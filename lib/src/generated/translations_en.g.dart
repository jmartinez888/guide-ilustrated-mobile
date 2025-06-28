///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final texts = Translations.of(context);
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
	late final TranslationsAboutProjectEn aboutProject = TranslationsAboutProjectEn._(_root);
	late final TranslationsAuthorsEn authors = TranslationsAuthorsEn._(_root);
	late final TranslationsBottomBarEn bottomBar = TranslationsBottomBarEn._(_root);
	late final TranslationsCommunityEn community = TranslationsCommunityEn._(_root);
	late final TranslationsDeleteAccountEn deleteAccount = TranslationsDeleteAccountEn._(_root);
	late final TranslationsDrawerEn drawer = TranslationsDrawerEn._(_root);
	late final TranslationsEditProfileEn editProfile = TranslationsEditProfileEn._(_root);
	late final TranslationsErrorPageEn errorPage = TranslationsErrorPageEn._(_root);
	late final TranslationsFavoriteRepositoryEn favoriteRepository = TranslationsFavoriteRepositoryEn._(_root);
	late final TranslationsFavoritesEn favorites = TranslationsFavoritesEn._(_root);
	late final TranslationsFilterOptionsEn filterOptions = TranslationsFilterOptionsEn._(_root);
	late final TranslationsForgotPasswordEn forgotPassword = TranslationsForgotPasswordEn._(_root);
	late final TranslationsGeneralEn general = TranslationsGeneralEn._(_root);
	late final TranslationsPdfPreviewPageEn pdfPreviewPage = TranslationsPdfPreviewPageEn._(_root);
	late final TranslationsProfileEn profile = TranslationsProfileEn._(_root);
	late final TranslationsSearchPageEn searchPage = TranslationsSearchPageEn._(_root);
	late final TranslationsSignInEn signIn = TranslationsSignInEn._(_root);
	late final TranslationsSignUpEn signUp = TranslationsSignUpEn._(_root);
	late final TranslationsSpeciesEn species = TranslationsSpeciesEn._(_root);
	late final TranslationsSpeciesDetailsEn speciesDetails = TranslationsSpeciesDetailsEn._(_root);
	late final TranslationsSpeciesDetailsPageEn speciesDetailsPage = TranslationsSpeciesDetailsPageEn._(_root);
	late final TranslationsStaffEn staff = TranslationsStaffEn._(_root);
	late final TranslationsUserCredentialFailureEn userCredentialFailure = TranslationsUserCredentialFailureEn._(_root);
	late final TranslationsValidatorEn validator = TranslationsValidatorEn._(_root);
}

// Path: aboutProject
class TranslationsAboutProjectEn {
	TranslationsAboutProjectEn._(this._root);

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
class TranslationsAuthorsEn {
	TranslationsAuthorsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Authors';
	String get withoutAuthors => 'It seems there are no authors here';
	String get professionNotAvailable => 'Profession not available';
}

// Path: bottomBar
class TranslationsBottomBarEn {
	TranslationsBottomBarEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get home => 'Home';
	String get search => 'Search';
	String get favorites => 'Favorites';
}

// Path: community
class TranslationsCommunityEn {
	TranslationsCommunityEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Indigenous communities';
	String get withoutCommunities => 'It seems there are no indigenous communities here';
}

// Path: deleteAccount
class TranslationsDeleteAccountEn {
	TranslationsDeleteAccountEn._(this._root);

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

// Path: drawer
class TranslationsDrawerEn {
	TranslationsDrawerEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get account => 'Account';
	String get profile => 'Profile';
	String get content => 'Content';
	String get species => 'Species';
	String get communities => 'Indigenous communities';
	String get authors => 'Authors';
	String get about => 'About';
	String get staff => 'Staff';
	String get aboutGuide => 'About the guide';
	String get menu => 'Menu';
}

// Path: editProfile
class TranslationsEditProfileEn {
	TranslationsEditProfileEn._(this._root);

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
class TranslationsErrorPageEn {
	TranslationsErrorPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get page_not_exist => 'This page no longer exists';
	String get go_back => 'Back to species';
}

// Path: favoriteRepository
class TranslationsFavoriteRepositoryEn {
	TranslationsFavoriteRepositoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get getSpeciesNetworkError => 'Network error while fetching your favorite species';
	String get getSpeciesUnknownError => 'Unknown error while fetching your favorite species';
	String get getSpeciesEmptyError => 'Some of your favorite species were not found';
	String get updateSpeciesNetworkError => 'Network error while updating your favorite species';
	String get updateSpeciesUnknownError => 'Unknown error while updating your favorite species';
}

// Path: favorites
class TranslationsFavoritesEn {
	TranslationsFavoritesEn._(this._root);

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
class TranslationsFilterOptionsEn {
	TranslationsFilterOptionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get listByAlphabethic => 'List by alphabetical order';
	String get recentlyAdded => 'Recently added';
	String get all => 'All';
	String get noPreferencies => 'No preferences';
	late final TranslationsFilterOptionsFilterByNameEn filterByName = TranslationsFilterOptionsFilterByNameEn._(_root);
	late final TranslationsFilterOptionsFilterBySoundEn filterBySound = TranslationsFilterOptionsFilterBySoundEn._(_root);
	String get filterByConservation => 'Filter by conservation status';
	String get filterByCategory => 'Filter by category';
	String get filterByTaxonomy => 'Filter by taxonomy';
	String get filterByOrder => 'Filter by order';
	String get filterByFamily => 'Filter by family';
}

// Path: forgotPassword
class TranslationsForgotPasswordEn {
	TranslationsForgotPasswordEn._(this._root);

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
class TranslationsGeneralEn {
	TranslationsGeneralEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Amazon';
	String get subtitle => 'Illustrated Guide to Flora and Fauna';
	String get back => 'Back';
	String get close => 'Close';
	String get clear => 'Clear';
	String get search => 'Search';
	String get addToFavorites => 'Add to Favorites';
	String get removeFromFavorites => 'Remove from Favorites';
	String get error404Again => 'Something went wrong, please try again';
	String get nameNotAvailable => 'Name not available';
	String get lastnameNotAvailable => 'Last name not available';
	String get descriptionNotAvailable => 'Description not available';
	String get somethingWentWrong => 'Something went wrong, please try again';
	String get refresh => 'Refresh';
}

// Path: pdfPreviewPage
class TranslationsPdfPreviewPageEn {
	TranslationsPdfPreviewPageEn._(this._root);

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
	String get year => 'Year';
}

// Path: profile
class TranslationsProfileEn {
	TranslationsProfileEn._(this._root);

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
class TranslationsSearchPageEn {
	TranslationsSearchPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get failedRequest => 'Something went wrong. Please try again';
	String get recentlyAdded => 'Recently Added';
	late final TranslationsSearchPageNameFilterEn nameFilter = TranslationsSearchPageNameFilterEn._(_root);
	String get taxonomyFilter => 'Taxonomy';
	String get orderFilter => 'Order';
	String get familyFilter => 'Family';
	late final TranslationsSearchPageSoundFilterEn soundFilter = TranslationsSearchPageSoundFilterEn._(_root);
	String get conservationFilter => 'Conservation';
	late final TranslationsSearchPageCategoryFilterEn categoryFilter = TranslationsSearchPageCategoryFilterEn._(_root);
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
class TranslationsSignInEn {
	TranslationsSignInEn._(this._root);

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
class TranslationsSignUpEn {
	TranslationsSignUpEn._(this._root);

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
class TranslationsSpeciesEn {
	TranslationsSpeciesEn._(this._root);

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
class TranslationsSpeciesDetailsEn {
	TranslationsSpeciesDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get authors => 'Authors';
	String get taxonomicInfo => 'Taxonomic Information';
	String get kingdom => 'Kingdom';
	String get phylum => 'Phylum';
	String get classes => 'Class';
	String get order => 'Order';
	String get family => 'Family';
	String get download => 'Download';
	String get generatePdf => 'Generate PDF';
	String get downloadImage => 'Download Image';
	String get downloadAudio => 'Download Audio';
	String get share => 'Share';
	String get errorDownload => 'Download Error';
	String get successDownload => 'Download Successful!';
	String get shareAmazonInfo => 'Share the beauty of the Amazon! Share this valuable information about.';
	String get shareAmazon => 'Share the beauty of the Amazon!';
	String get conservationStatus => 'Conservation Status';
	String get extinct => 'Extinct';
	String get extinctDescription => 'The species no longer exists in the wild';
	String get extinctWild => 'Extinct in the Wild';
	String get extinctWildDescription => 'The species only exists in captivity';
	String get criticallyEndangered => 'Critically Endangered';
	String get criticallyEndangeredDescription => 'The species has an extremely high risk of extinction in the wild';
	String get endangered => 'Endangered';
	String get endangeredDescription => 'The species has a very high risk of extinction in the wild';
	String get vulnerable => 'Vulnerable';
	String get vulnerableDescription => 'The species has a high risk of extinction in the wild';
	String get almostThreatened => 'Almost Threatened';
	String get almostThreatenedDescription => 'The species is not endangered, but could be in the future';
	String get minorConcern => 'Minor Concern';
	String get minorConcernDescription => 'The species is not endangered';
	String get insufficientData => 'Insufficient Data';
	String get insufficientDataDescription => 'There is not enough information to assess the extinction risk of the species';
	String get notRated => 'Not Rated';
	String get notRatedDescription => 'The species has not been evaluated by the IUCN';
	String get appendix1 => 'Appendix I';
	String get appendix1Description => 'All species facing extinction. Trade in specimens of these species is permitted only in exceptional circumstances';
	String get appendix2 => 'Appendix II';
	String get appendix2Description => 'Species not necessarily threatened with extinction, but whose trade must be controlled in order to avoid use incompatible with their survival';
	String get appendix3 => 'Appendix III';
	String get appendix3Description => 'Species that are protected in at least one country, which has asked for assistance from other CITES Parties in controlling trade in the species';
}

// Path: speciesDetailsPage
class TranslationsSpeciesDetailsPageEn {
	TranslationsSpeciesDetailsPageEn._(this._root);

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

// Path: staff
class TranslationsStaffEn {
	TranslationsStaffEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Team';
	String get coordinationTeam => 'Coordination team';
	String get editorialCoordination => 'Editorial coordination';
	String get reviewCommittee => 'Review committee';
	String get textReview => 'Text review:';
	String get birdReview => 'Bird review:';
	String get fishReview => 'Fish review:';
	String get insectReview => 'Insect review:';
	String get plantReview => 'Plant review:';
	String get mapMaking => 'Map making:';
	String get illustrations => 'Illustrations:';
	String get sounds => 'Sounds';
	String get birds => 'Birds';
	String get monkeys => 'Monkeys';
	String get amphibians => 'Amphibians';
	String get developmentTeam => 'Development team';
	String get technicalLeader => 'Technical leader';
	String get mobileDeveloper => 'Mobile developer';
	String get developmentFrontend => 'Frontend developer';
	String get developmentBackend => 'Backend developer';
	String get briefcase => 'Portfolio';
}

// Path: userCredentialFailure
class TranslationsUserCredentialFailureEn {
	TranslationsUserCredentialFailureEn._(this._root);

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
class TranslationsValidatorEn {
	TranslationsValidatorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsValidatorPasswordEn password = TranslationsValidatorPasswordEn._(_root);
	late final TranslationsValidatorRepeatPasswordEn repeatPassword = TranslationsValidatorRepeatPasswordEn._(_root);
	late final TranslationsValidatorEmailEn email = TranslationsValidatorEmailEn._(_root);
	late final TranslationsValidatorNameEn name = TranslationsValidatorNameEn._(_root);
	late final TranslationsValidatorLastNameEn lastName = TranslationsValidatorLastNameEn._(_root);
	late final TranslationsValidatorPhoneEn phone = TranslationsValidatorPhoneEn._(_root);
	late final TranslationsValidatorCountryCodeEn countryCode = TranslationsValidatorCountryCodeEn._(_root);
}

// Path: filterOptions.filterByName
class TranslationsFilterOptionsFilterByNameEn {
	TranslationsFilterOptionsFilterByNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Filter by name';
	String get common => 'Common name';
	String get scientific => 'Scientific name';
}

// Path: filterOptions.filterBySound
class TranslationsFilterOptionsFilterBySoundEn {
	TranslationsFilterOptionsFilterBySoundEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Filter by sound';
	String get withSound => 'With sound';
	String get withoutSound => 'Without sound';
}

// Path: searchPage.nameFilter
class TranslationsSearchPageNameFilterEn {
	TranslationsSearchPageNameFilterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get common => 'Common';
	String get scientific => 'Scientific';
	String get order => 'Order by';
}

// Path: searchPage.soundFilter
class TranslationsSearchPageSoundFilterEn {
	TranslationsSearchPageSoundFilterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get withSound => 'With sound';
	String get withoutSound => 'Without sound';
	String get sound => 'Sound';
}

// Path: searchPage.categoryFilter
class TranslationsSearchPageCategoryFilterEn {
	TranslationsSearchPageCategoryFilterEn._(this._root);

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
class TranslationsValidatorPasswordEn {
	TranslationsValidatorPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Password';
	String get empty => 'Enter your password';
	String get minLength => 'Enter at least 6 characters';
	String get regExp => 'Password must contain at least one number and one letter';
}

// Path: validator.repeatPassword
class TranslationsValidatorRepeatPasswordEn {
	TranslationsValidatorRepeatPasswordEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get empty => 'Enter your password';
	String get minLength => 'Enter at least 6 characters';
	String get regExp => 'Password must contain at least one number and one letter';
	String get matchPassword => 'Passwords must match';
}

// Path: validator.email
class TranslationsValidatorEmailEn {
	TranslationsValidatorEmailEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Email';
	String get empty => 'Enter your email';
	String get regExp => 'Enter a valid email';
}

// Path: validator.name
class TranslationsValidatorNameEn {
	TranslationsValidatorNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Name';
	String get empty => 'Enter your name';
	String get minLength => 'Enter at least 3 characters';
}

// Path: validator.lastName
class TranslationsValidatorLastNameEn {
	TranslationsValidatorLastNameEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Lastname';
	String get empty => 'Enter your lastname';
	String get minLength => 'Enter at least 3 characters';
}

// Path: validator.phone
class TranslationsValidatorPhoneEn {
	TranslationsValidatorPhoneEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Phone number';
	String get empty => 'Enter your phone number';
	String get minLength => 'Enter at least 9 characters';
	String get regExp => 'Enter a valid phone number';
}

// Path: validator.countryCode
class TranslationsValidatorCountryCodeEn {
	TranslationsValidatorCountryCodeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Country code';
	String get select => 'Select country code';
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
			case 'drawer.account': return 'Account';
			case 'drawer.profile': return 'Profile';
			case 'drawer.content': return 'Content';
			case 'drawer.species': return 'Species';
			case 'drawer.communities': return 'Indigenous communities';
			case 'drawer.authors': return 'Authors';
			case 'drawer.about': return 'About';
			case 'drawer.staff': return 'Staff';
			case 'drawer.aboutGuide': return 'About the guide';
			case 'drawer.menu': return 'Menu';
			case 'editProfile.errorSnack': return 'Error loading user data';
			case 'editProfile.title': return 'Edit Profile';
			case 'editProfile.save': return 'Save';
			case 'editProfile.saving': return 'Saving...';
			case 'editProfile.errorSaving': return 'Error saving profile data';
			case 'editProfile.selectImage': return 'Select a profile picture';
			case 'editProfile.errorSave': return 'Error saving profile';
			case 'errorPage.page_not_exist': return 'This page no longer exists';
			case 'errorPage.go_back': return 'Back to species';
			case 'favoriteRepository.getSpeciesNetworkError': return 'Network error while fetching your favorite species';
			case 'favoriteRepository.getSpeciesUnknownError': return 'Unknown error while fetching your favorite species';
			case 'favoriteRepository.getSpeciesEmptyError': return 'Some of your favorite species were not found';
			case 'favoriteRepository.updateSpeciesNetworkError': return 'Network error while updating your favorite species';
			case 'favoriteRepository.updateSpeciesUnknownError': return 'Unknown error while updating your favorite species';
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
			case 'general.title': return 'Amazon';
			case 'general.subtitle': return 'Illustrated Guide to Flora and Fauna';
			case 'general.back': return 'Back';
			case 'general.close': return 'Close';
			case 'general.clear': return 'Clear';
			case 'general.search': return 'Search';
			case 'general.addToFavorites': return 'Add to Favorites';
			case 'general.removeFromFavorites': return 'Remove from Favorites';
			case 'general.error404Again': return 'Something went wrong, please try again';
			case 'general.nameNotAvailable': return 'Name not available';
			case 'general.lastnameNotAvailable': return 'Last name not available';
			case 'general.descriptionNotAvailable': return 'Description not available';
			case 'general.somethingWentWrong': return 'Something went wrong, please try again';
			case 'general.refresh': return 'Refresh';
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
			case 'pdfPreviewPage.year': return 'Year';
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
			case 'speciesDetails.phylum': return 'Phylum';
			case 'speciesDetails.classes': return 'Class';
			case 'speciesDetails.order': return 'Order';
			case 'speciesDetails.family': return 'Family';
			case 'speciesDetails.download': return 'Download';
			case 'speciesDetails.generatePdf': return 'Generate PDF';
			case 'speciesDetails.downloadImage': return 'Download Image';
			case 'speciesDetails.downloadAudio': return 'Download Audio';
			case 'speciesDetails.share': return 'Share';
			case 'speciesDetails.errorDownload': return 'Download Error';
			case 'speciesDetails.successDownload': return 'Download Successful!';
			case 'speciesDetails.shareAmazonInfo': return 'Share the beauty of the Amazon! Share this valuable information about.';
			case 'speciesDetails.shareAmazon': return 'Share the beauty of the Amazon!';
			case 'speciesDetails.conservationStatus': return 'Conservation Status';
			case 'speciesDetails.extinct': return 'Extinct';
			case 'speciesDetails.extinctDescription': return 'The species no longer exists in the wild';
			case 'speciesDetails.extinctWild': return 'Extinct in the Wild';
			case 'speciesDetails.extinctWildDescription': return 'The species only exists in captivity';
			case 'speciesDetails.criticallyEndangered': return 'Critically Endangered';
			case 'speciesDetails.criticallyEndangeredDescription': return 'The species has an extremely high risk of extinction in the wild';
			case 'speciesDetails.endangered': return 'Endangered';
			case 'speciesDetails.endangeredDescription': return 'The species has a very high risk of extinction in the wild';
			case 'speciesDetails.vulnerable': return 'Vulnerable';
			case 'speciesDetails.vulnerableDescription': return 'The species has a high risk of extinction in the wild';
			case 'speciesDetails.almostThreatened': return 'Almost Threatened';
			case 'speciesDetails.almostThreatenedDescription': return 'The species is not endangered, but could be in the future';
			case 'speciesDetails.minorConcern': return 'Minor Concern';
			case 'speciesDetails.minorConcernDescription': return 'The species is not endangered';
			case 'speciesDetails.insufficientData': return 'Insufficient Data';
			case 'speciesDetails.insufficientDataDescription': return 'There is not enough information to assess the extinction risk of the species';
			case 'speciesDetails.notRated': return 'Not Rated';
			case 'speciesDetails.notRatedDescription': return 'The species has not been evaluated by the IUCN';
			case 'speciesDetails.appendix1': return 'Appendix I';
			case 'speciesDetails.appendix1Description': return 'All species facing extinction. Trade in specimens of these species is permitted only in exceptional circumstances';
			case 'speciesDetails.appendix2': return 'Appendix II';
			case 'speciesDetails.appendix2Description': return 'Species not necessarily threatened with extinction, but whose trade must be controlled in order to avoid use incompatible with their survival';
			case 'speciesDetails.appendix3': return 'Appendix III';
			case 'speciesDetails.appendix3Description': return 'Species that are protected in at least one country, which has asked for assistance from other CITES Parties in controlling trade in the species';
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

