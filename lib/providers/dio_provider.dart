import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: 20.seconds,
      receiveTimeout: 20.seconds,
      sendTimeout: 20.seconds,
    ),
  );

  // Retry interceptor
  dio.interceptors.add(
    RetryInterceptor(
      dio: dio,
      logPrint: print, // specify log function (optional)
      retries: 3, // retry count (optional)
      retryDelays: const [
        // set delays between retries (optional)
        Duration(seconds: 1), // wait 1 sec before first retry
        Duration(seconds: 2), // wait 2 sec before second retry
        Duration(seconds: 3), // wait 3 sec before third retry
      ],
    ),
  );

  const accessToken = "#";
  final headers = {
    'Authorization': 'token $accessToken',
    'Accept': 'application/vnd.github.v3.raw',
  };

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll(headers);
        return handler.next(options);
      },
    ),
  );

  // // Logger interceptor
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true, // true
      responseHeader: false,
      responseBody: true, // true
      error: true, // true
      compact: true,
      maxWidth: 100,
    ),
  );

  return dio;
});
