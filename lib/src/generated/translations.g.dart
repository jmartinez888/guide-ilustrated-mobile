/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 5
/// Strings: 635 (127 per locale)
///
/// Built on 2024-03-22 at 22:58 UTC

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
	late final _TranslationsBottomBarEn bottomBar = _TranslationsBottomBarEn._(_root);
	late final _TranslationsFavoritesEn favorites = _TranslationsFavoritesEn._(_root);
	late final _TranslationsForgotPasswordEn forgotPassword = _TranslationsForgotPasswordEn._(_root);
	late final _TranslationsSearchPageEn searchPage = _TranslationsSearchPageEn._(_root);
	late final _TranslationsSignInEn signIn = _TranslationsSignInEn._(_root);
	late final _TranslationsSignUpEn signUp = _TranslationsSignUpEn._(_root);
	late final _TranslationsSpeciesEn species = _TranslationsSpeciesEn._(_root);
	late final _TranslationsSpeciesDetailsEn speciesDetails = _TranslationsSpeciesDetailsEn._(_root);
	late final _TranslationsUserCredentialFailureEn userCredentialFailure = _TranslationsUserCredentialFailureEn._(_root);
	late final _TranslationsValidatorEn validator = _TranslationsValidatorEn._(_root);
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

// Path: favorites
class _TranslationsFavoritesEn {
	_TranslationsFavoritesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Favorites';
	String get hintText => 'Search your favorite';
	String get close => 'Close';
	String get search => 'Search';
	String get exceptionText => 'No species here yet';
	String get deleteFavorite => 'Remove from favorites';
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
	String get deleteFavorite => 'Remove from Favorites';
	String get saveFavorite => 'Save to Favorites';
	String get orderName => 'Sort by Common Name';
	String get orderScientificName => 'Sort by Scientific Name';
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
	String get saveToFavorite => 'Save to Favorites';
	String get deleteFromFavorite => 'Delete from Favorites';
	String get errorDownload => 'Download Error';
	String get successDownload => 'Download Success';
	String get shareAmazonInfo => 'Share the beauty of the Amazon! Share this valuable information about.';
	String get shareAmazon => 'Share the beauty of the Amazon!';
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
	String get empty => 'Enter your email';
	String get regExp => 'Enter a valid email';
}

// Path: validator.name
class _TranslationsValidatorNameEn {
	_TranslationsValidatorNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Enter your name';
	String get minLength => 'Enter at least 3 characters';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Enter your last name';
	String get minLength => 'Enter at least 3 characters';
}

// Path: validator.phone
class _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Enter your phone number';
	String get minLength => 'Enter at least 9 characters';
	String get regExp => 'Enter a valid phone number';
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
	@override late final _TranslationsBottomBarEs bottomBar = _TranslationsBottomBarEs._(_root);
	@override late final _TranslationsFavoritesEs favorites = _TranslationsFavoritesEs._(_root);
	@override late final _TranslationsForgotPasswordEs forgotPassword = _TranslationsForgotPasswordEs._(_root);
	@override late final _TranslationsSearchPageEs searchPage = _TranslationsSearchPageEs._(_root);
	@override late final _TranslationsSignInEs signIn = _TranslationsSignInEs._(_root);
	@override late final _TranslationsSignUpEs signUp = _TranslationsSignUpEs._(_root);
	@override late final _TranslationsSpeciesEs species = _TranslationsSpeciesEs._(_root);
	@override late final _TranslationsSpeciesDetailsEs speciesDetails = _TranslationsSpeciesDetailsEs._(_root);
	@override late final _TranslationsUserCredentialFailureEs userCredentialFailure = _TranslationsUserCredentialFailureEs._(_root);
	@override late final _TranslationsValidatorEs validator = _TranslationsValidatorEs._(_root);
}

// Path: bottomBar
class _TranslationsBottomBarEs implements _TranslationsBottomBarEn {
	_TranslationsBottomBarEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'inicio';
	@override String get search => 'Buscar';
	@override String get favorites => 'favoritos';
}

// Path: favorites
class _TranslationsFavoritesEs implements _TranslationsFavoritesEn {
	_TranslationsFavoritesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoritos';
	@override String get hintText => 'Busca tu favorito';
	@override String get close => 'Cerrar';
	@override String get search => 'Buscar';
	@override String get exceptionText => 'Aún no hay especies aquí';
	@override String get deleteFavorite => 'Quitar de favoritos';
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
	@override String get deleteFavorite => 'Quitar de favoritos';
	@override String get saveFavorite => 'Guardar en favoritos';
	@override String get orderName => 'Ordenar por nombre común';
	@override String get orderScientificName => 'Ordenar por nombre científico';
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
	@override String get saveToFavorite => 'Guardar en Favoritos';
	@override String get deleteFromFavorite => 'Eliminar de Favoritos';
	@override String get errorDownload => 'Error al Descargar';
	@override String get successDownload => 'Descarga Exitosa';
	@override String get shareAmazonInfo => '¡Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre.';
	@override String get shareAmazon => '¡Comparte la belleza de la Amazonía!';
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
	@override String get matchPassword => 'Las contraseñas deben ser iguales';
}

// Path: validator.email
class _TranslationsValidatorEmailEs implements _TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Ingrese su email';
	@override String get regExp => 'Ingrese un email válido';
}

// Path: validator.name
class _TranslationsValidatorNameEs implements _TranslationsValidatorNameEn {
	_TranslationsValidatorNameEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Ingrese su nombre';
	@override String get minLength => 'Ingrese al menos 3 caracteres';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameEs implements _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Ingrese su apellido';
	@override String get minLength => 'Ingrese al menos 3 caracteres';
}

// Path: validator.phone
class _TranslationsValidatorPhoneEs implements _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Ingrese su teléfono';
	@override String get minLength => 'Ingrese al menos 9 caracteres';
	@override String get regExp => 'Ingrese un teléfono válido';
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
	@override late final _TranslationsBottomBarFr bottomBar = _TranslationsBottomBarFr._(_root);
	@override late final _TranslationsFavoritesFr favorites = _TranslationsFavoritesFr._(_root);
	@override late final _TranslationsForgotPasswordFr forgotPassword = _TranslationsForgotPasswordFr._(_root);
	@override late final _TranslationsSearchPageFr searchPage = _TranslationsSearchPageFr._(_root);
	@override late final _TranslationsSignInFr signIn = _TranslationsSignInFr._(_root);
	@override late final _TranslationsSignUpFr signUp = _TranslationsSignUpFr._(_root);
	@override late final _TranslationsSpeciesFr species = _TranslationsSpeciesFr._(_root);
	@override late final _TranslationsSpeciesDetailsFr speciesDetails = _TranslationsSpeciesDetailsFr._(_root);
	@override late final _TranslationsUserCredentialFailureFr userCredentialFailure = _TranslationsUserCredentialFailureFr._(_root);
	@override late final _TranslationsValidatorFr validator = _TranslationsValidatorFr._(_root);
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

// Path: favorites
class _TranslationsFavoritesFr implements _TranslationsFavoritesEn {
	_TranslationsFavoritesFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoris';
	@override String get hintText => 'Recherchez votre favori';
	@override String get close => 'Fermer';
	@override String get search => 'Chercher';
	@override String get exceptionText => 'Pas encore d\'espèces ici';
	@override String get deleteFavorite => 'Supprimer des favoris';
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
	@override String get title => 'Espécies';
	@override String get birds => 'Aves';
	@override String get mammals => 'Mamíferos';
	@override String get reptiles => 'Répteis';
	@override String get amphibians => 'Anfíbios';
	@override String get fishes => 'Peixes';
	@override String get insects => 'Insetos';
	@override String get trees => 'Árvores';
	@override String get palms => 'Palmeiras';
	@override String get deleteFavorite => 'Remover dos Favoritos';
	@override String get saveFavorite => 'Salvar nos Favoritos';
	@override String get orderName => 'Ordenar por Nome Comum';
	@override String get orderScientificName => 'Ordenar por Nome Científico';
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
	@override String get saveToFavorite => 'Enregistrer dans les Favoris';
	@override String get deleteFromFavorite => 'Supprimer des Favoris';
	@override String get errorDownload => 'Erreur de Téléchargement';
	@override String get successDownload => 'Téléchargement Réussi';
	@override String get shareAmazonInfo => 'Partagez la beauté de l\'Amazonie ! Partagez ces précieuses informations sur.';
	@override String get shareAmazon => 'Partagez la beauté de l\'Amazonie !';
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
	@override String get matchPassword => 'Les mots de passe doivent être identiques';
}

// Path: validator.email
class _TranslationsValidatorEmailFr implements _TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Entrez votre e-mail';
	@override String get regExp => 'Entrez un e-mail valide';
}

// Path: validator.name
class _TranslationsValidatorNameFr implements _TranslationsValidatorNameEn {
	_TranslationsValidatorNameFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Entrez votre nom';
	@override String get minLength => 'Entrez au moins 3 caractères';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameFr implements _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Entrez votre nom de famille';
	@override String get minLength => 'Entrez au moins 3 caractères';
}

// Path: validator.phone
class _TranslationsValidatorPhoneFr implements _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneFr._(this._root);

	@override final _TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Entrez votre numéro de téléphone';
	@override String get minLength => 'Entrez au moins 9 caractères';
	@override String get regExp => 'Entrez un numéro de téléphone valide';
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
	@override late final _TranslationsBottomBarPt bottomBar = _TranslationsBottomBarPt._(_root);
	@override late final _TranslationsFavoritesPt favorites = _TranslationsFavoritesPt._(_root);
	@override late final _TranslationsForgotPasswordPt forgotPassword = _TranslationsForgotPasswordPt._(_root);
	@override late final _TranslationsSearchPagePt searchPage = _TranslationsSearchPagePt._(_root);
	@override late final _TranslationsSignInPt signIn = _TranslationsSignInPt._(_root);
	@override late final _TranslationsSignUpPt signUp = _TranslationsSignUpPt._(_root);
	@override late final _TranslationsSpeciesPt species = _TranslationsSpeciesPt._(_root);
	@override late final _TranslationsSpeciesDetailsPt speciesDetails = _TranslationsSpeciesDetailsPt._(_root);
	@override late final _TranslationsUserCredentialFailurePt userCredentialFailure = _TranslationsUserCredentialFailurePt._(_root);
	@override late final _TranslationsValidatorPt validator = _TranslationsValidatorPt._(_root);
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

// Path: favorites
class _TranslationsFavoritesPt implements _TranslationsFavoritesEn {
	_TranslationsFavoritesPt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Favoritos';
	@override String get hintText => 'Procure o seu favorito';
	@override String get close => 'Fechar';
	@override String get search => 'Pesquisar';
	@override String get exceptionText => 'Ainda não há espécies aqui';
	@override String get deleteFavorite => 'Remover dos favoritos';
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
	@override String get deleteFavorite => 'Remover dos Favoritos';
	@override String get saveFavorite => 'Salvar nos Favoritos';
	@override String get orderName => 'Ordenar por Nome Comum';
	@override String get orderScientificName => 'Ordenar por Nome Científico';
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
	@override String get saveToFavorite => 'Salvar nos Favoritos';
	@override String get deleteFromFavorite => 'Remover dos Favoritos';
	@override String get errorDownload => 'Erro ao Baixar';
	@override String get successDownload => 'Download Bem-Sucedido';
	@override String get shareAmazonInfo => 'Compartilhe a beleza da Amazônia! Compartilhe estas informações valiosas sobre.';
	@override String get shareAmazon => 'Compartilhe a beleza da Amazônia!';
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
	@override String get empty => 'Digite seu email';
	@override String get regExp => 'Digite um email válido';
}

// Path: validator.name
class _TranslationsValidatorNamePt implements _TranslationsValidatorNameEn {
	_TranslationsValidatorNamePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Digite seu nome';
	@override String get minLength => 'Digite pelo menos 3 caracteres';
}

// Path: validator.lastName
class _TranslationsValidatorLastNamePt implements _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNamePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Digite seu sobrenome';
	@override String get minLength => 'Digite pelo menos 3 caracteres';
}

// Path: validator.phone
class _TranslationsValidatorPhonePt implements _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhonePt._(this._root);

	@override final _TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Digite seu telefone';
	@override String get minLength => 'Digite pelo menos 9 caracteres';
	@override String get regExp => 'Digite um telefone válido';
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
	@override late final _TranslationsBottomBarZh bottomBar = _TranslationsBottomBarZh._(_root);
	@override late final _TranslationsFavoritesZh favorites = _TranslationsFavoritesZh._(_root);
	@override late final _TranslationsForgotPasswordZh forgotPassword = _TranslationsForgotPasswordZh._(_root);
	@override late final _TranslationsSearchPageZh searchPage = _TranslationsSearchPageZh._(_root);
	@override late final _TranslationsSignInZh signIn = _TranslationsSignInZh._(_root);
	@override late final _TranslationsSignUpZh signUp = _TranslationsSignUpZh._(_root);
	@override late final _TranslationsSpeciesZh species = _TranslationsSpeciesZh._(_root);
	@override late final _TranslationsSpeciesDetailsZh speciesDetails = _TranslationsSpeciesDetailsZh._(_root);
	@override late final _TranslationsUserCredentialFailureZh userCredentialFailure = _TranslationsUserCredentialFailureZh._(_root);
	@override late final _TranslationsValidatorZh validator = _TranslationsValidatorZh._(_root);
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

// Path: favorites
class _TranslationsFavoritesZh implements _TranslationsFavoritesEn {
	_TranslationsFavoritesZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '收藏夹';
	@override String get hintText => '查找您的收藏';
	@override String get close => '关闭';
	@override String get search => '搜索';
	@override String get exceptionText => '这里还没有物种';
	@override String get deleteFavorite => '从收藏夹中删除';
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
	@override String get deleteFavorite => '从收藏中移除';
	@override String get saveFavorite => '保存到收藏夹';
	@override String get orderName => '按普通名称排序';
	@override String get orderScientificName => '按学名排序';
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
	@override String get saveToFavorite => '保存到收藏夹';
	@override String get deleteFromFavorite => '从收藏夹中删除';
	@override String get errorDownload => '下载错误';
	@override String get successDownload => '下载成功';
	@override String get shareAmazonInfo => '分享亚马逊的美丽！分享有关的宝贵信息.';
	@override String get shareAmazon => '分享亚马逊的美丽！';
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
	@override String get matchPassword => '密码必须相同';
}

// Path: validator.email
class _TranslationsValidatorEmailZh implements _TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get empty => '请输入您的邮箱';
	@override String get regExp => '请输入有效的邮箱';
}

// Path: validator.name
class _TranslationsValidatorNameZh implements _TranslationsValidatorNameEn {
	_TranslationsValidatorNameZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get empty => '请输入您的姓名';
	@override String get minLength => '至少输入3个字符';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameZh implements _TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get empty => '请输入您的姓氏';
	@override String get minLength => '至少输入3个字符';
}

// Path: validator.phone
class _TranslationsValidatorPhoneZh implements _TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneZh._(this._root);

	@override final _TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get empty => '请输入您的电话号码';
	@override String get minLength => '至少输入9个字符';
	@override String get regExp => '请输入有效的电话号码';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomBar.home': return 'Home';
			case 'bottomBar.search': return 'Search';
			case 'bottomBar.favorites': return 'Favorites';
			case 'favorites.title': return 'Favorites';
			case 'favorites.hintText': return 'Search your favorite';
			case 'favorites.close': return 'Close';
			case 'favorites.search': return 'Search';
			case 'favorites.exceptionText': return 'No species here yet';
			case 'favorites.deleteFavorite': return 'Remove from favorites';
			case 'forgotPassword.title': return 'Forgot Your Password';
			case 'forgotPassword.sendLabel': return 'Send';
			case 'forgotPassword.validatingLabel': return 'Validating...';
			case 'forgotPassword.email': return 'Email';
			case 'forgotPassword.clear': return 'Clear';
			case 'forgotPassword.message': return 'Enter your email to send you an email where you can change your password:';
			case 'forgotPassword.checkYourEmail': return 'Check your email!';
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
			case 'species.deleteFavorite': return 'Remove from Favorites';
			case 'species.saveFavorite': return 'Save to Favorites';
			case 'species.orderName': return 'Sort by Common Name';
			case 'species.orderScientificName': return 'Sort by Scientific Name';
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
			case 'speciesDetails.saveToFavorite': return 'Save to Favorites';
			case 'speciesDetails.deleteFromFavorite': return 'Delete from Favorites';
			case 'speciesDetails.errorDownload': return 'Download Error';
			case 'speciesDetails.successDownload': return 'Download Success';
			case 'speciesDetails.shareAmazonInfo': return 'Share the beauty of the Amazon! Share this valuable information about.';
			case 'speciesDetails.shareAmazon': return 'Share the beauty of the Amazon!';
			case 'userCredentialFailure.network': return 'Check your internet connection';
			case 'userCredentialFailure.credential': return 'Incorrect credentials';
			case 'userCredentialFailure.disable': return 'This account has been disabled, please try again later';
			case 'userCredentialFailure.notRegistered': return 'Email is not registered';
			case 'userCredentialFailure.password': return 'Incorrect password';
			case 'userCredentialFailure.unknown': return 'Unknown error';
			case 'validator.password.empty': return 'Enter your password';
			case 'validator.password.minLength': return 'Enter at least 6 characters';
			case 'validator.password.regExp': return 'Password must contain at least one number and one letter';
			case 'validator.repeatPassword.empty': return 'Enter your password';
			case 'validator.repeatPassword.minLength': return 'Enter at least 6 characters';
			case 'validator.repeatPassword.regExp': return 'Password must contain at least one number and one letter';
			case 'validator.repeatPassword.matchPassword': return 'Passwords must match';
			case 'validator.email.empty': return 'Enter your email';
			case 'validator.email.regExp': return 'Enter a valid email';
			case 'validator.name.empty': return 'Enter your name';
			case 'validator.name.minLength': return 'Enter at least 3 characters';
			case 'validator.lastName.empty': return 'Enter your last name';
			case 'validator.lastName.minLength': return 'Enter at least 3 characters';
			case 'validator.phone.empty': return 'Enter your phone number';
			case 'validator.phone.minLength': return 'Enter at least 9 characters';
			case 'validator.phone.regExp': return 'Enter a valid phone number';
			default: return null;
		}
	}
}

extension on _TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomBar.home': return 'inicio';
			case 'bottomBar.search': return 'Buscar';
			case 'bottomBar.favorites': return 'favoritos';
			case 'favorites.title': return 'Favoritos';
			case 'favorites.hintText': return 'Busca tu favorito';
			case 'favorites.close': return 'Cerrar';
			case 'favorites.search': return 'Buscar';
			case 'favorites.exceptionText': return 'Aún no hay especies aquí';
			case 'favorites.deleteFavorite': return 'Quitar de favoritos';
			case 'forgotPassword.title': return 'Olvidó su contraseña';
			case 'forgotPassword.sendLabel': return 'Enviar';
			case 'forgotPassword.validatingLabel': return 'Validando...';
			case 'forgotPassword.email': return 'Correo';
			case 'forgotPassword.clear': return 'Limpiar';
			case 'forgotPassword.message': return 'Ingrese su email para enviarle un correo donde podrá cambiar su contraseña:';
			case 'forgotPassword.checkYourEmail': return '¡Revisa tu correo!';
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
			case 'species.deleteFavorite': return 'Quitar de favoritos';
			case 'species.saveFavorite': return 'Guardar en favoritos';
			case 'species.orderName': return 'Ordenar por nombre común';
			case 'species.orderScientificName': return 'Ordenar por nombre científico';
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
			case 'speciesDetails.saveToFavorite': return 'Guardar en Favoritos';
			case 'speciesDetails.deleteFromFavorite': return 'Eliminar de Favoritos';
			case 'speciesDetails.errorDownload': return 'Error al Descargar';
			case 'speciesDetails.successDownload': return 'Descarga Exitosa';
			case 'speciesDetails.shareAmazonInfo': return '¡Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre.';
			case 'speciesDetails.shareAmazon': return '¡Comparte la belleza de la Amazonía!';
			case 'userCredentialFailure.network': return 'Comprueba tu conexión a internet';
			case 'userCredentialFailure.credential': return 'Credenciales incorrectas';
			case 'userCredentialFailure.disable': return 'Esta cuenta ha sido desactivada, inténtelo más tarde';
			case 'userCredentialFailure.notRegistered': return 'El correo no está registrado';
			case 'userCredentialFailure.password': return 'Contraseña incorrecta';
			case 'userCredentialFailure.unknown': return 'Error desconocido';
			case 'validator.password.empty': return 'Ingrese su contraseña';
			case 'validator.password.minLength': return 'Ingrese al menos 6 caracteres';
			case 'validator.password.regExp': return 'La contraseña debe contener al menos un número y una letra';
			case 'validator.repeatPassword.empty': return 'Ingrese su contraseña';
			case 'validator.repeatPassword.minLength': return 'Ingrese al menos 6 caracteres';
			case 'validator.repeatPassword.regExp': return 'La contraseña debe contener al menos un número y una letra';
			case 'validator.repeatPassword.matchPassword': return 'Las contraseñas deben ser iguales';
			case 'validator.email.empty': return 'Ingrese su email';
			case 'validator.email.regExp': return 'Ingrese un email válido';
			case 'validator.name.empty': return 'Ingrese su nombre';
			case 'validator.name.minLength': return 'Ingrese al menos 3 caracteres';
			case 'validator.lastName.empty': return 'Ingrese su apellido';
			case 'validator.lastName.minLength': return 'Ingrese al menos 3 caracteres';
			case 'validator.phone.empty': return 'Ingrese su teléfono';
			case 'validator.phone.minLength': return 'Ingrese al menos 9 caracteres';
			case 'validator.phone.regExp': return 'Ingrese un teléfono válido';
			default: return null;
		}
	}
}

extension on _TranslationsFr {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomBar.home': return 'Accueil';
			case 'bottomBar.search': return 'Rechercher';
			case 'bottomBar.favorites': return 'Favoris';
			case 'favorites.title': return 'Favoris';
			case 'favorites.hintText': return 'Recherchez votre favori';
			case 'favorites.close': return 'Fermer';
			case 'favorites.search': return 'Chercher';
			case 'favorites.exceptionText': return 'Pas encore d\'espèces ici';
			case 'favorites.deleteFavorite': return 'Supprimer des favoris';
			case 'forgotPassword.title': return 'Mot de passe oublié';
			case 'forgotPassword.sendLabel': return 'Envoyer';
			case 'forgotPassword.validatingLabel': return 'Validation en cours...';
			case 'forgotPassword.email': return 'Email';
			case 'forgotPassword.clear': return 'Effacer';
			case 'forgotPassword.message': return 'Entrez votre adresse e-mail pour recevoir un e-mail vous permettant de changer votre mot de passe :';
			case 'forgotPassword.checkYourEmail': return 'Vérifiez votre e-mail !';
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
			case 'species.title': return 'Espécies';
			case 'species.birds': return 'Aves';
			case 'species.mammals': return 'Mamíferos';
			case 'species.reptiles': return 'Répteis';
			case 'species.amphibians': return 'Anfíbios';
			case 'species.fishes': return 'Peixes';
			case 'species.insects': return 'Insetos';
			case 'species.trees': return 'Árvores';
			case 'species.palms': return 'Palmeiras';
			case 'species.deleteFavorite': return 'Remover dos Favoritos';
			case 'species.saveFavorite': return 'Salvar nos Favoritos';
			case 'species.orderName': return 'Ordenar por Nome Comum';
			case 'species.orderScientificName': return 'Ordenar por Nome Científico';
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
			case 'speciesDetails.saveToFavorite': return 'Enregistrer dans les Favoris';
			case 'speciesDetails.deleteFromFavorite': return 'Supprimer des Favoris';
			case 'speciesDetails.errorDownload': return 'Erreur de Téléchargement';
			case 'speciesDetails.successDownload': return 'Téléchargement Réussi';
			case 'speciesDetails.shareAmazonInfo': return 'Partagez la beauté de l\'Amazonie ! Partagez ces précieuses informations sur.';
			case 'speciesDetails.shareAmazon': return 'Partagez la beauté de l\'Amazonie !';
			case 'userCredentialFailure.network': return 'Vérifiez votre connexion internet';
			case 'userCredentialFailure.credential': return 'Identifiants incorrects';
			case 'userCredentialFailure.disable': return 'Ce compte a été désactivé, veuillez réessayer ultérieurement';
			case 'userCredentialFailure.notRegistered': return 'L\'e-mail n\'est pas enregistré';
			case 'userCredentialFailure.password': return 'Mot de passe incorrect';
			case 'userCredentialFailure.unknown': return 'Erreur inconnue';
			case 'validator.password.empty': return 'Entrez votre mot de passe';
			case 'validator.password.minLength': return 'Entrez au moins 6 caractères';
			case 'validator.password.regExp': return 'Le mot de passe doit contenir au moins un chiffre et une lettre';
			case 'validator.repeatPassword.empty': return 'Entrez votre mot de passe';
			case 'validator.repeatPassword.minLength': return 'Entrez au moins 6 caractères';
			case 'validator.repeatPassword.regExp': return 'Le mot de passe doit contenir au moins un chiffre et une lettre';
			case 'validator.repeatPassword.matchPassword': return 'Les mots de passe doivent être identiques';
			case 'validator.email.empty': return 'Entrez votre e-mail';
			case 'validator.email.regExp': return 'Entrez un e-mail valide';
			case 'validator.name.empty': return 'Entrez votre nom';
			case 'validator.name.minLength': return 'Entrez au moins 3 caractères';
			case 'validator.lastName.empty': return 'Entrez votre nom de famille';
			case 'validator.lastName.minLength': return 'Entrez au moins 3 caractères';
			case 'validator.phone.empty': return 'Entrez votre numéro de téléphone';
			case 'validator.phone.minLength': return 'Entrez au moins 9 caractères';
			case 'validator.phone.regExp': return 'Entrez un numéro de téléphone valide';
			default: return null;
		}
	}
}

extension on _TranslationsPt {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomBar.home': return 'Início';
			case 'bottomBar.search': return 'Buscar';
			case 'bottomBar.favorites': return 'Favoritos';
			case 'favorites.title': return 'Favoritos';
			case 'favorites.hintText': return 'Procure o seu favorito';
			case 'favorites.close': return 'Fechar';
			case 'favorites.search': return 'Pesquisar';
			case 'favorites.exceptionText': return 'Ainda não há espécies aqui';
			case 'favorites.deleteFavorite': return 'Remover dos favoritos';
			case 'forgotPassword.title': return 'Esqueceu sua senha';
			case 'forgotPassword.sendLabel': return 'Enviar';
			case 'forgotPassword.validatingLabel': return 'Validando...';
			case 'forgotPassword.email': return 'Email';
			case 'forgotPassword.clear': return 'Limpar';
			case 'forgotPassword.message': return 'Digite seu email para enviar um email onde você pode alterar sua senha:';
			case 'forgotPassword.checkYourEmail': return 'Verifique seu email!';
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
			case 'species.deleteFavorite': return 'Remover dos Favoritos';
			case 'species.saveFavorite': return 'Salvar nos Favoritos';
			case 'species.orderName': return 'Ordenar por Nome Comum';
			case 'species.orderScientificName': return 'Ordenar por Nome Científico';
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
			case 'speciesDetails.saveToFavorite': return 'Salvar nos Favoritos';
			case 'speciesDetails.deleteFromFavorite': return 'Remover dos Favoritos';
			case 'speciesDetails.errorDownload': return 'Erro ao Baixar';
			case 'speciesDetails.successDownload': return 'Download Bem-Sucedido';
			case 'speciesDetails.shareAmazonInfo': return 'Compartilhe a beleza da Amazônia! Compartilhe estas informações valiosas sobre.';
			case 'speciesDetails.shareAmazon': return 'Compartilhe a beleza da Amazônia!';
			case 'userCredentialFailure.network': return 'Verifique sua conexão com a internet';
			case 'userCredentialFailure.credential': return 'Credenciais incorretas';
			case 'userCredentialFailure.disable': return 'Esta conta foi desativada, tente novamente mais tarde';
			case 'userCredentialFailure.notRegistered': return 'O e-mail não está registrado';
			case 'userCredentialFailure.password': return 'Senha incorreta';
			case 'userCredentialFailure.unknown': return 'Erro desconhecido';
			case 'validator.password.empty': return 'Digite sua senha';
			case 'validator.password.minLength': return 'Digite pelo menos 6 caracteres';
			case 'validator.password.regExp': return 'A senha deve conter pelo menos um número e uma letra';
			case 'validator.repeatPassword.empty': return 'Digite sua senha';
			case 'validator.repeatPassword.minLength': return 'Digite pelo menos 6 caracteres';
			case 'validator.repeatPassword.regExp': return 'A senha deve conter pelo menos um número e uma letra';
			case 'validator.repeatPassword.matchPassword': return 'As senhas devem ser iguais';
			case 'validator.email.empty': return 'Digite seu email';
			case 'validator.email.regExp': return 'Digite um email válido';
			case 'validator.name.empty': return 'Digite seu nome';
			case 'validator.name.minLength': return 'Digite pelo menos 3 caracteres';
			case 'validator.lastName.empty': return 'Digite seu sobrenome';
			case 'validator.lastName.minLength': return 'Digite pelo menos 3 caracteres';
			case 'validator.phone.empty': return 'Digite seu telefone';
			case 'validator.phone.minLength': return 'Digite pelo menos 9 caracteres';
			case 'validator.phone.regExp': return 'Digite um telefone válido';
			default: return null;
		}
	}
}

extension on _TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomBar.home': return '首页';
			case 'bottomBar.search': return '搜索';
			case 'bottomBar.favorites': return '收藏夹';
			case 'favorites.title': return '收藏夹';
			case 'favorites.hintText': return '查找您的收藏';
			case 'favorites.close': return '关闭';
			case 'favorites.search': return '搜索';
			case 'favorites.exceptionText': return '这里还没有物种';
			case 'favorites.deleteFavorite': return '从收藏夹中删除';
			case 'forgotPassword.title': return '忘记密码';
			case 'forgotPassword.sendLabel': return '发送';
			case 'forgotPassword.validatingLabel': return '正在验证...';
			case 'forgotPassword.email': return '邮箱';
			case 'forgotPassword.clear': return '清除';
			case 'forgotPassword.message': return '请输入您的电子邮件以发送一封邮件，您可以在其中更改您的密码：';
			case 'forgotPassword.checkYourEmail': return '请检查您的邮箱！';
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
			case 'species.deleteFavorite': return '从收藏中移除';
			case 'species.saveFavorite': return '保存到收藏夹';
			case 'species.orderName': return '按普通名称排序';
			case 'species.orderScientificName': return '按学名排序';
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
			case 'speciesDetails.saveToFavorite': return '保存到收藏夹';
			case 'speciesDetails.deleteFromFavorite': return '从收藏夹中删除';
			case 'speciesDetails.errorDownload': return '下载错误';
			case 'speciesDetails.successDownload': return '下载成功';
			case 'speciesDetails.shareAmazonInfo': return '分享亚马逊的美丽！分享有关的宝贵信息.';
			case 'speciesDetails.shareAmazon': return '分享亚马逊的美丽！';
			case 'userCredentialFailure.network': return '检查您的网络连接';
			case 'userCredentialFailure.credential': return '凭证不正确';
			case 'userCredentialFailure.disable': return '此帐户已被禁用，请稍后再试';
			case 'userCredentialFailure.notRegistered': return '电子邮件未注册';
			case 'userCredentialFailure.password': return '密码不正确';
			case 'userCredentialFailure.unknown': return '未知错误';
			case 'validator.password.empty': return '请输入您的密码';
			case 'validator.password.minLength': return '至少输入6个字符';
			case 'validator.password.regExp': return '密码必须包含至少一个数字和一个字母';
			case 'validator.repeatPassword.empty': return '请输入您的密码';
			case 'validator.repeatPassword.minLength': return '至少输入6个字符';
			case 'validator.repeatPassword.regExp': return '密码必须包含至少一个数字和一个字母';
			case 'validator.repeatPassword.matchPassword': return '密码必须相同';
			case 'validator.email.empty': return '请输入您的邮箱';
			case 'validator.email.regExp': return '请输入有效的邮箱';
			case 'validator.name.empty': return '请输入您的姓名';
			case 'validator.name.minLength': return '至少输入3个字符';
			case 'validator.lastName.empty': return '请输入您的姓氏';
			case 'validator.lastName.minLength': return '至少输入3个字符';
			case 'validator.phone.empty': return '请输入您的电话号码';
			case 'validator.phone.minLength': return '至少输入9个字符';
			case 'validator.phone.regExp': return '请输入有效的电话号码';
			default: return null;
		}
	}
}
