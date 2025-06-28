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
class TranslationsZh implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsAboutProjectZh aboutProject = _TranslationsAboutProjectZh._(_root);
	@override late final _TranslationsAuthorsZh authors = _TranslationsAuthorsZh._(_root);
	@override late final _TranslationsBottomBarZh bottomBar = _TranslationsBottomBarZh._(_root);
	@override late final _TranslationsCommunityZh community = _TranslationsCommunityZh._(_root);
	@override late final _TranslationsDeleteAccountZh deleteAccount = _TranslationsDeleteAccountZh._(_root);
	@override late final _TranslationsDrawerZh drawer = _TranslationsDrawerZh._(_root);
	@override late final _TranslationsEditProfileZh editProfile = _TranslationsEditProfileZh._(_root);
	@override late final _TranslationsErrorPageZh errorPage = _TranslationsErrorPageZh._(_root);
	@override late final _TranslationsFavoriteRepositoryZh favoriteRepository = _TranslationsFavoriteRepositoryZh._(_root);
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
	@override late final _TranslationsStaffZh staff = _TranslationsStaffZh._(_root);
	@override late final _TranslationsUserCredentialFailureZh userCredentialFailure = _TranslationsUserCredentialFailureZh._(_root);
	@override late final _TranslationsValidatorZh validator = _TranslationsValidatorZh._(_root);
}

// Path: aboutProject
class _TranslationsAboutProjectZh implements TranslationsAboutProjectEn {
	_TranslationsAboutProjectZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsAuthorsZh implements TranslationsAuthorsEn {
	_TranslationsAuthorsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '作者';
	@override String get withoutAuthors => '这里似乎没有作者';
	@override String get professionNotAvailable => '职业不可用';
}

// Path: bottomBar
class _TranslationsBottomBarZh implements TranslationsBottomBarEn {
	_TranslationsBottomBarZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get home => '首页';
	@override String get search => '搜索';
	@override String get favorites => '收藏夹';
}

// Path: community
class _TranslationsCommunityZh implements TranslationsCommunityEn {
	_TranslationsCommunityZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '土著社区';
	@override String get withoutCommunities => '这里似乎没有土著社区';
}

// Path: deleteAccount
class _TranslationsDeleteAccountZh implements TranslationsDeleteAccountEn {
	_TranslationsDeleteAccountZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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

// Path: drawer
class _TranslationsDrawerZh implements TranslationsDrawerEn {
	_TranslationsDrawerZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get account => '账户';
	@override String get profile => '个人资料';
	@override String get content => '内容';
	@override String get species => '物种';
	@override String get communities => '土著社区';
	@override String get authors => '作者';
	@override String get about => '关于';
	@override String get staff => '工作人员';
	@override String get aboutGuide => '关于指南';
	@override String get menu => '菜单';
}

// Path: editProfile
class _TranslationsEditProfileZh implements TranslationsEditProfileEn {
	_TranslationsEditProfileZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsErrorPageZh implements TranslationsErrorPageEn {
	_TranslationsErrorPageZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get page_not_exist => '该页面不存在';
	@override String get go_back => '返回物种';
}

// Path: favoriteRepository
class _TranslationsFavoriteRepositoryZh implements TranslationsFavoriteRepositoryEn {
	_TranslationsFavoriteRepositoryZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get getSpeciesNetworkError => '获取你收藏的物种时网络错误';
	@override String get getSpeciesUnknownError => '获取你收藏的物种时未知错误';
	@override String get getSpeciesEmptyError => '没有找到你收藏的某些物种';
	@override String get updateSpeciesNetworkError => '更新你收藏的物种时网络错误';
	@override String get updateSpeciesUnknownError => '更新你收藏的物种时未知错误';
}

// Path: favorites
class _TranslationsFavoritesZh implements TranslationsFavoritesEn {
	_TranslationsFavoritesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsFilterOptionsZh implements TranslationsFilterOptionsEn {
	_TranslationsFilterOptionsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsForgotPasswordZh implements TranslationsForgotPasswordEn {
	_TranslationsForgotPasswordZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsGeneralZh implements TranslationsGeneralEn {
	_TranslationsGeneralZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '亚马逊';
	@override String get subtitle => '动植物图解指南';
	@override String get back => '返回';
	@override String get close => '关闭';
	@override String get clear => '清除';
	@override String get search => '搜索';
	@override String get addToFavorites => '添加到收藏夹';
	@override String get removeFromFavorites => '从收藏夹中移除';
	@override String get error404Again => '出错了，请再试一次';
	@override String get nameNotAvailable => '姓名不可用';
	@override String get lastnameNotAvailable => '姓氏不可用';
	@override String get descriptionNotAvailable => '描述不可用';
	@override String get somethingWentWrong => '出错了，请再试一次';
	@override String get refresh => '刷新';
}

// Path: pdfPreviewPage
class _TranslationsPdfPreviewPageZh implements TranslationsPdfPreviewPageEn {
	_TranslationsPdfPreviewPageZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
	@override String get year => '年';
}

// Path: profile
class _TranslationsProfileZh implements TranslationsProfileEn {
	_TranslationsProfileZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsSearchPageZh implements TranslationsSearchPageEn {
	_TranslationsSearchPageZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsSignInZh implements TranslationsSignInEn {
	_TranslationsSignInZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsSignUpZh implements TranslationsSignUpEn {
	_TranslationsSignUpZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsSpeciesZh implements TranslationsSpeciesEn {
	_TranslationsSpeciesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsSpeciesDetailsZh implements TranslationsSpeciesDetailsEn {
	_TranslationsSpeciesDetailsZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get authors => '作者';
	@override String get taxonomicInfo => '分类信息';
	@override String get kingdom => '界';
	@override String get phylum => '门';
	@override String get classes => '纲';
	@override String get order => '目';
	@override String get family => '科';
	@override String get download => '下载';
	@override String get generatePdf => '生成PDF';
	@override String get downloadImage => '下载图片';
	@override String get downloadAudio => '下载音频';
	@override String get share => '分享';
	@override String get errorDownload => '下载出错';
	@override String get successDownload => '下载成功！';
	@override String get shareAmazonInfo => '分享亚马逊的美丽！分享这些宝贵的信息。';
	@override String get shareAmazon => '分享亚马逊的美丽！';
	@override String get conservationStatus => '保护状况';
	@override String get extinct => '灭绝';
	@override String get extinctDescription => '该物种已不复存在于自然界';
	@override String get extinctWild => '野外灭绝';
	@override String get extinctWildDescription => '该物种仅存在于圈养环境中';
	@override String get criticallyEndangered => '濒危';
	@override String get criticallyEndangeredDescription => '该物种在自然环境中面临极高的灭绝风险';
	@override String get endangered => '濒危';
	@override String get endangeredDescription => '该物种在自然环境中面临很高的灭绝风险';
	@override String get vulnerable => '易危';
	@override String get vulnerableDescription => '该物种在自然环境中面临较高的灭绝风险';
	@override String get almostThreatened => '濒临威胁';
	@override String get almostThreatenedDescription => '该物种目前没有受到威胁，但未来可能受到威胁';
	@override String get minorConcern => '轻度关注';
	@override String get minorConcernDescription => '该物种并未濒危';
	@override String get insufficientData => '数据不足';
	@override String get insufficientDataDescription => '没有足够的信息来评估该物种的灭绝风险';
	@override String get notRated => '未评定';
	@override String get notRatedDescription => '该物种尚未被IUCN评定';
	@override String get appendix1 => '附录 I';
	@override String get appendix1Description => '所有濒危物种。这些物种的标本交易仅在特殊情况下允许';
	@override String get appendix2 => '附录 II';
	@override String get appendix2Description => '非必然濒危的物种，但其交易必须受到控制，以避免与其生存不相容的使用';
	@override String get appendix3 => '附录 III';
	@override String get appendix3Description => '在至少一个国家受到保护的物种，该国家请求CITES其他缔约方协助控制该物种的贸易';
}

// Path: speciesDetailsPage
class _TranslationsSpeciesDetailsPageZh implements TranslationsSpeciesDetailsPageEn {
	_TranslationsSpeciesDetailsPageZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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

// Path: staff
class _TranslationsStaffZh implements TranslationsStaffEn {
	_TranslationsStaffZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '工作团队';
	@override String get coordinationTeam => '协调团队';
	@override String get editorialCoordination => '编辑协调';
	@override String get reviewCommittee => '审查委员会';
	@override String get textReview => '文本审查：';
	@override String get birdReview => '鸟类审查：';
	@override String get fishReview => '鱼类审查：';
	@override String get insectReview => '昆虫审查：';
	@override String get plantReview => '植物审查：';
	@override String get mapMaking => '地图制作：';
	@override String get illustrations => '插图：';
	@override String get sounds => '声音';
	@override String get birds => '鸟类';
	@override String get monkeys => '猴子';
	@override String get amphibians => '两栖动物';
	@override String get developmentTeam => '开发团队';
	@override String get technicalLeader => '技术负责人';
	@override String get mobileDeveloper => '移动开发人员';
	@override String get developmentFrontend => '前端开发人员';
	@override String get developmentBackend => '后端开发人员';
	@override String get briefcase => '作品集';
}

// Path: userCredentialFailure
class _TranslationsUserCredentialFailureZh implements TranslationsUserCredentialFailureEn {
	_TranslationsUserCredentialFailureZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get network => '检查您的网络连接';
	@override String get credential => '凭证不正确';
	@override String get disable => '此帐户已被禁用，请稍后再试';
	@override String get notRegistered => '电子邮件未注册';
	@override String get password => '密码不正确';
	@override String get unknown => '未知错误';
}

// Path: validator
class _TranslationsValidatorZh implements TranslationsValidatorEn {
	_TranslationsValidatorZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsFilterOptionsFilterByNameZh implements TranslationsFilterOptionsFilterByNameEn {
	_TranslationsFilterOptionsFilterByNameZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '按名称过滤';
	@override String get common => '通用名称';
	@override String get scientific => '科学名称';
}

// Path: filterOptions.filterBySound
class _TranslationsFilterOptionsFilterBySoundZh implements TranslationsFilterOptionsFilterBySoundEn {
	_TranslationsFilterOptionsFilterBySoundZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get title => '按声音过滤';
	@override String get withSound => '有声音';
	@override String get withoutSound => '无声音';
}

// Path: searchPage.nameFilter
class _TranslationsSearchPageNameFilterZh implements TranslationsSearchPageNameFilterEn {
	_TranslationsSearchPageNameFilterZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get common => '常见';
	@override String get scientific => '科学';
	@override String get order => '排序方式';
}

// Path: searchPage.soundFilter
class _TranslationsSearchPageSoundFilterZh implements TranslationsSearchPageSoundFilterEn {
	_TranslationsSearchPageSoundFilterZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get withSound => '有声音';
	@override String get withoutSound => '无声音';
	@override String get sound => '声音';
}

// Path: searchPage.categoryFilter
class _TranslationsSearchPageCategoryFilterZh implements TranslationsSearchPageCategoryFilterEn {
	_TranslationsSearchPageCategoryFilterZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

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
class _TranslationsValidatorPasswordZh implements TranslationsValidatorPasswordEn {
	_TranslationsValidatorPasswordZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '密码';
	@override String get empty => '请输入您的密码';
	@override String get minLength => '至少输入6个字符';
	@override String get regExp => '密码必须包含至少一个数字和一个字母';
}

// Path: validator.repeatPassword
class _TranslationsValidatorRepeatPasswordZh implements TranslationsValidatorRepeatPasswordEn {
	_TranslationsValidatorRepeatPasswordZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get empty => '请输入您的密码';
	@override String get minLength => '至少输入6个字符';
	@override String get regExp => '密码必须包含至少一个数字和一个字母';
	@override String get matchPassword => '密码必须匹配';
}

// Path: validator.email
class _TranslationsValidatorEmailZh implements TranslationsValidatorEmailEn {
	_TranslationsValidatorEmailZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '邮箱';
	@override String get empty => '请输入您的邮箱';
	@override String get regExp => '请输入有效的邮箱';
}

// Path: validator.name
class _TranslationsValidatorNameZh implements TranslationsValidatorNameEn {
	_TranslationsValidatorNameZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '姓名';
	@override String get empty => '请输入您的姓名';
	@override String get minLength => '至少输入3个字符';
}

// Path: validator.lastName
class _TranslationsValidatorLastNameZh implements TranslationsValidatorLastNameEn {
	_TranslationsValidatorLastNameZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '姓氏';
	@override String get empty => '请输入您的姓氏';
	@override String get minLength => '至少输入3个字符';
}

// Path: validator.phone
class _TranslationsValidatorPhoneZh implements TranslationsValidatorPhoneEn {
	_TranslationsValidatorPhoneZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '电话号码';
	@override String get empty => '请输入您的电话号码';
	@override String get minLength => '至少输入9个字符';
	@override String get regExp => '请输入有效的电话号码';
}

// Path: validator.countryCode
class _TranslationsValidatorCountryCodeZh implements TranslationsValidatorCountryCodeEn {
	_TranslationsValidatorCountryCodeZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get label => '国家代码';
	@override String get select => '选择国家代码';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
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
			case 'drawer.account': return '账户';
			case 'drawer.profile': return '个人资料';
			case 'drawer.content': return '内容';
			case 'drawer.species': return '物种';
			case 'drawer.communities': return '土著社区';
			case 'drawer.authors': return '作者';
			case 'drawer.about': return '关于';
			case 'drawer.staff': return '工作人员';
			case 'drawer.aboutGuide': return '关于指南';
			case 'drawer.menu': return '菜单';
			case 'editProfile.errorSnack': return '加载用户数据时出错';
			case 'editProfile.title': return '编辑个人资料';
			case 'editProfile.save': return '保存';
			case 'editProfile.saving': return '正在保存...';
			case 'editProfile.errorSaving': return '保存个人资料数据时出错';
			case 'editProfile.selectImage': return '选择个人资料图片';
			case 'editProfile.errorSave': return '保存个人资料时出错';
			case 'errorPage.page_not_exist': return '该页面不存在';
			case 'errorPage.go_back': return '返回物种';
			case 'favoriteRepository.getSpeciesNetworkError': return '获取你收藏的物种时网络错误';
			case 'favoriteRepository.getSpeciesUnknownError': return '获取你收藏的物种时未知错误';
			case 'favoriteRepository.getSpeciesEmptyError': return '没有找到你收藏的某些物种';
			case 'favoriteRepository.updateSpeciesNetworkError': return '更新你收藏的物种时网络错误';
			case 'favoriteRepository.updateSpeciesUnknownError': return '更新你收藏的物种时未知错误';
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
			case 'general.title': return '亚马逊';
			case 'general.subtitle': return '动植物图解指南';
			case 'general.back': return '返回';
			case 'general.close': return '关闭';
			case 'general.clear': return '清除';
			case 'general.search': return '搜索';
			case 'general.addToFavorites': return '添加到收藏夹';
			case 'general.removeFromFavorites': return '从收藏夹中移除';
			case 'general.error404Again': return '出错了，请再试一次';
			case 'general.nameNotAvailable': return '姓名不可用';
			case 'general.lastnameNotAvailable': return '姓氏不可用';
			case 'general.descriptionNotAvailable': return '描述不可用';
			case 'general.somethingWentWrong': return '出错了，请再试一次';
			case 'general.refresh': return '刷新';
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
			case 'pdfPreviewPage.year': return '年';
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
			case 'speciesDetails.kingdom': return '界';
			case 'speciesDetails.phylum': return '门';
			case 'speciesDetails.classes': return '纲';
			case 'speciesDetails.order': return '目';
			case 'speciesDetails.family': return '科';
			case 'speciesDetails.download': return '下载';
			case 'speciesDetails.generatePdf': return '生成PDF';
			case 'speciesDetails.downloadImage': return '下载图片';
			case 'speciesDetails.downloadAudio': return '下载音频';
			case 'speciesDetails.share': return '分享';
			case 'speciesDetails.errorDownload': return '下载出错';
			case 'speciesDetails.successDownload': return '下载成功！';
			case 'speciesDetails.shareAmazonInfo': return '分享亚马逊的美丽！分享这些宝贵的信息。';
			case 'speciesDetails.shareAmazon': return '分享亚马逊的美丽！';
			case 'speciesDetails.conservationStatus': return '保护状况';
			case 'speciesDetails.extinct': return '灭绝';
			case 'speciesDetails.extinctDescription': return '该物种已不复存在于自然界';
			case 'speciesDetails.extinctWild': return '野外灭绝';
			case 'speciesDetails.extinctWildDescription': return '该物种仅存在于圈养环境中';
			case 'speciesDetails.criticallyEndangered': return '濒危';
			case 'speciesDetails.criticallyEndangeredDescription': return '该物种在自然环境中面临极高的灭绝风险';
			case 'speciesDetails.endangered': return '濒危';
			case 'speciesDetails.endangeredDescription': return '该物种在自然环境中面临很高的灭绝风险';
			case 'speciesDetails.vulnerable': return '易危';
			case 'speciesDetails.vulnerableDescription': return '该物种在自然环境中面临较高的灭绝风险';
			case 'speciesDetails.almostThreatened': return '濒临威胁';
			case 'speciesDetails.almostThreatenedDescription': return '该物种目前没有受到威胁，但未来可能受到威胁';
			case 'speciesDetails.minorConcern': return '轻度关注';
			case 'speciesDetails.minorConcernDescription': return '该物种并未濒危';
			case 'speciesDetails.insufficientData': return '数据不足';
			case 'speciesDetails.insufficientDataDescription': return '没有足够的信息来评估该物种的灭绝风险';
			case 'speciesDetails.notRated': return '未评定';
			case 'speciesDetails.notRatedDescription': return '该物种尚未被IUCN评定';
			case 'speciesDetails.appendix1': return '附录 I';
			case 'speciesDetails.appendix1Description': return '所有濒危物种。这些物种的标本交易仅在特殊情况下允许';
			case 'speciesDetails.appendix2': return '附录 II';
			case 'speciesDetails.appendix2Description': return '非必然濒危的物种，但其交易必须受到控制，以避免与其生存不相容的使用';
			case 'speciesDetails.appendix3': return '附录 III';
			case 'speciesDetails.appendix3Description': return '在至少一个国家受到保护的物种，该国家请求CITES其他缔约方协助控制该物种的贸易';
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
			case 'staff.title': return '工作团队';
			case 'staff.coordinationTeam': return '协调团队';
			case 'staff.editorialCoordination': return '编辑协调';
			case 'staff.reviewCommittee': return '审查委员会';
			case 'staff.textReview': return '文本审查：';
			case 'staff.birdReview': return '鸟类审查：';
			case 'staff.fishReview': return '鱼类审查：';
			case 'staff.insectReview': return '昆虫审查：';
			case 'staff.plantReview': return '植物审查：';
			case 'staff.mapMaking': return '地图制作：';
			case 'staff.illustrations': return '插图：';
			case 'staff.sounds': return '声音';
			case 'staff.birds': return '鸟类';
			case 'staff.monkeys': return '猴子';
			case 'staff.amphibians': return '两栖动物';
			case 'staff.developmentTeam': return '开发团队';
			case 'staff.technicalLeader': return '技术负责人';
			case 'staff.mobileDeveloper': return '移动开发人员';
			case 'staff.developmentFrontend': return '前端开发人员';
			case 'staff.developmentBackend': return '后端开发人员';
			case 'staff.briefcase': return '作品集';
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

