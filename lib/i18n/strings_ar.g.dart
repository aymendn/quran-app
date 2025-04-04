///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override String get languageCode => 'ar';
	@override String get next => 'التالي';
	@override String get medinan => 'مدنية';
	@override String get meccan => 'مكية';
	@override String get tafsir => 'التفسير';
	@override String get manageTafsir => 'إدارة التفاسير';
	@override String get noTafsir => 'لا يوجد تفسيرات محملة بعد، يرجى إضافة تفسير من صفحة التفسير';
	@override String get chooseRiwayah => 'اختر رواية';
	@override String get highQuality => 'جودة عالية';
	@override String get lowQuality => 'جودة منخفضة';
	@override String get confirmDelete => 'تأكيد الحذف';
	@override String get confirmDeleteMessage => 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';
	@override String get downloading => 'جارٍ التحميل';
	@override String get downloadingErrorMessage => 'حدث خطأ أثناء التحميل';
	@override String get index => 'الفهرس';
	@override String get bookmark => 'علامة';
	@override String get saveBookmark => 'حفظ العلامة هنا';
	@override String get goToBookmark => 'الذهاب إلى العلامة';
	@override String get savedHere => 'تم الحفظ هنا';
	@override String get savedInPage => 'تم الحفظ في الصفحة';
	@override String get settings => 'الإعدادات';
	@override String get themeMode => 'المظهر';
	@override String get chooseThemeMode => 'اختيار المظهر';
	@override String get light => 'فاتح';
	@override String get dark => 'داكن';
	@override String get language => 'اللغة';
	@override String get languageOtherLanguage => 'Language';
	@override String get chooseLanguage => 'اختر اللغة';
	@override String get arabic => 'العربية';
	@override String get arabicOtherLanguage => 'Arabic';
	@override String get english => 'الإنجليزية';
	@override String get englishOtherLanguage => 'English';
	@override String get downloadRequired => 'التنزيل مطلوب';
	@override String get fileDownloadMessage => 'يجب تنزيل بعض الملفات قبل استخدام هذا التطبيق.';
	@override String get download => 'تنزيل';
	@override String get fileSize => 'حجم الملف';
	@override String get save => 'حفظ';
	@override String get cancel => 'إلغاء';
	@override String get chapter => 'السورة';
	@override String get chapters => 'السور';
	@override String get quarters => 'الأرباع';
	@override String get comingSoon => 'قريبًا!';
	@override String get comingSoonMessage => 'هذه الميزة لم يتم تنفيذها بعد. سيتم إضافتها في التحديث القادم.';
	@override String get search => 'بحث';
	@override String get page => 'الصفحة';
	@override String get juz => 'الجزء';
	@override String get surah => 'السورة';
	@override String get ayah => 'الآية';
	@override String get verse => 'الآية';
	@override String get verses => 'الآيات';
	@override String verseCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
		one: 'آية واحدة',
		two: 'آيتان',
		few: '${n} آيات',
		other: '${n} آية',
	);
	@override String get word => 'الكلمة';
	@override String get retry => 'إعادة المحاولة';
	@override String get downloadWaitingMessage => 'استثمر دقائق الانتظار بالذكر و الاستغفار';
	@override late final _TranslationsExceptionsAr exceptions = _TranslationsExceptionsAr._(_root);
}

// Path: exceptions
class _TranslationsExceptionsAr implements TranslationsExceptionsEn {
	_TranslationsExceptionsAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsExceptionsNetworkAr network = _TranslationsExceptionsNetworkAr._(_root);
	@override late final _TranslationsExceptionsTimeoutAr timeout = _TranslationsExceptionsTimeoutAr._(_root);
	@override late final _TranslationsExceptionsServerAr server = _TranslationsExceptionsServerAr._(_root);
	@override late final _TranslationsExceptionsUnknownAr unknown = _TranslationsExceptionsUnknownAr._(_root);
	@override late final _TranslationsExceptionsCustomAr custom = _TranslationsExceptionsCustomAr._(_root);
}

// Path: exceptions.network
class _TranslationsExceptionsNetworkAr implements TranslationsExceptionsNetworkEn {
	_TranslationsExceptionsNetworkAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خطأ في الشبكة';
	@override String get message => 'يرجى التحقق من اتصال الإنترنت.';
}

// Path: exceptions.timeout
class _TranslationsExceptionsTimeoutAr implements TranslationsExceptionsTimeoutEn {
	_TranslationsExceptionsTimeoutAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'اتصال بطيء بالإنترنت';
	@override String get message => 'يرجى التحقق من اتصال الإنترنت.';
}

// Path: exceptions.server
class _TranslationsExceptionsServerAr implements TranslationsExceptionsServerEn {
	_TranslationsExceptionsServerAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خطأ في الخادم';
	@override String get message => 'حدث خطأ في الخادم.';
}

// Path: exceptions.unknown
class _TranslationsExceptionsUnknownAr implements TranslationsExceptionsUnknownEn {
	_TranslationsExceptionsUnknownAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خطأ غير معروف';
	@override String get message => 'حدث خطأ غير معروف.';
}

// Path: exceptions.custom
class _TranslationsExceptionsCustomAr implements TranslationsExceptionsCustomEn {
	_TranslationsExceptionsCustomAr._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get title => 'خطأ';
	@override String get message => 'حدث خطأ.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'languageCode': return 'ar';
			case 'next': return 'التالي';
			case 'medinan': return 'مدنية';
			case 'meccan': return 'مكية';
			case 'tafsir': return 'التفسير';
			case 'manageTafsir': return 'إدارة التفاسير';
			case 'noTafsir': return 'لا يوجد تفسيرات محملة بعد، يرجى إضافة تفسير من صفحة التفسير';
			case 'chooseRiwayah': return 'اختر رواية';
			case 'highQuality': return 'جودة عالية';
			case 'lowQuality': return 'جودة منخفضة';
			case 'confirmDelete': return 'تأكيد الحذف';
			case 'confirmDeleteMessage': return 'هل أنت متأكد أنك تريد حذف هذا العنصر؟';
			case 'downloading': return 'جارٍ التحميل';
			case 'downloadingErrorMessage': return 'حدث خطأ أثناء التحميل';
			case 'index': return 'الفهرس';
			case 'bookmark': return 'علامة';
			case 'saveBookmark': return 'حفظ العلامة هنا';
			case 'goToBookmark': return 'الذهاب إلى العلامة';
			case 'savedHere': return 'تم الحفظ هنا';
			case 'savedInPage': return 'تم الحفظ في الصفحة';
			case 'settings': return 'الإعدادات';
			case 'themeMode': return 'المظهر';
			case 'chooseThemeMode': return 'اختيار المظهر';
			case 'light': return 'فاتح';
			case 'dark': return 'داكن';
			case 'language': return 'اللغة';
			case 'languageOtherLanguage': return 'Language';
			case 'chooseLanguage': return 'اختر اللغة';
			case 'arabic': return 'العربية';
			case 'arabicOtherLanguage': return 'Arabic';
			case 'english': return 'الإنجليزية';
			case 'englishOtherLanguage': return 'English';
			case 'downloadRequired': return 'التنزيل مطلوب';
			case 'fileDownloadMessage': return 'يجب تنزيل بعض الملفات قبل استخدام هذا التطبيق.';
			case 'download': return 'تنزيل';
			case 'fileSize': return 'حجم الملف';
			case 'save': return 'حفظ';
			case 'cancel': return 'إلغاء';
			case 'chapter': return 'السورة';
			case 'chapters': return 'السور';
			case 'quarters': return 'الأرباع';
			case 'comingSoon': return 'قريبًا!';
			case 'comingSoonMessage': return 'هذه الميزة لم يتم تنفيذها بعد. سيتم إضافتها في التحديث القادم.';
			case 'search': return 'بحث';
			case 'page': return 'الصفحة';
			case 'juz': return 'الجزء';
			case 'surah': return 'السورة';
			case 'ayah': return 'الآية';
			case 'verse': return 'الآية';
			case 'verses': return 'الآيات';
			case 'verseCount': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
				one: 'آية واحدة',
				two: 'آيتان',
				few: '${n} آيات',
				other: '${n} آية',
			);
			case 'word': return 'الكلمة';
			case 'retry': return 'إعادة المحاولة';
			case 'downloadWaitingMessage': return 'استثمر دقائق الانتظار بالذكر و الاستغفار';
			case 'exceptions.network.title': return 'خطأ في الشبكة';
			case 'exceptions.network.message': return 'يرجى التحقق من اتصال الإنترنت.';
			case 'exceptions.timeout.title': return 'اتصال بطيء بالإنترنت';
			case 'exceptions.timeout.message': return 'يرجى التحقق من اتصال الإنترنت.';
			case 'exceptions.server.title': return 'خطأ في الخادم';
			case 'exceptions.server.message': return 'حدث خطأ في الخادم.';
			case 'exceptions.unknown.title': return 'خطأ غير معروف';
			case 'exceptions.unknown.message': return 'حدث خطأ غير معروف.';
			case 'exceptions.custom.title': return 'خطأ';
			case 'exceptions.custom.message': return 'حدث خطأ.';
			default: return null;
		}
	}
}

