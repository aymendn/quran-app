/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 112 (56 per locale)
///
/// Built on 2024-10-07 at 17:08 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ar;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ar) // set locale
/// - Locale locale = AppLocale.ar.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ar) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	ar(languageCode: 'ar', build: Translations.build),
	en(languageCode: 'en', build: _StringsEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get languageCode => 'ar';
	String get medinan => 'مدنية';
	String get meccan => 'مكية';
	String get tafsir => 'التفسير';
	String get index => 'الفهرس';
	String get bookmark => 'علامة';
	String get saveBookmark => 'حفظ العلامة هنا';
	String get goToBookmark => 'الذهاب إلى العلامة';
	String get savedHere => 'تم الحفظ هنا';
	String get savedInPage => 'تم الحفظ في الصفحة';
	String get settings => 'الإعدادات';
	String get themeMode => 'المظهر';
	String get chooseThemeMode => 'اختيار المظهر';
	String get light => 'فاتح';
	String get dark => 'داكن';
	String get language => 'اللغة';
	String get languageOtherLanguage => 'Language';
	String get chooseLanguage => 'اختر اللغة';
	String get arabic => 'العربية';
	String get arabicOtherLanguage => 'Arabic';
	String get english => 'الإنجليزية';
	String get englishOtherLanguage => 'English';
	String get downloadRequired => 'التنزيل مطلوب';
	String get fileDownloadMessage => 'يجب تنزيل بعض الملفات قبل استخدام هذا التطبيق.';
	String get download => 'تنزيل';
	String get fileSize => 'حجم الملف';
	String get save => 'حفظ';
	String get cancel => 'إلغاء';
	String get chapter => 'السورة';
	String get chapters => 'السور';
	String get quarters => 'الأرباع';
	String get comingSoon => 'قريبًا!';
	String get comingSoonMessage => 'هذه الميزة لم يتم تنفيذها بعد. سيتم إضافتها في التحديث القادم.';
	String get search => 'بحث';
	String get page => 'الصفحة';
	String get juz => 'الجزء';
	String get surah => 'السورة';
	String get ayah => 'الآية';
	String get verse => 'الآية';
	String get verses => 'الآيات';
	String verseCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ar'))(n,
		one: 'آية واحدة',
		two: 'آيتان',
		few: '${n} آيات',
		other: '${n} آية',
	);
	String get word => 'الكلمة';
	String get retry => 'إعادة المحاولة';
	String get downloadWaitingMessage => 'استثمر دقائق الانتظار بالذكر و الاستغفار';
	late final _StringsExceptionsAr exceptions = _StringsExceptionsAr._(_root);
}

// Path: exceptions
class _StringsExceptionsAr {
	_StringsExceptionsAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _StringsExceptionsNetworkAr network = _StringsExceptionsNetworkAr._(_root);
	late final _StringsExceptionsTimeoutAr timeout = _StringsExceptionsTimeoutAr._(_root);
	late final _StringsExceptionsServerAr server = _StringsExceptionsServerAr._(_root);
	late final _StringsExceptionsUnknownAr unknown = _StringsExceptionsUnknownAr._(_root);
	late final _StringsExceptionsCustomAr custom = _StringsExceptionsCustomAr._(_root);
}

// Path: exceptions.network
class _StringsExceptionsNetworkAr {
	_StringsExceptionsNetworkAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'خطأ في الشبكة';
	String get message => 'يرجى التحقق من اتصال الإنترنت.';
}

// Path: exceptions.timeout
class _StringsExceptionsTimeoutAr {
	_StringsExceptionsTimeoutAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'اتصال بطيء بالإنترنت';
	String get message => 'يرجى التحقق من اتصال الإنترنت.';
}

// Path: exceptions.server
class _StringsExceptionsServerAr {
	_StringsExceptionsServerAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'خطأ في الخادم';
	String get message => 'حدث خطأ في الخادم.';
}

// Path: exceptions.unknown
class _StringsExceptionsUnknownAr {
	_StringsExceptionsUnknownAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'خطأ غير معروف';
	String get message => 'حدث خطأ غير معروف.';
}

// Path: exceptions.custom
class _StringsExceptionsCustomAr {
	_StringsExceptionsCustomAr._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'خطأ';
	String get message => 'حدث خطأ.';
}

// Path: <root>
class _StringsEn extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	@override String get languageCode => 'en';
	@override String get medinan => 'Medinan';
	@override String get meccan => 'Meccan';
	@override String get tafsir => 'Tafsir';
	@override String get index => 'Index';
	@override String get bookmark => 'Bookmark';
	@override String get saveBookmark => 'Save Here';
	@override String get goToBookmark => 'Go To Bookmark';
	@override String get savedHere => 'Saved Here';
	@override String get savedInPage => 'Saved In Page';
	@override String get settings => 'Settings';
	@override String get themeMode => 'Theme Mode';
	@override String get chooseThemeMode => 'Choose Theme Mode';
	@override String get light => 'Light';
	@override String get dark => 'Dark';
	@override String get language => 'Language';
	@override String get languageOtherLanguage => 'اللغة';
	@override String get chooseLanguage => 'Choose Language';
	@override String get arabic => 'Arabic';
	@override String get arabicOtherLanguage => 'العربية';
	@override String get english => 'English';
	@override String get englishOtherLanguage => 'الإنجليزية';
	@override String get downloadRequired => 'Download Required';
	@override String get fileDownloadMessage => 'Some files need to be downloaded before using this app.';
	@override String get download => 'Download';
	@override String get fileSize => 'File Size';
	@override String get save => 'Save';
	@override String get cancel => 'Cancel';
	@override String get chapter => 'Chapter';
	@override String get chapters => 'Chapters';
	@override String get quarters => 'Quraters';
	@override String get comingSoon => 'Comming Soon!';
	@override String get comingSoonMessage => 'This feature is not yet implemented. It will be added in the next update.';
	@override String get search => 'Search';
	@override String get page => 'Page';
	@override String get juz => 'Juz';
	@override String get surah => 'Surah';
	@override String get ayah => 'Ayah';
	@override String get verse => 'Verse';
	@override String get verses => 'Verses';
	@override String verseCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 Verse',
		other: '${n} Verses',
	);
	@override String get word => 'Word';
	@override String get retry => 'Retry';
	@override String get downloadWaitingMessage => 'Invest waiting minutes in Dhikr and Istighfar';
	@override late final _StringsExceptionsEn exceptions = _StringsExceptionsEn._(_root);
}

// Path: exceptions
class _StringsExceptionsEn extends _StringsExceptionsAr {
	_StringsExceptionsEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override late final _StringsExceptionsNetworkEn network = _StringsExceptionsNetworkEn._(_root);
	@override late final _StringsExceptionsTimeoutEn timeout = _StringsExceptionsTimeoutEn._(_root);
	@override late final _StringsExceptionsServerEn server = _StringsExceptionsServerEn._(_root);
	@override late final _StringsExceptionsUnknownEn unknown = _StringsExceptionsUnknownEn._(_root);
	@override late final _StringsExceptionsCustomEn custom = _StringsExceptionsCustomEn._(_root);
}

// Path: exceptions.network
class _StringsExceptionsNetworkEn extends _StringsExceptionsNetworkAr {
	_StringsExceptionsNetworkEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Network Error';
	@override String get message => 'Please check your internet connection.';
}

// Path: exceptions.timeout
class _StringsExceptionsTimeoutEn extends _StringsExceptionsTimeoutAr {
	_StringsExceptionsTimeoutEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Slow Internet';
	@override String get message => 'Please check your internet connection.';
}

// Path: exceptions.server
class _StringsExceptionsServerEn extends _StringsExceptionsServerAr {
	_StringsExceptionsServerEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Server Error';
	@override String get message => 'A server error has occurred.';
}

// Path: exceptions.unknown
class _StringsExceptionsUnknownEn extends _StringsExceptionsUnknownAr {
	_StringsExceptionsUnknownEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Unknown Error';
	@override String get message => 'An unknown error has occurred.';
}

// Path: exceptions.custom
class _StringsExceptionsCustomEn extends _StringsExceptionsCustomAr {
	_StringsExceptionsCustomEn._(_StringsEn root) : this._root = root, super._(root);

	@override final _StringsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Error';
	@override String get message => 'An error has occurred.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'languageCode': return 'ar';
			case 'medinan': return 'مدنية';
			case 'meccan': return 'مكية';
			case 'tafsir': return 'التفسير';
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

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'languageCode': return 'en';
			case 'medinan': return 'Medinan';
			case 'meccan': return 'Meccan';
			case 'tafsir': return 'Tafsir';
			case 'index': return 'Index';
			case 'bookmark': return 'Bookmark';
			case 'saveBookmark': return 'Save Here';
			case 'goToBookmark': return 'Go To Bookmark';
			case 'savedHere': return 'Saved Here';
			case 'savedInPage': return 'Saved In Page';
			case 'settings': return 'Settings';
			case 'themeMode': return 'Theme Mode';
			case 'chooseThemeMode': return 'Choose Theme Mode';
			case 'light': return 'Light';
			case 'dark': return 'Dark';
			case 'language': return 'Language';
			case 'languageOtherLanguage': return 'اللغة';
			case 'chooseLanguage': return 'Choose Language';
			case 'arabic': return 'Arabic';
			case 'arabicOtherLanguage': return 'العربية';
			case 'english': return 'English';
			case 'englishOtherLanguage': return 'الإنجليزية';
			case 'downloadRequired': return 'Download Required';
			case 'fileDownloadMessage': return 'Some files need to be downloaded before using this app.';
			case 'download': return 'Download';
			case 'fileSize': return 'File Size';
			case 'save': return 'Save';
			case 'cancel': return 'Cancel';
			case 'chapter': return 'Chapter';
			case 'chapters': return 'Chapters';
			case 'quarters': return 'Quraters';
			case 'comingSoon': return 'Comming Soon!';
			case 'comingSoonMessage': return 'This feature is not yet implemented. It will be added in the next update.';
			case 'search': return 'Search';
			case 'page': return 'Page';
			case 'juz': return 'Juz';
			case 'surah': return 'Surah';
			case 'ayah': return 'Ayah';
			case 'verse': return 'Verse';
			case 'verses': return 'Verses';
			case 'verseCount': return ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
				one: '1 Verse',
				other: '${n} Verses',
			);
			case 'word': return 'Word';
			case 'retry': return 'Retry';
			case 'downloadWaitingMessage': return 'Invest waiting minutes in Dhikr and Istighfar';
			case 'exceptions.network.title': return 'Network Error';
			case 'exceptions.network.message': return 'Please check your internet connection.';
			case 'exceptions.timeout.title': return 'Slow Internet';
			case 'exceptions.timeout.message': return 'Please check your internet connection.';
			case 'exceptions.server.title': return 'Server Error';
			case 'exceptions.server.message': return 'A server error has occurred.';
			case 'exceptions.unknown.title': return 'Unknown Error';
			case 'exceptions.unknown.message': return 'An unknown error has occurred.';
			case 'exceptions.custom.title': return 'Error';
			case 'exceptions.custom.message': return 'An error has occurred.';
			default: return null;
		}
	}
}
