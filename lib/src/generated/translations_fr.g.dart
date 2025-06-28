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
class TranslationsFr implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsFr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	late final TranslationsFr _root = this; // ignore: unused_field

	@override 
	TranslationsFr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsFr(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAboutProjectFr aboutProject = _TranslationsAboutProjectFr._(_root);
	@override late final _TranslationsAuthorsFr authors = _TranslationsAuthorsFr._(_root);
	@override late final _TranslationsBottomBarFr bottomBar = _TranslationsBottomBarFr._(_root);
	@override late final _TranslationsCommunityFr community = _TranslationsCommunityFr._(_root);
	@override late final _TranslationsDeleteAccountFr deleteAccount = _TranslationsDeleteAccountFr._(_root);
	@override late final _TranslationsDrawerFr drawer = _TranslationsDrawerFr._(_root);
	@override late final _TranslationsEditProfileFr editProfile = _TranslationsEditProfileFr._(_root);
	@override late final _TranslationsErrorPageFr errorPage = _TranslationsErrorPageFr._(_root);
	@override late final _TranslationsFavoriteRepositoryFr favoriteRepository = _TranslationsFavoriteRepositoryFr._(_root);
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
	@override late final _TranslationsStaffFr staff = _TranslationsStaffFr._(_root);
	@override late final _TranslationsUserCredentialFailureFr userCredentialFailure = _TranslationsUserCredentialFailureFr._(_root);
	@override late final _TranslationsValidatorFr validator = _TranslationsValidatorFr._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectFr implements TranslationsAboutProjectEn {
	_TranslationsAboutProjectFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsAuthorsFr implements TranslationsAuthorsEn {
	_TranslationsAuthorsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Auteurs';
	@override String get withoutAuthors => 'Il semble qu\'il n\'y ait pas d\'auteurs ici';
	@override String get professionNotAvailable => 'Profession non disponible';
}

// Path: bottomBar
class _TranslationsBottomBarFr implements TranslationsBottomBarEn {
	_TranslationsBottomBarFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get home => 'Accueil';
	@override String get search => 'Rechercher';
	@override String get favorites => 'Favoris';
}

// Path: community
class _TranslationsCommunityFr implements TranslationsCommunityEn {
	_TranslationsCommunityFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Communautés autochtones';
	@override String get withoutCommunities => 'Il semble qu\'il n\'y ait pas de communautés autochtones ici';
}

// Path: deleteAccount
class _TranslationsDeleteAccountFr implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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

// Path: drawer
class _TranslationsDrawerFr implements TranslationsDrawerEn {
	_TranslationsDrawerFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get account => 'Compte';
	@override String get profile => 'Profil';
	@override String get content => 'Contenu';
	@override String get species => 'Espèces';
	@override String get communities => 'Communautés autochtones';
	@override String get authors => 'Auteurs';
	@override String get about => 'À propos';
	@override String get staff => 'Équipe';
	@override String get aboutGuide => 'À propos du guide';
	@override String get menu => 'Menu';
}

// Path: editProfile
class _TranslationsEditProfileFr implements TranslationsEditProfileEn {
	_TranslationsEditProfileFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsErrorPageFr implements TranslationsErrorPageEn {
	_TranslationsErrorPageFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get page_not_exist => 'Cette page n\'existe plus';
	@override String get go_back => 'Retour aux espèces';
}

// Path: favoriteRepository
class _TranslationsFavoriteRepositoryFr implements TranslationsFavoriteRepositoryEn {
	_TranslationsFavoriteRepositoryFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get getSpeciesNetworkError => 'Erreur de réseau lors de la récupération de vos espèces favorites';
	@override String get getSpeciesUnknownError => 'Erreur inconnue lors de la récupération de vos espèces favorites';
	@override String get getSpeciesEmptyError => 'Certaines de vos espèces favorites n\'ont pas été trouvées';
	@override String get updateSpeciesNetworkError => 'Erreur de réseau lors de la mise à jour de vos espèces favorites';
	@override String get updateSpeciesUnknownError => 'Erreur inconnue lors de la mise à jour de vos espèces favorites';
}

// Path: favorites
class _TranslationsFavoritesFr implements TranslationsFavoritesEn {
	_TranslationsFavoritesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsFilterOptionsFr implements TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsForgotPasswordFr implements TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsGeneralFr implements TranslationsGeneralEn {
	_TranslationsGeneralFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Amazonie';
	@override String get subtitle => 'Guide Illustré de la Flore et de la Faune';
	@override String get back => 'Retour';
	@override String get close => 'Fermer';
	@override String get clear => 'Effacer';
	@override String get search => 'Rechercher';
	@override String get addToFavorites => 'Ajouter aux favoris';
	@override String get removeFromFavorites => 'Retirer des favoris';
	@override String get error404Again => 'Quelque chose a mal tourné, veuillez réessayer';
	@override String get nameNotAvailable => 'Nom non disponible';
	@override String get lastnameNotAvailable => 'Nom de famille non disponible';
	@override String get descriptionNotAvailable => 'Description non disponible';
	@override String get somethingWentWrong => 'Quelque chose a mal tourné, veuillez réessayer';
	@override String get refresh => 'Actualiser';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPageFr implements TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPageFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
	@override String get year => 'Année';
}

// Path: profile
class _TranslationsProfileFr implements TranslationsProfileEn {
	_TranslationsProfileFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsSearchPageFr implements TranslationsSearchPageEn {
	_TranslationsSearchPageFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsSignInFr implements TranslationsSignInEn {
	_TranslationsSignInFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsSignUpFr implements TranslationsSignUpEn {
	_TranslationsSignUpFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsSpeciesFr implements TranslationsSpeciesEn {
	_TranslationsSpeciesFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsSpeciesDetailsFr implements TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get authors => 'Auteurs';
	@override String get taxonomicInfo => 'Informations Taxonomiques';
	@override String get kingdom => 'Règne';
	@override String get phylum => 'Phylum';
	@override String get classes => 'Classe';
	@override String get order => 'Ordre';
	@override String get family => 'Famille';
	@override String get download => 'Télécharger';
	@override String get generatePdf => 'Générer un PDF';
	@override String get downloadImage => 'Télécharger l\'image';
	@override String get downloadAudio => 'Télécharger l\'audio';
	@override String get share => 'Partager';
	@override String get errorDownload => 'Erreur de Téléchargement';
	@override String get successDownload => 'Téléchargement réussi !';
	@override String get shareAmazonInfo => 'Partagez la beauté de l\'Amazonie ! Partagez ces précieuses informations sur.';
	@override String get shareAmazon => 'Partagez la beauté de l\'Amazonie !';
	@override String get conservationStatus => 'Statut de Conservation';
	@override String get extinct => 'Éteint';
	@override String get extinctDescription => 'L\'espèce n\'existe plus à l\'état sauvage';
	@override String get extinctWild => 'Éteint dans la Nature';
	@override String get extinctWildDescription => 'L\'espèce n\'existe plus qu\'en captivité';
	@override String get criticallyEndangered => 'En Danger Critique';
	@override String get criticallyEndangeredDescription => 'L\'espèce présente un risque extrêmement élevé d\'extinction dans la nature';
	@override String get endangered => 'En Danger';
	@override String get endangeredDescription => 'L\'espèce présente un risque très élevé d\'extinction dans la nature';
	@override String get vulnerable => 'Vulnérable';
	@override String get vulnerableDescription => 'L\'espèce présente un risque élevé d\'extinction dans la nature';
	@override String get almostThreatened => 'Quasi Menacé';
	@override String get almostThreatenedDescription => 'L\'espèce n\'est pas en danger, mais pourrait l\'être à l\'avenir';
	@override String get minorConcern => 'Préoccupation Mineure';
	@override String get minorConcernDescription => 'L\'espèce n\'est pas en danger d\'extinction';
	@override String get insufficientData => 'Données Insuffisantes';
	@override String get insufficientDataDescription => 'Il n\'y a pas suffisamment d\'informations pour évaluer le risque d\'extinction de l\'espèce';
	@override String get notRated => 'Non Évalué';
	@override String get notRatedDescription => 'L\'espèce n\'a pas été évaluée par l\'UICN';
	@override String get appendix1 => 'Annexe I';
	@override String get appendix1Description => 'Toutes les espèces menacées d\'extinction. Le commerce des spécimens de ces espèces n\'est autorisé que dans des circonstances exceptionnelles';
	@override String get appendix2 => 'Annexe II';
	@override String get appendix2Description => 'Espèces non nécessairement menacées d\'extinction, mais dont le commerce doit être contrôlé afin d\'éviter une utilisation incompatible avec leur survie';
	@override String get appendix3 => 'Annexe III';
	@override String get appendix3Description => 'Espèces protégées dans au moins un pays, qui ont demandé l\'assistance d\'autres Parties de la CITES pour contrôler le commerce de l\'espèce';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPageFr implements TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPageFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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

// Path: staff
class _TranslationsStaffFr implements TranslationsStaffEn {
	_TranslationsStaffFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Équipe de travail';
	@override String get coordinationTeam => 'Équipe de coordination';
	@override String get editorialCoordination => 'Coordination éditoriale';
	@override String get reviewCommittee => 'Comité de révision';
	@override String get textReview => 'Révision de textes :';
	@override String get birdReview => 'Révision des oiseaux :';
	@override String get fishReview => 'Révision des poissons :';
	@override String get insectReview => 'Révision des insectes :';
	@override String get plantReview => 'Révision des plantes :';
	@override String get mapMaking => 'Élaboration des cartes :';
	@override String get illustrations => 'Illustrations :';
	@override String get sounds => 'Sons';
	@override String get birds => 'Oiseaux';
	@override String get monkeys => 'Singes';
	@override String get amphibians => 'Amphibiens';
	@override String get developmentTeam => 'Équipe de développement';
	@override String get technicalLeader => 'Responsable technique';
	@override String get mobileDeveloper => 'Développeur mobile';
	@override String get developmentFrontend => 'Développeur frontend';
	@override String get developmentBackend => 'Développeur backend';
	@override String get briefcase => 'Portefeuille';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailureFr implements TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailureFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get network => 'Vérifiez votre connexion internet';
	@override String get credential => 'Identifiants incorrects';
	@override String get disable => 'Ce compte a été désactivé, veuillez réessayer ultérieurement';
	@override String get notRegistered => 'L\'e-mail n\'est pas enregistré';
	@override String get password => 'Mot de passe incorrect';
	@override String get unknown => 'Erreur inconnue';
}

// Path: validator
class _TranslationsValidatorFr implements TranslationsValidatorEn {
	_TranslationsValidatorFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsFilterOptionsFilterByNameFr implements TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNameFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrer par nom';
	@override String get common => 'Nom commun';
	@override String get scientific => 'Nom scientifique';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundFr implements TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrer par son';
	@override String get withSound => 'Avec son';
	@override String get withoutSound => 'Sans son';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterFr implements TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get common => 'Commun';
	@override String get scientific => 'Scientifique';
	@override String get order => 'Trier par';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterFr implements TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get withSound => 'Avec son';
	@override String get withoutSound => 'Sans son';
	@override String get sound => 'Son';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterFr implements TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

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
class _TranslationsValidatorPasswordFr implements TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Mot de passe';
	@override String get empty => 'Entrez votre mot de passe';
	@override String get minLength => 'Entrez au moins 6 caractères';
	@override String get regExp => 'Le mot de passe doit contenir au moins un chiffre et une lettre';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordFr implements TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Entrez votre mot de passe';
	@override String get minLength => 'Entrez au moins 6 caractères';
	@override String get regExp => 'Le mot de passe doit contenir au moins un chiffre et une lettre';
	@override String get matchPassword => 'Les mots de passe doivent correspondre';
}

// Path: validator.email
class _TranslationsValidatorEmailFr implements TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Email';
	@override String get empty => 'Entrez votre email';
	@override String get regExp => 'Entrez un email valide';
}

// Path: validator.name
class _TranslationsValidatorNameFr implements TranslationsValidatorNameEn {
	_TranslationsValidatorNameFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nom';
	@override String get empty => 'Entrez votre nom';
	@override String get minLength => 'Entrez au moins 3 caractères';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameFr implements TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nom de famille';
	@override String get empty => 'Entrez votre nom de famille';
	@override String get minLength => 'Entrez au moins 3 caractères';
}

// Path: validator.phone
class _TranslationsValidatorPhoneFr implements TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Numéro de téléphone';
	@override String get empty => 'Entrez votre numéro de téléphone';
	@override String get minLength => 'Entrez au moins 9 caractères';
	@override String get regExp => 'Entrez un numéro de téléphone valide';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodeFr implements TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodeFr._(this._root);

	final TranslationsFr _root; // ignore: unused_field

	// Translations
	@override String get label => 'Code pays';
	@override String get select => 'Sélectionnez le code pays';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsFr {
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
			case 'drawer.account': return 'Compte';
			case 'drawer.profile': return 'Profil';
			case 'drawer.content': return 'Contenu';
			case 'drawer.species': return 'Espèces';
			case 'drawer.communities': return 'Communautés autochtones';
			case 'drawer.authors': return 'Auteurs';
			case 'drawer.about': return 'À propos';
			case 'drawer.staff': return 'Équipe';
			case 'drawer.aboutGuide': return 'À propos du guide';
			case 'drawer.menu': return 'Menu';
			case 'editProfile.errorSnack': return 'Erreur lors du chargement des données utilisateur';
			case 'editProfile.title': return 'Modifier le profil';
			case 'editProfile.save': return 'Enregistrer';
			case 'editProfile.saving': return 'Enregistrement...';
			case 'editProfile.errorSaving': return 'Erreur lors de l\'enregistrement des données du profil';
			case 'editProfile.selectImage': return 'Sélectionnez une photo de profil';
			case 'editProfile.errorSave': return 'Erreur lors de l\'enregistrement du profil';
			case 'errorPage.page_not_exist': return 'Cette page n\'existe plus';
			case 'errorPage.go_back': return 'Retour aux espèces';
			case 'favoriteRepository.getSpeciesNetworkError': return 'Erreur de réseau lors de la récupération de vos espèces favorites';
			case 'favoriteRepository.getSpeciesUnknownError': return 'Erreur inconnue lors de la récupération de vos espèces favorites';
			case 'favoriteRepository.getSpeciesEmptyError': return 'Certaines de vos espèces favorites n\'ont pas été trouvées';
			case 'favoriteRepository.updateSpeciesNetworkError': return 'Erreur de réseau lors de la mise à jour de vos espèces favorites';
			case 'favoriteRepository.updateSpeciesUnknownError': return 'Erreur inconnue lors de la mise à jour de vos espèces favorites';
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
			case 'general.title': return 'Amazonie';
			case 'general.subtitle': return 'Guide Illustré de la Flore et de la Faune';
			case 'general.back': return 'Retour';
			case 'general.close': return 'Fermer';
			case 'general.clear': return 'Effacer';
			case 'general.search': return 'Rechercher';
			case 'general.addToFavorites': return 'Ajouter aux favoris';
			case 'general.removeFromFavorites': return 'Retirer des favoris';
			case 'general.error404Again': return 'Quelque chose a mal tourné, veuillez réessayer';
			case 'general.nameNotAvailable': return 'Nom non disponible';
			case 'general.lastnameNotAvailable': return 'Nom de famille non disponible';
			case 'general.descriptionNotAvailable': return 'Description non disponible';
			case 'general.somethingWentWrong': return 'Quelque chose a mal tourné, veuillez réessayer';
			case 'general.refresh': return 'Actualiser';
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
			case 'pdfPreviewPage.year': return 'Année';
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
			case 'speciesDetails.taxonomicInfo': return 'Informations Taxonomiques';
			case 'speciesDetails.kingdom': return 'Règne';
			case 'speciesDetails.phylum': return 'Phylum';
			case 'speciesDetails.classes': return 'Classe';
			case 'speciesDetails.order': return 'Ordre';
			case 'speciesDetails.family': return 'Famille';
			case 'speciesDetails.download': return 'Télécharger';
			case 'speciesDetails.generatePdf': return 'Générer un PDF';
			case 'speciesDetails.downloadImage': return 'Télécharger l\'image';
			case 'speciesDetails.downloadAudio': return 'Télécharger l\'audio';
			case 'speciesDetails.share': return 'Partager';
			case 'speciesDetails.errorDownload': return 'Erreur de Téléchargement';
			case 'speciesDetails.successDownload': return 'Téléchargement réussi !';
			case 'speciesDetails.shareAmazonInfo': return 'Partagez la beauté de l\'Amazonie ! Partagez ces précieuses informations sur.';
			case 'speciesDetails.shareAmazon': return 'Partagez la beauté de l\'Amazonie !';
			case 'speciesDetails.conservationStatus': return 'Statut de Conservation';
			case 'speciesDetails.extinct': return 'Éteint';
			case 'speciesDetails.extinctDescription': return 'L\'espèce n\'existe plus à l\'état sauvage';
			case 'speciesDetails.extinctWild': return 'Éteint dans la Nature';
			case 'speciesDetails.extinctWildDescription': return 'L\'espèce n\'existe plus qu\'en captivité';
			case 'speciesDetails.criticallyEndangered': return 'En Danger Critique';
			case 'speciesDetails.criticallyEndangeredDescription': return 'L\'espèce présente un risque extrêmement élevé d\'extinction dans la nature';
			case 'speciesDetails.endangered': return 'En Danger';
			case 'speciesDetails.endangeredDescription': return 'L\'espèce présente un risque très élevé d\'extinction dans la nature';
			case 'speciesDetails.vulnerable': return 'Vulnérable';
			case 'speciesDetails.vulnerableDescription': return 'L\'espèce présente un risque élevé d\'extinction dans la nature';
			case 'speciesDetails.almostThreatened': return 'Quasi Menacé';
			case 'speciesDetails.almostThreatenedDescription': return 'L\'espèce n\'est pas en danger, mais pourrait l\'être à l\'avenir';
			case 'speciesDetails.minorConcern': return 'Préoccupation Mineure';
			case 'speciesDetails.minorConcernDescription': return 'L\'espèce n\'est pas en danger d\'extinction';
			case 'speciesDetails.insufficientData': return 'Données Insuffisantes';
			case 'speciesDetails.insufficientDataDescription': return 'Il n\'y a pas suffisamment d\'informations pour évaluer le risque d\'extinction de l\'espèce';
			case 'speciesDetails.notRated': return 'Non Évalué';
			case 'speciesDetails.notRatedDescription': return 'L\'espèce n\'a pas été évaluée par l\'UICN';
			case 'speciesDetails.appendix1': return 'Annexe I';
			case 'speciesDetails.appendix1Description': return 'Toutes les espèces menacées d\'extinction. Le commerce des spécimens de ces espèces n\'est autorisé que dans des circonstances exceptionnelles';
			case 'speciesDetails.appendix2': return 'Annexe II';
			case 'speciesDetails.appendix2Description': return 'Espèces non nécessairement menacées d\'extinction, mais dont le commerce doit être contrôlé afin d\'éviter une utilisation incompatible avec leur survie';
			case 'speciesDetails.appendix3': return 'Annexe III';
			case 'speciesDetails.appendix3Description': return 'Espèces protégées dans au moins un pays, qui ont demandé l\'assistance d\'autres Parties de la CITES pour contrôler le commerce de l\'espèce';
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
			case 'staff.title': return 'Équipe de travail';
			case 'staff.coordinationTeam': return 'Équipe de coordination';
			case 'staff.editorialCoordination': return 'Coordination éditoriale';
			case 'staff.reviewCommittee': return 'Comité de révision';
			case 'staff.textReview': return 'Révision de textes :';
			case 'staff.birdReview': return 'Révision des oiseaux :';
			case 'staff.fishReview': return 'Révision des poissons :';
			case 'staff.insectReview': return 'Révision des insectes :';
			case 'staff.plantReview': return 'Révision des plantes :';
			case 'staff.mapMaking': return 'Élaboration des cartes :';
			case 'staff.illustrations': return 'Illustrations :';
			case 'staff.sounds': return 'Sons';
			case 'staff.birds': return 'Oiseaux';
			case 'staff.monkeys': return 'Singes';
			case 'staff.amphibians': return 'Amphibiens';
			case 'staff.developmentTeam': return 'Équipe de développement';
			case 'staff.technicalLeader': return 'Responsable technique';
			case 'staff.mobileDeveloper': return 'Développeur mobile';
			case 'staff.developmentFrontend': return 'Développeur frontend';
			case 'staff.developmentBackend': return 'Développeur backend';
			case 'staff.briefcase': return 'Portefeuille';
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

