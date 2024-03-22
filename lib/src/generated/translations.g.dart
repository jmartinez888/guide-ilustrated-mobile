/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 5
/// Strings: 260 (52 per locale)
///
/// Built on 2024-03-22 at 16:12 UTC

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
	late final _TranslationsSignInEn signIn = _TranslationsSignInEn._(_root);
	late final _TranslationsSpeciesEn species = _TranslationsSpeciesEn._(_root);
	late final _TranslationsSpeciesDetailsEn speciesDetails = _TranslationsSpeciesDetailsEn._(_root);
	late final _TranslationsUserCredentialFailureEn userCredentialFailure = _TranslationsUserCredentialFailureEn._(_root);
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
	@override late final _TranslationsSignInEs signIn = _TranslationsSignInEs._(_root);
	@override late final _TranslationsSpeciesEs species = _TranslationsSpeciesEs._(_root);
	@override late final _TranslationsSpeciesDetailsEs speciesDetails = _TranslationsSpeciesDetailsEs._(_root);
	@override late final _TranslationsUserCredentialFailureEs userCredentialFailure = _TranslationsUserCredentialFailureEs._(_root);
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
	@override late final _TranslationsSignInFr signIn = _TranslationsSignInFr._(_root);
	@override late final _TranslationsSpeciesFr species = _TranslationsSpeciesFr._(_root);
	@override late final _TranslationsSpeciesDetailsFr speciesDetails = _TranslationsSpeciesDetailsFr._(_root);
	@override late final _TranslationsUserCredentialFailureFr userCredentialFailure = _TranslationsUserCredentialFailureFr._(_root);
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
	@override late final _TranslationsSignInPt signIn = _TranslationsSignInPt._(_root);
	@override late final _TranslationsSpeciesPt species = _TranslationsSpeciesPt._(_root);
	@override late final _TranslationsSpeciesDetailsPt speciesDetails = _TranslationsSpeciesDetailsPt._(_root);
	@override late final _TranslationsUserCredentialFailurePt userCredentialFailure = _TranslationsUserCredentialFailurePt._(_root);
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
	@override late final _TranslationsSignInZh signIn = _TranslationsSignInZh._(_root);
	@override late final _TranslationsSpeciesZh species = _TranslationsSpeciesZh._(_root);
	@override late final _TranslationsSpeciesDetailsZh speciesDetails = _TranslationsSpeciesDetailsZh._(_root);
	@override late final _TranslationsUserCredentialFailureZh userCredentialFailure = _TranslationsUserCredentialFailureZh._(_root);
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'bottomBar.home': return 'Home';
			case 'bottomBar.search': return 'Search';
			case 'bottomBar.favorites': return 'Favorites';
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
			default: return null;
		}
	}
}
