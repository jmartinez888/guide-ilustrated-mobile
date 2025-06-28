///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'translations.g.dart';

// Path: <root>
class TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEs({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	late final TranslationsEs _root = this; // ignore: unused_field

	@override 
	TranslationsEs $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEs(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAboutProjectEs aboutProject = _TranslationsAboutProjectEs._(_root);
	@override late final _TranslationsAuthorsEs authors = _TranslationsAuthorsEs._(_root);
	@override late final _TranslationsBottomBarEs bottomBar = _TranslationsBottomBarEs._(_root);
	@override late final _TranslationsCommunityEs community = _TranslationsCommunityEs._(_root);
	@override late final _TranslationsDeleteAccountEs deleteAccount = _TranslationsDeleteAccountEs._(_root);
	@override late final _TranslationsDrawerEs drawer = _TranslationsDrawerEs._(_root);
	@override late final _TranslationsEditProfileEs editProfile = _TranslationsEditProfileEs._(_root);
	@override late final _TranslationsErrorPageEs errorPage = _TranslationsErrorPageEs._(_root);
	@override late final _TranslationsFavoriteRepositoryEs favoriteRepository = _TranslationsFavoriteRepositoryEs._(_root);
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
	@override late final _TranslationsStaffEs staff = _TranslationsStaffEs._(_root);
	@override late final _TranslationsUserCredentialFailureEs userCredentialFailure = _TranslationsUserCredentialFailureEs._(_root);
	@override late final _TranslationsValidatorEs validator = _TranslationsValidatorEs._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectEs implements TranslationsAboutProjectEn {
	_TranslationsAboutProjectEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsAuthorsEs implements TranslationsAuthorsEn {
	_TranslationsAuthorsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Autores';
	@override String get withoutAuthors => 'Parece que no hay autores aquí';
	@override String get professionNotAvailable => 'Profesión no disponible';
}

// Path: bottomBar
class _TranslationsBottomBarEs implements TranslationsBottomBarEn {
	_TranslationsBottomBarEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get home => 'Inicio';
	@override String get search => 'Buscar';
	@override String get favorites => 'Favoritos';
}

// Path: community
class _TranslationsCommunityEs implements TranslationsCommunityEn {
	_TranslationsCommunityEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comunidades indígenas';
	@override String get withoutCommunities => 'Parece que no hay comunidades indígenas aquí';
}

// Path: deleteAccount
class _TranslationsDeleteAccountEs implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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

// Path: drawer
class _TranslationsDrawerEs implements TranslationsDrawerEn {
	_TranslationsDrawerEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get account => 'Cuenta';
	@override String get profile => 'Perfil';
	@override String get content => 'Contenido';
	@override String get species => 'Especies';
	@override String get communities => 'Comunidades indígenas';
	@override String get authors => 'Autores';
	@override String get about => 'Acerca de';
	@override String get staff => 'Staff';
	@override String get aboutGuide => 'Sobre la guía';
	@override String get menu => 'Menú';
}

// Path: editProfile
class _TranslationsEditProfileEs implements TranslationsEditProfileEn {
	_TranslationsEditProfileEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsErrorPageEs implements TranslationsErrorPageEn {
	_TranslationsErrorPageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get page_not_exist => 'Esta página ya no existe';
	@override String get go_back => 'Volver a especies';
}

// Path: favoriteRepository
class _TranslationsFavoriteRepositoryEs implements TranslationsFavoriteRepositoryEn {
	_TranslationsFavoriteRepositoryEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get getSpeciesNetworkError => 'Error de conexión al obtener tus especies favoritas';
	@override String get getSpeciesUnknownError => 'Error desconocido al obtener tus especies favoritas';
	@override String get getSpeciesEmptyError => 'Algunas de tus especies favoritas no se encontraron';
	@override String get updateSpeciesNetworkError => 'Error de conexión al actualizar tus especies favoritas';
	@override String get updateSpeciesUnknownError => 'Error desconocido al actualizar tus especies favoritas';
}

// Path: favorites
class _TranslationsFavoritesEs implements TranslationsFavoritesEn {
	_TranslationsFavoritesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsFilterOptionsEs implements TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsForgotPasswordEs implements TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsGeneralEs implements TranslationsGeneralEn {
	_TranslationsGeneralEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Amazonía';
	@override String get subtitle => 'Guía Ilustrada de Flora y Fauna';
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
	@override String get somethingWentWrong => 'Algo salió mal, inténtalo de nuevo';
	@override String get refresh => 'Actualizar';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPageEs implements TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
	@override String get year => 'Año';
}

// Path: profile
class _TranslationsProfileEs implements TranslationsProfileEn {
	_TranslationsProfileEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsSearchPageEs implements TranslationsSearchPageEn {
	_TranslationsSearchPageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsSignInEs implements TranslationsSignInEn {
	_TranslationsSignInEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsSignUpEs implements TranslationsSignUpEn {
	_TranslationsSignUpEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsSpeciesEs implements TranslationsSpeciesEn {
	_TranslationsSpeciesEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsSpeciesDetailsEs implements TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get authors => 'Autores';
	@override String get taxonomicInfo => 'Información taxonómica';
	@override String get kingdom => 'Reino';
	@override String get phylum => 'Filo';
	@override String get classes => 'Clase';
	@override String get order => 'Orden';
	@override String get family => 'Familia';
	@override String get download => 'Descargar';
	@override String get generatePdf => 'Generar PDF';
	@override String get downloadImage => 'Descargar imagen';
	@override String get downloadAudio => 'Descargar audio';
	@override String get share => 'Compartir';
	@override String get errorDownload => 'Error al descargar';
	@override String get successDownload => '¡Descarga exitosa!';
	@override String get shareAmazonInfo => '¡Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre.';
	@override String get shareAmazon => '¡Comparte la belleza de la Amazonía!';
	@override String get conservationStatus => 'Estados de conservación';
	@override String get extinct => 'Extinto';
	@override String get extinctDescription => 'La especie ya no existe en la naturaleza';
	@override String get extinctWild => 'Extinto en estado silvestre';
	@override String get extinctWildDescription => 'La especie solo existe en cautiverio';
	@override String get criticallyEndangered => 'En peligro crítico';
	@override String get criticallyEndangeredDescription => 'La especie tiene un riesgo extremadamente alto de extinción en la naturaleza';
	@override String get endangered => 'En peligro';
	@override String get endangeredDescription => 'La especie tiene un riesgo muy alto de extinción en la naturaleza';
	@override String get vulnerable => 'Vulnerable';
	@override String get vulnerableDescription => 'La especie tiene un riesgo alto de extinción en la naturaleza';
	@override String get almostThreatened => 'Casi amenazado';
	@override String get almostThreatenedDescription => 'La especie no está en peligro de extinción, pero podría estarlo en el futuro';
	@override String get minorConcern => 'Preocupación menor';
	@override String get minorConcernDescription => 'La especie no está en peligro de extinción';
	@override String get insufficientData => 'Datos insuficientes';
	@override String get insufficientDataDescription => 'No hay suficiente información para evaluar el riesgo de extinción de la especie';
	@override String get notRated => 'No evaluado';
	@override String get notRatedDescription => 'La especie no ha sido evaluada por la UICN';
	@override String get appendix1 => 'Apéndice I';
	@override String get appendix1Description => 'Todas las especies en peligro de extinción. El comercio de especímenes de esas especies se autoriza solamente bajo circunstancias excepcionales';
	@override String get appendix2 => 'Apéndice II';
	@override String get appendix2Description => 'Especies que no se encuentran necesariamente en peligro de extinción, pero cuyo comercio debe controlarse a fin de evitar una utilización incompatible con su supervivencia';
	@override String get appendix3 => 'Apéndice III';
	@override String get appendix3Description => 'Especies que están protegidas al menos en un país, el cual ha solicitado la asistencia de otras Partes en la CITES para controlar su comercio';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPageEs implements TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPageEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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

// Path: staff
class _TranslationsStaffEs implements TranslationsStaffEn {
	_TranslationsStaffEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Team';
	@override String get coordinationTeam => 'Coordination team';
	@override String get editorialCoordination => 'Editorial coordination';
	@override String get reviewCommittee => 'Review committee';
	@override String get textReview => 'Text review:';
	@override String get birdReview => 'Bird review:';
	@override String get fishReview => 'Fish review:';
	@override String get insectReview => 'Insect review:';
	@override String get plantReview => 'Plant review:';
	@override String get mapMaking => 'Map making:';
	@override String get illustrations => 'Illustrations:';
	@override String get sounds => 'Sounds';
	@override String get birds => 'Birds';
	@override String get monkeys => 'Monkeys';
	@override String get amphibians => 'Amphibians';
	@override String get developmentTeam => 'Development team';
	@override String get technicalLeader => 'Technical leader';
	@override String get mobileDeveloper => 'Mobile developer';
	@override String get developmentFrontend => 'Frontend developer';
	@override String get developmentBackend => 'Backend developer';
	@override String get briefcase => 'Portfolio';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailureEs implements TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailureEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get network => 'Comprueba tu conexión a internet';
	@override String get credential => 'Credenciales incorrectas';
	@override String get disable => 'Esta cuenta ha sido desactivada, inténtelo más tarde';
	@override String get notRegistered => 'El correo no está registrado';
	@override String get password => 'Contraseña incorrecta';
	@override String get unknown => 'Error desconocido';
}

// Path: validator
class _TranslationsValidatorEs implements TranslationsValidatorEn {
	_TranslationsValidatorEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsFilterOptionsFilterByNameEs implements TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNameEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrar por nombre';
	@override String get common => 'Nombre común';
	@override String get scientific => 'Nombre científico';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundEs implements TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrar por sonido';
	@override String get withSound => 'Con sonido';
	@override String get withoutSound => 'Sin sonido';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterEs implements TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get common => 'Común';
	@override String get scientific => 'Científico';
	@override String get order => 'Ordenar por';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterEs implements TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get withSound => 'Con sonido';
	@override String get withoutSound => 'Sin sonido';
	@override String get sound => 'Sonido';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterEs implements TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

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
class _TranslationsValidatorPasswordEs implements TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Contraseña';
	@override String get empty => 'Ingrese su contraseña';
	@override String get minLength => 'Ingrese al menos 6 caracteres';
	@override String get regExp => 'La contraseña debe contener al menos un número y una letra';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordEs implements TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Ingrese su contraseña';
	@override String get minLength => 'Ingrese al menos 6 caracteres';
	@override String get regExp => 'La contraseña debe contener al menos un número y una letra';
	@override String get matchPassword => 'Las contraseñas deben coincidir';
}

// Path: validator.email
class _TranslationsValidatorEmailEs implements TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Correo electrónico';
	@override String get empty => 'Ingrese su correo electrónico';
	@override String get regExp => 'Ingrese un correo electrónico válido';
}

// Path: validator.name
class _TranslationsValidatorNameEs implements TranslationsValidatorNameEn {
	_TranslationsValidatorNameEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nombre';
	@override String get empty => 'Ingrese su nombre';
	@override String get minLength => 'Ingrese al menos 3 caracteres';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameEs implements TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Apellido';
	@override String get empty => 'Ingrese su apellido';
	@override String get minLength => 'Ingrese al menos 3 caracteres';
}

// Path: validator.phone
class _TranslationsValidatorPhoneEs implements TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Número de teléfono';
	@override String get empty => 'Ingrese su número de teléfono';
	@override String get minLength => 'Ingrese al menos 9 caracteres';
	@override String get regExp => 'Ingrese un número de teléfono válido';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodeEs implements TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodeEs._(this._root);

	final TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get label => 'Código de país';
	@override String get select => 'Seleccione el código de país';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEs {
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
			case 'drawer.account': return 'Cuenta';
			case 'drawer.profile': return 'Perfil';
			case 'drawer.content': return 'Contenido';
			case 'drawer.species': return 'Especies';
			case 'drawer.communities': return 'Comunidades indígenas';
			case 'drawer.authors': return 'Autores';
			case 'drawer.about': return 'Acerca de';
			case 'drawer.staff': return 'Staff';
			case 'drawer.aboutGuide': return 'Sobre la guía';
			case 'drawer.menu': return 'Menú';
			case 'editProfile.errorSnack': return 'Error al cargar los datos del usuario';
			case 'editProfile.title': return 'Editar perfil';
			case 'editProfile.save': return 'Guardar';
			case 'editProfile.saving': return 'Guardando...';
			case 'editProfile.errorSaving': return 'Error al guardar los datos del perfil';
			case 'editProfile.selectImage': return 'Seleccione una imagen de perfil';
			case 'editProfile.errorSave': return 'Error al guardar el perfil';
			case 'errorPage.page_not_exist': return 'Esta página ya no existe';
			case 'errorPage.go_back': return 'Volver a especies';
			case 'favoriteRepository.getSpeciesNetworkError': return 'Error de conexión al obtener tus especies favoritas';
			case 'favoriteRepository.getSpeciesUnknownError': return 'Error desconocido al obtener tus especies favoritas';
			case 'favoriteRepository.getSpeciesEmptyError': return 'Algunas de tus especies favoritas no se encontraron';
			case 'favoriteRepository.updateSpeciesNetworkError': return 'Error de conexión al actualizar tus especies favoritas';
			case 'favoriteRepository.updateSpeciesUnknownError': return 'Error desconocido al actualizar tus especies favoritas';
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
			case 'general.title': return 'Amazonía';
			case 'general.subtitle': return 'Guía Ilustrada de Flora y Fauna';
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
			case 'general.somethingWentWrong': return 'Algo salió mal, inténtalo de nuevo';
			case 'general.refresh': return 'Actualizar';
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
			case 'pdfPreviewPage.year': return 'Año';
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
			case 'speciesDetails.taxonomicInfo': return 'Información taxonómica';
			case 'speciesDetails.kingdom': return 'Reino';
			case 'speciesDetails.phylum': return 'Filo';
			case 'speciesDetails.classes': return 'Clase';
			case 'speciesDetails.order': return 'Orden';
			case 'speciesDetails.family': return 'Familia';
			case 'speciesDetails.download': return 'Descargar';
			case 'speciesDetails.generatePdf': return 'Generar PDF';
			case 'speciesDetails.downloadImage': return 'Descargar imagen';
			case 'speciesDetails.downloadAudio': return 'Descargar audio';
			case 'speciesDetails.share': return 'Compartir';
			case 'speciesDetails.errorDownload': return 'Error al descargar';
			case 'speciesDetails.successDownload': return '¡Descarga exitosa!';
			case 'speciesDetails.shareAmazonInfo': return '¡Comparte la belleza de la Amazonía! Comparte esta valiosa información sobre.';
			case 'speciesDetails.shareAmazon': return '¡Comparte la belleza de la Amazonía!';
			case 'speciesDetails.conservationStatus': return 'Estados de conservación';
			case 'speciesDetails.extinct': return 'Extinto';
			case 'speciesDetails.extinctDescription': return 'La especie ya no existe en la naturaleza';
			case 'speciesDetails.extinctWild': return 'Extinto en estado silvestre';
			case 'speciesDetails.extinctWildDescription': return 'La especie solo existe en cautiverio';
			case 'speciesDetails.criticallyEndangered': return 'En peligro crítico';
			case 'speciesDetails.criticallyEndangeredDescription': return 'La especie tiene un riesgo extremadamente alto de extinción en la naturaleza';
			case 'speciesDetails.endangered': return 'En peligro';
			case 'speciesDetails.endangeredDescription': return 'La especie tiene un riesgo muy alto de extinción en la naturaleza';
			case 'speciesDetails.vulnerable': return 'Vulnerable';
			case 'speciesDetails.vulnerableDescription': return 'La especie tiene un riesgo alto de extinción en la naturaleza';
			case 'speciesDetails.almostThreatened': return 'Casi amenazado';
			case 'speciesDetails.almostThreatenedDescription': return 'La especie no está en peligro de extinción, pero podría estarlo en el futuro';
			case 'speciesDetails.minorConcern': return 'Preocupación menor';
			case 'speciesDetails.minorConcernDescription': return 'La especie no está en peligro de extinción';
			case 'speciesDetails.insufficientData': return 'Datos insuficientes';
			case 'speciesDetails.insufficientDataDescription': return 'No hay suficiente información para evaluar el riesgo de extinción de la especie';
			case 'speciesDetails.notRated': return 'No evaluado';
			case 'speciesDetails.notRatedDescription': return 'La especie no ha sido evaluada por la UICN';
			case 'speciesDetails.appendix1': return 'Apéndice I';
			case 'speciesDetails.appendix1Description': return 'Todas las especies en peligro de extinción. El comercio de especímenes de esas especies se autoriza solamente bajo circunstancias excepcionales';
			case 'speciesDetails.appendix2': return 'Apéndice II';
			case 'speciesDetails.appendix2Description': return 'Especies que no se encuentran necesariamente en peligro de extinción, pero cuyo comercio debe controlarse a fin de evitar una utilización incompatible con su supervivencia';
			case 'speciesDetails.appendix3': return 'Apéndice III';
			case 'speciesDetails.appendix3Description': return 'Especies que están protegidas al menos en un país, el cual ha solicitado la asistencia de otras Partes en la CITES para controlar su comercio';
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
			case 'staff.title': return 'Team';
			case 'staff.coordinationTeam': return 'Coordination team';
			case 'staff.editorialCoordination': return 'Editorial coordination';
			case 'staff.reviewCommittee': return 'Review committee';
			case 'staff.textReview': return 'Text review:';
			case 'staff.birdReview': return 'Bird review:';
			case 'staff.fishReview': return 'Fish review:';
			case 'staff.insectReview': return 'Insect review:';
			case 'staff.plantReview': return 'Plant review:';
			case 'staff.mapMaking': return 'Map making:';
			case 'staff.illustrations': return 'Illustrations:';
			case 'staff.sounds': return 'Sounds';
			case 'staff.birds': return 'Birds';
			case 'staff.monkeys': return 'Monkeys';
			case 'staff.amphibians': return 'Amphibians';
			case 'staff.developmentTeam': return 'Development team';
			case 'staff.technicalLeader': return 'Technical leader';
			case 'staff.mobileDeveloper': return 'Mobile developer';
			case 'staff.developmentFrontend': return 'Frontend developer';
			case 'staff.developmentBackend': return 'Backend developer';
			case 'staff.briefcase': return 'Portfolio';
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

