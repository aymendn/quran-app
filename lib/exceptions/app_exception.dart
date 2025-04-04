import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quran_app/i18n/strings.g.dart';

enum AppExceptionType {
  network,
  timeout,
  server,
  unknown,
  custom;

  String get title {
    final tr = t.exceptions;
    return switch (this) {
      AppExceptionType.network => tr.network.title,
      AppExceptionType.timeout => tr.timeout.title,
      AppExceptionType.server => tr.server.title,
      AppExceptionType.unknown => tr.unknown.title,
      AppExceptionType.custom => tr.custom.title,
    };
  }

  String get message {
    final tr = t.exceptions;
    return switch (this) {
      AppExceptionType.network => tr.network.message,
      AppExceptionType.timeout => tr.timeout.message,
      AppExceptionType.server => tr.server.message,
      AppExceptionType.unknown => tr.unknown.message,
      AppExceptionType.custom => tr.custom.message,
    };
  }
}

class AppException implements Exception {
  AppException({
    required this.type,
    this.customMessage,
    this.error,
    this.stackTrace,
  });

  final AppExceptionType type;
  final String? customMessage;
  final Object? error;
  final StackTrace? stackTrace;

  String get title {
    return type.title;
  }

  String get message {
    return customMessage ?? type.message;
  }

  bool get isErrorDioException {
    return error is DioException;
  }

  int? get dioErrorCode {
    if (error is DioException) {
      return (error as DioException).response?.statusCode;
    }
    return null;
  }

  factory AppException.fromDartException(
    Object? e, [
    StackTrace? st,
    bool sendToCrashlytics = true,
  ]) {
    if (e is AppException) {
      return e;
    }

    if (e is SocketException) {
      return AppException(
        type: AppExceptionType.network,
        error: e,
        stackTrace: st,
      );
    }

    if (e is HttpException) {
      return AppException(
        type: AppExceptionType.server,
        error: e,
        stackTrace: st,
      );
    }

    if (e is DioException) {
      return AppException(
        type: AppExceptionType.server,
        error: e,
        stackTrace: st,
      );
    }

    return AppException(
      type: AppExceptionType.unknown,
      error: e,
      stackTrace: st,
    );
  }

  static AsyncValue<T> asAsyncError<T>(
    Object? e,
    StackTrace? st,
  ) {
    final error = AppException.fromDartException(e, st);
    return AsyncError(error, st ?? StackTrace.current);
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.toString(),
      'customMessage': customMessage,
      'error': error.toString(),
      'stackTrace': stackTrace.toString().split('\n'),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'AppException(type: $type, customMessage: $customMessage, error: $error, stackTrace: $stackTrace)';
  }
}
