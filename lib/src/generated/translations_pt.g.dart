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
class TranslationsPt implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsPt({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	late final TranslationsPt _root = this; // ignore: unused_field

	@override 
	TranslationsPt $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsPt(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAboutProjectPt aboutProject = _TranslationsAboutProjectPt._(_root);
	@override late final _TranslationsAuthorsPt authors = _TranslationsAuthorsPt._(_root);
	@override late final _TranslationsBottomBarPt bottomBar = _TranslationsBottomBarPt._(_root);
	@override late final _TranslationsCommunityPt community = _TranslationsCommunityPt._(_root);
	@override late final _TranslationsDeleteAccountPt deleteAccount = _TranslationsDeleteAccountPt._(_root);
	@override late final _TranslationsDrawerPt drawer = _TranslationsDrawerPt._(_root);
	@override late final _TranslationsEditProfilePt editProfile = _TranslationsEditProfilePt._(_root);
	@override late final _TranslationsErrorPagePt errorPage = _TranslationsErrorPagePt._(_root);
	@override late final _TranslationsFavoriteRepositoryPt favoriteRepository = _TranslationsFavoriteRepositoryPt._(_root);
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
	@override late final _TranslationsStaffPt staff = _TranslationsStaffPt._(_root);
	@override late final _TranslationsUserCredentialFailurePt userCredentialFailure = _TranslationsUserCredentialFailurePt._(_root);
	@override late final _TranslationsValidatorPt validator = _TranslationsValidatorPt._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectPt implements TranslationsAboutProjectEn {
	_TranslationsAboutProjectPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsAuthorsPt implements TranslationsAuthorsEn {
	_TranslationsAuthorsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Autores';
	@override String get withoutAuthors => 'Parece que não há autores aqui';
	@override String get professionNotAvailable => 'Profissão não disponível';
}

// Path: bottomBar
class _TranslationsBottomBarPt implements TranslationsBottomBarEn {
	_TranslationsBottomBarPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get home => 'Início';
	@override String get search => 'Buscar';
	@override String get favorites => 'Favoritos';
}

// Path: community
class _TranslationsCommunityPt implements TranslationsCommunityEn {
	_TranslationsCommunityPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Comunidades indígenas';
	@override String get withoutCommunities => 'Parece que não há comunidades indígenas aqui';
}

// Path: deleteAccount
class _TranslationsDeleteAccountPt implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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

// Path: drawer
class _TranslationsDrawerPt implements TranslationsDrawerEn {
	_TranslationsDrawerPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get account => 'Conta';
	@override String get profile => 'Perfil';
	@override String get content => 'Conteúdo';
	@override String get species => 'Espécies';
	@override String get communities => 'Comunidades indígenas';
	@override String get authors => 'Autores';
	@override String get about => 'Sobre';
	@override String get staff => 'Equipe';
	@override String get aboutGuide => 'Sobre o guia';
	@override String get menu => 'Menu';
}

// Path: editProfile
class _TranslationsEditProfilePt implements TranslationsEditProfileEn {
	_TranslationsEditProfilePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsErrorPagePt implements TranslationsErrorPageEn {
	_TranslationsErrorPagePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get page_not_exist => 'Esta página não existe mais';
	@override String get go_back => 'Voltar para espécies';
}

// Path: favoriteRepository
class _TranslationsFavoriteRepositoryPt implements TranslationsFavoriteRepositoryEn {
	_TranslationsFavoriteRepositoryPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get getSpeciesNetworkError => 'Erro de rede ao buscar suas espécies favoritas';
	@override String get getSpeciesUnknownError => 'Erro desconhecido ao buscar suas espécies favoritas';
	@override String get getSpeciesEmptyError => 'Algumas de suas espécies favoritas não foram encontradas';
	@override String get updateSpeciesNetworkError => 'Erro de rede ao atualizar suas espécies favoritas';
	@override String get updateSpeciesUnknownError => 'Erro desconhecido ao atualizar suas espécies favoritas';
}

// Path: favorites
class _TranslationsFavoritesPt implements TranslationsFavoritesEn {
	_TranslationsFavoritesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsFilterOptionsPt implements TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsForgotPasswordPt implements TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsGeneralPt implements TranslationsGeneralEn {
	_TranslationsGeneralPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Amazônia';
	@override String get subtitle => 'Guia Ilustrado de Flora e Fauna';
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
	@override String get somethingWentWrong => 'Algo deu errado, por favor tente novamente';
	@override String get refresh => 'Atualizar';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPagePt implements TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPagePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
	@override String get year => 'Ano';
}

// Path: profile
class _TranslationsProfilePt implements TranslationsProfileEn {
	_TranslationsProfilePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsSearchPagePt implements TranslationsSearchPageEn {
	_TranslationsSearchPagePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsSignInPt implements TranslationsSignInEn {
	_TranslationsSignInPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsSignUpPt implements TranslationsSignUpEn {
	_TranslationsSignUpPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsSpeciesPt implements TranslationsSpeciesEn {
	_TranslationsSpeciesPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsSpeciesDetailsPt implements TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get authors => 'Autores';
	@override String get taxonomicInfo => 'Informação Taxonômica';
	@override String get kingdom => 'Reino';
	@override String get phylum => 'Filo';
	@override String get classes => 'Classe';
	@override String get order => 'Ordem';
	@override String get family => 'Família';
	@override String get download => 'Baixar';
	@override String get generatePdf => 'Gerar PDF';
	@override String get downloadImage => 'Baixar Imagem';
	@override String get downloadAudio => 'Baixar Áudio';
	@override String get share => 'Compartilhar';
	@override String get errorDownload => 'Erro ao Baixar';
	@override String get successDownload => 'Download bem-sucedido!';
	@override String get shareAmazonInfo => 'Compartilhe a beleza da Amazônia! Compartilhe estas valiosas informações sobre.';
	@override String get shareAmazon => 'Compartilhe a beleza da Amazônia!';
	@override String get conservationStatus => 'Status de Conservação';
	@override String get extinct => 'Extinto';
	@override String get extinctDescription => 'A espécie não existe mais na natureza';
	@override String get extinctWild => 'Extinto na Natureza';
	@override String get extinctWildDescription => 'A espécie só existe em cativeiro';
	@override String get criticallyEndangered => 'Criticamente em Perigo';
	@override String get criticallyEndangeredDescription => 'A espécie tem um risco extremamente alto de extinção na natureza';
	@override String get endangered => 'Em Perigo';
	@override String get endangeredDescription => 'A espécie tem um risco muito alto de extinção na natureza';
	@override String get vulnerable => 'Vulnerável';
	@override String get vulnerableDescription => 'A espécie tem um alto risco de extinção na natureza';
	@override String get almostThreatened => 'Quase Ameaçado';
	@override String get almostThreatenedDescription => 'A espécie não está ameaçada, mas poderia estar no futuro';
	@override String get minorConcern => 'Preocupação Menor';
	@override String get minorConcernDescription => 'A espécie não está em perigo de extinção';
	@override String get insufficientData => 'Dados Insuficientes';
	@override String get insufficientDataDescription => 'Não há informações suficientes para avaliar o risco de extinção da espécie';
	@override String get notRated => 'Não Avaliado';
	@override String get notRatedDescription => 'A espécie não foi avaliada pela IUCN';
	@override String get appendix1 => 'Apêndice I';
	@override String get appendix1Description => 'Todas as espécies ameaçadas de extinção. O comércio de exemplares dessas espécies é permitido apenas em circunstâncias excepcionais';
	@override String get appendix2 => 'Apêndice II';
	@override String get appendix2Description => 'Espécies não necessariamente ameaçadas de extinção, mas cujo comércio deve ser controlado para evitar um uso incompatível com sua sobrevivência';
	@override String get appendix3 => 'Apêndice III';
	@override String get appendix3Description => 'Espécies protegidas em pelo menos um país, que solicitou assistência de outras Partes da CITES para controlar o comércio da espécie';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPagePt implements TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPagePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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

// Path: staff
class _TranslationsStaffPt implements TranslationsStaffEn {
	_TranslationsStaffPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Equipe de trabalho';
	@override String get coordinationTeam => 'Equipe de coordenação';
	@override String get editorialCoordination => 'Coordenação editorial';
	@override String get reviewCommittee => 'Comitê de revisão';
	@override String get textReview => 'Revisão de textos:';
	@override String get birdReview => 'Revisão de aves:';
	@override String get fishReview => 'Revisão de peixes:';
	@override String get insectReview => 'Revisão de insetos:';
	@override String get plantReview => 'Revisão de plantas:';
	@override String get mapMaking => 'Elaboração de mapas:';
	@override String get illustrations => 'Ilustrações:';
	@override String get sounds => 'Sons';
	@override String get birds => 'Aves';
	@override String get monkeys => 'Macacos';
	@override String get amphibians => 'Anfíbios';
	@override String get developmentTeam => 'Equipe de desenvolvimento';
	@override String get technicalLeader => 'Líder técnico';
	@override String get mobileDeveloper => 'Desenvolvedor móvel';
	@override String get developmentFrontend => 'Desenvolvedor frontend';
	@override String get developmentBackend => 'Desenvolvedor backend';
	@override String get briefcase => 'Portfólio';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailurePt implements TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailurePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get network => 'Verifique sua conexão com a internet';
	@override String get credential => 'Credenciais incorretas';
	@override String get disable => 'Esta conta foi desativada, tente novamente mais tarde';
	@override String get notRegistered => 'O e-mail não está registrado';
	@override String get password => 'Senha incorreta';
	@override String get unknown => 'Erro desconhecido';
}

// Path: validator
class _TranslationsValidatorPt implements TranslationsValidatorEn {
	_TranslationsValidatorPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsFilterOptionsFilterByNamePt implements TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNamePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrar por nome';
	@override String get common => 'Nome comum';
	@override String get scientific => 'Nome científico';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundPt implements TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get title => 'Filtrar por som';
	@override String get withSound => 'Com som';
	@override String get withoutSound => 'Sem som';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterPt implements TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get common => 'Comum';
	@override String get scientific => 'Científico';
	@override String get order => 'Ordenar por';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterPt implements TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get withSound => 'Com som';
	@override String get withoutSound => 'Sem som';
	@override String get sound => 'Som';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterPt implements TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

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
class _TranslationsValidatorPasswordPt implements TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Senha';
	@override String get empty => 'Digite sua senha';
	@override String get minLength => 'Digite pelo menos 6 caracteres';
	@override String get regExp => 'A senha deve conter pelo menos um número e uma letra';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordPt implements TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get empty => 'Digite sua senha';
	@override String get minLength => 'Digite pelo menos 6 caracteres';
	@override String get regExp => 'A senha deve conter pelo menos um número e uma letra';
	@override String get matchPassword => 'As senhas devem ser iguais';
}

// Path: validator.email
class _TranslationsValidatorEmailPt implements TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailPt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Email';
	@override String get empty => 'Digite seu email';
	@override String get regExp => 'Digite um email válido';
}

// Path: validator.name
class _TranslationsValidatorNamePt implements TranslationsValidatorNameEn {
	_TranslationsValidatorNamePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Nome';
	@override String get empty => 'Digite seu nome';
	@override String get minLength => 'Digite pelo menos 3 caracteres';
}

// Path: validator.lastName
class _TranslationsValidatorLastNamePt implements TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNamePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Sobrenome';
	@override String get empty => 'Digite seu sobrenome';
	@override String get minLength => 'Digite pelo menos 3 caracteres';
}

// Path: validator.phone
class _TranslationsValidatorPhonePt implements TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhonePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Número de telefone';
	@override String get empty => 'Digite seu número de telefone';
	@override String get minLength => 'Digite pelo menos 9 caracteres';
	@override String get regExp => 'Digite um número de telefone válido';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodePt implements TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodePt._(this._root);

	final TranslationsPt _root; // ignore: unused_field

	// Translations
	@override String get label => 'Código do país';
	@override String get select => 'Selecione o código do país';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsPt {
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
			case 'drawer.account': return 'Conta';
			case 'drawer.profile': return 'Perfil';
			case 'drawer.content': return 'Conteúdo';
			case 'drawer.species': return 'Espécies';
			case 'drawer.communities': return 'Comunidades indígenas';
			case 'drawer.authors': return 'Autores';
			case 'drawer.about': return 'Sobre';
			case 'drawer.staff': return 'Equipe';
			case 'drawer.aboutGuide': return 'Sobre o guia';
			case 'drawer.menu': return 'Menu';
			case 'editProfile.errorSnack': return 'Erro ao carregar os dados do usuário';
			case 'editProfile.title': return 'Editar perfil';
			case 'editProfile.save': return 'Salvar';
			case 'editProfile.saving': return 'Salvando...';
			case 'editProfile.errorSaving': return 'Erro ao salvar os dados do perfil';
			case 'editProfile.selectImage': return 'Selecione uma imagem de perfil';
			case 'editProfile.errorSave': return 'Erro ao salvar o perfil';
			case 'errorPage.page_not_exist': return 'Esta página não existe mais';
			case 'errorPage.go_back': return 'Voltar para espécies';
			case 'favoriteRepository.getSpeciesNetworkError': return 'Erro de rede ao buscar suas espécies favoritas';
			case 'favoriteRepository.getSpeciesUnknownError': return 'Erro desconhecido ao buscar suas espécies favoritas';
			case 'favoriteRepository.getSpeciesEmptyError': return 'Algumas de suas espécies favoritas não foram encontradas';
			case 'favoriteRepository.updateSpeciesNetworkError': return 'Erro de rede ao atualizar suas espécies favoritas';
			case 'favoriteRepository.updateSpeciesUnknownError': return 'Erro desconhecido ao atualizar suas espécies favoritas';
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
			case 'general.title': return 'Amazônia';
			case 'general.subtitle': return 'Guia Ilustrado de Flora e Fauna';
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
			case 'general.somethingWentWrong': return 'Algo deu errado, por favor tente novamente';
			case 'general.refresh': return 'Atualizar';
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
			case 'pdfPreviewPage.year': return 'Ano';
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
			case 'speciesDetails.phylum': return 'Filo';
			case 'speciesDetails.classes': return 'Classe';
			case 'speciesDetails.order': return 'Ordem';
			case 'speciesDetails.family': return 'Família';
			case 'speciesDetails.download': return 'Baixar';
			case 'speciesDetails.generatePdf': return 'Gerar PDF';
			case 'speciesDetails.downloadImage': return 'Baixar Imagem';
			case 'speciesDetails.downloadAudio': return 'Baixar Áudio';
			case 'speciesDetails.share': return 'Compartilhar';
			case 'speciesDetails.errorDownload': return 'Erro ao Baixar';
			case 'speciesDetails.successDownload': return 'Download bem-sucedido!';
			case 'speciesDetails.shareAmazonInfo': return 'Compartilhe a beleza da Amazônia! Compartilhe estas valiosas informações sobre.';
			case 'speciesDetails.shareAmazon': return 'Compartilhe a beleza da Amazônia!';
			case 'speciesDetails.conservationStatus': return 'Status de Conservação';
			case 'speciesDetails.extinct': return 'Extinto';
			case 'speciesDetails.extinctDescription': return 'A espécie não existe mais na natureza';
			case 'speciesDetails.extinctWild': return 'Extinto na Natureza';
			case 'speciesDetails.extinctWildDescription': return 'A espécie só existe em cativeiro';
			case 'speciesDetails.criticallyEndangered': return 'Criticamente em Perigo';
			case 'speciesDetails.criticallyEndangeredDescription': return 'A espécie tem um risco extremamente alto de extinção na natureza';
			case 'speciesDetails.endangered': return 'Em Perigo';
			case 'speciesDetails.endangeredDescription': return 'A espécie tem um risco muito alto de extinção na natureza';
			case 'speciesDetails.vulnerable': return 'Vulnerável';
			case 'speciesDetails.vulnerableDescription': return 'A espécie tem um alto risco de extinção na natureza';
			case 'speciesDetails.almostThreatened': return 'Quase Ameaçado';
			case 'speciesDetails.almostThreatenedDescription': return 'A espécie não está ameaçada, mas poderia estar no futuro';
			case 'speciesDetails.minorConcern': return 'Preocupação Menor';
			case 'speciesDetails.minorConcernDescription': return 'A espécie não está em perigo de extinção';
			case 'speciesDetails.insufficientData': return 'Dados Insuficientes';
			case 'speciesDetails.insufficientDataDescription': return 'Não há informações suficientes para avaliar o risco de extinção da espécie';
			case 'speciesDetails.notRated': return 'Não Avaliado';
			case 'speciesDetails.notRatedDescription': return 'A espécie não foi avaliada pela IUCN';
			case 'speciesDetails.appendix1': return 'Apêndice I';
			case 'speciesDetails.appendix1Description': return 'Todas as espécies ameaçadas de extinção. O comércio de exemplares dessas espécies é permitido apenas em circunstâncias excepcionais';
			case 'speciesDetails.appendix2': return 'Apêndice II';
			case 'speciesDetails.appendix2Description': return 'Espécies não necessariamente ameaçadas de extinção, mas cujo comércio deve ser controlado para evitar um uso incompatível com sua sobrevivência';
			case 'speciesDetails.appendix3': return 'Apêndice III';
			case 'speciesDetails.appendix3Description': return 'Espécies protegidas em pelo menos um país, que solicitou assistência de outras Partes da CITES para controlar o comércio da espécie';
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
			case 'staff.title': return 'Equipe de trabalho';
			case 'staff.coordinationTeam': return 'Equipe de coordenação';
			case 'staff.editorialCoordination': return 'Coordenação editorial';
			case 'staff.reviewCommittee': return 'Comitê de revisão';
			case 'staff.textReview': return 'Revisão de textos:';
			case 'staff.birdReview': return 'Revisão de aves:';
			case 'staff.fishReview': return 'Revisão de peixes:';
			case 'staff.insectReview': return 'Revisão de insetos:';
			case 'staff.plantReview': return 'Revisão de plantas:';
			case 'staff.mapMaking': return 'Elaboração de mapas:';
			case 'staff.illustrations': return 'Ilustrações:';
			case 'staff.sounds': return 'Sons';
			case 'staff.birds': return 'Aves';
			case 'staff.monkeys': return 'Macacos';
			case 'staff.amphibians': return 'Anfíbios';
			case 'staff.developmentTeam': return 'Equipe de desenvolvimento';
			case 'staff.technicalLeader': return 'Líder técnico';
			case 'staff.mobileDeveloper': return 'Desenvolvedor móvel';
			case 'staff.developmentFrontend': return 'Desenvolvedor frontend';
			case 'staff.developmentBackend': return 'Desenvolvedor backend';
			case 'staff.briefcase': return 'Portfólio';
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

