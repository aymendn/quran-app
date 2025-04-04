///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	String get languageCode => 'en';
	String get next => 'Next';
	String get medinan => 'Medinan';
	String get meccan => 'Meccan';
	String get tafsir => 'Tafsir';
	String get manageTafsir => 'Manage Tafsirs';
	String get noTafsir => 'No Tafsirs downloaded yet, please add a tafsir from the tafsir page.';
	String get chooseRiwayah => 'Choose Riwayah';
	String get highQuality => 'High Quality';
	String get lowQuality => 'Low Quality';
	String get confirmDelete => 'Confirm Delete';
	String get confirmDeleteMessage => 'Are you sure you want to delete this item?';
	String get downloading => 'Downloading';
	String get downloadingErrorMessage => 'An error occurred while downloading';
	String get index => 'Index';
	String get bookmark => 'Bookmark';
	String get saveBookmark => 'Save Here';
	String get goToBookmark => 'Go To Bookmark';
	String get savedHere => 'Saved Here';
	String get savedInPage => 'Saved In Page';
	String get settings => 'Settings';
	String get themeMode => 'Theme Mode';
	String get chooseThemeMode => 'Choose Theme Mode';
	String get light => 'Light';
	String get dark => 'Dark';
	String get language => 'Language';
	String get languageOtherLanguage => 'اللغة';
	String get chooseLanguage => 'Choose Language';
	String get arabic => 'Arabic';
	String get arabicOtherLanguage => 'العربية';
	String get english => 'English';
	String get englishOtherLanguage => 'الإنجليزية';
	String get downloadRequired => 'Download Required';
	String get fileDownloadMessage => 'Some files need to be downloaded before using this app.';
	String get download => 'Download';
	String get fileSize => 'File Size';
	String get save => 'Save';
	String get cancel => 'Cancel';
	String get chapter => 'Chapter';
	String get chapters => 'Chapters';
	String get quarters => 'Quraters';
	String get comingSoon => 'Comming Soon!';
	String get comingSoonMessage => 'This feature is not yet implemented. It will be added in the next update.';
	String get search => 'Search';
	String get page => 'Page';
	String get juz => 'Juz';
	String get surah => 'Surah';
	String get ayah => 'Ayah';
	String get verse => 'Verse';
	String get verses => 'Verses';
	String verseCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(n,
		one: '1 Verse',
		other: '${n} Verses',
	);
	String get word => 'Word';
	String get retry => 'Retry';
	String get downloadWaitingMessage => 'Invest waiting minutes in Dhikr and Istighfar';
	late final TranslationsExceptionsEn exceptions = TranslationsExceptionsEn._(_root);
}

// Path: exceptions
class TranslationsExceptionsEn {
	TranslationsExceptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsExceptionsNetworkEn network = TranslationsExceptionsNetworkEn._(_root);
	late final TranslationsExceptionsTimeoutEn timeout = TranslationsExceptionsTimeoutEn._(_root);
	late final TranslationsExceptionsServerEn server = TranslationsExceptionsServerEn._(_root);
	late final TranslationsExceptionsUnknownEn unknown = TranslationsExceptionsUnknownEn._(_root);
	late final TranslationsExceptionsCustomEn custom = TranslationsExceptionsCustomEn._(_root);
}

// Path: exceptions.network
class TranslationsExceptionsNetworkEn {
	TranslationsExceptionsNetworkEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Network Error';
	String get message => 'Please check your internet connection.';
}

// Path: exceptions.timeout
class TranslationsExceptionsTimeoutEn {
	TranslationsExceptionsTimeoutEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Slow Internet';
	String get message => 'Please check your internet connection.';
}

// Path: exceptions.server
class TranslationsExceptionsServerEn {
	TranslationsExceptionsServerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Server Error';
	String get message => 'A server error has occurred.';
}

// Path: exceptions.unknown
class TranslationsExceptionsUnknownEn {
	TranslationsExceptionsUnknownEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Unknown Error';
	String get message => 'An unknown error has occurred.';
}

// Path: exceptions.custom
class TranslationsExceptionsCustomEn {
	TranslationsExceptionsCustomEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Error';
	String get message => 'An error has occurred.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'languageCode': return 'en';
			case 'next': return 'Next';
			case 'medinan': return 'Medinan';
			case 'meccan': return 'Meccan';
			case 'tafsir': return 'Tafsir';
			case 'manageTafsir': return 'Manage Tafsirs';
			case 'noTafsir': return 'No Tafsirs downloaded yet, please add a tafsir from the tafsir page.';
			case 'chooseRiwayah': return 'Choose Riwayah';
			case 'highQuality': return 'High Quality';
			case 'lowQuality': return 'Low Quality';
			case 'confirmDelete': return 'Confirm Delete';
			case 'confirmDeleteMessage': return 'Are you sure you want to delete this item?';
			case 'downloading': return 'Downloading';
			case 'downloadingErrorMessage': return 'An error occurred while downloading';
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

