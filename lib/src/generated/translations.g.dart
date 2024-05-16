/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 5
/// Strings: 1230 (246 per locale)
///
/// Built on 2024-05-16 at 23:54 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	es(languageCode: 'es', build: _TranslationsEs.build),
	fr(languageCode: 'fr', build: _TranslationsFr.build),
	pt(languageCode: 'pt', build: _TranslationsPt.build),
	zh(languageCode: 'zh', build: _TranslationsZh.build);

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
/// Translation happens during initialization of the widget (call of texts).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = texts.someKey.anotherKey;
/// String b = texts['someKey.anotherKey']; // Only for edge cases!
Translations get texts => LocaleSettings.instance.currentTranslations;

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
/// final texts = Translations.of(context); // Get texts variable.
/// String a = texts.someKey.anotherKey; // Use texts variable.
/// String b = texts['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.texts.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get texts => TranslationProvider.of(this).translations;
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
	/// final texts = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
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

	// Translations
	late final _TranslationsAboutProjectEn aboutProject = _TranslationsAboutProjectEn._(_root);
	late final _TranslationsAuthorsEn authors = _TranslationsAuthorsEn._(_root);
	late final _TranslationsBottomBarEn bottomBar = _TranslationsBottomBarEn._(_root);
	late final _TranslationsCommunityEn community = _TranslationsCommunityEn._(_root);
	late final _TranslationsDeleteAccountEn deleteAccount = _TranslationsDeleteAccountEn._(_root);
	late final _TranslationsEditProfileEn editProfile = _TranslationsEditProfileEn._(_root);
	late final _TranslationsErrorPageEn errorPage = _TranslationsErrorPageEn._(_root);
	late final _TranslationsFavoritesEn favorites = _TranslationsFavoritesEn._(_root);
	late final _TranslationsFilterOptionsEn filterOptions = _TranslationsFilterOptionsEn._(_root);
	late final _TranslationsForgotPasswordEn forgotPassword = _TranslationsForgotPasswordEn._(_root);
	late final _TranslationsGeneralEn general = _TranslationsGeneralEn._(_root);
	late final _TranslationsPdfPreviewPageEn pdfPreviewPage = _TranslationsPdfPreviewPageEn._(_root);
	late final _TranslationsProfileEn profile = _TranslationsProfileEn._(_root);
	late final _TranslationsSearchPageEn searchPage = _TranslationsSearchPageEn._(_root);
	late final _TranslationsSignInEn signIn = _TranslationsSignInEn._(_root);
	late final _TranslationsSignUpEn signUp = _TranslationsSignUpEn._(_root);
	late final _TranslationsSpeciesEn species = _TranslationsSpeciesEn._(_root);
	late final _TranslationsSpeciesDetailsEn speciesDetails = _TranslationsSpeciesDetailsEn._(_root);
	late final _TranslationsSpeciesDetailsPageEn speciesDetailsPage = _TranslationsSpeciesDetailsPageEn._(_root);
	late final _TranslationsUserCredentialFailureEn userCredentialFailure = _TranslationsUserCredentialFailureEn._(_root);
	late final _TranslationsValidatorEn validator = _TranslationsValidatorEn._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectEn {
	_TranslationsAboutProjectEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'About the project';
	String get getBook => 'Get the book';
	String get titleBook => 'AMAZONIA';
	String get subtitleBook => 'Illustrated Guide to Flora and Fauna';
	String get p1 => 'Welcome to the mobile platform of the Illustrated Guide to Flora and Fauna of the Amazon. Dive into the richness and diversity of this unique region through an interactive experience based on data updated until 2022';
	String get content => 'About the content';
	String get p2 => 'Our platform is a window to the astonishing Amazonian biodiversity. Through expert content and visually stunning imagery, we invite you to explore the unparalleled beauty of this region and understand its critical importance to our planet.';
	String get commitment => 'Our commitment';
	String get p3 => 'We strive to raise awareness about the immense importance of biodiversity and its protection, especially in the most vulnerable regions and among populations affected by degradation and climate change.';
	String get contact => 'Contact us';
	String get p4 => 'For more information about the project, contact the Peruvian Amazon Research Institute (IIAP) through the website: ';
	String get address => 'Iquitos - Nauta Road Km 4.5, Quistococha, San Juan Bautista District, Maynas, Loreto: ';
}

// Path: authors
class _TranslationsAuthorsEn {
	_TranslationsAuthorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Authors';
	String get withoutAuthors => 'It seems there are no authors here';
	String get professionNotAvailable => 'Profession not available';
}

// Path: bottomBar
class _TranslationsBottomBarEn {
	_TranslationsBottomBarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get search => 'Search';
	String get favorites => 'Favorites';
}

// Path: community
class _TranslationsCommunityEn {
	_TranslationsCommunityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Indigenous communities';
	String get withoutCommunities => 'It seems there are no indigenous communities here';
}

// Path: deleteAccount
class _TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Delete account';
	String get userInfo => 'User information:';
	String get username => 'Username';
	String get email => 'Email';
	String get phone => 'Phone';
	String get delete => 'Delete account';
	String get warning => 'By deleting your account, you agree to the following terms:';
	String get firtsTerm => '- You won\'t be able to recover your account.';
	String get secondTerm => '- You won\'t be able to recover your data.';
	String get confirm => 'Confirm';
	String get cancel => 'Cancel';
	String get information => 'Are you sure you want to delete your account? This action is irreversible. Enter your password to confirm.';
	String get accountDeleted => 'Account deleted successfully';
	String get notRegistered => 'Not registered';
}

// Path: editProfile
class _TranslationsEditProfileEn {
	_TranslationsEditProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get errorSnack => 'Error loading user data';
	String get title => 'Edit Profile';
	String get save => 'Save';
	String get saving => 'Saving...';
	String get errorSaving => 'Error saving profile data';
	String get selectImage => 'Select a profile picture';
	String get errorSave => 'Error saving profile';
}

// Path: errorPage
class _TranslationsErrorPageEn {
	_TranslationsErrorPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get page_not_exist => 'This page no longer exists';
	String get go_back => 'Back to species';
}

// Path: favorites
class _TranslationsFavoritesEn {
	_TranslationsFavoritesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Favorites';
	String get hintText => 'Search your favorite';
	String get exceptionText => 'There are no species here yet';
	String get deleteFavorite => 'Remove from favorites';
	String get empty => 'Start marking species as favorites to see them here';
	String get error => 'We have made significant changes, tap on \'Restore species\' to update the information, make sure you have an internet connection';
	String get canNot => 'This action could not be performed';
	String get reestoreSpecies => 'Restore species';
	String get withoutSpecies => 'You don\'t have any favorite species yet, you can add them from the species section';
	String get yeah => 'All your favorite species have been restored!';
}

// Path: filterOptions
class _TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get listByAlphabethic => 'List by alphabetical order';
	String get recentlyAdded => 'Recently added';
	String get all => 'All';
	String get noPreferencies => 'No preferences';
	late final _TranslationsFilterOptionsFilterByNameEn filterByName = _TranslationsFilterOptionsFilterByNameEn._(_root);
	late final _TranslationsFilterOptionsFilterBySoundEn filterBySound = _TranslationsFilterOptionsFilterBySoundEn._(_root);
	String get filterByConservation => 'Filter by conservation status';
	String get filterByCategory => 'Filter by category';
	String get filterByTaxonomy => 'Filter by taxonomy';
	String get filterByOrder => 'Filter by order';
	String get filterByFamily => 'Filter by family';
}

// Path: forgotPassword
class _TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Forgot Your Password';
	String get sendLabel => 'Send';
	String get validatingLabel => 'Validating...';
	String get email => 'Email';
	String get clear => 'Clear';
	String get message => 'Enter your email to send you an email where you can change your password:';
	String get checkYourEmail => 'Check your email!';
}

// Path: general
class _TranslationsGeneralEn {
	_TranslationsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get back => 'Back';
	String get close => 'Close';
	String get clear => 'Clear';
	String get search => 'Search';
	String get addToFavorites => 'Add to favorites';
	String get removeFromFavorites => 'Remove from favorites';
	String get error404Again => 'Something went wrong, please try again';
	String get nameNotAvailable => 'Name not available';
	String get lastnameNotAvailable => 'Last name not available';
	String get descriptionNotAvailable => 'Description not available';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get amazon => 'Amazon';
	String get institute => 'Research Institute of the Peruvian Amazon';
	String get title => 'Illustrated Guide to Flora and Fauna';
	String get commonNameNotAvailable => 'Common name not available';
	String get scientificNameNotAvailable => 'Scientific name not available';
	String get author => 'Author';
	String get authors => 'Authors';
	String get imageNotAvailable => 'Image not available';
	String get taxonomicInformation => 'Taxonomic information';
	String get kingdom => 'Kingdom';
	String get phylum => 'Phylum';
	String get class_ => 'Class';
	String get order => 'Order';
	String get family => 'Family';
	String get authorInformation => 'Author information';
	String get name => 'Name';
	String get lastname => 'Last name';
	String get profession => 'Profession';
	String get bornIn => 'Born in';
	String get diedIn => 'Died in';
}

// Path: profile
class _TranslationsProfileEn {
	_TranslationsProfileEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My Profile';
	String get logout => 'Logout';
	String get favorites => 'My favorites';
	String get changePassword => 'Change password';
	String get share => 'Download the IIAP Illustrated Guide to Flora and Fauna app and learn more about species in the Peruvian Amazon:';
	String get invite => 'Invite friends';
	String get project => 'About the project';
	String get team => 'About us';
	String get deleteAccount => 'Delete account';
	String get userNotFound => 'User not found';
	String get completeProfile => 'Complete your profile to access all the features of the application.';
	String get completeButton => 'Complete profile';
	String get editButton => 'Edit profile';
}

// Path: searchPage
class _TranslationsSearchPageEn {
	_TranslationsSearchPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get failedRequest => 'Something went wrong. Please try again';
	String get recentlyAdded => 'Recently Added';
	late final _TranslationsSearchPageNameFilterEn nameFilter = _TranslationsSearchPageNameFilterEn._(_root);
	String get taxonomyFilter => 'Taxonomy';
	String get orderFilter => 'Order';
	String get familyFilter => 'Family';
	late final _TranslationsSearchPageSoundFilterEn soundFilter = _TranslationsSearchPageSoundFilterEn._(_root);
	String get conservationFilter => 'Conservation';
	late final _TranslationsSearchPageCategoryFilterEn categoryFilter = _TranslationsSearchPageCategoryFilterEn._(_root);
	String get cleanFilters => 'Clear Filters';
	String get searchSpecies => 'Search species';
	String get cleanSearch => 'Clear Search';
	String get errorFetchingTitle => 'Error fetching results';
	String get errorFetchingContent => 'Try again';
	String get notResultsTitle => 'No results found';
	String get notResultsContent => 'No results found. Try another search';
	String get errorFetchingSpecies => 'No species found related to your search. Please try again with another class, order, or family.';
	String get acceptText => 'Accept';
	String get updateText => 'Update';
	String get aToZ => 'A-Z';
	String get zToA => 'Z-A';
}

// Path: signIn
class _TranslationsSignInEn {
	_TranslationsSignInEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Amazon';
	String get subtitle => 'Illustrated Guide to Flora and Fauna';
	String get email => 'E-Mail';
	String get password => 'Password';
	String get enter => 'Enter';
	String get new_ => 'If you\'re new, register here';
	String get view_password => 'Show password';
	String get clear => 'Clear';
	String get register_first => 'You must register first';
	String get verify_email => 'First verify your email';
	String get verify_email_more => 'You need to verify your email to log in';
	String get forgot_password => 'Forgot your password?';
}

// Path: signUp
class _TranslationsSignUpEn {
	_TranslationsSignUpEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Sign Up';
	String get alreadyRegistered => 'Already have an account? Sign in';
	String get button => 'Sign Up';
	String get email => 'Email';
	String get password => 'Password';
	String get showPassword => 'Show Password';
	String get repeatPassword => 'Repeat Your Password';
	String get clear => 'Clear';
	String get network => 'Check your internet connection';
	String get credential => 'Incorrect credentials';
	String get disabled => 'This account has been disabled, please try again later';
	String get notRegistered => 'This account is not registered';
	String get passwordNotMatch => 'Incorrect password';
	String get unknown => 'Unknown error, please try again later';
	String get sendedEmail => 'A confirmation email has been sent to your email address';
}

// Path: species
class _TranslationsSpeciesEn {
	_TranslationsSpeciesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Species';
	String get birds => 'Birds';
	String get mammals => 'Mammals';
	String get reptiles => 'Reptiles';
	String get amphibians => 'Amphibians';
	String get fishes => 'Fishes';
	String get insects => 'Insects';
	String get trees => 'Trees';
	String get palms => 'Palms';
	String get orderName => 'Common name';
	String get orderScientificName => 'Scientific name';
}

// Path: speciesDetails
class _TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get authors => 'Authors';
	String get taxonomicInfo => 'Taxonomic Information';
	String get kingdom => 'Kingdom';
	String get filo => 'Phylum';
	String get classes => 'Class';
	String get order => 'Order';
	String get family => 'Family';
	String get download => 'Download';
	String get generatePdf => 'Generate PDF';
	String get downloadImage => 'Download Image';
	String get downloadAudio => 'Download Audio';
	String get share => 'Share';
	String get errorDownload => 'Download Error';
	String get successDownload => 'Download Success';
	String get shareAmazonInfo => 'Share the beauty of the Amazon! Share this valuable information about.';
	String get shareAmazon => 'Share the beauty of the Amazon!';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get download => 'Download';
	String get errorDownload => 'Could not download';
	String get downloadImage => 'Download image';
	String get downloadAudio => 'Download audio';
	String get share => 'Share';
	String get generatePdf => 'Generate PDF';
	String get attractiveMessage => 'Share the beauty of the Amazon! Share this valuable information about';
	String get conservationStates => 'Conservation statuses';
	String get noInformation => 'No information';
	String get nameNotAvailable => 'Name not available';
	String get scientificNameNotAvailable => 'Scientific name not available';
	String get year => 'Year';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailureEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get network => 'Check your internet connection';
	String get credential => 'Incorrect credentials';
	String get disable => 'This account has been disabled, please try again later';
	String get notRegistered => 'Email is not registered';
	String get password => 'Incorrect password';
	String get unknown => 'Unknown error';
}

// Path: validator
class _TranslationsValidatorEn {
	_TranslationsValidatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsValidatorPasswordEn password = _TranslationsValidatorPasswordEn._(_root);
	late final _TranslationsValidatorRepeatPasswordEn repeatPassword = _TranslationsValidatorRepeatPasswordEn._(_root);
	late final _TranslationsValidatorEmailEn email = _TranslationsValidatorEmailEn._(_root);
	late final _TranslationsValidatorNameEn name = _TranslationsValidatorNameEn._(_root);
	late final _TranslationsValidatorLastNameEn lastName = _TranslationsValidatorLastNameEn._(_root);
	late final _TranslationsValidatorPhoneEn phone = _TranslationsValidatorPhoneEn._(_root);
	late final _TranslationsValidatorCountryCodeEn countryCode = _TranslationsValidatorCountryCodeEn._(_root);
}

// Path: filterOptions.filterByName
class _TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Filter by name';
	String get common => 'Common name';
	String get scientific => 'Scientific name';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Filter by sound';
	String get withSound => 'With sound';
	String get withoutSound => 'Without sound';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get common => 'Common';
	String get scientific => 'Scientific';
	String get order => 'Order by';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get withSound => 'With sound';
	String get withoutSound => 'Without sound';
	String get sound => 'Sound';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get category => 'Category';
	String get birds => 'Birds';
	String get mammals => 'Mammals';
	String get reptiles => 'Reptiles';
	String get amphibians => 'Amphibians';
	String get fish => 'Fish';
	String get insects => 'Insects';
	String get plants => 'Plants';
	String get palms => 'Palms';
}

// Path: validator.password
class _TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Password';
	String get empty => 'Enter your password';
	String get minLength => 'Enter at least 6 characters';
	String get regExp => 'Password must contain at least one number and one letter';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Enter your password';
	String get minLength => 'Enter at least 6 characters';
	String get regExp => 'Password must contain at least one number and one letter';
	String get matchPassword => 'Passwords must match';
}

// Path: validator.email
class _TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Email';
	String get empty => 'Enter your email';
	String get regExp => 'Enter a valid email';
}

// Path: validator.name
class _TranslationsValidatorNameEn {
	_TranslationsValidatorNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Name';
	String get empty => 'Enter your name';
	String get minLength => 'Enter at least 3 characters';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Lastname';
	String get empty => 'Enter your lastname';
	String get minLength => 'Enter at least 3 characters';
}

// Path: validator.phone
class _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Phone number';
	String get empty => 'Enter your phone number';
	String get minLength => 'Enter at least 9 characters';
	String get regExp => 'Enter a valid phone number';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Country code';
	String get select => 'Select country code';
}

// Path: <root>
class _TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEs _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsAboutProjectEs aboutProject = _TranslationsAboutProjectEs._(_root);
	@override late final _TranslationsAuthorsEs authors = _TranslationsAuthorsEs._(_root);
	@override late final _TranslationsBottomBarEs bottomBar = _TranslationsBottomBarEs._(_root);
	@override late final _TranslationsCommunityEs community = _TranslationsCommunityEs._(_root);
	@override late final _TranslationsDeleteAccountEs deleteAccount = _TranslationsDeleteAccountEs._(_root);
	@override late final _TranslationsEditProfileEs editProfile = _TranslationsEditProfileEs._(_root);
	@override late final _TranslationsErrorPageEs errorPage = _TranslationsErrorPageEs._(_root);
	@override late final _TranslationsFavoritesEs favorites = _TranslationsFavoritesEs._(_root);
	@override late final _TranslationsFilterOptionsEs filterOptions = _TranslationsFilterOptionsEs._(_root);
	@override late final _TranslationsForgotPasswordEs forgotPassword = _TranslationsForgotPasswordEs._(_root);
	@override late final _TranslationsGeneralEs general = _TranslationsGeneralEs._(_root);
	@override late final _TranslationsPdfPreviewPageEs pdfPreviewPage = _TranslationsPdfPreviewPageEs._(_root);
	@override late final _TranslationsProfileEs profile = _TranslationsProfileEs._(_root);
	@override late final _TranslationsSearchPageEs searchPage = _TranslationsSearchPageEs._(_root);
	@override late final _TranslationsSignInEs signIn = _TranslationsSignInEs._(_root);
	@override late final _TranslationsSignUpEs signUp = _TranslationsSignUpEs._(_root);
	@override late final _TranslationsSpeciesEs species = _TranslationsSpeciesEs._(_root);
	@override late final _TranslationsSpeciesDetailsEs speciesDetails = _TranslationsSpeciesDetailsEs._(_root);
	@override late final _TranslationsSpeciesDetailsPageEs speciesDetailsPage = _TranslationsSpeciesDetailsPageEs._(_root);
	@override late final _TranslationsUserCredentialFailureEs userCredentialFailure = _TranslationsUserCredentialFailureEs._(_root);
	@override late final _TranslationsValidatorEs validator = _TranslationsValidatorEs._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectEs implements _TranslationsAboutProjectEn {
	_TranslationsAboutProjectEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Acerca del proyecto';
	@override String get getBook => 'Obtener el libro';
	@override String get titleBook => 'AMAZONÍA';
	@override String get subtitleBook => 'Guía ilustrada de flora y fauna';
	@override String get p1 => 'Bienvenido a la plataforma móvil de la Guía Ilustrada de Flora y Fauna de la Amazonía. Sumérgete en la riqueza y diversidad de esta región única a través de una experiencia interactiva basada en datos actualizados hasta 2022';
	@override String get content => 'Sobre el contenido';
	@override String get p2 => 'Nuestra plataforma es una ventana a la sorprendente biodiversidad amazónica. A través de contenido experto e imágenes visualmente impresionantes, te invitamos a explorar la belleza incomparable de esta región y comprender su importancia crítica para nuestro planeta.';
	@override String get commitment => 'Nuestro compromiso';
	@override String get p3 => 'Nos esforzamos por concienciar sobre la inmensa importancia de la biodiversidad y su protección, especialmente en las regiones más vulnerables y entre las poblaciones afectadas por la degradación y el cambio climático.';
	@override String get contact => 'Contáctanos';
	@override String get p4 => 'Para obtener más información sobre el proyecto, comunícate con el Instituto de Investigaciones de la Amazonía Peruana (IIAP) a través del sitio web: ';
	@override String get address => 'Carretera Iquitos - Nauta Km 4.5, Quistococha, Distrito de San Juan Bautista, Maynas, Loreto: ';
}

// Path: authors
class _TranslationsAuthorsEs implements _TranslationsAuthorsEn {
	_TranslationsAuthorsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Autores';
	@override String get withoutAuthors => 'Parece que no hay autores aquí';
	@override String get professionNotAvailable => 'Profesión no disponible';
}

// Path: bottomBar
class _TranslationsBottomBarEs implements _TranslationsBottomBarEn {
	_TranslationsBottomBarEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get search => 'Buscar';
	@override String get favorites => 'Favoritos';
}

// Path: community
class _TranslationsCommunityEs implements _TranslationsCommunityEn {
	_TranslationsCommunityEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comunidades indígenas';
	@override String get withoutCommunities => 'Parece que no hay comunidades indígenas aquí';
}

// Path: deleteAccount
class _TranslationsDeleteAccountEs implements _TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Eliminar cuenta';
	@override String get userInfo => 'Información del usuario:';
	@override String get username => 'Nombre de usuario';
	@override String get email => 'Correo electrónico';
	@override String get phone => 'Teléfono';
	@override String get delete => 'Eliminar cuenta';
	@override String get warning => 'Al eliminar tu cuenta, aceptas los siguientes términos:';
	@override String get firtsTerm => '- No podrás recuperar tu cuenta.';
	@override String get secondTerm => '- No podrás recuperar tus datos.';
	@override String get confirm => 'Confirmar';
	@override String get cancel => 'Cancelar';
	@override String get information => '¿Estás seguro de que quieres eliminar tu cuenta? Esta acción es irreversible. Ingresa tu contraseña para confirmar.';
	@override String get accountDeleted => 'Cuenta eliminada exitosamente';
	@override String get notRegistered => 'No registrado';
}

// Path: editProfile
class _TranslationsEditProfileEs implements _TranslationsEditProfileEn {
	_TranslationsEditProfileEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get errorSnack => 'Error al cargar los datos del usuario';
	@override String get title => 'Editar perfil';
	@override String get save => 'Guardar';
	@override String get saving => 'Guardando...';
	@override String get errorSaving => 'Error al guardar los datos del perfil';
	@override String get selectImage => 'Seleccione una imagen de perfil';
	@override String get errorSave => 'Error al guardar el perfil';
}

// Path: errorPage
class _TranslationsErrorPageEs implements _TranslationsErrorPageEn {
	_TranslationsErrorPageEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get page_not_exist => 'Esta página ya no existe';
	@override String get go_back => 'Volver a especies';
}

// Path: favorites
class _TranslationsFavoritesEs implements _TranslationsFavoritesEn {
	_TranslationsFavoritesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoritos';
	@override String get hintText => 'Busca tu favorito';
	@override String get exceptionText => 'Aún no hay especies aquí';
	@override String get deleteFavorite => 'Quitar de favoritos';
	@override String get empty => 'Empieza a marcar especies como favoritas para verlas aquí';
	@override String get error => 'Hemos hecho cambios importantes, toca en \'Recuperar las especies\' para actualizar la información, asegurate tener conexión a internet';
	@override String get canNot => 'No se pudo realizar esta acción';
	@override String get reestoreSpecies => 'Recuperar las especies';
	@override String get withoutSpecies => 'Todavía no tienes especies favoritas, puedes agregarlas desde la sección de especies';
	@override String get yeah => '!Se han restaurado todas tus especies favoritas!';
}

// Path: filterOptions
class _TranslationsFilterOptionsEs implements _TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get listByAlphabethic => 'Listar por orden alfabético';
	@override String get recentlyAdded => 'Más reciente';
	@override String get all => 'Todos';
	@override String get noPreferencies => 'Sin preferencias';
	@override late final _TranslationsFilterOptionsFilterByNameEs filterByName = _TranslationsFilterOptionsFilterByNameEs._(_root);
	@override late final _TranslationsFilterOptionsFilterBySoundEs filterBySound = _TranslationsFilterOptionsFilterBySoundEs._(_root);
	@override String get filterByConservation => 'Filtrar por estado de conservación';
	@override String get filterByCategory => 'Filtrar por categoría';
	@override String get filterByTaxonomy => 'Filtrar por taxonomía';
	@override String get filterByOrder => 'Filtrar por orden';
	@override String get filterByFamily => 'Filtrar por familia';
}

// Path: forgotPassword
class _TranslationsForgotPasswordEs implements _TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Olvidó su contraseña';
	@override String get sendLabel => 'Enviar';
	@override String get validatingLabel => 'Validando...';
	@override String get email => 'Correo';
	@override String get clear => 'Limpiar';
	@override String get message => 'Ingrese su email para enviarle un correo donde podrá cambiar su contraseña:';
	@override String get checkYourEmail => '¡Revisa tu correo!';
}

// Path: general
class _TranslationsGeneralEs implements _TranslationsGeneralEn {
	_TranslationsGeneralEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get back => 'Atrás';
	@override String get close => 'Cerrar';
	@override String get clear => 'Limpiar';
	@override String get search => 'Buscar';
	@override String get addToFavorites => 'Agregar a favoritos';
	@override String get removeFromFavorites => 'Quitar de favoritos';
	@override String get error404Again => 'Algo salió mal, inténtalo de nuevo';
	@override String get nameNotAvailable => 'Nombre no disponible';
	@override String get lastnameNotAvailable => 'Apellidos no disponibles';
	@override String get descriptionNotAvailable => 'Descripción no disponible';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPageEs implements _TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPageEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get amazon => 'Amazonía';
	@override String get institute => 'Instituto de Investigación de la Amazonía Peruana';
	@override String get title => 'Guía ilustrada de flora y fauna';
	@override String get commonNameNotAvailable => 'Nombre común no disponible';
	@override String get scientificNameNotAvailable => 'Nombre científico no disponible';
	@override String get author => 'Autor';
	@override String get authors => 'Autores';
	@override String get imageNotAvailable => 'Imagen no está disponible';
	@override String get taxonomicInformation => 'Información taxonómica';
	@override String get kingdom => 'Reino';
	@override String get phylum => 'Filo';
	@override String get class_ => 'Clase';
	@override String get order => 'Orden';
	@override String get family => 'Familia';
	@override String get authorInformation => 'Información del autor';
	@override String get name => 'Nombre';
	@override String get lastname => 'Apellidos';
	@override String get profession => 'Profesión';
	@override String get bornIn => 'Nació en';
	@override String get diedIn => 'Falleció en';
}

// Path: profile
class _TranslationsProfileEs implements _TranslationsProfileEn {
	_TranslationsProfileEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mi perfil';
	@override String get logout => 'Cerrar sesión';
	@override String get favorites => 'Mis favoritos';
	@override String get changePassword => 'Cambiar contraseña';
	@override String get share => 'Descarga la app Guía Ilustrada de Flora y Fauna del IIAP y conoce más sobre las especies de la Amazonía Peruana:';
	@override String get invite => 'Invitar amigos';
	@override String get project => 'Sobre el proyecto';
	@override String get team => 'Sobre nosotros';
	@override String get deleteAccount => 'Eliminar cuenta';
	@override String get userNotFound => 'Usuario no encontrado';
	@override String get completeProfile => 'Completa tu perfil para acceder a todas las funcionalidades de la aplicación.';
	@override String get completeButton => 'Completar perfil';
	@override String get editButton => 'Editar perfil';
}

// Path: searchPage
class _TranslationsSearchPageEs implements _TranslationsSearchPageEn {
	_TranslationsSearchPageEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get failedRequest => 'Algo salió mal. Inténtalo de nuevo';
	@override String get recentlyAdded => 'Recién agregado';
	@override late final _TranslationsSearchPageNameFilterEs nameFilter = _TranslationsSearchPageNameFilterEs._(_root);
	@override String get taxonomyFilter => 'Taxonomía';
	@override String get orderFilter => 'Orden';
	@override String get familyFilter => 'Familia';
	@override late final _TranslationsSearchPageSoundFilterEs soundFilter = _TranslationsSearchPageSoundFilterEs._(_root);
	@override String get conservationFilter => 'Conservación';
	@override late final _TranslationsSearchPageCategoryFilterEs categoryFilter = _TranslationsSearchPageCategoryFilterEs._(_root);
	@override String get cleanFilters => 'Limpiar filtros';
	@override String get searchSpecies => 'Buscar especies';
	@override String get cleanSearch => 'Limpiar búsqueda';
	@override String get errorFetchingTitle => 'Error al obtener resultados';
	@override String get errorFetchingContent => 'Inténtalo de nuevo';
	@override String get notResultsTitle => 'No se encontraron resultados';
	@override String get notResultsContent => 'No se encontraron resultados. Prueba otra búsqueda';
	@override String get errorFetchingSpecies => 'No se encontraron especies relacionadas con tu búsqueda. Por favor, intenta nuevamente con otra clase, orden o familia.';
	@override String get acceptText => 'Aceptar';
	@override String get updateText => 'Actualizar';
	@override String get aToZ => 'A-Z';
	@override String get zToA => 'Z-A';
}

// Path: signIn
class _TranslationsSignInEs implements _TranslationsSignInEn {
	_TranslationsSignInEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Amazonía';
	@override String get subtitle => 'Guía ilustrada de flora y fauna';
	@override String get email => 'E-Mail';
	@override String get password => 'Contraseña';
	@override String get enter => 'Ingresar';
	@override String get new_ => 'Si eres nuevo, regístrate aquí';
	@override String get view_password => 'Mostrar contraseña';
	@override String get clear => 'Limpiar';
	@override String get register_first => 'Primero debes registrarte';
	@override String get verify_email => 'Primero verifica tu correo electrónico';
	@override String get verify_email_more => 'Debes verificar tu correo electrónico para poder ingresar';
	@override String get forgot_password => '¿Olvidaste tu contraseña?';
}

// Path: signUp
class _TranslationsSignUpEs implements _TranslationsSignUpEn {
	_TranslationsSignUpEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registrarse';
	@override String get alreadyRegistered => '¿Ya tienes una cuenta? Inicia sesión';
	@override String get button => 'Registrarse';
	@override String get email => 'Correo';
	@override String get password => 'Contraseña';
	@override String get showPassword => 'Mostrar contraseña';
	@override String get repeatPassword => 'Repite tu contraseña';
	@override String get clear => 'Limpiar';
	@override String get network => 'Comprueba tu conexión a internet';
	@override String get credential => 'Credenciales incorrectas';
	@override String get disabled => 'Esta cuenta ha sido desactivada, inténtelo más tarde';
	@override String get notRegistered => 'Esta cuenta no está registrada';
	@override String get passwordNotMatch => 'Contraseña incorrecta';
	@override String get unknown => 'Error desconocido, inténtelo más tarde';
	@override String get sendedEmail => 'Se ha enviado un correo de confirmación a tu dirección de correo electrónico';
}

// Path: species
class _TranslationsSpeciesEs implements _TranslationsSpeciesEn {
	_TranslationsSpeciesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Especies';
	@override String get birds => 'Aves';
	@override String get mammals => 'Mamíferos';
	@override String get reptiles => 'Reptiles';
	@override String get amphibians => 'Anfibios';
	@override String get fishes => 'Peces';
	@override String get insects => 'Insectos';
	@override String get trees => 'Árboles';
	@override String get palms => 'Palmeras';
	@override String get orderName => 'Nombre común';
	@override String get orderScientificName => 'Nombre científico';
}

// Path: speciesDetails
class _TranslationsSpeciesDetailsEs implements _TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get authors => 'Autores';
	@override String get taxonomicInfo => 'Información Taxonómica';
	@override String get kingdom => 'Reino';
	@override String get filo => 'Filo';
	@override String get classes => 'Clase';
	@override String get order => 'Orden';
	@override String get family => 'Familia';
	@override String get download => 'Descargar';
	@override String get generatePdf => 'Generar PDF';
	@override String get downloadImage => 'Descargar Imagen';
	@override String get downloadAudio => 'Descargar Audio';
	@override String get share => 'Compartir';
	@override String get errorDownload => 'Error al Descargar';
	@override String get successDownload => 'Descarga Exitosa';
	@override String get shareAmazonInfo => '¡Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre.';
	@override String get shareAmazon => '¡Comparte la belleza de la Amazonía!';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPageEs implements _TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPageEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get download => 'Descargar';
	@override String get errorDownload => 'No se pudo descargar';
	@override String get downloadImage => 'Descargar imagen';
	@override String get downloadAudio => 'Descargar audio';
	@override String get share => 'Compartir';
	@override String get generatePdf => 'Generar PDF';
	@override String get attractiveMessage => 'Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre';
	@override String get conservationStates => 'Estados de conservación';
	@override String get noInformation => 'Sin información';
	@override String get nameNotAvailable => 'Nombre no disponible';
	@override String get scientificNameNotAvailable => 'Nombre científico no disponible';
	@override String get year => 'Año';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailureEs implements _TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailureEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get network => 'Comprueba tu conexión a internet';
	@override String get credential => 'Credenciales incorrectas';
	@override String get disable => 'Esta cuenta ha sido desactivada, inténtelo más tarde';
	@override String get notRegistered => 'El correo no está registrado';
	@override String get password => 'Contraseña incorrecta';
	@override String get unknown => 'Error desconocido';
}

// Path: validator
class _TranslationsValidatorEs implements _TranslationsValidatorEn {
	_TranslationsValidatorEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsValidatorPasswordEs password = _TranslationsValidatorPasswordEs._(_root);
	@override late final _TranslationsValidatorRepeatPasswordEs repeatPassword = _TranslationsValidatorRepeatPasswordEs._(_root);
	@override late final _TranslationsValidatorEmailEs email = _TranslationsValidatorEmailEs._(_root);
	@override late final _TranslationsValidatorNameEs name = _TranslationsValidatorNameEs._(_root);
	@override late final _TranslationsValidatorLastNameEs lastName = _TranslationsValidatorLastNameEs._(_root);
	@override late final _TranslationsValidatorPhoneEs phone = _TranslationsValidatorPhoneEs._(_root);
	@override late final _TranslationsValidatorCountryCodeEs countryCode = _TranslationsValidatorCountryCodeEs._(_root);
}

// Path: filterOptions.filterByName
class _TranslationsFilterOptionsFilterByNameEs implements _TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNameEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrar por nombre';
	@override String get common => 'Nombre común';
	@override String get scientific => 'Nombre científico';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundEs implements _TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrar por sonido';
	@override String get withSound => 'Con sonido';
	@override String get withoutSound => 'Sin sonido';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterEs implements _TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get common => 'Común';
	@override String get scientific => 'Científico';
	@override String get order => 'Ordenar por';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterEs implements _TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get withSound => 'Con sonido';
	@override String get withoutSound => 'Sin sonido';
	@override String get sound => 'Sonido';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterEs implements _TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get category => 'Categoría';
	@override String get birds => 'Aves';
	@override String get mammals => 'Mamíferos';
	@override String get reptiles => 'Reptiles';
	@override String get amphibians => 'Anfibios';
	@override String get fish => 'Peces';
	@override String get insects => 'Insectos';
	@override String get plants => 'Plantas';
	@override String get palms => 'Palmeras';
}

// Path: validator.password
class _TranslationsValidatorPasswordEs implements _TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Contraseña';
	@override String get empty => 'Ingrese su contraseña';
	@override String get minLength => 'Ingrese al menos 6 caracteres';
	@override String get regExp => 'La contraseña debe contener al menos un número y una letra';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordEs implements _TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Ingrese su contraseña';
	@override String get minLength => 'Ingrese al menos 6 caracteres';
	@override String get regExp => 'La contraseña debe contener al menos un número y una letra';
	@override String get matchPassword => 'Las contraseñas deben coincidir';
}

// Path: validator.email
class _TranslationsValidatorEmailEs implements _TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Correo electrónico';
	@override String get empty => 'Ingrese su correo electrónico';
	@override String get regExp => 'Ingrese un correo electrónico válido';
}

// Path: validator.name
class _TranslationsValidatorNameEs implements _TranslationsValidatorNameEn {
	_TranslationsValidatorNameEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nombre';
	@override String get empty => 'Ingrese su nombre';
	@override String get minLength => 'Ingrese al menos 3 caracteres';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameEs implements _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Apellido';
	@override String get empty => 'Ingrese su apellido';
	@override String get minLength => 'Ingrese al menos 3 caracteres';
}

// Path: validator.phone
class _TranslationsValidatorPhoneEs implements _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Número de teléfono';
	@override String get empty => 'Ingrese su número de teléfono';
	@override String get minLength => 'Ingrese al menos 9 caracteres';
	@override String get regExp => 'Ingrese un número de teléfono válido';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodeEs implements _TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodeEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Código de país';
	@override String get select => 'Seleccione el código de país';
}

// Path: <root>
class _TranslationsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsFr.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fr,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fr>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsFr _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsAboutProjectFr aboutProject = _TranslationsAboutProjectFr._(_root);
	@override late final _TranslationsAuthorsFr authors = _TranslationsAuthorsFr._(_root);
	@override late final _TranslationsBottomBarFr bottomBar = _TranslationsBottomBarFr._(_root);
	@override late final _TranslationsCommunityFr community = _TranslationsCommunityFr._(_root);
	@override late final _TranslationsDeleteAccountFr deleteAccount = _TranslationsDeleteAccountFr._(_root);
	@override late final _TranslationsEditProfileFr editProfile = _TranslationsEditProfileFr._(_root);
	@override late final _TranslationsErrorPageFr errorPage = _TranslationsErrorPageFr._(_root);
	@override late final _TranslationsFavoritesFr favorites = _TranslationsFavoritesFr._(_root);
	@override late final _TranslationsFilterOptionsFr filterOptions = _TranslationsFilterOptionsFr._(_root);
	@override late final _TranslationsForgotPasswordFr forgotPassword = _TranslationsForgotPasswordFr._(_root);
	@override late final _TranslationsGeneralFr general = _TranslationsGeneralFr._(_root);
	@override late final _TranslationsPdfPreviewPageFr pdfPreviewPage = _TranslationsPdfPreviewPageFr._(_root);
	@override late final _TranslationsProfileFr profile = _TranslationsProfileFr._(_root);
	@override late final _TranslationsSearchPageFr searchPage = _TranslationsSearchPageFr._(_root);
	@override late final _TranslationsSignInFr signIn = _TranslationsSignInFr._(_root);
	@override late final _TranslationsSignUpFr signUp = _TranslationsSignUpFr._(_root);
	@override late final _TranslationsSpeciesFr species = _TranslationsSpeciesFr._(_root);
	@override late final _TranslationsSpeciesDetailsFr speciesDetails = _TranslationsSpeciesDetailsFr._(_root);
	@override late final _TranslationsSpeciesDetailsPageFr speciesDetailsPage = _TranslationsSpeciesDetailsPageFr._(_root);
	@override late final _TranslationsUserCredentialFailureFr userCredentialFailure = _TranslationsUserCredentialFailureFr._(_root);
	@override late final _TranslationsValidatorFr validator = _TranslationsValidatorFr._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectFr implements _TranslationsAboutProjectEn {
	_TranslationsAboutProjectFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'À propos du projet';
	@override String get getBook => 'Obtenir le livre';
	@override String get titleBook => 'AMAZONIE';
	@override String get subtitleBook => 'Guide illustré de la flore et de la faune';
	@override String get p1 => 'Bienvenue sur la plateforme mobile du Guide Illustré de la Flore et de la Faune de l\'Amazonie. Plongez dans la richesse et la diversité de cette région unique à travers une expérience interactive basée sur des données mises à jour jusqu\'en 2022';
	@override String get content => 'À propos du contenu';
	@override String get p2 => 'Notre plateforme est une fenêtre sur l\'étonnante biodiversité amazonienne. À travers un contenu expert et des images visuellement stupéfiantes, nous vous invitons à explorer la beauté inégalée de cette région et à comprendre son importance critique pour notre planète.';
	@override String get commitment => 'Notre engagement';
	@override String get p3 => 'Nous nous efforçons de sensibiliser à l\'immense importance de la biodiversité et de sa protection, notamment dans les régions les plus vulnérables et parmi les populations affectées par la dégradation et le changement climatique.';
	@override String get contact => 'Contactez-nous';
	@override String get p4 => 'Pour plus d\'informations sur le projet, contactez l\'Institut de Recherche de l\'Amazonie Péruvienne (IIAP) via le site web : ';
	@override String get address => 'Route Iquitos - Nauta Km 4.5, Quistococha, District de San Juan Bautista, Maynas, Loreto : ';
}

// Path: authors
class _TranslationsAuthorsFr implements _TranslationsAuthorsEn {
	_TranslationsAuthorsFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Auteurs';
	@override String get withoutAuthors => 'Il semble qu\'il n\'y ait pas d\'auteurs ici';
	@override String get professionNotAvailable => 'Profession non disponible';
}

// Path: bottomBar
class _TranslationsBottomBarFr implements _TranslationsBottomBarEn {
	_TranslationsBottomBarFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Accueil';
	@override String get search => 'Rechercher';
	@override String get favorites => 'Favoris';
}

// Path: community
class _TranslationsCommunityFr implements _TranslationsCommunityEn {
	_TranslationsCommunityFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Communautés autochtones';
	@override String get withoutCommunities => 'Il semble qu\'il n\'y ait pas de communautés autochtones ici';
}

// Path: deleteAccount
class _TranslationsDeleteAccountFr implements _TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Supprimer le compte';
	@override String get userInfo => 'Informations sur l\'utilisateur :';
	@override String get username => 'Nom d\'utilisateur';
	@override String get email => 'Email';
	@override String get phone => 'Téléphone';
	@override String get delete => 'Supprimer le compte';
	@override String get warning => 'En supprimant votre compte, vous acceptez les conditions suivantes :';
	@override String get firtsTerm => '- Vous ne pourrez pas récupérer votre compte.';
	@override String get secondTerm => '- Vous ne pourrez pas récupérer vos données.';
	@override String get confirm => 'Confirmer';
	@override String get cancel => 'Annuler';
	@override String get information => 'Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible. Entrez votre mot de passe pour confirmer.';
	@override String get accountDeleted => 'Compte supprimé avec succès';
	@override String get notRegistered => 'Non inscrit';
}

// Path: editProfile
class _TranslationsEditProfileFr implements _TranslationsEditProfileEn {
	_TranslationsEditProfileFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get errorSnack => 'Erreur lors du chargement des données utilisateur';
	@override String get title => 'Modifier le profil';
	@override String get save => 'Enregistrer';
	@override String get saving => 'Enregistrement...';
	@override String get errorSaving => 'Erreur lors de l\'enregistrement des données du profil';
	@override String get selectImage => 'Sélectionnez une photo de profil';
	@override String get errorSave => 'Erreur lors de l\'enregistrement du profil';
}

// Path: errorPage
class _TranslationsErrorPageFr implements _TranslationsErrorPageEn {
	_TranslationsErrorPageFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get page_not_exist => 'Cette page n\'existe plus';
	@override String get go_back => 'Retour aux espèces';
}

// Path: favorites
class _TranslationsFavoritesFr implements _TranslationsFavoritesEn {
	_TranslationsFavoritesFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoris';
	@override String get hintText => 'Recherchez votre favori';
	@override String get exceptionText => 'Il n\'y a pas encore d\'espèces ici';
	@override String get deleteFavorite => 'Retirer des favoris';
	@override String get empty => 'Commencez à marquer des espèces comme favorites pour les voir ici';
	@override String get error => 'Nous avons apporté des modifications importantes, appuyez sur \'Restaurer les espèces\' pour mettre à jour les informations, assurez-vous d\'avoir une connexion Internet';
	@override String get canNot => 'Cette action n\'a pas pu être effectuée';
	@override String get reestoreSpecies => 'Restaurer les espèces';
	@override String get withoutSpecies => 'Vous n\'avez pas encore d\'espèces favorites, vous pouvez les ajouter depuis la section des espèces';
	@override String get yeah => 'Toutes vos espèces favorites ont été restaurées!';
}

// Path: filterOptions
class _TranslationsFilterOptionsFr implements _TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get listByAlphabethic => 'Trier par ordre alphabétique';
	@override String get recentlyAdded => 'Plus récent';
	@override String get all => 'Tout';
	@override String get noPreferencies => 'Pas de préférences';
	@override late final _TranslationsFilterOptionsFilterByNameFr filterByName = _TranslationsFilterOptionsFilterByNameFr._(_root);
	@override late final _TranslationsFilterOptionsFilterBySoundFr filterBySound = _TranslationsFilterOptionsFilterBySoundFr._(_root);
	@override String get filterByConservation => 'Filtrer par état de conservation';
	@override String get filterByCategory => 'Filtrer par catégorie';
	@override String get filterByTaxonomy => 'Filtrer par taxonomie';
	@override String get filterByOrder => 'Filtrer par ordre';
	@override String get filterByFamily => 'Filtrer par famille';
}

// Path: forgotPassword
class _TranslationsForgotPasswordFr implements _TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mot de passe oublié';
	@override String get sendLabel => 'Envoyer';
	@override String get validatingLabel => 'Validation en cours...';
	@override String get email => 'Email';
	@override String get clear => 'Effacer';
	@override String get message => 'Entrez votre adresse e-mail pour recevoir un e-mail vous permettant de changer votre mot de passe :';
	@override String get checkYourEmail => 'Vérifiez votre e-mail !';
}

// Path: general
class _TranslationsGeneralFr implements _TranslationsGeneralEn {
	_TranslationsGeneralFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get back => 'Retour';
	@override String get close => 'Fermer';
	@override String get clear => 'Effacer';
	@override String get search => 'Rechercher';
	@override String get addToFavorites => 'Ajouter aux favoris';
	@override String get removeFromFavorites => 'Retirer des favoris';
	@override String get error404Again => 'Quelque chose s\'est mal passé, veuillez réessayer';
	@override String get nameNotAvailable => 'Nom non disponible';
	@override String get lastnameNotAvailable => 'Nom de famille non disponible';
	@override String get descriptionNotAvailable => 'Description non disponible';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPageFr implements _TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPageFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get amazon => 'Amazone';
	@override String get institute => 'Institut de Recherche de l\'Amazonie Péruvienne';
	@override String get title => 'Guide illustré de la flore et de la faune';
	@override String get commonNameNotAvailable => 'Nom commun non disponible';
	@override String get scientificNameNotAvailable => 'Nom scientifique non disponible';
	@override String get author => 'Auteur';
	@override String get authors => 'Auteurs';
	@override String get imageNotAvailable => 'Image non disponible';
	@override String get taxonomicInformation => 'Informations taxonomiques';
	@override String get kingdom => 'Règne';
	@override String get phylum => 'Embranchement';
	@override String get class_ => 'Classe';
	@override String get order => 'Ordre';
	@override String get family => 'Famille';
	@override String get authorInformation => 'Informations sur l\'auteur';
	@override String get name => 'Prénom';
	@override String get lastname => 'Nom';
	@override String get profession => 'Profession';
	@override String get bornIn => 'Né en';
	@override String get diedIn => 'Décédé en';
}

// Path: profile
class _TranslationsProfileFr implements _TranslationsProfileEn {
	_TranslationsProfileFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mon profil';
	@override String get logout => 'Déconnexion';
	@override String get favorites => 'Mes favoris';
	@override String get changePassword => 'Changer le mot de passe';
	@override String get share => 'Téléchargez l\'application Guide illustré de la flore et de la faune de l\'IIAP et apprenez-en davantage sur les espèces de l\'Amazonie péruvienne :';
	@override String get invite => 'Inviter des amis';
	@override String get project => 'À propos du projet';
	@override String get team => 'À propos de nous';
	@override String get deleteAccount => 'Supprimer le compte';
	@override String get userNotFound => 'Utilisateur non trouvé';
	@override String get completeProfile => 'Complétez votre profil pour accéder à toutes les fonctionnalités de l\'application.';
	@override String get completeButton => 'Compléter le profil';
	@override String get editButton => 'Modifier le profil';
}

// Path: searchPage
class _TranslationsSearchPageFr implements _TranslationsSearchPageEn {
	_TranslationsSearchPageFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get failedRequest => 'Quelque chose s\'est mal passé. Veuillez réessayer';
	@override String get recentlyAdded => 'Récemment ajouté';
	@override late final _TranslationsSearchPageNameFilterFr nameFilter = _TranslationsSearchPageNameFilterFr._(_root);
	@override String get taxonomyFilter => 'Taxonomie';
	@override String get orderFilter => 'Ordre';
	@override String get familyFilter => 'Famille';
	@override late final _TranslationsSearchPageSoundFilterFr soundFilter = _TranslationsSearchPageSoundFilterFr._(_root);
	@override String get conservationFilter => 'Conservation';
	@override late final _TranslationsSearchPageCategoryFilterFr categoryFilter = _TranslationsSearchPageCategoryFilterFr._(_root);
	@override String get cleanFilters => 'Effacer les filtres';
	@override String get searchSpecies => 'Rechercher des espèces';
	@override String get cleanSearch => 'Effacer la recherche';
	@override String get errorFetchingTitle => 'Erreur lors de la récupération des résultats';
	@override String get errorFetchingContent => 'Réessayer';
	@override String get notResultsTitle => 'Aucun résultat trouvé';
	@override String get notResultsContent => 'Aucun résultat trouvé. Essayez une autre recherche';
	@override String get errorFetchingSpecies => 'Aucune espèce trouvée liée à votre recherche. Veuillez réessayer avec une autre classe, ordre ou famille.';
	@override String get acceptText => 'Accepter';
	@override String get updateText => 'Mettre à jour';
	@override String get aToZ => 'A-Z';
	@override String get zToA => 'Z-A';
}

// Path: signIn
class _TranslationsSignInFr implements _TranslationsSignInEn {
	_TranslationsSignInFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Forêt amazonienne';
	@override String get subtitle => 'Guide illustré de la flore et de la faune';
	@override String get email => 'E-Mail';
	@override String get password => 'Mot de passe';
	@override String get enter => 'Entrer';
	@override String get new_ => 'Si vous êtes nouveau, inscrivez-vous ici';
	@override String get view_password => 'Afficher le mot de passe';
	@override String get clear => 'Effacer';
	@override String get register_first => 'Vous devez d\'abord vous inscrire';
	@override String get verify_email => 'Vérifiez d\'abord votre e-mail';
	@override String get verify_email_more => 'Vous devez vérifier votre e-mail pour vous connecter';
	@override String get forgot_password => 'Mot de passe oublié ?';
}

// Path: signUp
class _TranslationsSignUpFr implements _TranslationsSignUpEn {
	_TranslationsSignUpFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'S\'inscrire';
	@override String get alreadyRegistered => 'Vous avez déjà un compte ? Connectez-vous';
	@override String get button => 'S\'inscrire';
	@override String get email => 'E-mail';
	@override String get password => 'Mot de passe';
	@override String get showPassword => 'Afficher le mot de passe';
	@override String get repeatPassword => 'Répéter votre mot de passe';
	@override String get clear => 'Effacer';
	@override String get network => 'Vérifiez votre connexion internet';
	@override String get credential => 'Identifiants incorrects';
	@override String get disabled => 'Ce compte a été désactivé, veuillez réessayer plus tard';
	@override String get notRegistered => 'Ce compte n\'est pas enregistré';
	@override String get passwordNotMatch => 'Mot de passe incorrect';
	@override String get unknown => 'Erreur inconnue, veuillez réessayer plus tard';
	@override String get sendedEmail => 'Un e-mail de confirmation a été envoyé à votre adresse e-mail';
}

// Path: species
class _TranslationsSpeciesFr implements _TranslationsSpeciesEn {
	_TranslationsSpeciesFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Espèces';
	@override String get birds => 'Oiseaux';
	@override String get mammals => 'Mammifères';
	@override String get reptiles => 'Reptiles';
	@override String get amphibians => 'Amphibiens';
	@override String get fishes => 'Poissons';
	@override String get insects => 'Insectes';
	@override String get trees => 'Arbres';
	@override String get palms => 'Palmiers';
	@override String get orderName => 'Nom commun';
	@override String get orderScientificName => 'Nom scientifique';
}

// Path: speciesDetails
class _TranslationsSpeciesDetailsFr implements _TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get authors => 'Auteurs';
	@override String get taxonomicInfo => 'Information Taxonomique';
	@override String get kingdom => 'Royaume';
	@override String get filo => 'Phylum';
	@override String get classes => 'Classe';
	@override String get order => 'Ordre';
	@override String get family => 'Famille';
	@override String get download => 'Télécharger';
	@override String get generatePdf => 'Générer PDF';
	@override String get downloadImage => 'Télécharger l\'Image';
	@override String get downloadAudio => 'Télécharger l\'Audio';
	@override String get share => 'Partager';
	@override String get errorDownload => 'Erreur de Téléchargement';
	@override String get successDownload => 'Téléchargement Réussi';
	@override String get shareAmazonInfo => 'Partagez la beauté de l\'Amazonie ! Partagez ces précieuses informations sur.';
	@override String get shareAmazon => 'Partagez la beauté de l\'Amazonie !';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPageFr implements _TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPageFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get download => 'Télécharger';
	@override String get errorDownload => 'Téléchargement impossible';
	@override String get downloadImage => 'Télécharger l\'image';
	@override String get downloadAudio => 'Télécharger l\'audio';
	@override String get share => 'Partager';
	@override String get generatePdf => 'Générer PDF';
	@override String get attractiveMessage => 'Partagez la beauté de l\'Amazonie ! Partagez cette information précieuse sur';
	@override String get conservationStates => 'Statuts de conservation';
	@override String get noInformation => 'Pas d\'information';
	@override String get nameNotAvailable => 'Nom non disponible';
	@override String get scientificNameNotAvailable => 'Nom scientifique non disponible';
	@override String get year => 'Année';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailureFr implements _TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailureFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get network => 'Vérifiez votre connexion internet';
	@override String get credential => 'Identifiants incorrects';
	@override String get disable => 'Ce compte a été désactivé, veuillez réessayer ultérieurement';
	@override String get notRegistered => 'L\'e-mail n\'est pas enregistré';
	@override String get password => 'Mot de passe incorrect';
	@override String get unknown => 'Erreur inconnue';
}

// Path: validator
class _TranslationsValidatorFr implements _TranslationsValidatorEn {
	_TranslationsValidatorFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsValidatorPasswordFr password = _TranslationsValidatorPasswordFr._(_root);
	@override late final _TranslationsValidatorRepeatPasswordFr repeatPassword = _TranslationsValidatorRepeatPasswordFr._(_root);
	@override late final _TranslationsValidatorEmailFr email = _TranslationsValidatorEmailFr._(_root);
	@override late final _TranslationsValidatorNameFr name = _TranslationsValidatorNameFr._(_root);
	@override late final _TranslationsValidatorLastNameFr lastName = _TranslationsValidatorLastNameFr._(_root);
	@override late final _TranslationsValidatorPhoneFr phone = _TranslationsValidatorPhoneFr._(_root);
	@override late final _TranslationsValidatorCountryCodeFr countryCode = _TranslationsValidatorCountryCodeFr._(_root);
}

// Path: filterOptions.filterByName
class _TranslationsFilterOptionsFilterByNameFr implements _TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNameFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrer par nom';
	@override String get common => 'Nom commun';
	@override String get scientific => 'Nom scientifique';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundFr implements _TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrer par son';
	@override String get withSound => 'Avec son';
	@override String get withoutSound => 'Sans son';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterFr implements _TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get common => 'Commun';
	@override String get scientific => 'Scientifique';
	@override String get order => 'Trier par';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterFr implements _TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get withSound => 'Avec son';
	@override String get withoutSound => 'Sans son';
	@override String get sound => 'Son';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterFr implements _TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get category => 'Catégorie';
	@override String get birds => 'Oiseaux';
	@override String get mammals => 'Mammifères';
	@override String get reptiles => 'Reptiles';
	@override String get amphibians => 'Amphibiens';
	@override String get fish => 'Poissons';
	@override String get insects => 'Insectes';
	@override String get plants => 'Plantes';
	@override String get palms => 'Palmiers';
}

// Path: validator.password
class _TranslationsValidatorPasswordFr implements _TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Mot de passe';
	@override String get empty => 'Entrez votre mot de passe';
	@override String get minLength => 'Entrez au moins 6 caractères';
	@override String get regExp => 'Le mot de passe doit contenir au moins un chiffre et une lettre';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordFr implements _TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Entrez votre mot de passe';
	@override String get minLength => 'Entrez au moins 6 caractères';
	@override String get regExp => 'Le mot de passe doit contenir au moins un chiffre et une lettre';
	@override String get matchPassword => 'Les mots de passe doivent correspondre';
}

// Path: validator.email
class _TranslationsValidatorEmailFr implements _TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Email';
	@override String get empty => 'Entrez votre email';
	@override String get regExp => 'Entrez un email valide';
}

// Path: validator.name
class _TranslationsValidatorNameFr implements _TranslationsValidatorNameEn {
	_TranslationsValidatorNameFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nom';
	@override String get empty => 'Entrez votre nom';
	@override String get minLength => 'Entrez au moins 3 caractères';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameFr implements _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nom de famille';
	@override String get empty => 'Entrez votre nom de famille';
	@override String get minLength => 'Entrez au moins 3 caractères';
}

// Path: validator.phone
class _TranslationsValidatorPhoneFr implements _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Numéro de téléphone';
	@override String get empty => 'Entrez votre numéro de téléphone';
	@override String get minLength => 'Entrez au moins 9 caractères';
	@override String get regExp => 'Entrez un numéro de téléphone valide';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodeFr implements _TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodeFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Code pays';
	@override String get select => 'Sélectionnez le code pays';
}

// Path: <root>
class _TranslationsPt implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsPt.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.pt,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <pt>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsPt _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsAboutProjectPt aboutProject = _TranslationsAboutProjectPt._(_root);
	@override late final _TranslationsAuthorsPt authors = _TranslationsAuthorsPt._(_root);
	@override late final _TranslationsBottomBarPt bottomBar = _TranslationsBottomBarPt._(_root);
	@override late final _TranslationsCommunityPt community = _TranslationsCommunityPt._(_root);
	@override late final _TranslationsDeleteAccountPt deleteAccount = _TranslationsDeleteAccountPt._(_root);
	@override late final _TranslationsEditProfilePt editProfile = _TranslationsEditProfilePt._(_root);
	@override late final _TranslationsErrorPagePt errorPage = _TranslationsErrorPagePt._(_root);
	@override late final _TranslationsFavoritesPt favorites = _TranslationsFavoritesPt._(_root);
	@override late final _TranslationsFilterOptionsPt filterOptions = _TranslationsFilterOptionsPt._(_root);
	@override late final _TranslationsForgotPasswordPt forgotPassword = _TranslationsForgotPasswordPt._(_root);
	@override late final _TranslationsGeneralPt general = _TranslationsGeneralPt._(_root);
	@override late final _TranslationsPdfPreviewPagePt pdfPreviewPage = _TranslationsPdfPreviewPagePt._(_root);
	@override late final _TranslationsProfilePt profile = _TranslationsProfilePt._(_root);
	@override late final _TranslationsSearchPagePt searchPage = _TranslationsSearchPagePt._(_root);
	@override late final _TranslationsSignInPt signIn = _TranslationsSignInPt._(_root);
	@override late final _TranslationsSignUpPt signUp = _TranslationsSignUpPt._(_root);
	@override late final _TranslationsSpeciesPt species = _TranslationsSpeciesPt._(_root);
	@override late final _TranslationsSpeciesDetailsPt speciesDetails = _TranslationsSpeciesDetailsPt._(_root);
	@override late final _TranslationsSpeciesDetailsPagePt speciesDetailsPage = _TranslationsSpeciesDetailsPagePt._(_root);
	@override late final _TranslationsUserCredentialFailurePt userCredentialFailure = _TranslationsUserCredentialFailurePt._(_root);
	@override late final _TranslationsValidatorPt validator = _TranslationsValidatorPt._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectPt implements _TranslationsAboutProjectEn {
	_TranslationsAboutProjectPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sobre o projeto';
	@override String get getBook => 'Obter o livro';
	@override String get titleBook => 'AMAZONIA';
	@override String get subtitleBook => 'Guia Ilustrado de Flora e Fauna';
	@override String get p1 => 'Bem-vindo à plataforma móvel do Guia Ilustrado de Flora e Fauna da Amazônia. Explore a riqueza e a diversidade desta região única através de uma experiência interativa baseada em dados atualizados até 2022';
	@override String get content => 'Sobre o conteúdo';
	@override String get p2 => 'Nossa plataforma é uma janela para a surpreendente biodiversidade amazônica. Através de conteúdo especializado e imagens visualmente impressionantes, convidamos você a explorar a beleza incomparável desta região e entender sua importância crítica para nosso planeta.';
	@override String get commitment => 'Nosso compromisso';
	@override String get p3 => 'Nos esforçamos para conscientizar sobre a imensa importância da biodiversidade e sua proteção, especialmente nas regiões mais vulneráveis e entre as populações afetadas pela degradação e mudanças climáticas.';
	@override String get contact => 'Entre em contato';
	@override String get p4 => 'Para mais informações sobre o projeto, entre em contato com o Instituto de Pesquisas da Amazônia Peruana (IIAP) através do site: ';
	@override String get address => 'Estrada Iquitos - Nauta Km 4.5, Quistococha, Distrito de San Juan Bautista, Maynas, Loreto: ';
}

// Path: authors
class _TranslationsAuthorsPt implements _TranslationsAuthorsEn {
	_TranslationsAuthorsPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Autores';
	@override String get withoutAuthors => 'Parece que não há autores aqui';
	@override String get professionNotAvailable => 'Profissão não disponível';
}

// Path: bottomBar
class _TranslationsBottomBarPt implements _TranslationsBottomBarEn {
	_TranslationsBottomBarPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Início';
	@override String get search => 'Buscar';
	@override String get favorites => 'Favoritos';
}

// Path: community
class _TranslationsCommunityPt implements _TranslationsCommunityEn {
	_TranslationsCommunityPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comunidades indígenas';
	@override String get withoutCommunities => 'Parece que não há comunidades indígenas aqui';
}

// Path: deleteAccount
class _TranslationsDeleteAccountPt implements _TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Excluir conta';
	@override String get userInfo => 'Informações do usuário:';
	@override String get username => 'Nome de usuário';
	@override String get email => 'Email';
	@override String get phone => 'Telefone';
	@override String get delete => 'Excluir conta';
	@override String get warning => 'Ao excluir sua conta, você concorda com os seguintes termos:';
	@override String get firtsTerm => '- Você não poderá recuperar sua conta.';
	@override String get secondTerm => '- Você não poderá recuperar seus dados.';
	@override String get confirm => 'Confirmar';
	@override String get cancel => 'Cancelar';
	@override String get information => 'Tem certeza de que deseja excluir sua conta? Esta ação é irreversível. Digite sua senha para confirmar.';
	@override String get accountDeleted => 'Conta excluída com sucesso';
	@override String get notRegistered => 'Não registrado';
}

// Path: editProfile
class _TranslationsEditProfilePt implements _TranslationsEditProfileEn {
	_TranslationsEditProfilePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get errorSnack => 'Erro ao carregar os dados do usuário';
	@override String get title => 'Editar perfil';
	@override String get save => 'Salvar';
	@override String get saving => 'Salvando...';
	@override String get errorSaving => 'Erro ao salvar os dados do perfil';
	@override String get selectImage => 'Selecione uma imagem de perfil';
	@override String get errorSave => 'Erro ao salvar o perfil';
}

// Path: errorPage
class _TranslationsErrorPagePt implements _TranslationsErrorPageEn {
	_TranslationsErrorPagePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get page_not_exist => 'Esta página não existe mais';
	@override String get go_back => 'Voltar para espécies';
}

// Path: favorites
class _TranslationsFavoritesPt implements _TranslationsFavoritesEn {
	_TranslationsFavoritesPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoritos';
	@override String get hintText => 'Procure seu favorito';
	@override String get exceptionText => 'Ainda não há espécies aqui';
	@override String get deleteFavorite => 'Remover dos favoritos';
	@override String get empty => 'Comece a marcar espécies como favoritas para vê-las aqui';
	@override String get error => 'Fizemos mudanças importantes, toque em \'Restaurar as espécies\' para atualizar as informações, certifique-se de estar conectado à internet';
	@override String get canNot => 'Não foi possível realizar esta ação';
	@override String get reestoreSpecies => 'Restaurar as espécies';
	@override String get withoutSpecies => 'Você ainda não tem espécies favoritas, pode adicioná-las na seção de espécies';
	@override String get yeah => 'Todas as suas espécies favoritas foram restauradas!';
}

// Path: filterOptions
class _TranslationsFilterOptionsPt implements _TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get listByAlphabethic => 'Listar por ordem alfabética';
	@override String get recentlyAdded => 'Mais recente';
	@override String get all => 'Todos';
	@override String get noPreferencies => 'Sem preferências';
	@override late final _TranslationsFilterOptionsFilterByNamePt filterByName = _TranslationsFilterOptionsFilterByNamePt._(_root);
	@override late final _TranslationsFilterOptionsFilterBySoundPt filterBySound = _TranslationsFilterOptionsFilterBySoundPt._(_root);
	@override String get filterByConservation => 'Filtrar por estado de conservação';
	@override String get filterByCategory => 'Filtrar por categoria';
	@override String get filterByTaxonomy => 'Filtrar por taxonomia';
	@override String get filterByOrder => 'Filtrar por ordem';
	@override String get filterByFamily => 'Filtrar por família';
}

// Path: forgotPassword
class _TranslationsForgotPasswordPt implements _TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Esqueceu sua senha';
	@override String get sendLabel => 'Enviar';
	@override String get validatingLabel => 'Validando...';
	@override String get email => 'Email';
	@override String get clear => 'Limpar';
	@override String get message => 'Digite seu email para enviar um email onde você pode alterar sua senha:';
	@override String get checkYourEmail => 'Verifique seu email!';
}

// Path: general
class _TranslationsGeneralPt implements _TranslationsGeneralEn {
	_TranslationsGeneralPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get back => 'Voltar';
	@override String get close => 'Fechar';
	@override String get clear => 'Limpar';
	@override String get search => 'Buscar';
	@override String get addToFavorites => 'Adicionar aos favoritos';
	@override String get removeFromFavorites => 'Remover dos favoritos';
	@override String get error404Again => 'Algo deu errado, por favor tente novamente';
	@override String get nameNotAvailable => 'Nome não disponível';
	@override String get lastnameNotAvailable => 'Sobrenome não disponível';
	@override String get descriptionNotAvailable => 'Descrição não disponível';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPagePt implements _TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPagePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get amazon => 'Amazonas';
	@override String get institute => 'Instituto de Pesquisa da Amazônia Peruana';
	@override String get title => 'Guia Ilustrado de Flora e Fauna';
	@override String get commonNameNotAvailable => 'Nome comum não disponível';
	@override String get scientificNameNotAvailable => 'Nome científico não disponível';
	@override String get author => 'Autor';
	@override String get authors => 'Autores';
	@override String get imageNotAvailable => 'Imagem não disponível';
	@override String get taxonomicInformation => 'Informação taxonômica';
	@override String get kingdom => 'Reino';
	@override String get phylum => 'Filo';
	@override String get class_ => 'Classe';
	@override String get order => 'Ordem';
	@override String get family => 'Família';
	@override String get authorInformation => 'Informação do autor';
	@override String get name => 'Nome';
	@override String get lastname => 'Sobrenome';
	@override String get profession => 'Profissão';
	@override String get bornIn => 'Nasceu em';
	@override String get diedIn => 'Faleceu em';
}

// Path: profile
class _TranslationsProfilePt implements _TranslationsProfileEn {
	_TranslationsProfilePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Meu perfil';
	@override String get logout => 'Sair';
	@override String get favorites => 'Meus favoritos';
	@override String get changePassword => 'Alterar senha';
	@override String get share => 'Baixe o aplicativo Guia Ilustrado de Flora e Fauna do IIAP e saiba mais sobre as espécies da Amazônia Peruana:';
	@override String get invite => 'Convidar amigos';
	@override String get project => 'Sobre o projeto';
	@override String get team => 'Sobre nós';
	@override String get deleteAccount => 'Excluir conta';
	@override String get userNotFound => 'Usuário não encontrado';
	@override String get completeProfile => 'Complete seu perfil para acessar todos os recursos do aplicativo.';
	@override String get completeButton => 'Completar perfil';
	@override String get editButton => 'Editar perfil';
}

// Path: searchPage
class _TranslationsSearchPagePt implements _TranslationsSearchPageEn {
	_TranslationsSearchPagePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get failedRequest => 'Algo deu errado. Por favor, tente novamente';
	@override String get recentlyAdded => 'Recentemente adicionado';
	@override late final _TranslationsSearchPageNameFilterPt nameFilter = _TranslationsSearchPageNameFilterPt._(_root);
	@override String get taxonomyFilter => 'Taxonomia';
	@override String get orderFilter => 'Ordem';
	@override String get familyFilter => 'Família';
	@override late final _TranslationsSearchPageSoundFilterPt soundFilter = _TranslationsSearchPageSoundFilterPt._(_root);
	@override String get conservationFilter => 'Conservação';
	@override late final _TranslationsSearchPageCategoryFilterPt categoryFilter = _TranslationsSearchPageCategoryFilterPt._(_root);
	@override String get cleanFilters => 'Limpar filtros';
	@override String get searchSpecies => 'Pesquisar espécies';
	@override String get cleanSearch => 'Limpar pesquisa';
	@override String get errorFetchingTitle => 'Erro ao buscar resultados';
	@override String get errorFetchingContent => 'Tente novamente';
	@override String get notResultsTitle => 'Nenhum resultado encontrado';
	@override String get notResultsContent => 'Nenhum resultado encontrado. Tente outra pesquisa';
	@override String get errorFetchingSpecies => 'Nenhuma espécie encontrada relacionada à sua busca. Por favor, tente novamente com outra classe, ordem ou família.';
	@override String get acceptText => 'Aceitar';
	@override String get updateText => 'Atualizar';
	@override String get aToZ => 'A-Z';
	@override String get zToA => 'Z-A';
}

// Path: signIn
class _TranslationsSignInPt implements _TranslationsSignInEn {
	_TranslationsSignInPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Floresta Amazônica';
	@override String get subtitle => 'Guia Ilustrado de Flora e Fauna';
	@override String get email => 'E-Mail';
	@override String get password => 'Senha';
	@override String get enter => 'Entrar';
	@override String get new_ => 'Se você é novo, registre-se aqui';
	@override String get view_password => 'Mostrar senha';
	@override String get clear => 'Limpar';
	@override String get register_first => 'Você deve se registrar primeiro';
	@override String get verify_email => 'Primeiro verifique seu e-mail';
	@override String get verify_email_more => 'Você precisa verificar seu e-mail para fazer login';
	@override String get forgot_password => 'Esqueceu sua senha?';
}

// Path: signUp
class _TranslationsSignUpPt implements _TranslationsSignUpEn {
	_TranslationsSignUpPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Registar-se';
	@override String get alreadyRegistered => 'Já tem uma conta? Iniciar sessão';
	@override String get button => 'Registar-se';
	@override String get email => 'E-mail';
	@override String get password => 'Senha';
	@override String get showPassword => 'Mostrar senha';
	@override String get repeatPassword => 'Repetir sua senha';
	@override String get clear => 'Limpar';
	@override String get network => 'Verifique sua conexão com a internet';
	@override String get credential => 'Credenciais incorretas';
	@override String get disabled => 'Esta conta foi desativada, tente novamente mais tarde';
	@override String get notRegistered => 'Esta conta não está registrada';
	@override String get passwordNotMatch => 'Senha incorreta';
	@override String get unknown => 'Erro desconhecido, tente novamente mais tarde';
	@override String get sendedEmail => 'Um e-mail de confirmação foi enviado para o seu endereço de e-mail';
}

// Path: species
class _TranslationsSpeciesPt implements _TranslationsSpeciesEn {
	_TranslationsSpeciesPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Espécies';
	@override String get birds => 'Aves';
	@override String get mammals => 'Mamíferos';
	@override String get reptiles => 'Répteis';
	@override String get amphibians => 'Anfíbios';
	@override String get fishes => 'Peixes';
	@override String get insects => 'Insetos';
	@override String get trees => 'Árvores';
	@override String get palms => 'Palmeiras';
	@override String get orderName => 'Nome comum';
	@override String get orderScientificName => 'Nome científico';
}

// Path: speciesDetails
class _TranslationsSpeciesDetailsPt implements _TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get authors => 'Autores';
	@override String get taxonomicInfo => 'Informação Taxonômica';
	@override String get kingdom => 'Reino';
	@override String get filo => 'Filo';
	@override String get classes => 'Classe';
	@override String get order => 'Ordem';
	@override String get family => 'Família';
	@override String get download => 'Baixar';
	@override String get generatePdf => 'Gerar PDF';
	@override String get downloadImage => 'Baixar Imagem';
	@override String get downloadAudio => 'Baixar Áudio';
	@override String get share => 'Compartilhar';
	@override String get errorDownload => 'Erro ao Baixar';
	@override String get successDownload => 'Download Bem-Sucedido';
	@override String get shareAmazonInfo => 'Compartilhe a beleza da Amazônia! Compartilhe estas informações valiosas sobre.';
	@override String get shareAmazon => 'Compartilhe a beleza da Amazônia!';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPagePt implements _TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPagePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get download => 'Baixar';
	@override String get errorDownload => 'Não foi possível baixar';
	@override String get downloadImage => 'Baixar imagem';
	@override String get downloadAudio => 'Baixar áudio';
	@override String get share => 'Compartilhar';
	@override String get generatePdf => 'Gerar PDF';
	@override String get attractiveMessage => 'Compartilhe a beleza da Amazônia! Compartilhe esta valiosa informação sobre';
	@override String get conservationStates => 'Estados de conservação';
	@override String get noInformation => 'Sem informação';
	@override String get nameNotAvailable => 'Nome não disponível';
	@override String get scientificNameNotAvailable => 'Nome científico não disponível';
	@override String get year => 'Ano';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailurePt implements _TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailurePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get network => 'Verifique sua conexão com a internet';
	@override String get credential => 'Credenciais incorretas';
	@override String get disable => 'Esta conta foi desativada, tente novamente mais tarde';
	@override String get notRegistered => 'O e-mail não está registrado';
	@override String get password => 'Senha incorreta';
	@override String get unknown => 'Erro desconhecido';
}

// Path: validator
class _TranslationsValidatorPt implements _TranslationsValidatorEn {
	_TranslationsValidatorPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsValidatorPasswordPt password = _TranslationsValidatorPasswordPt._(_root);
	@override late final _TranslationsValidatorRepeatPasswordPt repeatPassword = _TranslationsValidatorRepeatPasswordPt._(_root);
	@override late final _TranslationsValidatorEmailPt email = _TranslationsValidatorEmailPt._(_root);
	@override late final _TranslationsValidatorNamePt name = _TranslationsValidatorNamePt._(_root);
	@override late final _TranslationsValidatorLastNamePt lastName = _TranslationsValidatorLastNamePt._(_root);
	@override late final _TranslationsValidatorPhonePt phone = _TranslationsValidatorPhonePt._(_root);
	@override late final _TranslationsValidatorCountryCodePt countryCode = _TranslationsValidatorCountryCodePt._(_root);
}

// Path: filterOptions.filterByName
class _TranslationsFilterOptionsFilterByNamePt implements _TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNamePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrar por nome';
	@override String get common => 'Nome comum';
	@override String get scientific => 'Nome científico';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundPt implements _TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrar por som';
	@override String get withSound => 'Com som';
	@override String get withoutSound => 'Sem som';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterPt implements _TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get common => 'Comum';
	@override String get scientific => 'Científico';
	@override String get order => 'Ordenar por';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterPt implements _TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get withSound => 'Com som';
	@override String get withoutSound => 'Sem som';
	@override String get sound => 'Som';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterPt implements _TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get category => 'Categoria';
	@override String get birds => 'Aves';
	@override String get mammals => 'Mamíferos';
	@override String get reptiles => 'Répteis';
	@override String get amphibians => 'Anfíbios';
	@override String get fish => 'Peixes';
	@override String get insects => 'Insetos';
	@override String get plants => 'Plantas';
	@override String get palms => 'Palmeiras';
}

// Path: validator.password
class _TranslationsValidatorPasswordPt implements _TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Senha';
	@override String get empty => 'Digite sua senha';
	@override String get minLength => 'Digite pelo menos 6 caracteres';
	@override String get regExp => 'A senha deve conter pelo menos um número e uma letra';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordPt implements _TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Digite sua senha';
	@override String get minLength => 'Digite pelo menos 6 caracteres';
	@override String get regExp => 'A senha deve conter pelo menos um número e uma letra';
	@override String get matchPassword => 'As senhas devem ser iguais';
}

// Path: validator.email
class _TranslationsValidatorEmailPt implements _TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Email';
	@override String get empty => 'Digite seu email';
	@override String get regExp => 'Digite um email válido';
}

// Path: validator.name
class _TranslationsValidatorNamePt implements _TranslationsValidatorNameEn {
	_TranslationsValidatorNamePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nome';
	@override String get empty => 'Digite seu nome';
	@override String get minLength => 'Digite pelo menos 3 caracteres';
}

// Path: validator.lastName
class _TranslationsValidatorLastNamePt implements _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNamePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Sobrenome';
	@override String get empty => 'Digite seu sobrenome';
	@override String get minLength => 'Digite pelo menos 3 caracteres';
}

// Path: validator.phone
class _TranslationsValidatorPhonePt implements _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhonePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Número de telefone';
	@override String get empty => 'Digite seu número de telefone';
	@override String get minLength => 'Digite pelo menos 9 caracteres';
	@override String get regExp => 'Digite um número de telefone válido';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodePt implements _TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Código do país';
	@override String get select => 'Selecione o código do país';
}

// Path: <root>
class _TranslationsZh implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsZh.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsZh _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsAboutProjectZh aboutProject = _TranslationsAboutProjectZh._(_root);
	@override late final _TranslationsAuthorsZh authors = _TranslationsAuthorsZh._(_root);
	@override late final _TranslationsBottomBarZh bottomBar = _TranslationsBottomBarZh._(_root);
	@override late final _TranslationsCommunityZh community = _TranslationsCommunityZh._(_root);
	@override late final _TranslationsDeleteAccountZh deleteAccount = _TranslationsDeleteAccountZh._(_root);
	@override late final _TranslationsEditProfileZh editProfile = _TranslationsEditProfileZh._(_root);
	@override late final _TranslationsErrorPageZh errorPage = _TranslationsErrorPageZh._(_root);
	@override late final _TranslationsFavoritesZh favorites = _TranslationsFavoritesZh._(_root);
	@override late final _TranslationsFilterOptionsZh filterOptions = _TranslationsFilterOptionsZh._(_root);
	@override late final _TranslationsForgotPasswordZh forgotPassword = _TranslationsForgotPasswordZh._(_root);
	@override late final _TranslationsGeneralZh general = _TranslationsGeneralZh._(_root);
	@override late final _TranslationsPdfPreviewPageZh pdfPreviewPage = _TranslationsPdfPreviewPageZh._(_root);
	@override late final _TranslationsProfileZh profile = _TranslationsProfileZh._(_root);
	@override late final _TranslationsSearchPageZh searchPage = _TranslationsSearchPageZh._(_root);
	@override late final _TranslationsSignInZh signIn = _TranslationsSignInZh._(_root);
	@override late final _TranslationsSignUpZh signUp = _TranslationsSignUpZh._(_root);
	@override late final _TranslationsSpeciesZh species = _TranslationsSpeciesZh._(_root);
	@override late final _TranslationsSpeciesDetailsZh speciesDetails = _TranslationsSpeciesDetailsZh._(_root);
	@override late final _TranslationsSpeciesDetailsPageZh speciesDetailsPage = _TranslationsSpeciesDetailsPageZh._(_root);
	@override late final _TranslationsUserCredentialFailureZh userCredentialFailure = _TranslationsUserCredentialFailureZh._(_root);
	@override late final _TranslationsValidatorZh validator = _TranslationsValidatorZh._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectZh implements _TranslationsAboutProjectEn {
	_TranslationsAboutProjectZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '关于项目';
	@override String get getBook => '获取书籍';
	@override String get titleBook => '亚马逊';
	@override String get subtitleBook => '植物和动物图解指南';
	@override String get p1 => '欢迎来到亚马逊植物和动物图解指南的移动平台。通过基于截至2022年的数据更新的交互式体验，深入了解这个独特地区的丰富多样性';
	@override String get content => '关于内容';
	@override String get p2 => '我们的平台是窥视令人惊叹的亚马逊生物多样性的窗口。通过专业内容和视觉上令人惊叹的图像，我们邀请您探索这个地区无与伦比的美丽，并了解其对我们星球的至关重要性。';
	@override String get commitment => '我们的承诺';
	@override String get p3 => '我们致力于提高人们对生物多样性及其保护的重要性的认识，特别是在最脆弱的地区和受到退化和气候变化影响的人群中。';
	@override String get contact => '联系我们';
	@override String get p4 => '有关该项目的更多信息，请通过以下网站联系秘鲁亚马逊研究所（IIAP）：';
	@override String get address => '伊基托斯 - 瑙塔路4.5公里，奎斯托科查，圣胡安巴蒂斯塔区，迈纳斯，洛雷托：';
}

// Path: authors
class _TranslationsAuthorsZh implements _TranslationsAuthorsEn {
	_TranslationsAuthorsZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '作者';
	@override String get withoutAuthors => '这里似乎没有作者';
	@override String get professionNotAvailable => '职业不可用';
}

// Path: bottomBar
class _TranslationsBottomBarZh implements _TranslationsBottomBarEn {
	_TranslationsBottomBarZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get home => '首页';
	@override String get search => '搜索';
	@override String get favorites => '收藏夹';
}

// Path: community
class _TranslationsCommunityZh implements _TranslationsCommunityEn {
	_TranslationsCommunityZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '土著社区';
	@override String get withoutCommunities => '这里似乎没有土著社区';
}

// Path: deleteAccount
class _TranslationsDeleteAccountZh implements _TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '删除账户';
	@override String get userInfo => '用户信息：';
	@override String get username => '用户名';
	@override String get email => '邮箱';
	@override String get phone => '电话';
	@override String get delete => '删除账户';
	@override String get warning => '删除您的账户，即表示您同意以下条款：';
	@override String get firtsTerm => '- 您将无法恢复您的账户。';
	@override String get secondTerm => '- 您将无法恢复您的数据。';
	@override String get confirm => '确认';
	@override String get cancel => '取消';
	@override String get information => '您确定要删除您的账户吗？此操作不可逆。请输入您的密码进行确认。';
	@override String get accountDeleted => '账户删除成功';
	@override String get notRegistered => '未注册';
}

// Path: editProfile
class _TranslationsEditProfileZh implements _TranslationsEditProfileEn {
	_TranslationsEditProfileZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get errorSnack => '加载用户数据时出错';
	@override String get title => '编辑个人资料';
	@override String get save => '保存';
	@override String get saving => '正在保存...';
	@override String get errorSaving => '保存个人资料数据时出错';
	@override String get selectImage => '选择个人资料图片';
	@override String get errorSave => '保存个人资料时出错';
}

// Path: errorPage
class _TranslationsErrorPageZh implements _TranslationsErrorPageEn {
	_TranslationsErrorPageZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get page_not_exist => '该页面不存在';
	@override String get go_back => '返回物种';
}

// Path: favorites
class _TranslationsFavoritesZh implements _TranslationsFavoritesEn {
	_TranslationsFavoritesZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '收藏夹';
	@override String get hintText => '搜索你的收藏';
	@override String get exceptionText => '这里还没有物种';
	@override String get deleteFavorite => '从收藏夹中删除';
	@override String get empty => '开始将物种标记为收藏，以便在此查看';
	@override String get error => '我们进行了重大更改，点击“恢复物种”以更新信息，请确保你已连接到互联网';
	@override String get canNot => '无法执行此操作';
	@override String get reestoreSpecies => '恢复物种';
	@override String get withoutSpecies => '你还没有收藏的物种，可以从物种部分添加';
	@override String get yeah => '你的所有收藏物种都已恢复！';
}

// Path: filterOptions
class _TranslationsFilterOptionsZh implements _TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get listByAlphabethic => '按字母顺序列出';
	@override String get recentlyAdded => '最近添加';
	@override String get all => '全部';
	@override String get noPreferencies => '没有偏好';
	@override late final _TranslationsFilterOptionsFilterByNameZh filterByName = _TranslationsFilterOptionsFilterByNameZh._(_root);
	@override late final _TranslationsFilterOptionsFilterBySoundZh filterBySound = _TranslationsFilterOptionsFilterBySoundZh._(_root);
	@override String get filterByConservation => '按保护状态过滤';
	@override String get filterByCategory => '按类别过滤';
	@override String get filterByTaxonomy => '按分类过滤';
	@override String get filterByOrder => '按顺序过滤';
	@override String get filterByFamily => '按科过滤';
}

// Path: forgotPassword
class _TranslationsForgotPasswordZh implements _TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '忘记密码';
	@override String get sendLabel => '发送';
	@override String get validatingLabel => '正在验证...';
	@override String get email => '邮箱';
	@override String get clear => '清除';
	@override String get message => '请输入您的电子邮件以发送一封邮件，您可以在其中更改您的密码：';
	@override String get checkYourEmail => '请检查您的邮箱！';
}

// Path: general
class _TranslationsGeneralZh implements _TranslationsGeneralEn {
	_TranslationsGeneralZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get back => '返回';
	@override String get close => '关闭';
	@override String get clear => '清除';
	@override String get search => '搜索';
	@override String get addToFavorites => '添加到收藏夹';
	@override String get removeFromFavorites => '从收藏夹中删除';
	@override String get error404Again => '出了点问题，请再试一次';
	@override String get nameNotAvailable => '名称不可用';
	@override String get lastnameNotAvailable => '姓氏不可用';
	@override String get descriptionNotAvailable => '描述不可用';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPageZh implements _TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPageZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get amazon => '亚马逊';
	@override String get institute => '秘鲁亚马逊研究所';
	@override String get title => '动植物图鉴';
	@override String get commonNameNotAvailable => '常用名称不可用';
	@override String get scientificNameNotAvailable => '学名不可用';
	@override String get author => '作者';
	@override String get authors => '作者们';
	@override String get imageNotAvailable => '图片不可用';
	@override String get taxonomicInformation => '分类信息';
	@override String get kingdom => '界';
	@override String get phylum => '门';
	@override String get class_ => '纲';
	@override String get order => '目';
	@override String get family => '科';
	@override String get authorInformation => '作者信息';
	@override String get name => '名字';
	@override String get lastname => '姓氏';
	@override String get profession => '职业';
	@override String get bornIn => '出生于';
	@override String get diedIn => '逝世于';
}

// Path: profile
class _TranslationsProfileZh implements _TranslationsProfileEn {
	_TranslationsProfileZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '我的个人资料';
	@override String get logout => '退出';
	@override String get favorites => '我的收藏';
	@override String get changePassword => '更改密码';
	@override String get share => '下载IIAP植物和动物图解指南应用程序，了解更多有关秘鲁亚马逊物种的信息：';
	@override String get invite => '邀请朋友';
	@override String get project => '关于项目';
	@override String get team => '关于我们';
	@override String get deleteAccount => '删除帐户';
	@override String get userNotFound => '找不到用户';
	@override String get completeProfile => '完善您的个人资料以访问应用程序的所有功能。';
	@override String get completeButton => '完成个人资料';
	@override String get editButton => '编辑个人资料';
}

// Path: searchPage
class _TranslationsSearchPageZh implements _TranslationsSearchPageEn {
	_TranslationsSearchPageZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get failedRequest => '发生错误。请重试';
	@override String get recentlyAdded => '最近添加';
	@override late final _TranslationsSearchPageNameFilterZh nameFilter = _TranslationsSearchPageNameFilterZh._(_root);
	@override String get taxonomyFilter => '分类';
	@override String get orderFilter => '顺序';
	@override String get familyFilter => '家庭';
	@override late final _TranslationsSearchPageSoundFilterZh soundFilter = _TranslationsSearchPageSoundFilterZh._(_root);
	@override String get conservationFilter => '保护';
	@override late final _TranslationsSearchPageCategoryFilterZh categoryFilter = _TranslationsSearchPageCategoryFilterZh._(_root);
	@override String get cleanFilters => '清除过滤器';
	@override String get searchSpecies => '搜索物种';
	@override String get cleanSearch => '清除搜索';
	@override String get errorFetchingTitle => '获取结果时出错';
	@override String get errorFetchingContent => '重试';
	@override String get notResultsTitle => '未找到结果';
	@override String get notResultsContent => '未找到结果。请尝试另一种搜索';
	@override String get errorFetchingSpecies => '未找到与您的搜索相关的物种。 请尝试使用其他类别，排序或科。';
	@override String get acceptText => '接受';
	@override String get updateText => '更新';
	@override String get aToZ => '阿-贼德';
	@override String get zToA => '贼德-阿';
}

// Path: signIn
class _TranslationsSignInZh implements _TranslationsSignInEn {
	_TranslationsSignInZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '亚马逊雨林';
	@override String get subtitle => '植物和动物图鉴';
	@override String get email => '电子邮件';
	@override String get password => '密码';
	@override String get enter => '进入';
	@override String get new_ => '如果您是新用户，请在此注册';
	@override String get view_password => '显示密码';
	@override String get clear => '清除';
	@override String get register_first => '您必须先注册';
	@override String get verify_email => '首先验证您的电子邮件';
	@override String get verify_email_more => '您需要验证您的电子邮件才能登录';
	@override String get forgot_password => '忘记密码了吗？';
}

// Path: signUp
class _TranslationsSignUpZh implements _TranslationsSignUpEn {
	_TranslationsSignUpZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '注册';
	@override String get alreadyRegistered => '已经有账号了？登录';
	@override String get button => '注册';
	@override String get email => '邮箱';
	@override String get password => '密码';
	@override String get showPassword => '显示密码';
	@override String get repeatPassword => '重复你的密码';
	@override String get clear => '清除';
	@override String get network => '检查你的网络连接';
	@override String get credential => '凭据不正确';
	@override String get disabled => '此帐户已被停用，请稍后再试';
	@override String get notRegistered => '此帐户尚未注册';
	@override String get passwordNotMatch => '密码不正确';
	@override String get unknown => '未知错误，请稍后再试';
	@override String get sendedEmail => '确认邮件已发送至您的电子邮件地址';
}

// Path: species
class _TranslationsSpeciesZh implements _TranslationsSpeciesEn {
	_TranslationsSpeciesZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '物种';
	@override String get birds => '鸟类';
	@override String get mammals => '哺乳动物';
	@override String get reptiles => '爬行动物';
	@override String get amphibians => '两栖动物';
	@override String get fishes => '鱼类';
	@override String get insects => '昆虫';
	@override String get trees => '树木';
	@override String get palms => '棕榈树';
	@override String get orderName => '通用名';
	@override String get orderScientificName => '科学名称';
}

// Path: speciesDetails
class _TranslationsSpeciesDetailsZh implements _TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get authors => '作者';
	@override String get taxonomicInfo => '分类信息';
	@override String get kingdom => '王国';
	@override String get filo => '门';
	@override String get classes => '类';
	@override String get order => '目';
	@override String get family => '科';
	@override String get download => '下载';
	@override String get generatePdf => '生成 PDF';
	@override String get downloadImage => '下载图片';
	@override String get downloadAudio => '下载音频';
	@override String get share => '分享';
	@override String get errorDownload => '下载错误';
	@override String get successDownload => '下载成功';
	@override String get shareAmazonInfo => '分享亚马逊的美丽！分享有关的宝贵信息.';
	@override String get shareAmazon => '分享亚马逊的美丽！';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPageZh implements _TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPageZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get download => '下载';
	@override String get errorDownload => '无法下载';
	@override String get downloadImage => '下载图片';
	@override String get downloadAudio => '下载音频';
	@override String get share => '分享';
	@override String get generatePdf => '生成 PDF';
	@override String get attractiveMessage => '分享亚马逊的美丽！分享这条有价值的信息';
	@override String get conservationStates => '保护状态';
	@override String get noInformation => '没有信息';
	@override String get nameNotAvailable => '名称不可用';
	@override String get scientificNameNotAvailable => '学名不可用';
	@override String get year => '年';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailureZh implements _TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailureZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get network => '检查您的网络连接';
	@override String get credential => '凭证不正确';
	@override String get disable => '此帐户已被禁用，请稍后再试';
	@override String get notRegistered => '电子邮件未注册';
	@override String get password => '密码不正确';
	@override String get unknown => '未知错误';
}

// Path: validator
class _TranslationsValidatorZh implements _TranslationsValidatorEn {
	_TranslationsValidatorZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsValidatorPasswordZh password = _TranslationsValidatorPasswordZh._(_root);
	@override late final _TranslationsValidatorRepeatPasswordZh repeatPassword = _TranslationsValidatorRepeatPasswordZh._(_root);
	@override late final _TranslationsValidatorEmailZh email = _TranslationsValidatorEmailZh._(_root);
	@override late final _TranslationsValidatorNameZh name = _TranslationsValidatorNameZh._(_root);
	@override late final _TranslationsValidatorLastNameZh lastName = _TranslationsValidatorLastNameZh._(_root);
	@override late final _TranslationsValidatorPhoneZh phone = _TranslationsValidatorPhoneZh._(_root);
	@override late final _TranslationsValidatorCountryCodeZh countryCode = _TranslationsValidatorCountryCodeZh._(_root);
}

// Path: filterOptions.filterByName
class _TranslationsFilterOptionsFilterByNameZh implements _TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNameZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '按名称过滤';
	@override String get common => '通用名称';
	@override String get scientific => '科学名称';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundZh implements _TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '按声音过滤';
	@override String get withSound => '有声音';
	@override String get withoutSound => '无声音';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterZh implements _TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get common => '常见';
	@override String get scientific => '科学';
	@override String get order => '排序方式';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterZh implements _TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get withSound => '有声音';
	@override String get withoutSound => '无声音';
	@override String get sound => '声音';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterZh implements _TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get category => '类别';
	@override String get birds => '鸟类';
	@override String get mammals => '哺乳动物';
	@override String get reptiles => '爬行动物';
	@override String get amphibians => '两栖动物';
	@override String get fish => '鱼类';
	@override String get insects => '昆虫';
	@override String get plants => '植物';
	@override String get palms => '棕榈树';
}

// Path: validator.password
class _TranslationsValidatorPasswordZh implements _TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '密码';
	@override String get empty => '请输入您的密码';
	@override String get minLength => '至少输入6个字符';
	@override String get regExp => '密码必须包含至少一个数字和一个字母';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordZh implements _TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get empty => '请输入您的密码';
	@override String get minLength => '至少输入6个字符';
	@override String get regExp => '密码必须包含至少一个数字和一个字母';
	@override String get matchPassword => '密码必须匹配';
}

// Path: validator.email
class _TranslationsValidatorEmailZh implements _TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '邮箱';
	@override String get empty => '请输入您的邮箱';
	@override String get regExp => '请输入有效的邮箱';
}

// Path: validator.name
class _TranslationsValidatorNameZh implements _TranslationsValidatorNameEn {
	_TranslationsValidatorNameZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '姓名';
	@override String get empty => '请输入您的姓名';
	@override String get minLength => '至少输入3个字符';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameZh implements _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '姓氏';
	@override String get empty => '请输入您的姓氏';
	@override String get minLength => '至少输入3个字符';
}

// Path: validator.phone
class _TranslationsValidatorPhoneZh implements _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '电话号码';
	@override String get empty => '请输入您的电话号码';
	@override String get minLength => '至少输入9个字符';
	@override String get regExp => '请输入有效的电话号码';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodeZh implements _TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodeZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '国家代码';
	@override String get select => '选择国家代码';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'aboutProject.title': return 'About the project';
			case 'aboutProject.getBook': return 'Get the book';
			case 'aboutProject.titleBook': return 'AMAZONIA';
			case 'aboutProject.subtitleBook': return 'Illustrated Guide to Flora and Fauna';
			case 'aboutProject.p1': return 'Welcome to the mobile platform of the Illustrated Guide to Flora and Fauna of the Amazon. Dive into the richness and diversity of this unique region through an interactive experience based on data updated until 2022';
			case 'aboutProject.content': return 'About the content';
			case 'aboutProject.p2': return 'Our platform is a window to the astonishing Amazonian biodiversity. Through expert content and visually stunning imagery, we invite you to explore the unparalleled beauty of this region and understand its critical importance to our planet.';
			case 'aboutProject.commitment': return 'Our commitment';
			case 'aboutProject.p3': return 'We strive to raise awareness about the immense importance of biodiversity and its protection, especially in the most vulnerable regions and among populations affected by degradation and climate change.';
			case 'aboutProject.contact': return 'Contact us';
			case 'aboutProject.p4': return 'For more information about the project, contact the Peruvian Amazon Research Institute (IIAP) through the website: ';
			case 'aboutProject.address': return 'Iquitos - Nauta Road Km 4.5, Quistococha, San Juan Bautista District, Maynas, Loreto: ';
			case 'authors.title': return 'Authors';
			case 'authors.withoutAuthors': return 'It seems there are no authors here';
			case 'authors.professionNotAvailable': return 'Profession not available';
			case 'bottomBar.home': return 'Home';
			case 'bottomBar.search': return 'Search';
			case 'bottomBar.favorites': return 'Favorites';
			case 'community.title': return 'Indigenous communities';
			case 'community.withoutCommunities': return 'It seems there are no indigenous communities here';
			case 'deleteAccount.title': return 'Delete account';
			case 'deleteAccount.userInfo': return 'User information:';
			case 'deleteAccount.username': return 'Username';
			case 'deleteAccount.email': return 'Email';
			case 'deleteAccount.phone': return 'Phone';
			case 'deleteAccount.delete': return 'Delete account';
			case 'deleteAccount.warning': return 'By deleting your account, you agree to the following terms:';
			case 'deleteAccount.firtsTerm': return '- You won\'t be able to recover your account.';
			case 'deleteAccount.secondTerm': return '- You won\'t be able to recover your data.';
			case 'deleteAccount.confirm': return 'Confirm';
			case 'deleteAccount.cancel': return 'Cancel';
			case 'deleteAccount.information': return 'Are you sure you want to delete your account? This action is irreversible. Enter your password to confirm.';
			case 'deleteAccount.accountDeleted': return 'Account deleted successfully';
			case 'deleteAccount.notRegistered': return 'Not registered';
			case 'editProfile.errorSnack': return 'Error loading user data';
			case 'editProfile.title': return 'Edit Profile';
			case 'editProfile.save': return 'Save';
			case 'editProfile.saving': return 'Saving...';
			case 'editProfile.errorSaving': return 'Error saving profile data';
			case 'editProfile.selectImage': return 'Select a profile picture';
			case 'editProfile.errorSave': return 'Error saving profile';
			case 'errorPage.page_not_exist': return 'This page no longer exists';
			case 'errorPage.go_back': return 'Back to species';
			case 'favorites.title': return 'Favorites';
			case 'favorites.hintText': return 'Search your favorite';
			case 'favorites.exceptionText': return 'There are no species here yet';
			case 'favorites.deleteFavorite': return 'Remove from favorites';
			case 'favorites.empty': return 'Start marking species as favorites to see them here';
			case 'favorites.error': return 'We have made significant changes, tap on \'Restore species\' to update the information, make sure you have an internet connection';
			case 'favorites.canNot': return 'This action could not be performed';
			case 'favorites.reestoreSpecies': return 'Restore species';
			case 'favorites.withoutSpecies': return 'You don\'t have any favorite species yet, you can add them from the species section';
			case 'favorites.yeah': return 'All your favorite species have been restored!';
			case 'filterOptions.listByAlphabethic': return 'List by alphabetical order';
			case 'filterOptions.recentlyAdded': return 'Recently added';
			case 'filterOptions.all': return 'All';
			case 'filterOptions.noPreferencies': return 'No preferences';
			case 'filterOptions.filterByName.title': return 'Filter by name';
			case 'filterOptions.filterByName.common': return 'Common name';
			case 'filterOptions.filterByName.scientific': return 'Scientific name';
			case 'filterOptions.filterBySound.title': return 'Filter by sound';
			case 'filterOptions.filterBySound.withSound': return 'With sound';
			case 'filterOptions.filterBySound.withoutSound': return 'Without sound';
			case 'filterOptions.filterByConservation': return 'Filter by conservation status';
			case 'filterOptions.filterByCategory': return 'Filter by category';
			case 'filterOptions.filterByTaxonomy': return 'Filter by taxonomy';
			case 'filterOptions.filterByOrder': return 'Filter by order';
			case 'filterOptions.filterByFamily': return 'Filter by family';
			case 'forgotPassword.title': return 'Forgot Your Password';
			case 'forgotPassword.sendLabel': return 'Send';
			case 'forgotPassword.validatingLabel': return 'Validating...';
			case 'forgotPassword.email': return 'Email';
			case 'forgotPassword.clear': return 'Clear';
			case 'forgotPassword.message': return 'Enter your email to send you an email where you can change your password:';
			case 'forgotPassword.checkYourEmail': return 'Check your email!';
			case 'general.back': return 'Back';
			case 'general.close': return 'Close';
			case 'general.clear': return 'Clear';
			case 'general.search': return 'Search';
			case 'general.addToFavorites': return 'Add to favorites';
			case 'general.removeFromFavorites': return 'Remove from favorites';
			case 'general.error404Again': return 'Something went wrong, please try again';
			case 'general.nameNotAvailable': return 'Name not available';
			case 'general.lastnameNotAvailable': return 'Last name not available';
			case 'general.descriptionNotAvailable': return 'Description not available';
			case 'pdfPreviewPage.amazon': return 'Amazon';
			case 'pdfPreviewPage.institute': return 'Research Institute of the Peruvian Amazon';
			case 'pdfPreviewPage.title': return 'Illustrated Guide to Flora and Fauna';
			case 'pdfPreviewPage.commonNameNotAvailable': return 'Common name not available';
			case 'pdfPreviewPage.scientificNameNotAvailable': return 'Scientific name not available';
			case 'pdfPreviewPage.author': return 'Author';
			case 'pdfPreviewPage.authors': return 'Authors';
			case 'pdfPreviewPage.imageNotAvailable': return 'Image not available';
			case 'pdfPreviewPage.taxonomicInformation': return 'Taxonomic information';
			case 'pdfPreviewPage.kingdom': return 'Kingdom';
			case 'pdfPreviewPage.phylum': return 'Phylum';
			case 'pdfPreviewPage.class_': return 'Class';
			case 'pdfPreviewPage.order': return 'Order';
			case 'pdfPreviewPage.family': return 'Family';
			case 'pdfPreviewPage.authorInformation': return 'Author information';
			case 'pdfPreviewPage.name': return 'Name';
			case 'pdfPreviewPage.lastname': return 'Last name';
			case 'pdfPreviewPage.profession': return 'Profession';
			case 'pdfPreviewPage.bornIn': return 'Born in';
			case 'pdfPreviewPage.diedIn': return 'Died in';
			case 'profile.title': return 'My Profile';
			case 'profile.logout': return 'Logout';
			case 'profile.favorites': return 'My favorites';
			case 'profile.changePassword': return 'Change password';
			case 'profile.share': return 'Download the IIAP Illustrated Guide to Flora and Fauna app and learn more about species in the Peruvian Amazon:';
			case 'profile.invite': return 'Invite friends';
			case 'profile.project': return 'About the project';
			case 'profile.team': return 'About us';
			case 'profile.deleteAccount': return 'Delete account';
			case 'profile.userNotFound': return 'User not found';
			case 'profile.completeProfile': return 'Complete your profile to access all the features of the application.';
			case 'profile.completeButton': return 'Complete profile';
			case 'profile.editButton': return 'Edit profile';
			case 'searchPage.failedRequest': return 'Something went wrong. Please try again';
			case 'searchPage.recentlyAdded': return 'Recently Added';
			case 'searchPage.nameFilter.common': return 'Common';
			case 'searchPage.nameFilter.scientific': return 'Scientific';
			case 'searchPage.nameFilter.order': return 'Order by';
			case 'searchPage.taxonomyFilter': return 'Taxonomy';
			case 'searchPage.orderFilter': return 'Order';
			case 'searchPage.familyFilter': return 'Family';
			case 'searchPage.soundFilter.withSound': return 'With sound';
			case 'searchPage.soundFilter.withoutSound': return 'Without sound';
			case 'searchPage.soundFilter.sound': return 'Sound';
			case 'searchPage.conservationFilter': return 'Conservation';
			case 'searchPage.categoryFilter.category': return 'Category';
			case 'searchPage.categoryFilter.birds': return 'Birds';
			case 'searchPage.categoryFilter.mammals': return 'Mammals';
			case 'searchPage.categoryFilter.reptiles': return 'Reptiles';
			case 'searchPage.categoryFilter.amphibians': return 'Amphibians';
			case 'searchPage.categoryFilter.fish': return 'Fish';
			case 'searchPage.categoryFilter.insects': return 'Insects';
			case 'searchPage.categoryFilter.plants': return 'Plants';
			case 'searchPage.categoryFilter.palms': return 'Palms';
			case 'searchPage.cleanFilters': return 'Clear Filters';
			case 'searchPage.searchSpecies': return 'Search species';
			case 'searchPage.cleanSearch': return 'Clear Search';
			case 'searchPage.errorFetchingTitle': return 'Error fetching results';
			case 'searchPage.errorFetchingContent': return 'Try again';
			case 'searchPage.notResultsTitle': return 'No results found';
			case 'searchPage.notResultsContent': return 'No results found. Try another search';
			case 'searchPage.errorFetchingSpecies': return 'No species found related to your search. Please try again with another class, order, or family.';
			case 'searchPage.acceptText': return 'Accept';
			case 'searchPage.updateText': return 'Update';
			case 'searchPage.aToZ': return 'A-Z';
			case 'searchPage.zToA': return 'Z-A';
			case 'signIn.title': return 'Amazon';
			case 'signIn.subtitle': return 'Illustrated Guide to Flora and Fauna';
			case 'signIn.email': return 'E-Mail';
			case 'signIn.password': return 'Password';
			case 'signIn.enter': return 'Enter';
			case 'signIn.new_': return 'If you\'re new, register here';
			case 'signIn.view_password': return 'Show password';
			case 'signIn.clear': return 'Clear';
			case 'signIn.register_first': return 'You must register first';
			case 'signIn.verify_email': return 'First verify your email';
			case 'signIn.verify_email_more': return 'You need to verify your email to log in';
			case 'signIn.forgot_password': return 'Forgot your password?';
			case 'signUp.title': return 'Sign Up';
			case 'signUp.alreadyRegistered': return 'Already have an account? Sign in';
			case 'signUp.button': return 'Sign Up';
			case 'signUp.email': return 'Email';
			case 'signUp.password': return 'Password';
			case 'signUp.showPassword': return 'Show Password';
			case 'signUp.repeatPassword': return 'Repeat Your Password';
			case 'signUp.clear': return 'Clear';
			case 'signUp.network': return 'Check your internet connection';
			case 'signUp.credential': return 'Incorrect credentials';
			case 'signUp.disabled': return 'This account has been disabled, please try again later';
			case 'signUp.notRegistered': return 'This account is not registered';
			case 'signUp.passwordNotMatch': return 'Incorrect password';
			case 'signUp.unknown': return 'Unknown error, please try again later';
			case 'signUp.sendedEmail': return 'A confirmation email has been sent to your email address';
			case 'species.title': return 'Species';
			case 'species.birds': return 'Birds';
			case 'species.mammals': return 'Mammals';
			case 'species.reptiles': return 'Reptiles';
			case 'species.amphibians': return 'Amphibians';
			case 'species.fishes': return 'Fishes';
			case 'species.insects': return 'Insects';
			case 'species.trees': return 'Trees';
			case 'species.palms': return 'Palms';
			case 'species.orderName': return 'Common name';
			case 'species.orderScientificName': return 'Scientific name';
			case 'speciesDetails.authors': return 'Authors';
			case 'speciesDetails.taxonomicInfo': return 'Taxonomic Information';
			case 'speciesDetails.kingdom': return 'Kingdom';
			case 'speciesDetails.filo': return 'Phylum';
			case 'speciesDetails.classes': return 'Class';
			case 'speciesDetails.order': return 'Order';
			case 'speciesDetails.family': return 'Family';
			case 'speciesDetails.download': return 'Download';
			case 'speciesDetails.generatePdf': return 'Generate PDF';
			case 'speciesDetails.downloadImage': return 'Download Image';
			case 'speciesDetails.downloadAudio': return 'Download Audio';
			case 'speciesDetails.share': return 'Share';
			case 'speciesDetails.errorDownload': return 'Download Error';
			case 'speciesDetails.successDownload': return 'Download Success';
			case 'speciesDetails.shareAmazonInfo': return 'Share the beauty of the Amazon! Share this valuable information about.';
			case 'speciesDetails.shareAmazon': return 'Share the beauty of the Amazon!';
			case 'speciesDetailsPage.download': return 'Download';
			case 'speciesDetailsPage.errorDownload': return 'Could not download';
			case 'speciesDetailsPage.downloadImage': return 'Download image';
			case 'speciesDetailsPage.downloadAudio': return 'Download audio';
			case 'speciesDetailsPage.share': return 'Share';
			case 'speciesDetailsPage.generatePdf': return 'Generate PDF';
			case 'speciesDetailsPage.attractiveMessage': return 'Share the beauty of the Amazon! Share this valuable information about';
			case 'speciesDetailsPage.conservationStates': return 'Conservation statuses';
			case 'speciesDetailsPage.noInformation': return 'No information';
			case 'speciesDetailsPage.nameNotAvailable': return 'Name not available';
			case 'speciesDetailsPage.scientificNameNotAvailable': return 'Scientific name not available';
			case 'speciesDetailsPage.year': return 'Year';
			case 'userCredentialFailure.network': return 'Check your internet connection';
			case 'userCredentialFailure.credential': return 'Incorrect credentials';
			case 'userCredentialFailure.disable': return 'This account has been disabled, please try again later';
			case 'userCredentialFailure.notRegistered': return 'Email is not registered';
			case 'userCredentialFailure.password': return 'Incorrect password';
			case 'userCredentialFailure.unknown': return 'Unknown error';
			case 'validator.password.label': return 'Password';
			case 'validator.password.empty': return 'Enter your password';
			case 'validator.password.minLength': return 'Enter at least 6 characters';
			case 'validator.password.regExp': return 'Password must contain at least one number and one letter';
			case 'validator.repeatPassword.empty': return 'Enter your password';
			case 'validator.repeatPassword.minLength': return 'Enter at least 6 characters';
			case 'validator.repeatPassword.regExp': return 'Password must contain at least one number and one letter';
			case 'validator.repeatPassword.matchPassword': return 'Passwords must match';
			case 'validator.email.label': return 'Email';
			case 'validator.email.empty': return 'Enter your email';
			case 'validator.email.regExp': return 'Enter a valid email';
			case 'validator.name.label': return 'Name';
			case 'validator.name.empty': return 'Enter your name';
			case 'validator.name.minLength': return 'Enter at least 3 characters';
			case 'validator.lastName.label': return 'Lastname';
			case 'validator.lastName.empty': return 'Enter your lastname';
			case 'validator.lastName.minLength': return 'Enter at least 3 characters';
			case 'validator.phone.label': return 'Phone number';
			case 'validator.phone.empty': return 'Enter your phone number';
			case 'validator.phone.minLength': return 'Enter at least 9 characters';
			case 'validator.phone.regExp': return 'Enter a valid phone number';
			case 'validator.countryCode.label': return 'Country code';
			case 'validator.countryCode.select': return 'Select country code';
			default: return null;
		}
	}
}

extension on _TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'aboutProject.title': return 'Acerca del proyecto';
			case 'aboutProject.getBook': return 'Obtener el libro';
			case 'aboutProject.titleBook': return 'AMAZONÍA';
			case 'aboutProject.subtitleBook': return 'Guía ilustrada de flora y fauna';
			case 'aboutProject.p1': return 'Bienvenido a la plataforma móvil de la Guía Ilustrada de Flora y Fauna de la Amazonía. Sumérgete en la riqueza y diversidad de esta región única a través de una experiencia interactiva basada en datos actualizados hasta 2022';
			case 'aboutProject.content': return 'Sobre el contenido';
			case 'aboutProject.p2': return 'Nuestra plataforma es una ventana a la sorprendente biodiversidad amazónica. A través de contenido experto e imágenes visualmente impresionantes, te invitamos a explorar la belleza incomparable de esta región y comprender su importancia crítica para nuestro planeta.';
			case 'aboutProject.commitment': return 'Nuestro compromiso';
			case 'aboutProject.p3': return 'Nos esforzamos por concienciar sobre la inmensa importancia de la biodiversidad y su protección, especialmente en las regiones más vulnerables y entre las poblaciones afectadas por la degradación y el cambio climático.';
			case 'aboutProject.contact': return 'Contáctanos';
			case 'aboutProject.p4': return 'Para obtener más información sobre el proyecto, comunícate con el Instituto de Investigaciones de la Amazonía Peruana (IIAP) a través del sitio web: ';
			case 'aboutProject.address': return 'Carretera Iquitos - Nauta Km 4.5, Quistococha, Distrito de San Juan Bautista, Maynas, Loreto: ';
			case 'authors.title': return 'Autores';
			case 'authors.withoutAuthors': return 'Parece que no hay autores aquí';
			case 'authors.professionNotAvailable': return 'Profesión no disponible';
			case 'bottomBar.home': return 'Inicio';
			case 'bottomBar.search': return 'Buscar';
			case 'bottomBar.favorites': return 'Favoritos';
			case 'community.title': return 'Comunidades indígenas';
			case 'community.withoutCommunities': return 'Parece que no hay comunidades indígenas aquí';
			case 'deleteAccount.title': return 'Eliminar cuenta';
			case 'deleteAccount.userInfo': return 'Información del usuario:';
			case 'deleteAccount.username': return 'Nombre de usuario';
			case 'deleteAccount.email': return 'Correo electrónico';
			case 'deleteAccount.phone': return 'Teléfono';
			case 'deleteAccount.delete': return 'Eliminar cuenta';
			case 'deleteAccount.warning': return 'Al eliminar tu cuenta, aceptas los siguientes términos:';
			case 'deleteAccount.firtsTerm': return '- No podrás recuperar tu cuenta.';
			case 'deleteAccount.secondTerm': return '- No podrás recuperar tus datos.';
			case 'deleteAccount.confirm': return 'Confirmar';
			case 'deleteAccount.cancel': return 'Cancelar';
			case 'deleteAccount.information': return '¿Estás seguro de que quieres eliminar tu cuenta? Esta acción es irreversible. Ingresa tu contraseña para confirmar.';
			case 'deleteAccount.accountDeleted': return 'Cuenta eliminada exitosamente';
			case 'deleteAccount.notRegistered': return 'No registrado';
			case 'editProfile.errorSnack': return 'Error al cargar los datos del usuario';
			case 'editProfile.title': return 'Editar perfil';
			case 'editProfile.save': return 'Guardar';
			case 'editProfile.saving': return 'Guardando...';
			case 'editProfile.errorSaving': return 'Error al guardar los datos del perfil';
			case 'editProfile.selectImage': return 'Seleccione una imagen de perfil';
			case 'editProfile.errorSave': return 'Error al guardar el perfil';
			case 'errorPage.page_not_exist': return 'Esta página ya no existe';
			case 'errorPage.go_back': return 'Volver a especies';
			case 'favorites.title': return 'Favoritos';
			case 'favorites.hintText': return 'Busca tu favorito';
			case 'favorites.exceptionText': return 'Aún no hay especies aquí';
			case 'favorites.deleteFavorite': return 'Quitar de favoritos';
			case 'favorites.empty': return 'Empieza a marcar especies como favoritas para verlas aquí';
			case 'favorites.error': return 'Hemos hecho cambios importantes, toca en \'Recuperar las especies\' para actualizar la información, asegurate tener conexión a internet';
			case 'favorites.canNot': return 'No se pudo realizar esta acción';
			case 'favorites.reestoreSpecies': return 'Recuperar las especies';
			case 'favorites.withoutSpecies': return 'Todavía no tienes especies favoritas, puedes agregarlas desde la sección de especies';
			case 'favorites.yeah': return '!Se han restaurado todas tus especies favoritas!';
			case 'filterOptions.listByAlphabethic': return 'Listar por orden alfabético';
			case 'filterOptions.recentlyAdded': return 'Más reciente';
			case 'filterOptions.all': return 'Todos';
			case 'filterOptions.noPreferencies': return 'Sin preferencias';
			case 'filterOptions.filterByName.title': return 'Filtrar por nombre';
			case 'filterOptions.filterByName.common': return 'Nombre común';
			case 'filterOptions.filterByName.scientific': return 'Nombre científico';
			case 'filterOptions.filterBySound.title': return 'Filtrar por sonido';
			case 'filterOptions.filterBySound.withSound': return 'Con sonido';
			case 'filterOptions.filterBySound.withoutSound': return 'Sin sonido';
			case 'filterOptions.filterByConservation': return 'Filtrar por estado de conservación';
			case 'filterOptions.filterByCategory': return 'Filtrar por categoría';
			case 'filterOptions.filterByTaxonomy': return 'Filtrar por taxonomía';
			case 'filterOptions.filterByOrder': return 'Filtrar por orden';
			case 'filterOptions.filterByFamily': return 'Filtrar por familia';
			case 'forgotPassword.title': return 'Olvidó su contraseña';
			case 'forgotPassword.sendLabel': return 'Enviar';
			case 'forgotPassword.validatingLabel': return 'Validando...';
			case 'forgotPassword.email': return 'Correo';
			case 'forgotPassword.clear': return 'Limpiar';
			case 'forgotPassword.message': return 'Ingrese su email para enviarle un correo donde podrá cambiar su contraseña:';
			case 'forgotPassword.checkYourEmail': return '¡Revisa tu correo!';
			case 'general.back': return 'Atrás';
			case 'general.close': return 'Cerrar';
			case 'general.clear': return 'Limpiar';
			case 'general.search': return 'Buscar';
			case 'general.addToFavorites': return 'Agregar a favoritos';
			case 'general.removeFromFavorites': return 'Quitar de favoritos';
			case 'general.error404Again': return 'Algo salió mal, inténtalo de nuevo';
			case 'general.nameNotAvailable': return 'Nombre no disponible';
			case 'general.lastnameNotAvailable': return 'Apellidos no disponibles';
			case 'general.descriptionNotAvailable': return 'Descripción no disponible';
			case 'pdfPreviewPage.amazon': return 'Amazonía';
			case 'pdfPreviewPage.institute': return 'Instituto de Investigación de la Amazonía Peruana';
			case 'pdfPreviewPage.title': return 'Guía ilustrada de flora y fauna';
			case 'pdfPreviewPage.commonNameNotAvailable': return 'Nombre común no disponible';
			case 'pdfPreviewPage.scientificNameNotAvailable': return 'Nombre científico no disponible';
			case 'pdfPreviewPage.author': return 'Autor';
			case 'pdfPreviewPage.authors': return 'Autores';
			case 'pdfPreviewPage.imageNotAvailable': return 'Imagen no está disponible';
			case 'pdfPreviewPage.taxonomicInformation': return 'Información taxonómica';
			case 'pdfPreviewPage.kingdom': return 'Reino';
			case 'pdfPreviewPage.phylum': return 'Filo';
			case 'pdfPreviewPage.class_': return 'Clase';
			case 'pdfPreviewPage.order': return 'Orden';
			case 'pdfPreviewPage.family': return 'Familia';
			case 'pdfPreviewPage.authorInformation': return 'Información del autor';
			case 'pdfPreviewPage.name': return 'Nombre';
			case 'pdfPreviewPage.lastname': return 'Apellidos';
			case 'pdfPreviewPage.profession': return 'Profesión';
			case 'pdfPreviewPage.bornIn': return 'Nació en';
			case 'pdfPreviewPage.diedIn': return 'Falleció en';
			case 'profile.title': return 'Mi perfil';
			case 'profile.logout': return 'Cerrar sesión';
			case 'profile.favorites': return 'Mis favoritos';
			case 'profile.changePassword': return 'Cambiar contraseña';
			case 'profile.share': return 'Descarga la app Guía Ilustrada de Flora y Fauna del IIAP y conoce más sobre las especies de la Amazonía Peruana:';
			case 'profile.invite': return 'Invitar amigos';
			case 'profile.project': return 'Sobre el proyecto';
			case 'profile.team': return 'Sobre nosotros';
			case 'profile.deleteAccount': return 'Eliminar cuenta';
			case 'profile.userNotFound': return 'Usuario no encontrado';
			case 'profile.completeProfile': return 'Completa tu perfil para acceder a todas las funcionalidades de la aplicación.';
			case 'profile.completeButton': return 'Completar perfil';
			case 'profile.editButton': return 'Editar perfil';
			case 'searchPage.failedRequest': return 'Algo salió mal. Inténtalo de nuevo';
			case 'searchPage.recentlyAdded': return 'Recién agregado';
			case 'searchPage.nameFilter.common': return 'Común';
			case 'searchPage.nameFilter.scientific': return 'Científico';
			case 'searchPage.nameFilter.order': return 'Ordenar por';
			case 'searchPage.taxonomyFilter': return 'Taxonomía';
			case 'searchPage.orderFilter': return 'Orden';
			case 'searchPage.familyFilter': return 'Familia';
			case 'searchPage.soundFilter.withSound': return 'Con sonido';
			case 'searchPage.soundFilter.withoutSound': return 'Sin sonido';
			case 'searchPage.soundFilter.sound': return 'Sonido';
			case 'searchPage.conservationFilter': return 'Conservación';
			case 'searchPage.categoryFilter.category': return 'Categoría';
			case 'searchPage.categoryFilter.birds': return 'Aves';
			case 'searchPage.categoryFilter.mammals': return 'Mamíferos';
			case 'searchPage.categoryFilter.reptiles': return 'Reptiles';
			case 'searchPage.categoryFilter.amphibians': return 'Anfibios';
			case 'searchPage.categoryFilter.fish': return 'Peces';
			case 'searchPage.categoryFilter.insects': return 'Insectos';
			case 'searchPage.categoryFilter.plants': return 'Plantas';
			case 'searchPage.categoryFilter.palms': return 'Palmeras';
			case 'searchPage.cleanFilters': return 'Limpiar filtros';
			case 'searchPage.searchSpecies': return 'Buscar especies';
			case 'searchPage.cleanSearch': return 'Limpiar búsqueda';
			case 'searchPage.errorFetchingTitle': return 'Error al obtener resultados';
			case 'searchPage.errorFetchingContent': return 'Inténtalo de nuevo';
			case 'searchPage.notResultsTitle': return 'No se encontraron resultados';
			case 'searchPage.notResultsContent': return 'No se encontraron resultados. Prueba otra búsqueda';
			case 'searchPage.errorFetchingSpecies': return 'No se encontraron especies relacionadas con tu búsqueda. Por favor, intenta nuevamente con otra clase, orden o familia.';
			case 'searchPage.acceptText': return 'Aceptar';
			case 'searchPage.updateText': return 'Actualizar';
			case 'searchPage.aToZ': return 'A-Z';
			case 'searchPage.zToA': return 'Z-A';
			case 'signIn.title': return 'Amazonía';
			case 'signIn.subtitle': return 'Guía ilustrada de flora y fauna';
			case 'signIn.email': return 'E-Mail';
			case 'signIn.password': return 'Contraseña';
			case 'signIn.enter': return 'Ingresar';
			case 'signIn.new_': return 'Si eres nuevo, regístrate aquí';
			case 'signIn.view_password': return 'Mostrar contraseña';
			case 'signIn.clear': return 'Limpiar';
			case 'signIn.register_first': return 'Primero debes registrarte';
			case 'signIn.verify_email': return 'Primero verifica tu correo electrónico';
			case 'signIn.verify_email_more': return 'Debes verificar tu correo electrónico para poder ingresar';
			case 'signIn.forgot_password': return '¿Olvidaste tu contraseña?';
			case 'signUp.title': return 'Registrarse';
			case 'signUp.alreadyRegistered': return '¿Ya tienes una cuenta? Inicia sesión';
			case 'signUp.button': return 'Registrarse';
			case 'signUp.email': return 'Correo';
			case 'signUp.password': return 'Contraseña';
			case 'signUp.showPassword': return 'Mostrar contraseña';
			case 'signUp.repeatPassword': return 'Repite tu contraseña';
			case 'signUp.clear': return 'Limpiar';
			case 'signUp.network': return 'Comprueba tu conexión a internet';
			case 'signUp.credential': return 'Credenciales incorrectas';
			case 'signUp.disabled': return 'Esta cuenta ha sido desactivada, inténtelo más tarde';
			case 'signUp.notRegistered': return 'Esta cuenta no está registrada';
			case 'signUp.passwordNotMatch': return 'Contraseña incorrecta';
			case 'signUp.unknown': return 'Error desconocido, inténtelo más tarde';
			case 'signUp.sendedEmail': return 'Se ha enviado un correo de confirmación a tu dirección de correo electrónico';
			case 'species.title': return 'Especies';
			case 'species.birds': return 'Aves';
			case 'species.mammals': return 'Mamíferos';
			case 'species.reptiles': return 'Reptiles';
			case 'species.amphibians': return 'Anfibios';
			case 'species.fishes': return 'Peces';
			case 'species.insects': return 'Insectos';
			case 'species.trees': return 'Árboles';
			case 'species.palms': return 'Palmeras';
			case 'species.orderName': return 'Nombre común';
			case 'species.orderScientificName': return 'Nombre científico';
			case 'speciesDetails.authors': return 'Autores';
			case 'speciesDetails.taxonomicInfo': return 'Información Taxonómica';
			case 'speciesDetails.kingdom': return 'Reino';
			case 'speciesDetails.filo': return 'Filo';
			case 'speciesDetails.classes': return 'Clase';
			case 'speciesDetails.order': return 'Orden';
			case 'speciesDetails.family': return 'Familia';
			case 'speciesDetails.download': return 'Descargar';
			case 'speciesDetails.generatePdf': return 'Generar PDF';
			case 'speciesDetails.downloadImage': return 'Descargar Imagen';
			case 'speciesDetails.downloadAudio': return 'Descargar Audio';
			case 'speciesDetails.share': return 'Compartir';
			case 'speciesDetails.errorDownload': return 'Error al Descargar';
			case 'speciesDetails.successDownload': return 'Descarga Exitosa';
			case 'speciesDetails.shareAmazonInfo': return '¡Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre.';
			case 'speciesDetails.shareAmazon': return '¡Comparte la belleza de la Amazonía!';
			case 'speciesDetailsPage.download': return 'Descargar';
			case 'speciesDetailsPage.errorDownload': return 'No se pudo descargar';
			case 'speciesDetailsPage.downloadImage': return 'Descargar imagen';
			case 'speciesDetailsPage.downloadAudio': return 'Descargar audio';
			case 'speciesDetailsPage.share': return 'Compartir';
			case 'speciesDetailsPage.generatePdf': return 'Generar PDF';
			case 'speciesDetailsPage.attractiveMessage': return 'Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre';
			case 'speciesDetailsPage.conservationStates': return 'Estados de conservación';
			case 'speciesDetailsPage.noInformation': return 'Sin información';
			case 'speciesDetailsPage.nameNotAvailable': return 'Nombre no disponible';
			case 'speciesDetailsPage.scientificNameNotAvailable': return 'Nombre científico no disponible';
			case 'speciesDetailsPage.year': return 'Año';
			case 'userCredentialFailure.network': return 'Comprueba tu conexión a internet';
			case 'userCredentialFailure.credential': return 'Credenciales incorrectas';
			case 'userCredentialFailure.disable': return 'Esta cuenta ha sido desactivada, inténtelo más tarde';
			case 'userCredentialFailure.notRegistered': return 'El correo no está registrado';
			case 'userCredentialFailure.password': return 'Contraseña incorrecta';
			case 'userCredentialFailure.unknown': return 'Error desconocido';
			case 'validator.password.label': return 'Contraseña';
			case 'validator.password.empty': return 'Ingrese su contraseña';
			case 'validator.password.minLength': return 'Ingrese al menos 6 caracteres';
			case 'validator.password.regExp': return 'La contraseña debe contener al menos un número y una letra';
			case 'validator.repeatPassword.empty': return 'Ingrese su contraseña';
			case 'validator.repeatPassword.minLength': return 'Ingrese al menos 6 caracteres';
			case 'validator.repeatPassword.regExp': return 'La contraseña debe contener al menos un número y una letra';
			case 'validator.repeatPassword.matchPassword': return 'Las contraseñas deben coincidir';
			case 'validator.email.label': return 'Correo electrónico';
			case 'validator.email.empty': return 'Ingrese su correo electrónico';
			case 'validator.email.regExp': return 'Ingrese un correo electrónico válido';
			case 'validator.name.label': return 'Nombre';
			case 'validator.name.empty': return 'Ingrese su nombre';
			case 'validator.name.minLength': return 'Ingrese al menos 3 caracteres';
			case 'validator.lastName.label': return 'Apellido';
			case 'validator.lastName.empty': return 'Ingrese su apellido';
			case 'validator.lastName.minLength': return 'Ingrese al menos 3 caracteres';
			case 'validator.phone.label': return 'Número de teléfono';
			case 'validator.phone.empty': return 'Ingrese su número de teléfono';
			case 'validator.phone.minLength': return 'Ingrese al menos 9 caracteres';
			case 'validator.phone.regExp': return 'Ingrese un número de teléfono válido';
			case 'validator.countryCode.label': return 'Código de país';
			case 'validator.countryCode.select': return 'Seleccione el código de país';
			default: return null;
		}
	}
}

extension on _TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'aboutProject.title': return 'À propos du projet';
			case 'aboutProject.getBook': return 'Obtenir le livre';
			case 'aboutProject.titleBook': return 'AMAZONIE';
			case 'aboutProject.subtitleBook': return 'Guide illustré de la flore et de la faune';
			case 'aboutProject.p1': return 'Bienvenue sur la plateforme mobile du Guide Illustré de la Flore et de la Faune de l\'Amazonie. Plongez dans la richesse et la diversité de cette région unique à travers une expérience interactive basée sur des données mises à jour jusqu\'en 2022';
			case 'aboutProject.content': return 'À propos du contenu';
			case 'aboutProject.p2': return 'Notre plateforme est une fenêtre sur l\'étonnante biodiversité amazonienne. À travers un contenu expert et des images visuellement stupéfiantes, nous vous invitons à explorer la beauté inégalée de cette région et à comprendre son importance critique pour notre planète.';
			case 'aboutProject.commitment': return 'Notre engagement';
			case 'aboutProject.p3': return 'Nous nous efforçons de sensibiliser à l\'immense importance de la biodiversité et de sa protection, notamment dans les régions les plus vulnérables et parmi les populations affectées par la dégradation et le changement climatique.';
			case 'aboutProject.contact': return 'Contactez-nous';
			case 'aboutProject.p4': return 'Pour plus d\'informations sur le projet, contactez l\'Institut de Recherche de l\'Amazonie Péruvienne (IIAP) via le site web : ';
			case 'aboutProject.address': return 'Route Iquitos - Nauta Km 4.5, Quistococha, District de San Juan Bautista, Maynas, Loreto : ';
			case 'authors.title': return 'Auteurs';
			case 'authors.withoutAuthors': return 'Il semble qu\'il n\'y ait pas d\'auteurs ici';
			case 'authors.professionNotAvailable': return 'Profession non disponible';
			case 'bottomBar.home': return 'Accueil';
			case 'bottomBar.search': return 'Rechercher';
			case 'bottomBar.favorites': return 'Favoris';
			case 'community.title': return 'Communautés autochtones';
			case 'community.withoutCommunities': return 'Il semble qu\'il n\'y ait pas de communautés autochtones ici';
			case 'deleteAccount.title': return 'Supprimer le compte';
			case 'deleteAccount.userInfo': return 'Informations sur l\'utilisateur :';
			case 'deleteAccount.username': return 'Nom d\'utilisateur';
			case 'deleteAccount.email': return 'Email';
			case 'deleteAccount.phone': return 'Téléphone';
			case 'deleteAccount.delete': return 'Supprimer le compte';
			case 'deleteAccount.warning': return 'En supprimant votre compte, vous acceptez les conditions suivantes :';
			case 'deleteAccount.firtsTerm': return '- Vous ne pourrez pas récupérer votre compte.';
			case 'deleteAccount.secondTerm': return '- Vous ne pourrez pas récupérer vos données.';
			case 'deleteAccount.confirm': return 'Confirmer';
			case 'deleteAccount.cancel': return 'Annuler';
			case 'deleteAccount.information': return 'Êtes-vous sûr de vouloir supprimer votre compte ? Cette action est irréversible. Entrez votre mot de passe pour confirmer.';
			case 'deleteAccount.accountDeleted': return 'Compte supprimé avec succès';
			case 'deleteAccount.notRegistered': return 'Non inscrit';
			case 'editProfile.errorSnack': return 'Erreur lors du chargement des données utilisateur';
			case 'editProfile.title': return 'Modifier le profil';
			case 'editProfile.save': return 'Enregistrer';
			case 'editProfile.saving': return 'Enregistrement...';
			case 'editProfile.errorSaving': return 'Erreur lors de l\'enregistrement des données du profil';
			case 'editProfile.selectImage': return 'Sélectionnez une photo de profil';
			case 'editProfile.errorSave': return 'Erreur lors de l\'enregistrement du profil';
			case 'errorPage.page_not_exist': return 'Cette page n\'existe plus';
			case 'errorPage.go_back': return 'Retour aux espèces';
			case 'favorites.title': return 'Favoris';
			case 'favorites.hintText': return 'Recherchez votre favori';
			case 'favorites.exceptionText': return 'Il n\'y a pas encore d\'espèces ici';
			case 'favorites.deleteFavorite': return 'Retirer des favoris';
			case 'favorites.empty': return 'Commencez à marquer des espèces comme favorites pour les voir ici';
			case 'favorites.error': return 'Nous avons apporté des modifications importantes, appuyez sur \'Restaurer les espèces\' pour mettre à jour les informations, assurez-vous d\'avoir une connexion Internet';
			case 'favorites.canNot': return 'Cette action n\'a pas pu être effectuée';
			case 'favorites.reestoreSpecies': return 'Restaurer les espèces';
			case 'favorites.withoutSpecies': return 'Vous n\'avez pas encore d\'espèces favorites, vous pouvez les ajouter depuis la section des espèces';
			case 'favorites.yeah': return 'Toutes vos espèces favorites ont été restaurées!';
			case 'filterOptions.listByAlphabethic': return 'Trier par ordre alphabétique';
			case 'filterOptions.recentlyAdded': return 'Plus récent';
			case 'filterOptions.all': return 'Tout';
			case 'filterOptions.noPreferencies': return 'Pas de préférences';
			case 'filterOptions.filterByName.title': return 'Filtrer par nom';
			case 'filterOptions.filterByName.common': return 'Nom commun';
			case 'filterOptions.filterByName.scientific': return 'Nom scientifique';
			case 'filterOptions.filterBySound.title': return 'Filtrer par son';
			case 'filterOptions.filterBySound.withSound': return 'Avec son';
			case 'filterOptions.filterBySound.withoutSound': return 'Sans son';
			case 'filterOptions.filterByConservation': return 'Filtrer par état de conservation';
			case 'filterOptions.filterByCategory': return 'Filtrer par catégorie';
			case 'filterOptions.filterByTaxonomy': return 'Filtrer par taxonomie';
			case 'filterOptions.filterByOrder': return 'Filtrer par ordre';
			case 'filterOptions.filterByFamily': return 'Filtrer par famille';
			case 'forgotPassword.title': return 'Mot de passe oublié';
			case 'forgotPassword.sendLabel': return 'Envoyer';
			case 'forgotPassword.validatingLabel': return 'Validation en cours...';
			case 'forgotPassword.email': return 'Email';
			case 'forgotPassword.clear': return 'Effacer';
			case 'forgotPassword.message': return 'Entrez votre adresse e-mail pour recevoir un e-mail vous permettant de changer votre mot de passe :';
			case 'forgotPassword.checkYourEmail': return 'Vérifiez votre e-mail !';
			case 'general.back': return 'Retour';
			case 'general.close': return 'Fermer';
			case 'general.clear': return 'Effacer';
			case 'general.search': return 'Rechercher';
			case 'general.addToFavorites': return 'Ajouter aux favoris';
			case 'general.removeFromFavorites': return 'Retirer des favoris';
			case 'general.error404Again': return 'Quelque chose s\'est mal passé, veuillez réessayer';
			case 'general.nameNotAvailable': return 'Nom non disponible';
			case 'general.lastnameNotAvailable': return 'Nom de famille non disponible';
			case 'general.descriptionNotAvailable': return 'Description non disponible';
			case 'pdfPreviewPage.amazon': return 'Amazone';
			case 'pdfPreviewPage.institute': return 'Institut de Recherche de l\'Amazonie Péruvienne';
			case 'pdfPreviewPage.title': return 'Guide illustré de la flore et de la faune';
			case 'pdfPreviewPage.commonNameNotAvailable': return 'Nom commun non disponible';
			case 'pdfPreviewPage.scientificNameNotAvailable': return 'Nom scientifique non disponible';
			case 'pdfPreviewPage.author': return 'Auteur';
			case 'pdfPreviewPage.authors': return 'Auteurs';
			case 'pdfPreviewPage.imageNotAvailable': return 'Image non disponible';
			case 'pdfPreviewPage.taxonomicInformation': return 'Informations taxonomiques';
			case 'pdfPreviewPage.kingdom': return 'Règne';
			case 'pdfPreviewPage.phylum': return 'Embranchement';
			case 'pdfPreviewPage.class_': return 'Classe';
			case 'pdfPreviewPage.order': return 'Ordre';
			case 'pdfPreviewPage.family': return 'Famille';
			case 'pdfPreviewPage.authorInformation': return 'Informations sur l\'auteur';
			case 'pdfPreviewPage.name': return 'Prénom';
			case 'pdfPreviewPage.lastname': return 'Nom';
			case 'pdfPreviewPage.profession': return 'Profession';
			case 'pdfPreviewPage.bornIn': return 'Né en';
			case 'pdfPreviewPage.diedIn': return 'Décédé en';
			case 'profile.title': return 'Mon profil';
			case 'profile.logout': return 'Déconnexion';
			case 'profile.favorites': return 'Mes favoris';
			case 'profile.changePassword': return 'Changer le mot de passe';
			case 'profile.share': return 'Téléchargez l\'application Guide illustré de la flore et de la faune de l\'IIAP et apprenez-en davantage sur les espèces de l\'Amazonie péruvienne :';
			case 'profile.invite': return 'Inviter des amis';
			case 'profile.project': return 'À propos du projet';
			case 'profile.team': return 'À propos de nous';
			case 'profile.deleteAccount': return 'Supprimer le compte';
			case 'profile.userNotFound': return 'Utilisateur non trouvé';
			case 'profile.completeProfile': return 'Complétez votre profil pour accéder à toutes les fonctionnalités de l\'application.';
			case 'profile.completeButton': return 'Compléter le profil';
			case 'profile.editButton': return 'Modifier le profil';
			case 'searchPage.failedRequest': return 'Quelque chose s\'est mal passé. Veuillez réessayer';
			case 'searchPage.recentlyAdded': return 'Récemment ajouté';
			case 'searchPage.nameFilter.common': return 'Commun';
			case 'searchPage.nameFilter.scientific': return 'Scientifique';
			case 'searchPage.nameFilter.order': return 'Trier par';
			case 'searchPage.taxonomyFilter': return 'Taxonomie';
			case 'searchPage.orderFilter': return 'Ordre';
			case 'searchPage.familyFilter': return 'Famille';
			case 'searchPage.soundFilter.withSound': return 'Avec son';
			case 'searchPage.soundFilter.withoutSound': return 'Sans son';
			case 'searchPage.soundFilter.sound': return 'Son';
			case 'searchPage.conservationFilter': return 'Conservation';
			case 'searchPage.categoryFilter.category': return 'Catégorie';
			case 'searchPage.categoryFilter.birds': return 'Oiseaux';
			case 'searchPage.categoryFilter.mammals': return 'Mammifères';
			case 'searchPage.categoryFilter.reptiles': return 'Reptiles';
			case 'searchPage.categoryFilter.amphibians': return 'Amphibiens';
			case 'searchPage.categoryFilter.fish': return 'Poissons';
			case 'searchPage.categoryFilter.insects': return 'Insectes';
			case 'searchPage.categoryFilter.plants': return 'Plantes';
			case 'searchPage.categoryFilter.palms': return 'Palmiers';
			case 'searchPage.cleanFilters': return 'Effacer les filtres';
			case 'searchPage.searchSpecies': return 'Rechercher des espèces';
			case 'searchPage.cleanSearch': return 'Effacer la recherche';
			case 'searchPage.errorFetchingTitle': return 'Erreur lors de la récupération des résultats';
			case 'searchPage.errorFetchingContent': return 'Réessayer';
			case 'searchPage.notResultsTitle': return 'Aucun résultat trouvé';
			case 'searchPage.notResultsContent': return 'Aucun résultat trouvé. Essayez une autre recherche';
			case 'searchPage.errorFetchingSpecies': return 'Aucune espèce trouvée liée à votre recherche. Veuillez réessayer avec une autre classe, ordre ou famille.';
			case 'searchPage.acceptText': return 'Accepter';
			case 'searchPage.updateText': return 'Mettre à jour';
			case 'searchPage.aToZ': return 'A-Z';
			case 'searchPage.zToA': return 'Z-A';
			case 'signIn.title': return 'Forêt amazonienne';
			case 'signIn.subtitle': return 'Guide illustré de la flore et de la faune';
			case 'signIn.email': return 'E-Mail';
			case 'signIn.password': return 'Mot de passe';
			case 'signIn.enter': return 'Entrer';
			case 'signIn.new_': return 'Si vous êtes nouveau, inscrivez-vous ici';
			case 'signIn.view_password': return 'Afficher le mot de passe';
			case 'signIn.clear': return 'Effacer';
			case 'signIn.register_first': return 'Vous devez d\'abord vous inscrire';
			case 'signIn.verify_email': return 'Vérifiez d\'abord votre e-mail';
			case 'signIn.verify_email_more': return 'Vous devez vérifier votre e-mail pour vous connecter';
			case 'signIn.forgot_password': return 'Mot de passe oublié ?';
			case 'signUp.title': return 'S\'inscrire';
			case 'signUp.alreadyRegistered': return 'Vous avez déjà un compte ? Connectez-vous';
			case 'signUp.button': return 'S\'inscrire';
			case 'signUp.email': return 'E-mail';
			case 'signUp.password': return 'Mot de passe';
			case 'signUp.showPassword': return 'Afficher le mot de passe';
			case 'signUp.repeatPassword': return 'Répéter votre mot de passe';
			case 'signUp.clear': return 'Effacer';
			case 'signUp.network': return 'Vérifiez votre connexion internet';
			case 'signUp.credential': return 'Identifiants incorrects';
			case 'signUp.disabled': return 'Ce compte a été désactivé, veuillez réessayer plus tard';
			case 'signUp.notRegistered': return 'Ce compte n\'est pas enregistré';
			case 'signUp.passwordNotMatch': return 'Mot de passe incorrect';
			case 'signUp.unknown': return 'Erreur inconnue, veuillez réessayer plus tard';
			case 'signUp.sendedEmail': return 'Un e-mail de confirmation a été envoyé à votre adresse e-mail';
			case 'species.title': return 'Espèces';
			case 'species.birds': return 'Oiseaux';
			case 'species.mammals': return 'Mammifères';
			case 'species.reptiles': return 'Reptiles';
			case 'species.amphibians': return 'Amphibiens';
			case 'species.fishes': return 'Poissons';
			case 'species.insects': return 'Insectes';
			case 'species.trees': return 'Arbres';
			case 'species.palms': return 'Palmiers';
			case 'species.orderName': return 'Nom commun';
			case 'species.orderScientificName': return 'Nom scientifique';
			case 'speciesDetails.authors': return 'Auteurs';
			case 'speciesDetails.taxonomicInfo': return 'Information Taxonomique';
			case 'speciesDetails.kingdom': return 'Royaume';
			case 'speciesDetails.filo': return 'Phylum';
			case 'speciesDetails.classes': return 'Classe';
			case 'speciesDetails.order': return 'Ordre';
			case 'speciesDetails.family': return 'Famille';
			case 'speciesDetails.download': return 'Télécharger';
			case 'speciesDetails.generatePdf': return 'Générer PDF';
			case 'speciesDetails.downloadImage': return 'Télécharger l\'Image';
			case 'speciesDetails.downloadAudio': return 'Télécharger l\'Audio';
			case 'speciesDetails.share': return 'Partager';
			case 'speciesDetails.errorDownload': return 'Erreur de Téléchargement';
			case 'speciesDetails.successDownload': return 'Téléchargement Réussi';
			case 'speciesDetails.shareAmazonInfo': return 'Partagez la beauté de l\'Amazonie ! Partagez ces précieuses informations sur.';
			case 'speciesDetails.shareAmazon': return 'Partagez la beauté de l\'Amazonie !';
			case 'speciesDetailsPage.download': return 'Télécharger';
			case 'speciesDetailsPage.errorDownload': return 'Téléchargement impossible';
			case 'speciesDetailsPage.downloadImage': return 'Télécharger l\'image';
			case 'speciesDetailsPage.downloadAudio': return 'Télécharger l\'audio';
			case 'speciesDetailsPage.share': return 'Partager';
			case 'speciesDetailsPage.generatePdf': return 'Générer PDF';
			case 'speciesDetailsPage.attractiveMessage': return 'Partagez la beauté de l\'Amazonie ! Partagez cette information précieuse sur';
			case 'speciesDetailsPage.conservationStates': return 'Statuts de conservation';
			case 'speciesDetailsPage.noInformation': return 'Pas d\'information';
			case 'speciesDetailsPage.nameNotAvailable': return 'Nom non disponible';
			case 'speciesDetailsPage.scientificNameNotAvailable': return 'Nom scientifique non disponible';
			case 'speciesDetailsPage.year': return 'Année';
			case 'userCredentialFailure.network': return 'Vérifiez votre connexion internet';
			case 'userCredentialFailure.credential': return 'Identifiants incorrects';
			case 'userCredentialFailure.disable': return 'Ce compte a été désactivé, veuillez réessayer ultérieurement';
			case 'userCredentialFailure.notRegistered': return 'L\'e-mail n\'est pas enregistré';
			case 'userCredentialFailure.password': return 'Mot de passe incorrect';
			case 'userCredentialFailure.unknown': return 'Erreur inconnue';
			case 'validator.password.label': return 'Mot de passe';
			case 'validator.password.empty': return 'Entrez votre mot de passe';
			case 'validator.password.minLength': return 'Entrez au moins 6 caractères';
			case 'validator.password.regExp': return 'Le mot de passe doit contenir au moins un chiffre et une lettre';
			case 'validator.repeatPassword.empty': return 'Entrez votre mot de passe';
			case 'validator.repeatPassword.minLength': return 'Entrez au moins 6 caractères';
			case 'validator.repeatPassword.regExp': return 'Le mot de passe doit contenir au moins un chiffre et une lettre';
			case 'validator.repeatPassword.matchPassword': return 'Les mots de passe doivent correspondre';
			case 'validator.email.label': return 'Email';
			case 'validator.email.empty': return 'Entrez votre email';
			case 'validator.email.regExp': return 'Entrez un email valide';
			case 'validator.name.label': return 'Nom';
			case 'validator.name.empty': return 'Entrez votre nom';
			case 'validator.name.minLength': return 'Entrez au moins 3 caractères';
			case 'validator.lastName.label': return 'Nom de famille';
			case 'validator.lastName.empty': return 'Entrez votre nom de famille';
			case 'validator.lastName.minLength': return 'Entrez au moins 3 caractères';
			case 'validator.phone.label': return 'Numéro de téléphone';
			case 'validator.phone.empty': return 'Entrez votre numéro de téléphone';
			case 'validator.phone.minLength': return 'Entrez au moins 9 caractères';
			case 'validator.phone.regExp': return 'Entrez un numéro de téléphone valide';
			case 'validator.countryCode.label': return 'Code pays';
			case 'validator.countryCode.select': return 'Sélectionnez le code pays';
			default: return null;
		}
	}
}

extension on _TranslationsPt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'aboutProject.title': return 'Sobre o projeto';
			case 'aboutProject.getBook': return 'Obter o livro';
			case 'aboutProject.titleBook': return 'AMAZONIA';
			case 'aboutProject.subtitleBook': return 'Guia Ilustrado de Flora e Fauna';
			case 'aboutProject.p1': return 'Bem-vindo à plataforma móvel do Guia Ilustrado de Flora e Fauna da Amazônia. Explore a riqueza e a diversidade desta região única através de uma experiência interativa baseada em dados atualizados até 2022';
			case 'aboutProject.content': return 'Sobre o conteúdo';
			case 'aboutProject.p2': return 'Nossa plataforma é uma janela para a surpreendente biodiversidade amazônica. Através de conteúdo especializado e imagens visualmente impressionantes, convidamos você a explorar a beleza incomparável desta região e entender sua importância crítica para nosso planeta.';
			case 'aboutProject.commitment': return 'Nosso compromisso';
			case 'aboutProject.p3': return 'Nos esforçamos para conscientizar sobre a imensa importância da biodiversidade e sua proteção, especialmente nas regiões mais vulneráveis e entre as populações afetadas pela degradação e mudanças climáticas.';
			case 'aboutProject.contact': return 'Entre em contato';
			case 'aboutProject.p4': return 'Para mais informações sobre o projeto, entre em contato com o Instituto de Pesquisas da Amazônia Peruana (IIAP) através do site: ';
			case 'aboutProject.address': return 'Estrada Iquitos - Nauta Km 4.5, Quistococha, Distrito de San Juan Bautista, Maynas, Loreto: ';
			case 'authors.title': return 'Autores';
			case 'authors.withoutAuthors': return 'Parece que não há autores aqui';
			case 'authors.professionNotAvailable': return 'Profissão não disponível';
			case 'bottomBar.home': return 'Início';
			case 'bottomBar.search': return 'Buscar';
			case 'bottomBar.favorites': return 'Favoritos';
			case 'community.title': return 'Comunidades indígenas';
			case 'community.withoutCommunities': return 'Parece que não há comunidades indígenas aqui';
			case 'deleteAccount.title': return 'Excluir conta';
			case 'deleteAccount.userInfo': return 'Informações do usuário:';
			case 'deleteAccount.username': return 'Nome de usuário';
			case 'deleteAccount.email': return 'Email';
			case 'deleteAccount.phone': return 'Telefone';
			case 'deleteAccount.delete': return 'Excluir conta';
			case 'deleteAccount.warning': return 'Ao excluir sua conta, você concorda com os seguintes termos:';
			case 'deleteAccount.firtsTerm': return '- Você não poderá recuperar sua conta.';
			case 'deleteAccount.secondTerm': return '- Você não poderá recuperar seus dados.';
			case 'deleteAccount.confirm': return 'Confirmar';
			case 'deleteAccount.cancel': return 'Cancelar';
			case 'deleteAccount.information': return 'Tem certeza de que deseja excluir sua conta? Esta ação é irreversível. Digite sua senha para confirmar.';
			case 'deleteAccount.accountDeleted': return 'Conta excluída com sucesso';
			case 'deleteAccount.notRegistered': return 'Não registrado';
			case 'editProfile.errorSnack': return 'Erro ao carregar os dados do usuário';
			case 'editProfile.title': return 'Editar perfil';
			case 'editProfile.save': return 'Salvar';
			case 'editProfile.saving': return 'Salvando...';
			case 'editProfile.errorSaving': return 'Erro ao salvar os dados do perfil';
			case 'editProfile.selectImage': return 'Selecione uma imagem de perfil';
			case 'editProfile.errorSave': return 'Erro ao salvar o perfil';
			case 'errorPage.page_not_exist': return 'Esta página não existe mais';
			case 'errorPage.go_back': return 'Voltar para espécies';
			case 'favorites.title': return 'Favoritos';
			case 'favorites.hintText': return 'Procure seu favorito';
			case 'favorites.exceptionText': return 'Ainda não há espécies aqui';
			case 'favorites.deleteFavorite': return 'Remover dos favoritos';
			case 'favorites.empty': return 'Comece a marcar espécies como favoritas para vê-las aqui';
			case 'favorites.error': return 'Fizemos mudanças importantes, toque em \'Restaurar as espécies\' para atualizar as informações, certifique-se de estar conectado à internet';
			case 'favorites.canNot': return 'Não foi possível realizar esta ação';
			case 'favorites.reestoreSpecies': return 'Restaurar as espécies';
			case 'favorites.withoutSpecies': return 'Você ainda não tem espécies favoritas, pode adicioná-las na seção de espécies';
			case 'favorites.yeah': return 'Todas as suas espécies favoritas foram restauradas!';
			case 'filterOptions.listByAlphabethic': return 'Listar por ordem alfabética';
			case 'filterOptions.recentlyAdded': return 'Mais recente';
			case 'filterOptions.all': return 'Todos';
			case 'filterOptions.noPreferencies': return 'Sem preferências';
			case 'filterOptions.filterByName.title': return 'Filtrar por nome';
			case 'filterOptions.filterByName.common': return 'Nome comum';
			case 'filterOptions.filterByName.scientific': return 'Nome científico';
			case 'filterOptions.filterBySound.title': return 'Filtrar por som';
			case 'filterOptions.filterBySound.withSound': return 'Com som';
			case 'filterOptions.filterBySound.withoutSound': return 'Sem som';
			case 'filterOptions.filterByConservation': return 'Filtrar por estado de conservação';
			case 'filterOptions.filterByCategory': return 'Filtrar por categoria';
			case 'filterOptions.filterByTaxonomy': return 'Filtrar por taxonomia';
			case 'filterOptions.filterByOrder': return 'Filtrar por ordem';
			case 'filterOptions.filterByFamily': return 'Filtrar por família';
			case 'forgotPassword.title': return 'Esqueceu sua senha';
			case 'forgotPassword.sendLabel': return 'Enviar';
			case 'forgotPassword.validatingLabel': return 'Validando...';
			case 'forgotPassword.email': return 'Email';
			case 'forgotPassword.clear': return 'Limpar';
			case 'forgotPassword.message': return 'Digite seu email para enviar um email onde você pode alterar sua senha:';
			case 'forgotPassword.checkYourEmail': return 'Verifique seu email!';
			case 'general.back': return 'Voltar';
			case 'general.close': return 'Fechar';
			case 'general.clear': return 'Limpar';
			case 'general.search': return 'Buscar';
			case 'general.addToFavorites': return 'Adicionar aos favoritos';
			case 'general.removeFromFavorites': return 'Remover dos favoritos';
			case 'general.error404Again': return 'Algo deu errado, por favor tente novamente';
			case 'general.nameNotAvailable': return 'Nome não disponível';
			case 'general.lastnameNotAvailable': return 'Sobrenome não disponível';
			case 'general.descriptionNotAvailable': return 'Descrição não disponível';
			case 'pdfPreviewPage.amazon': return 'Amazonas';
			case 'pdfPreviewPage.institute': return 'Instituto de Pesquisa da Amazônia Peruana';
			case 'pdfPreviewPage.title': return 'Guia Ilustrado de Flora e Fauna';
			case 'pdfPreviewPage.commonNameNotAvailable': return 'Nome comum não disponível';
			case 'pdfPreviewPage.scientificNameNotAvailable': return 'Nome científico não disponível';
			case 'pdfPreviewPage.author': return 'Autor';
			case 'pdfPreviewPage.authors': return 'Autores';
			case 'pdfPreviewPage.imageNotAvailable': return 'Imagem não disponível';
			case 'pdfPreviewPage.taxonomicInformation': return 'Informação taxonômica';
			case 'pdfPreviewPage.kingdom': return 'Reino';
			case 'pdfPreviewPage.phylum': return 'Filo';
			case 'pdfPreviewPage.class_': return 'Classe';
			case 'pdfPreviewPage.order': return 'Ordem';
			case 'pdfPreviewPage.family': return 'Família';
			case 'pdfPreviewPage.authorInformation': return 'Informação do autor';
			case 'pdfPreviewPage.name': return 'Nome';
			case 'pdfPreviewPage.lastname': return 'Sobrenome';
			case 'pdfPreviewPage.profession': return 'Profissão';
			case 'pdfPreviewPage.bornIn': return 'Nasceu em';
			case 'pdfPreviewPage.diedIn': return 'Faleceu em';
			case 'profile.title': return 'Meu perfil';
			case 'profile.logout': return 'Sair';
			case 'profile.favorites': return 'Meus favoritos';
			case 'profile.changePassword': return 'Alterar senha';
			case 'profile.share': return 'Baixe o aplicativo Guia Ilustrado de Flora e Fauna do IIAP e saiba mais sobre as espécies da Amazônia Peruana:';
			case 'profile.invite': return 'Convidar amigos';
			case 'profile.project': return 'Sobre o projeto';
			case 'profile.team': return 'Sobre nós';
			case 'profile.deleteAccount': return 'Excluir conta';
			case 'profile.userNotFound': return 'Usuário não encontrado';
			case 'profile.completeProfile': return 'Complete seu perfil para acessar todos os recursos do aplicativo.';
			case 'profile.completeButton': return 'Completar perfil';
			case 'profile.editButton': return 'Editar perfil';
			case 'searchPage.failedRequest': return 'Algo deu errado. Por favor, tente novamente';
			case 'searchPage.recentlyAdded': return 'Recentemente adicionado';
			case 'searchPage.nameFilter.common': return 'Comum';
			case 'searchPage.nameFilter.scientific': return 'Científico';
			case 'searchPage.nameFilter.order': return 'Ordenar por';
			case 'searchPage.taxonomyFilter': return 'Taxonomia';
			case 'searchPage.orderFilter': return 'Ordem';
			case 'searchPage.familyFilter': return 'Família';
			case 'searchPage.soundFilter.withSound': return 'Com som';
			case 'searchPage.soundFilter.withoutSound': return 'Sem som';
			case 'searchPage.soundFilter.sound': return 'Som';
			case 'searchPage.conservationFilter': return 'Conservação';
			case 'searchPage.categoryFilter.category': return 'Categoria';
			case 'searchPage.categoryFilter.birds': return 'Aves';
			case 'searchPage.categoryFilter.mammals': return 'Mamíferos';
			case 'searchPage.categoryFilter.reptiles': return 'Répteis';
			case 'searchPage.categoryFilter.amphibians': return 'Anfíbios';
			case 'searchPage.categoryFilter.fish': return 'Peixes';
			case 'searchPage.categoryFilter.insects': return 'Insetos';
			case 'searchPage.categoryFilter.plants': return 'Plantas';
			case 'searchPage.categoryFilter.palms': return 'Palmeiras';
			case 'searchPage.cleanFilters': return 'Limpar filtros';
			case 'searchPage.searchSpecies': return 'Pesquisar espécies';
			case 'searchPage.cleanSearch': return 'Limpar pesquisa';
			case 'searchPage.errorFetchingTitle': return 'Erro ao buscar resultados';
			case 'searchPage.errorFetchingContent': return 'Tente novamente';
			case 'searchPage.notResultsTitle': return 'Nenhum resultado encontrado';
			case 'searchPage.notResultsContent': return 'Nenhum resultado encontrado. Tente outra pesquisa';
			case 'searchPage.errorFetchingSpecies': return 'Nenhuma espécie encontrada relacionada à sua busca. Por favor, tente novamente com outra classe, ordem ou família.';
			case 'searchPage.acceptText': return 'Aceitar';
			case 'searchPage.updateText': return 'Atualizar';
			case 'searchPage.aToZ': return 'A-Z';
			case 'searchPage.zToA': return 'Z-A';
			case 'signIn.title': return 'Floresta Amazônica';
			case 'signIn.subtitle': return 'Guia Ilustrado de Flora e Fauna';
			case 'signIn.email': return 'E-Mail';
			case 'signIn.password': return 'Senha';
			case 'signIn.enter': return 'Entrar';
			case 'signIn.new_': return 'Se você é novo, registre-se aqui';
			case 'signIn.view_password': return 'Mostrar senha';
			case 'signIn.clear': return 'Limpar';
			case 'signIn.register_first': return 'Você deve se registrar primeiro';
			case 'signIn.verify_email': return 'Primeiro verifique seu e-mail';
			case 'signIn.verify_email_more': return 'Você precisa verificar seu e-mail para fazer login';
			case 'signIn.forgot_password': return 'Esqueceu sua senha?';
			case 'signUp.title': return 'Registar-se';
			case 'signUp.alreadyRegistered': return 'Já tem uma conta? Iniciar sessão';
			case 'signUp.button': return 'Registar-se';
			case 'signUp.email': return 'E-mail';
			case 'signUp.password': return 'Senha';
			case 'signUp.showPassword': return 'Mostrar senha';
			case 'signUp.repeatPassword': return 'Repetir sua senha';
			case 'signUp.clear': return 'Limpar';
			case 'signUp.network': return 'Verifique sua conexão com a internet';
			case 'signUp.credential': return 'Credenciais incorretas';
			case 'signUp.disabled': return 'Esta conta foi desativada, tente novamente mais tarde';
			case 'signUp.notRegistered': return 'Esta conta não está registrada';
			case 'signUp.passwordNotMatch': return 'Senha incorreta';
			case 'signUp.unknown': return 'Erro desconhecido, tente novamente mais tarde';
			case 'signUp.sendedEmail': return 'Um e-mail de confirmação foi enviado para o seu endereço de e-mail';
			case 'species.title': return 'Espécies';
			case 'species.birds': return 'Aves';
			case 'species.mammals': return 'Mamíferos';
			case 'species.reptiles': return 'Répteis';
			case 'species.amphibians': return 'Anfíbios';
			case 'species.fishes': return 'Peixes';
			case 'species.insects': return 'Insetos';
			case 'species.trees': return 'Árvores';
			case 'species.palms': return 'Palmeiras';
			case 'species.orderName': return 'Nome comum';
			case 'species.orderScientificName': return 'Nome científico';
			case 'speciesDetails.authors': return 'Autores';
			case 'speciesDetails.taxonomicInfo': return 'Informação Taxonômica';
			case 'speciesDetails.kingdom': return 'Reino';
			case 'speciesDetails.filo': return 'Filo';
			case 'speciesDetails.classes': return 'Classe';
			case 'speciesDetails.order': return 'Ordem';
			case 'speciesDetails.family': return 'Família';
			case 'speciesDetails.download': return 'Baixar';
			case 'speciesDetails.generatePdf': return 'Gerar PDF';
			case 'speciesDetails.downloadImage': return 'Baixar Imagem';
			case 'speciesDetails.downloadAudio': return 'Baixar Áudio';
			case 'speciesDetails.share': return 'Compartilhar';
			case 'speciesDetails.errorDownload': return 'Erro ao Baixar';
			case 'speciesDetails.successDownload': return 'Download Bem-Sucedido';
			case 'speciesDetails.shareAmazonInfo': return 'Compartilhe a beleza da Amazônia! Compartilhe estas informações valiosas sobre.';
			case 'speciesDetails.shareAmazon': return 'Compartilhe a beleza da Amazônia!';
			case 'speciesDetailsPage.download': return 'Baixar';
			case 'speciesDetailsPage.errorDownload': return 'Não foi possível baixar';
			case 'speciesDetailsPage.downloadImage': return 'Baixar imagem';
			case 'speciesDetailsPage.downloadAudio': return 'Baixar áudio';
			case 'speciesDetailsPage.share': return 'Compartilhar';
			case 'speciesDetailsPage.generatePdf': return 'Gerar PDF';
			case 'speciesDetailsPage.attractiveMessage': return 'Compartilhe a beleza da Amazônia! Compartilhe esta valiosa informação sobre';
			case 'speciesDetailsPage.conservationStates': return 'Estados de conservação';
			case 'speciesDetailsPage.noInformation': return 'Sem informação';
			case 'speciesDetailsPage.nameNotAvailable': return 'Nome não disponível';
			case 'speciesDetailsPage.scientificNameNotAvailable': return 'Nome científico não disponível';
			case 'speciesDetailsPage.year': return 'Ano';
			case 'userCredentialFailure.network': return 'Verifique sua conexão com a internet';
			case 'userCredentialFailure.credential': return 'Credenciais incorretas';
			case 'userCredentialFailure.disable': return 'Esta conta foi desativada, tente novamente mais tarde';
			case 'userCredentialFailure.notRegistered': return 'O e-mail não está registrado';
			case 'userCredentialFailure.password': return 'Senha incorreta';
			case 'userCredentialFailure.unknown': return 'Erro desconhecido';
			case 'validator.password.label': return 'Senha';
			case 'validator.password.empty': return 'Digite sua senha';
			case 'validator.password.minLength': return 'Digite pelo menos 6 caracteres';
			case 'validator.password.regExp': return 'A senha deve conter pelo menos um número e uma letra';
			case 'validator.repeatPassword.empty': return 'Digite sua senha';
			case 'validator.repeatPassword.minLength': return 'Digite pelo menos 6 caracteres';
			case 'validator.repeatPassword.regExp': return 'A senha deve conter pelo menos um número e uma letra';
			case 'validator.repeatPassword.matchPassword': return 'As senhas devem ser iguais';
			case 'validator.email.label': return 'Email';
			case 'validator.email.empty': return 'Digite seu email';
			case 'validator.email.regExp': return 'Digite um email válido';
			case 'validator.name.label': return 'Nome';
			case 'validator.name.empty': return 'Digite seu nome';
			case 'validator.name.minLength': return 'Digite pelo menos 3 caracteres';
			case 'validator.lastName.label': return 'Sobrenome';
			case 'validator.lastName.empty': return 'Digite seu sobrenome';
			case 'validator.lastName.minLength': return 'Digite pelo menos 3 caracteres';
			case 'validator.phone.label': return 'Número de telefone';
			case 'validator.phone.empty': return 'Digite seu número de telefone';
			case 'validator.phone.minLength': return 'Digite pelo menos 9 caracteres';
			case 'validator.phone.regExp': return 'Digite um número de telefone válido';
			case 'validator.countryCode.label': return 'Código do país';
			case 'validator.countryCode.select': return 'Selecione o código do país';
			default: return null;
		}
	}
}

extension on _TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'aboutProject.title': return '关于项目';
			case 'aboutProject.getBook': return '获取书籍';
			case 'aboutProject.titleBook': return '亚马逊';
			case 'aboutProject.subtitleBook': return '植物和动物图解指南';
			case 'aboutProject.p1': return '欢迎来到亚马逊植物和动物图解指南的移动平台。通过基于截至2022年的数据更新的交互式体验，深入了解这个独特地区的丰富多样性';
			case 'aboutProject.content': return '关于内容';
			case 'aboutProject.p2': return '我们的平台是窥视令人惊叹的亚马逊生物多样性的窗口。通过专业内容和视觉上令人惊叹的图像，我们邀请您探索这个地区无与伦比的美丽，并了解其对我们星球的至关重要性。';
			case 'aboutProject.commitment': return '我们的承诺';
			case 'aboutProject.p3': return '我们致力于提高人们对生物多样性及其保护的重要性的认识，特别是在最脆弱的地区和受到退化和气候变化影响的人群中。';
			case 'aboutProject.contact': return '联系我们';
			case 'aboutProject.p4': return '有关该项目的更多信息，请通过以下网站联系秘鲁亚马逊研究所（IIAP）：';
			case 'aboutProject.address': return '伊基托斯 - 瑙塔路4.5公里，奎斯托科查，圣胡安巴蒂斯塔区，迈纳斯，洛雷托：';
			case 'authors.title': return '作者';
			case 'authors.withoutAuthors': return '这里似乎没有作者';
			case 'authors.professionNotAvailable': return '职业不可用';
			case 'bottomBar.home': return '首页';
			case 'bottomBar.search': return '搜索';
			case 'bottomBar.favorites': return '收藏夹';
			case 'community.title': return '土著社区';
			case 'community.withoutCommunities': return '这里似乎没有土著社区';
			case 'deleteAccount.title': return '删除账户';
			case 'deleteAccount.userInfo': return '用户信息：';
			case 'deleteAccount.username': return '用户名';
			case 'deleteAccount.email': return '邮箱';
			case 'deleteAccount.phone': return '电话';
			case 'deleteAccount.delete': return '删除账户';
			case 'deleteAccount.warning': return '删除您的账户，即表示您同意以下条款：';
			case 'deleteAccount.firtsTerm': return '- 您将无法恢复您的账户。';
			case 'deleteAccount.secondTerm': return '- 您将无法恢复您的数据。';
			case 'deleteAccount.confirm': return '确认';
			case 'deleteAccount.cancel': return '取消';
			case 'deleteAccount.information': return '您确定要删除您的账户吗？此操作不可逆。请输入您的密码进行确认。';
			case 'deleteAccount.accountDeleted': return '账户删除成功';
			case 'deleteAccount.notRegistered': return '未注册';
			case 'editProfile.errorSnack': return '加载用户数据时出错';
			case 'editProfile.title': return '编辑个人资料';
			case 'editProfile.save': return '保存';
			case 'editProfile.saving': return '正在保存...';
			case 'editProfile.errorSaving': return '保存个人资料数据时出错';
			case 'editProfile.selectImage': return '选择个人资料图片';
			case 'editProfile.errorSave': return '保存个人资料时出错';
			case 'errorPage.page_not_exist': return '该页面不存在';
			case 'errorPage.go_back': return '返回物种';
			case 'favorites.title': return '收藏夹';
			case 'favorites.hintText': return '搜索你的收藏';
			case 'favorites.exceptionText': return '这里还没有物种';
			case 'favorites.deleteFavorite': return '从收藏夹中删除';
			case 'favorites.empty': return '开始将物种标记为收藏，以便在此查看';
			case 'favorites.error': return '我们进行了重大更改，点击“恢复物种”以更新信息，请确保你已连接到互联网';
			case 'favorites.canNot': return '无法执行此操作';
			case 'favorites.reestoreSpecies': return '恢复物种';
			case 'favorites.withoutSpecies': return '你还没有收藏的物种，可以从物种部分添加';
			case 'favorites.yeah': return '你的所有收藏物种都已恢复！';
			case 'filterOptions.listByAlphabethic': return '按字母顺序列出';
			case 'filterOptions.recentlyAdded': return '最近添加';
			case 'filterOptions.all': return '全部';
			case 'filterOptions.noPreferencies': return '没有偏好';
			case 'filterOptions.filterByName.title': return '按名称过滤';
			case 'filterOptions.filterByName.common': return '通用名称';
			case 'filterOptions.filterByName.scientific': return '科学名称';
			case 'filterOptions.filterBySound.title': return '按声音过滤';
			case 'filterOptions.filterBySound.withSound': return '有声音';
			case 'filterOptions.filterBySound.withoutSound': return '无声音';
			case 'filterOptions.filterByConservation': return '按保护状态过滤';
			case 'filterOptions.filterByCategory': return '按类别过滤';
			case 'filterOptions.filterByTaxonomy': return '按分类过滤';
			case 'filterOptions.filterByOrder': return '按顺序过滤';
			case 'filterOptions.filterByFamily': return '按科过滤';
			case 'forgotPassword.title': return '忘记密码';
			case 'forgotPassword.sendLabel': return '发送';
			case 'forgotPassword.validatingLabel': return '正在验证...';
			case 'forgotPassword.email': return '邮箱';
			case 'forgotPassword.clear': return '清除';
			case 'forgotPassword.message': return '请输入您的电子邮件以发送一封邮件，您可以在其中更改您的密码：';
			case 'forgotPassword.checkYourEmail': return '请检查您的邮箱！';
			case 'general.back': return '返回';
			case 'general.close': return '关闭';
			case 'general.clear': return '清除';
			case 'general.search': return '搜索';
			case 'general.addToFavorites': return '添加到收藏夹';
			case 'general.removeFromFavorites': return '从收藏夹中删除';
			case 'general.error404Again': return '出了点问题，请再试一次';
			case 'general.nameNotAvailable': return '名称不可用';
			case 'general.lastnameNotAvailable': return '姓氏不可用';
			case 'general.descriptionNotAvailable': return '描述不可用';
			case 'pdfPreviewPage.amazon': return '亚马逊';
			case 'pdfPreviewPage.institute': return '秘鲁亚马逊研究所';
			case 'pdfPreviewPage.title': return '动植物图鉴';
			case 'pdfPreviewPage.commonNameNotAvailable': return '常用名称不可用';
			case 'pdfPreviewPage.scientificNameNotAvailable': return '学名不可用';
			case 'pdfPreviewPage.author': return '作者';
			case 'pdfPreviewPage.authors': return '作者们';
			case 'pdfPreviewPage.imageNotAvailable': return '图片不可用';
			case 'pdfPreviewPage.taxonomicInformation': return '分类信息';
			case 'pdfPreviewPage.kingdom': return '界';
			case 'pdfPreviewPage.phylum': return '门';
			case 'pdfPreviewPage.class_': return '纲';
			case 'pdfPreviewPage.order': return '目';
			case 'pdfPreviewPage.family': return '科';
			case 'pdfPreviewPage.authorInformation': return '作者信息';
			case 'pdfPreviewPage.name': return '名字';
			case 'pdfPreviewPage.lastname': return '姓氏';
			case 'pdfPreviewPage.profession': return '职业';
			case 'pdfPreviewPage.bornIn': return '出生于';
			case 'pdfPreviewPage.diedIn': return '逝世于';
			case 'profile.title': return '我的个人资料';
			case 'profile.logout': return '退出';
			case 'profile.favorites': return '我的收藏';
			case 'profile.changePassword': return '更改密码';
			case 'profile.share': return '下载IIAP植物和动物图解指南应用程序，了解更多有关秘鲁亚马逊物种的信息：';
			case 'profile.invite': return '邀请朋友';
			case 'profile.project': return '关于项目';
			case 'profile.team': return '关于我们';
			case 'profile.deleteAccount': return '删除帐户';
			case 'profile.userNotFound': return '找不到用户';
			case 'profile.completeProfile': return '完善您的个人资料以访问应用程序的所有功能。';
			case 'profile.completeButton': return '完成个人资料';
			case 'profile.editButton': return '编辑个人资料';
			case 'searchPage.failedRequest': return '发生错误。请重试';
			case 'searchPage.recentlyAdded': return '最近添加';
			case 'searchPage.nameFilter.common': return '常见';
			case 'searchPage.nameFilter.scientific': return '科学';
			case 'searchPage.nameFilter.order': return '排序方式';
			case 'searchPage.taxonomyFilter': return '分类';
			case 'searchPage.orderFilter': return '顺序';
			case 'searchPage.familyFilter': return '家庭';
			case 'searchPage.soundFilter.withSound': return '有声音';
			case 'searchPage.soundFilter.withoutSound': return '无声音';
			case 'searchPage.soundFilter.sound': return '声音';
			case 'searchPage.conservationFilter': return '保护';
			case 'searchPage.categoryFilter.category': return '类别';
			case 'searchPage.categoryFilter.birds': return '鸟类';
			case 'searchPage.categoryFilter.mammals': return '哺乳动物';
			case 'searchPage.categoryFilter.reptiles': return '爬行动物';
			case 'searchPage.categoryFilter.amphibians': return '两栖动物';
			case 'searchPage.categoryFilter.fish': return '鱼类';
			case 'searchPage.categoryFilter.insects': return '昆虫';
			case 'searchPage.categoryFilter.plants': return '植物';
			case 'searchPage.categoryFilter.palms': return '棕榈树';
			case 'searchPage.cleanFilters': return '清除过滤器';
			case 'searchPage.searchSpecies': return '搜索物种';
			case 'searchPage.cleanSearch': return '清除搜索';
			case 'searchPage.errorFetchingTitle': return '获取结果时出错';
			case 'searchPage.errorFetchingContent': return '重试';
			case 'searchPage.notResultsTitle': return '未找到结果';
			case 'searchPage.notResultsContent': return '未找到结果。请尝试另一种搜索';
			case 'searchPage.errorFetchingSpecies': return '未找到与您的搜索相关的物种。 请尝试使用其他类别，排序或科。';
			case 'searchPage.acceptText': return '接受';
			case 'searchPage.updateText': return '更新';
			case 'searchPage.aToZ': return '阿-贼德';
			case 'searchPage.zToA': return '贼德-阿';
			case 'signIn.title': return '亚马逊雨林';
			case 'signIn.subtitle': return '植物和动物图鉴';
			case 'signIn.email': return '电子邮件';
			case 'signIn.password': return '密码';
			case 'signIn.enter': return '进入';
			case 'signIn.new_': return '如果您是新用户，请在此注册';
			case 'signIn.view_password': return '显示密码';
			case 'signIn.clear': return '清除';
			case 'signIn.register_first': return '您必须先注册';
			case 'signIn.verify_email': return '首先验证您的电子邮件';
			case 'signIn.verify_email_more': return '您需要验证您的电子邮件才能登录';
			case 'signIn.forgot_password': return '忘记密码了吗？';
			case 'signUp.title': return '注册';
			case 'signUp.alreadyRegistered': return '已经有账号了？登录';
			case 'signUp.button': return '注册';
			case 'signUp.email': return '邮箱';
			case 'signUp.password': return '密码';
			case 'signUp.showPassword': return '显示密码';
			case 'signUp.repeatPassword': return '重复你的密码';
			case 'signUp.clear': return '清除';
			case 'signUp.network': return '检查你的网络连接';
			case 'signUp.credential': return '凭据不正确';
			case 'signUp.disabled': return '此帐户已被停用，请稍后再试';
			case 'signUp.notRegistered': return '此帐户尚未注册';
			case 'signUp.passwordNotMatch': return '密码不正确';
			case 'signUp.unknown': return '未知错误，请稍后再试';
			case 'signUp.sendedEmail': return '确认邮件已发送至您的电子邮件地址';
			case 'species.title': return '物种';
			case 'species.birds': return '鸟类';
			case 'species.mammals': return '哺乳动物';
			case 'species.reptiles': return '爬行动物';
			case 'species.amphibians': return '两栖动物';
			case 'species.fishes': return '鱼类';
			case 'species.insects': return '昆虫';
			case 'species.trees': return '树木';
			case 'species.palms': return '棕榈树';
			case 'species.orderName': return '通用名';
			case 'species.orderScientificName': return '科学名称';
			case 'speciesDetails.authors': return '作者';
			case 'speciesDetails.taxonomicInfo': return '分类信息';
			case 'speciesDetails.kingdom': return '王国';
			case 'speciesDetails.filo': return '门';
			case 'speciesDetails.classes': return '类';
			case 'speciesDetails.order': return '目';
			case 'speciesDetails.family': return '科';
			case 'speciesDetails.download': return '下载';
			case 'speciesDetails.generatePdf': return '生成 PDF';
			case 'speciesDetails.downloadImage': return '下载图片';
			case 'speciesDetails.downloadAudio': return '下载音频';
			case 'speciesDetails.share': return '分享';
			case 'speciesDetails.errorDownload': return '下载错误';
			case 'speciesDetails.successDownload': return '下载成功';
			case 'speciesDetails.shareAmazonInfo': return '分享亚马逊的美丽！分享有关的宝贵信息.';
			case 'speciesDetails.shareAmazon': return '分享亚马逊的美丽！';
			case 'speciesDetailsPage.download': return '下载';
			case 'speciesDetailsPage.errorDownload': return '无法下载';
			case 'speciesDetailsPage.downloadImage': return '下载图片';
			case 'speciesDetailsPage.downloadAudio': return '下载音频';
			case 'speciesDetailsPage.share': return '分享';
			case 'speciesDetailsPage.generatePdf': return '生成 PDF';
			case 'speciesDetailsPage.attractiveMessage': return '分享亚马逊的美丽！分享这条有价值的信息';
			case 'speciesDetailsPage.conservationStates': return '保护状态';
			case 'speciesDetailsPage.noInformation': return '没有信息';
			case 'speciesDetailsPage.nameNotAvailable': return '名称不可用';
			case 'speciesDetailsPage.scientificNameNotAvailable': return '学名不可用';
			case 'speciesDetailsPage.year': return '年';
			case 'userCredentialFailure.network': return '检查您的网络连接';
			case 'userCredentialFailure.credential': return '凭证不正确';
			case 'userCredentialFailure.disable': return '此帐户已被禁用，请稍后再试';
			case 'userCredentialFailure.notRegistered': return '电子邮件未注册';
			case 'userCredentialFailure.password': return '密码不正确';
			case 'userCredentialFailure.unknown': return '未知错误';
			case 'validator.password.label': return '密码';
			case 'validator.password.empty': return '请输入您的密码';
			case 'validator.password.minLength': return '至少输入6个字符';
			case 'validator.password.regExp': return '密码必须包含至少一个数字和一个字母';
			case 'validator.repeatPassword.empty': return '请输入您的密码';
			case 'validator.repeatPassword.minLength': return '至少输入6个字符';
			case 'validator.repeatPassword.regExp': return '密码必须包含至少一个数字和一个字母';
			case 'validator.repeatPassword.matchPassword': return '密码必须匹配';
			case 'validator.email.label': return '邮箱';
			case 'validator.email.empty': return '请输入您的邮箱';
			case 'validator.email.regExp': return '请输入有效的邮箱';
			case 'validator.name.label': return '姓名';
			case 'validator.name.empty': return '请输入您的姓名';
			case 'validator.name.minLength': return '至少输入3个字符';
			case 'validator.lastName.label': return '姓氏';
			case 'validator.lastName.empty': return '请输入您的姓氏';
			case 'validator.lastName.minLength': return '至少输入3个字符';
			case 'validator.phone.label': return '电话号码';
			case 'validator.phone.empty': return '请输入您的电话号码';
			case 'validator.phone.minLength': return '至少输入9个字符';
			case 'validator.phone.regExp': return '请输入有效的电话号码';
			case 'validator.countryCode.label': return '国家代码';
			case 'validator.countryCode.select': return '选择国家代码';
			default: return null;
		}
	}
}
