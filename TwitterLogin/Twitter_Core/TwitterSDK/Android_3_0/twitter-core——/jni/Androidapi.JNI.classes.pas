//====================================================
//
//  转换来自JavaOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932
//      396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//
//  生成时间：2018/1/15 16:43:20
//  工具版本：1.0.2015.5.11
//
//====================================================
unit Androidapi.JNI.classes;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge, 
  Androidapi.JNI.JavaTypes, 
//  Androidapi.JNI.com.google.gson.JsonElemen-t,
//  Androidapi.JNI.com.google.gson.JsonSerializationContext,
//  Androidapi.JNI.com.google.gson.JsonDeserializationContext,
//  Androidapi.JNI.com.google.gson.TypeAdapter,
//  Androidapi.JNI.com.google.gson.Gson,
//  Androidapi.JNI.com.google.gson.reflect.TypeToken,
//  Androidapi.JNI.com.google.gson.stream.JsonWriter,
//  Androidapi.JNI.com.google.gson.stream.JsonReader,
  Androidapi.JNI.GraphicsContentViewText,
//  Androidapi.JNI.okhttp3.OkHttpClient,
  Androidapi.JNI.os,
//  Androidapi.JNI.retrofit2.Call,
//  Androidapi.JNI.okhttp3.RequestBody,
//  Androidapi.JNI.retrofit2.Response,
  Androidapi.JNI.App,
//  Androidapi.JNI.okhttp3.Response,
//  Androidapi.JNI.okhttp3.Interceptor_Chain,
  Androidapi.JNI.Net,
//  Androidapi.JNI.okhttp3.Request,
//  Androidapi.JNI.okhttp3.Route,
//  Androidapi.JNI.java.net.URI,
//  Androidapi.JNI.okhttp3.CertificatePinner,
  Androidapi.JNI.Webkit,
  Androidapi.JNI.Util;


type
// ===== Forward declarations =====

  JTwitterCore = interface; //com.twitter.sdk.android.core.TwitterCore
  JEntity = interface; //com.twitter.sdk.android.core.models.Entity
  JPlace = interface; //com.twitter.sdk.android.core.models.Place
  JCoordinates = interface; //com.twitter.sdk.android.core.models.Coordinates
  JTwitterCollection_TimelineItem = interface; //com.twitter.sdk.android.core.models.TwitterCollection$TimelineItem
  JTwitterCollection_Content = interface; //com.twitter.sdk.android.core.models.TwitterCollection$Content
  JPlace_BoundingBox = interface; //com.twitter.sdk.android.core.models.Place$BoundingBox
  JHashtagEntity = interface; //com.twitter.sdk.android.core.models.HashtagEntity
  JMedia = interface; //com.twitter.sdk.android.core.models.Media
  JBindingValuesAdapter = interface; //com.twitter.sdk.android.core.models.BindingValuesAdapter
  JMediaEntity_Sizes = interface; //com.twitter.sdk.android.core.models.MediaEntity$Sizes
  JIdentifiable = interface; //com.twitter.sdk.android.core.models.Identifiable
  JCard = interface; //com.twitter.sdk.android.core.models.Card
  JUserBuilder = interface; //com.twitter.sdk.android.core.models.UserBuilder
  JTwitterCollection_Metadata = interface; //com.twitter.sdk.android.core.models.TwitterCollection$Metadata
  JSafeMapAdapter = interface; //com.twitter.sdk.android.core.models.SafeMapAdapter
  JUserValue = interface; //com.twitter.sdk.android.core.models.UserValue
  JImageValue = interface; //com.twitter.sdk.android.core.models.ImageValue
  JUserEntities_UrlEntities = interface; //com.twitter.sdk.android.core.models.UserEntities$UrlEntities
  JBindingValues = interface; //com.twitter.sdk.android.core.models.BindingValues
  JMediaEntity = interface; //com.twitter.sdk.android.core.models.MediaEntity
  JTwitterCollection = interface; //com.twitter.sdk.android.core.models.TwitterCollection
  JApiErrors = interface; //com.twitter.sdk.android.core.models.ApiErrors
  JUser = interface; //com.twitter.sdk.android.core.models.User
  JSafeMapAdapter_1 = interface; //com.twitter.sdk.android.core.models.SafeMapAdapter$1
  JSafeListAdapter_1 = interface; //com.twitter.sdk.android.core.models.SafeListAdapter$1
  JTwitterCollection_Metadata_Position = interface; //com.twitter.sdk.android.core.models.TwitterCollection$Metadata$Position
  JVideoInfo = interface; //com.twitter.sdk.android.core.models.VideoInfo
  JTwitterCollection_TimelineItem_TweetItem = interface; //com.twitter.sdk.android.core.models.TwitterCollection$TimelineItem$TweetItem
  JTweet = interface; //com.twitter.sdk.android.core.models.Tweet
  JVideoInfo_Variant = interface; //com.twitter.sdk.android.core.models.VideoInfo$Variant
  JTweetBuilder = interface; //com.twitter.sdk.android.core.models.TweetBuilder
  JTweetEntities = interface; //com.twitter.sdk.android.core.models.TweetEntities
  JImage = interface; //com.twitter.sdk.android.core.models.Image
  JSearchMetadata = interface; //com.twitter.sdk.android.core.models.SearchMetadata
  JUserEntities = interface; //com.twitter.sdk.android.core.models.UserEntities
  JUrlEntity = interface; //com.twitter.sdk.android.core.models.UrlEntity
  JSymbolEntity = interface; //com.twitter.sdk.android.core.models.SymbolEntity
  JMediaEntity_Size = interface; //com.twitter.sdk.android.core.models.MediaEntity$Size
  JMentionEntity = interface; //com.twitter.sdk.android.core.models.MentionEntity
  JModelUtils = interface; //com.twitter.sdk.android.core.models.ModelUtils
  JSearch = interface; //com.twitter.sdk.android.core.models.Search
  JSafeListAdapter = interface; //com.twitter.sdk.android.core.models.SafeListAdapter
  JConfiguration = interface; //com.twitter.sdk.android.core.models.Configuration
  JApiError = interface; //com.twitter.sdk.android.core.models.ApiError
  JTwitterSession_Serializer = interface; //com.twitter.sdk.android.core.TwitterSession$Serializer
  JTwitter = interface; //com.twitter.sdk.android.core.Twitter
  JTwitterApiClient = interface; //com.twitter.sdk.android.core.TwitterApiClient
  JGuestSessionProvider_1 = interface; //com.twitter.sdk.android.core.GuestSessionProvider$1
  JSession = interface; //com.twitter.sdk.android.core.Session
  JTwitterApiErrorConstants = interface; //com.twitter.sdk.android.core.TwitterApiErrorConstants
  JBuildConfig = interface; //com.twitter.sdk.android.core.BuildConfig
  JTwitterAuthToken = interface; //com.twitter.sdk.android.core.TwitterAuthToken
  JTwitterException = interface; //com.twitter.sdk.android.core.TwitterException
  JTwitterContext = interface; //com.twitter.sdk.android.core.TwitterContext
  JMediaService = interface; //com.twitter.sdk.android.core.services.MediaService
  JCollectionService = interface; //com.twitter.sdk.android.core.services.CollectionService
  JFavoriteService = interface; //com.twitter.sdk.android.core.services.FavoriteService
  JStatusesService = interface; //com.twitter.sdk.android.core.services.StatusesService
  JSearchService = interface; //com.twitter.sdk.android.core.services.SearchService
  JAccountService = interface; //com.twitter.sdk.android.core.services.AccountService
  JConfigurationService = interface; //com.twitter.sdk.android.core.services.ConfigurationService
  JListService = interface; //com.twitter.sdk.android.core.services.ListService
  JGeocode = interface; //com.twitter.sdk.android.core.services.params.Geocode
  JGeocode_Distance = interface; //com.twitter.sdk.android.core.services.params.Geocode$Distance
  JDefaultLogger = interface; //com.twitter.sdk.android.core.DefaultLogger
  JOAuthSigning = interface; //com.twitter.sdk.android.core.OAuthSigning
  JGuestSessionProvider = interface; //com.twitter.sdk.android.core.GuestSessionProvider
  JGuestSession = interface; //com.twitter.sdk.android.core.GuestSession
  JTwitterAuthConfig = interface; //com.twitter.sdk.android.core.TwitterAuthConfig
  JResult = interface; //com.twitter.sdk.android.core.Result
  JTwitterRateLimit = interface; //com.twitter.sdk.android.core.TwitterRateLimit
  JAuthTokenAdapter = interface; //com.twitter.sdk.android.core.AuthTokenAdapter
  JTwitterConfig_1 = interface; //com.twitter.sdk.android.core.TwitterConfig$1
  JLogger = interface; //com.twitter.sdk.android.core.Logger
  JPersistedSessionManager = interface; //com.twitter.sdk.android.core.PersistedSessionManager
  JSessionManager = interface; //com.twitter.sdk.android.core.SessionManager
  JTwitterSession = interface; //com.twitter.sdk.android.core.TwitterSession
  JSystemCurrentTimeProvider = interface; //com.twitter.sdk.android.core.internal.SystemCurrentTimeProvider
  JTwitterApiConstants_Errors = interface; //com.twitter.sdk.android.core.internal.TwitterApiConstants$Errors
  JTwitterSessionVerifier = interface; //com.twitter.sdk.android.core.internal.TwitterSessionVerifier
  JAdvertisingInfoServiceStrategy_AdvertisingConnection = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfoServiceStrategy$AdvertisingConnection
  JUserUtils = interface; //com.twitter.sdk.android.core.internal.UserUtils
  JUserUtils_1 = interface; //com.twitter.sdk.android.core.internal.UserUtils$1
  JActivityLifecycleManager_Callbacks = interface; //com.twitter.sdk.android.core.internal.ActivityLifecycleManager$Callbacks
  JSessionMonitor_MonitorState = interface; //com.twitter.sdk.android.core.internal.SessionMonitor$MonitorState
  JSessionVerifier = interface; //com.twitter.sdk.android.core.internal.SessionVerifier
  JSessionMonitor = interface; //com.twitter.sdk.android.core.internal.SessionMonitor
  JPreferenceStoreImpl = interface; //com.twitter.sdk.android.core.internal.persistence.PreferenceStoreImpl
  JPreferenceStore = interface; //com.twitter.sdk.android.core.internal.persistence.PreferenceStore
  JFileStoreImpl = interface; //com.twitter.sdk.android.core.internal.persistence.FileStoreImpl
  JPersistenceStrategy = interface; //com.twitter.sdk.android.core.internal.persistence.PersistenceStrategy
  JPreferenceStoreStrategy = interface; //com.twitter.sdk.android.core.internal.persistence.PreferenceStoreStrategy
  JFileStore = interface; //com.twitter.sdk.android.core.internal.persistence.FileStore
  JSerializationStrategy = interface; //com.twitter.sdk.android.core.internal.persistence.SerializationStrategy
  JGuestTokenResponse = interface; //com.twitter.sdk.android.core.internal.oauth.GuestTokenResponse
  JGuestAuthToken = interface; //com.twitter.sdk.android.core.internal.oauth.GuestAuthToken
  JOAuth1aService_1 = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth1aService$1
  JOAuthConstants = interface; //com.twitter.sdk.android.core.internal.oauth.OAuthConstants
  JOAuth2Service_OAuth2Api = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth2Service$OAuth2Api
  JOAuthResponse_1 = interface; //com.twitter.sdk.android.core.internal.oauth.OAuthResponse$1
  JOAuthService = interface; //com.twitter.sdk.android.core.internal.oauth.OAuthService
  JOAuth1aService = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth1aService
  JOAuthResponse = interface; //com.twitter.sdk.android.core.internal.oauth.OAuthResponse
  JOAuth1aService_OAuthApi = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth1aService$OAuthApi
  JOAuth1aParameters = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth1aParameters
  JOAuth2Token = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth2Token
  JOAuthService_1 = interface; //com.twitter.sdk.android.core.internal.oauth.OAuthService$1
  JOAuth1aHeaders = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth1aHeaders
  JOAuth2Service_1 = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth2Service$1
  JOAuth2Service_1_1 = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth2Service$1$1
  JOAuth2Service = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth2Service
  JOAuth2Token_1 = interface; //com.twitter.sdk.android.core.internal.oauth.OAuth2Token$1
  JTwitterApiConstants = interface; //com.twitter.sdk.android.core.internal.TwitterApiConstants
  JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper = interface; //com.twitter.sdk.android.core.internal.ActivityLifecycleManager$ActivityLifecycleCallbacksWrapper
  JActivityLifecycleManager = interface; //com.twitter.sdk.android.core.internal.ActivityLifecycleManager
  JTwitterApi = interface; //com.twitter.sdk.android.core.internal.TwitterApi
  JGuestAuthInterceptor = interface; //com.twitter.sdk.android.core.internal.network.GuestAuthInterceptor
  JGuestAuthenticator = interface; //com.twitter.sdk.android.core.internal.network.GuestAuthenticator
  JUrlUtils = interface; //com.twitter.sdk.android.core.internal.network.UrlUtils
  JGuestAuthNetworkInterceptor = interface; //com.twitter.sdk.android.core.internal.network.GuestAuthNetworkInterceptor
  JOAuth1aInterceptor = interface; //com.twitter.sdk.android.core.internal.network.OAuth1aInterceptor
  JOkHttpClientHelper = interface; //com.twitter.sdk.android.core.internal.network.OkHttpClientHelper
  JAdvertisingInfoProvider_1 = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfoProvider$1
  JAdvertisingInfoServiceStrategy_1 = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfoServiceStrategy$1
  JExecutorUtils_2 = interface; //com.twitter.sdk.android.core.internal.ExecutorUtils$2
  JUserUtils_AvatarSize = interface; //com.twitter.sdk.android.core.internal.UserUtils$AvatarSize
  JCurrentTimeProvider = interface; //com.twitter.sdk.android.core.internal.CurrentTimeProvider
  JAdvertisingInfoServiceStrategy = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfoServiceStrategy
  JIdManager = interface; //com.twitter.sdk.android.core.internal.IdManager
  JAdvertisingInfoProvider = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfoProvider
  JCommonUtils = interface; //com.twitter.sdk.android.core.internal.CommonUtils
  JAdvertisingInfoServiceStrategy_AdvertisingInterface = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfoServiceStrategy$AdvertisingInterface
  JExecutorUtils = interface; //com.twitter.sdk.android.core.internal.ExecutorUtils
  JAdvertisingInfo = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfo
  JAdvertisingInfoReflectionStrategy = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfoReflectionStrategy
  JExecutorUtils_1 = interface; //com.twitter.sdk.android.core.internal.ExecutorUtils$1
  JEventNamespace_Builder = interface; //com.twitter.sdk.android.core.internal.scribe.EventNamespace$Builder
  JFileRollOverManager = interface; //com.twitter.sdk.android.core.internal.scribe.FileRollOverManager
  JScribeItem_1 = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeItem$1
  JEventsManager = interface; //com.twitter.sdk.android.core.internal.scribe.EventsManager
  JScribeItem_CardEvent = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeItem$CardEvent
  JEventsStorage = interface; //com.twitter.sdk.android.core.internal.scribe.EventsStorage
  JEnabledScribeStrategy = interface; //com.twitter.sdk.android.core.internal.scribe.EnabledScribeStrategy
  JSyndicatedSdkImpressionEvent_ExternalIds = interface; //com.twitter.sdk.android.core.internal.scribe.SyndicatedSdkImpressionEvent$ExternalIds
  JEventNamespace = interface; //com.twitter.sdk.android.core.internal.scribe.EventNamespace
  JTwitterCoreScribeClientHolder = interface; //com.twitter.sdk.android.core.internal.scribe.TwitterCoreScribeClientHolder
  JScribeConfig = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeConfig
  JFilesSender = interface; //com.twitter.sdk.android.core.internal.scribe.FilesSender
  JQueueFile_1 = interface; //com.twitter.sdk.android.core.internal.scribe.QueueFile$1
  JEventsStrategy = interface; //com.twitter.sdk.android.core.internal.scribe.EventsStrategy
  JSyndicationClientEvent_ExternalIds = interface; //com.twitter.sdk.android.core.internal.scribe.SyndicationClientEvent$ExternalIds
  JDefaultScribeClient = interface; //com.twitter.sdk.android.core.internal.scribe.DefaultScribeClient
  JDisabledEventsStrategy = interface; //com.twitter.sdk.android.core.internal.scribe.DisabledEventsStrategy
  JEventsFilesManager_1 = interface; //com.twitter.sdk.android.core.internal.scribe.EventsFilesManager$1
  JQueueFile_Element = interface; //com.twitter.sdk.android.core.internal.scribe.QueueFile$Element
  JTimeBasedFileRollOverRunnable = interface; //com.twitter.sdk.android.core.internal.scribe.TimeBasedFileRollOverRunnable
  JEventTransform = interface; //com.twitter.sdk.android.core.internal.scribe.EventTransform
  JEventsHandler_1 = interface; //com.twitter.sdk.android.core.internal.scribe.EventsHandler$1
  JEventsStorageListener = interface; //com.twitter.sdk.android.core.internal.scribe.EventsStorageListener
  JQueueFile_ElementInputStream = interface; //com.twitter.sdk.android.core.internal.scribe.QueueFile$ElementInputStream
  JQueueFile_ElementReader = interface; //com.twitter.sdk.android.core.internal.scribe.QueueFile$ElementReader
  JScribeItem_Builder = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeItem$Builder
  JScribeFilesSender_ConfigRequestInterceptor = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeFilesSender$ConfigRequestInterceptor
  JEventsFilesManager_FileWithTimestamp = interface; //com.twitter.sdk.android.core.internal.scribe.EventsFilesManager$FileWithTimestamp
  JScribeItem_MediaDetails = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeItem$MediaDetails
  JEnabledEventsStrategy = interface; //com.twitter.sdk.android.core.internal.scribe.EnabledEventsStrategy
  JScribeEvent = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeEvent
  JEventsHandler_3 = interface; //com.twitter.sdk.android.core.internal.scribe.EventsHandler$3
  JScribeClient = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeClient
  JEventsHandler_2 = interface; //com.twitter.sdk.android.core.internal.scribe.EventsHandler$2
  JSyndicatedSdkImpressionEvent = interface; //com.twitter.sdk.android.core.internal.scribe.SyndicatedSdkImpressionEvent
  JScribeFilesSender = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeFilesSender
  JScribeFilesManager = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeFilesManager
  JScribeFilesSender_1 = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeFilesSender$1
  JQueueFile = interface; //com.twitter.sdk.android.core.internal.scribe.QueueFile
  JScribeEvent_Transform = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeEvent$Transform
  JScribeFilesSender_ScribeService = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeFilesSender$ScribeService
  JEventsHandler_4 = interface; //com.twitter.sdk.android.core.internal.scribe.EventsHandler$4
  JScribeEventFactory = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeEventFactory
  JQueueFileEventStorage = interface; //com.twitter.sdk.android.core.internal.scribe.QueueFileEventStorage
  JEventsFilesManager = interface; //com.twitter.sdk.android.core.internal.scribe.EventsFilesManager
  JScribeHandler = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeHandler
  JScribeItem = interface; //com.twitter.sdk.android.core.internal.scribe.ScribeItem
  JEventsHandler = interface; //com.twitter.sdk.android.core.internal.scribe.EventsHandler
  JSyndicationClientEvent = interface; //com.twitter.sdk.android.core.internal.scribe.SyndicationClientEvent
  JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper_1 = interface; //com.twitter.sdk.android.core.internal.ActivityLifecycleManager$ActivityLifecycleCallbacksWrapper$1
  JSessionMonitor_1 = interface; //com.twitter.sdk.android.core.internal.SessionMonitor$1
  JVineCardUtils = interface; //com.twitter.sdk.android.core.internal.VineCardUtils
  JAdvertisingInfoStrategy = interface; //com.twitter.sdk.android.core.internal.AdvertisingInfoStrategy
  JTwitterSessionVerifier_AccountServiceProvider = interface; //com.twitter.sdk.android.core.internal.TwitterSessionVerifier$AccountServiceProvider
  JSessionMonitor_2 = interface; //com.twitter.sdk.android.core.internal.SessionMonitor$2
  JAuthToken = interface; //com.twitter.sdk.android.core.AuthToken
  JTwitterAuthConfig_1 = interface; //com.twitter.sdk.android.core.TwitterAuthConfig$1
  JTwitterAuthToken_1 = interface; //com.twitter.sdk.android.core.TwitterAuthToken$1
  JTwitterApiException = interface; //com.twitter.sdk.android.core.TwitterApiException
  JTwitterConfig = interface; //com.twitter.sdk.android.core.TwitterConfig
  JGuestSession_Serializer = interface; //com.twitter.sdk.android.core.GuestSession$Serializer
  JTwitterAuthException = interface; //com.twitter.sdk.android.core.TwitterAuthException
  JTwitterCore_1 = interface; //com.twitter.sdk.android.core.TwitterCore$1
  JTwitterConfig_Builder = interface; //com.twitter.sdk.android.core.TwitterConfig$Builder
  JTwitterLoginButton_1 = interface; //com.twitter.sdk.android.core.identity.TwitterLoginButton$1
  JOAuthWebViewClient = interface; //com.twitter.sdk.android.core.identity.OAuthWebViewClient
  JWebViewException = interface; //com.twitter.sdk.android.core.identity.WebViewException
  JOAuthHandler = interface; //com.twitter.sdk.android.core.identity.OAuthHandler
  JOAuthController_1 = interface; //com.twitter.sdk.android.core.identity.OAuthController$1
  JOAuthController = interface; //com.twitter.sdk.android.core.identity.OAuthController
  JOAuthController_Listener = interface; //com.twitter.sdk.android.core.identity.OAuthController$Listener
  JOAuthWebViewClient_Listener = interface; //com.twitter.sdk.android.core.identity.OAuthWebViewClient$Listener
  JOAuthActivity = interface; //com.twitter.sdk.android.core.identity.OAuthActivity
  JTwitterAuthClient_AuthStateLazyHolder = interface; //com.twitter.sdk.android.core.identity.TwitterAuthClient$AuthStateLazyHolder
  JAuthHandler = interface; //com.twitter.sdk.android.core.identity.AuthHandler
  JAuthState = interface; //com.twitter.sdk.android.core.identity.AuthState
  JTwitterLoginButton_LoginClickListener = interface; //com.twitter.sdk.android.core.identity.TwitterLoginButton$LoginClickListener
  JOAuthWebChromeClient = interface; //com.twitter.sdk.android.core.identity.OAuthWebChromeClient
  JTwitterLoginButton = interface; //com.twitter.sdk.android.core.identity.TwitterLoginButton
  JTwitterAuthClient = interface; //com.twitter.sdk.android.core.identity.TwitterAuthClient
  JOAuthController_2 = interface; //com.twitter.sdk.android.core.identity.OAuthController$2
  JTwitterAuthClient_CallbackWrapper = interface; //com.twitter.sdk.android.core.identity.TwitterAuthClient$CallbackWrapper
  JSSOAuthHandler = interface; //com.twitter.sdk.android.core.identity.SSOAuthHandler
  JTwitterAuthClient_1 = interface; //com.twitter.sdk.android.core.identity.TwitterAuthClient$1
  JIntentUtils = interface; //com.twitter.sdk.android.core.IntentUtils
  JCallback = interface; //com.twitter.sdk.android.core.Callback

// ===== Interface declarations =====

  JTwitterCoreClass = interface(JObjectClass)
  ['{D9D58DC5-E73F-4334-99D6-A5AB8348027F}']
    { static Property Methods }
    {class} function _GetTAG: JString;

    { static Methods }
    {class} function getInstance: JTwitterCore; cdecl;

    { static Property }
    {class} property TAG: JString read _GetTAG;
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterCore')]
  JTwitterCore = interface(JObject)
  ['{22562348-4054-4704-AACF-4EBF5D22EEA4}']
    { Property Methods }

    { methods }
    function getVersion: JString; cdecl;
    function getAuthConfig: JTwitterAuthConfig; cdecl;
    function getIdentifier: JString; cdecl;
    function getSessionManager: JSessionManager; cdecl;
    function getGuestSessionProvider: JGuestSessionProvider; cdecl;
    function getApiClient: JTwitterApiClient; cdecl; overload;
    function getApiClient(session: JTwitterSession): JTwitterApiClient; cdecl; overload;
    procedure addGuestApiClient(customTwitterApiClient: JTwitterApiClient); cdecl;
    procedure addApiClient(session: JTwitterSession; customTwitterApiClient: JTwitterApiClient); cdecl;
    function getGuestApiClient: JTwitterApiClient; cdecl;

    { Property }
  end;

  TJTwitterCore = class(TJavaGenericImport<JTwitterCoreClass, JTwitterCore>) end;

  JEntityClass = interface(JObjectClass)
  ['{E7CA5EF2-C863-4145-B583-866944B7F098}']
    { static Property Methods }

    { static Methods }
    {class} function init(start: Integer; aend: Integer): JEntity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Entity')]
  JEntity = interface(JObject)
  ['{DEBF4BE0-68F3-4768-A9E4-AFBB6808A18A}']
    { Property Methods }
    function _Getindices: JList;
    procedure _Setindices(aindices: JList);

    { methods }
    function getStart: Integer; cdecl;
    function getEnd: Integer; cdecl;

    { Property }
    property indices: JList read _Getindices write _Setindices;
  end;

  TJEntity = class(TJavaGenericImport<JEntityClass, JEntity>) end;

  JPlaceClass = interface(JObjectClass)
  ['{E98CF871-B4E5-4E52-87D9-73807655FD48}']
    { static Property Methods }

    { static Methods }
    {class} function init(attributes: JMap; boundingBox: JPlace_BoundingBox; country: JString; countryCode: JString; fullName: JString; id: JString; name: JString; placeType: JString; url: JString): JPlace; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Place')]
  JPlace = interface(JObject)
  ['{794068EA-E484-4257-83BB-D9459953938B}']
    { Property Methods }
    function _Getattributes: JMap;
    procedure _Setattributes(aattributes: JMap);
    function _GetboundingBox: JPlace_BoundingBox;
    procedure _SetboundingBox(aboundingBox: JPlace_BoundingBox);
    function _Getcountry: JString;
    procedure _Setcountry(acountry: JString);
    function _GetcountryCode: JString;
    procedure _SetcountryCode(acountryCode: JString);
    function _GetfullName: JString;
    procedure _SetfullName(afullName: JString);
    function _Getid: JString;
    procedure _Setid(aid: JString);
    function _Getname: JString;
    procedure _Setname(aname: JString);
    function _GetplaceType: JString;
    procedure _SetplaceType(aplaceType: JString);
    function _Geturl: JString;
    procedure _Seturl(aurl: JString);

    { methods }

    { Property }
    property attributes: JMap read _Getattributes write _Setattributes;
    property boundingBox: JPlace_BoundingBox read _GetboundingBox write _SetboundingBox;
    property country: JString read _Getcountry write _Setcountry;
    property countryCode: JString read _GetcountryCode write _SetcountryCode;
    property fullName: JString read _GetfullName write _SetfullName;
    property id: JString read _Getid write _Setid;
    property name: JString read _Getname write _Setname;
    property placeType: JString read _GetplaceType write _SetplaceType;
    property url: JString read _Geturl write _Seturl;
  end;

  TJPlace = class(TJavaGenericImport<JPlaceClass, JPlace>) end;

  JCoordinatesClass = interface(JObjectClass)
  ['{F230BFFC-B13D-4E61-B1F0-B7324968E6EE}']
    { static Property Methods }
    {class} function _GetINDEX_LONGITUDE: Integer;
    {class} function _GetINDEX_LATITUDE: Integer;

    { static Methods }
    {class} function init(longitude: JDouble; latitude: JDouble; atype: JString): JCoordinates; cdecl;

    { static Property }
    {class} property INDEX_LONGITUDE: Integer read _GetINDEX_LONGITUDE;
    {class} property INDEX_LATITUDE: Integer read _GetINDEX_LATITUDE;
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Coordinates')]
  JCoordinates = interface(JObject)
  ['{1513E154-10FB-4A32-9661-E7E0BC14D3A0}']
    { Property Methods }
    function _Getcoordinates: JList;
    procedure _Setcoordinates(acoordinates: JList);
    function _Gettype: JString;
    procedure _Settype(atype: JString);

    { methods }
    function getLongitude: JDouble; cdecl;
    function getLatitude: JDouble; cdecl;

    { Property }
    property coordinates: JList read _Getcoordinates write _Setcoordinates;
    property &type: JString read _Gettype write _Settype;
  end;

  TJCoordinates = class(TJavaGenericImport<JCoordinatesClass, JCoordinates>) end;

  JTwitterCollection_TimelineItemClass = interface(JObjectClass)
  ['{DC313E48-AC36-4081-AB6F-D31A53C8049A}']
    { static Property Methods }

    { static Methods }
    {class} function init(tweetItem: JTwitterCollection_TimelineItem_TweetItem): JTwitterCollection_TimelineItem; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/TwitterCollection$TimelineItem')]
  JTwitterCollection_TimelineItem = interface(JObject)
  ['{02EA22D9-8A0B-4A72-BF23-ADABA2579B7C}']
    { Property Methods }
    function _GettweetItem: JTwitterCollection_TimelineItem_TweetItem;
    procedure _SettweetItem(atweetItem: JTwitterCollection_TimelineItem_TweetItem);

    { methods }

    { Property }
    property tweetItem: JTwitterCollection_TimelineItem_TweetItem read _GettweetItem write _SettweetItem;
  end;

  TJTwitterCollection_TimelineItem = class(TJavaGenericImport<JTwitterCollection_TimelineItemClass, JTwitterCollection_TimelineItem>) end;

  JTwitterCollection_ContentClass = interface(JObjectClass)
  ['{E63C3C3A-9CD1-40A9-86F8-C895CD8AC3CB}']
    { static Property Methods }

    { static Methods }
    {class} function init(tweetMap: JMap; userMap: JMap): JTwitterCollection_Content; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/TwitterCollection$Content')]
  JTwitterCollection_Content = interface(JObject)
  ['{56923C8D-9AF6-4555-A671-028BD2D2EC4A}']
    { Property Methods }
    function _GettweetMap: JMap;
    procedure _SettweetMap(atweetMap: JMap);
    function _GetuserMap: JMap;
    procedure _SetuserMap(auserMap: JMap);

    { methods }

    { Property }
    property tweetMap: JMap read _GettweetMap write _SettweetMap;
    property userMap: JMap read _GetuserMap write _SetuserMap;
  end;

  TJTwitterCollection_Content = class(TJavaGenericImport<JTwitterCollection_ContentClass, JTwitterCollection_Content>) end;

  JPlace_BoundingBoxClass = interface(JObjectClass)
  ['{F0823B34-BB5C-4772-9F69-13F362E26E7D}']
    { static Property Methods }

    { static Methods }
    {class} function init(coordinates: JList; atype: JString): JPlace_BoundingBox; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Place$BoundingBox')]
  JPlace_BoundingBox = interface(JObject)
  ['{F0788B7E-9CC9-4ED0-BFEB-78165B6D7FA4}']
    { Property Methods }
    function _Getcoordinates: JList;
    procedure _Setcoordinates(acoordinates: JList);
    function _Gettype: JString;
    procedure _Settype(atype: JString);

    { methods }

    { Property }
    property coordinates: JList read _Getcoordinates write _Setcoordinates;
    property &type: JString read _Gettype write _Settype;
  end;

  TJPlace_BoundingBox = class(TJavaGenericImport<JPlace_BoundingBoxClass, JPlace_BoundingBox>) end;

  JHashtagEntityClass = interface(JObjectClass)
  ['{558FE1AE-B72D-40BB-BB8E-7FF8043DE095}']
    { static Property Methods }

    { static Methods }
    {class} function init(text: JString; start: Integer; aend: Integer): JHashtagEntity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/HashtagEntity')]
  JHashtagEntity = interface(JObject)
  ['{22896778-55DC-44D3-BBC5-4CC156E5AA11}']
    { Property Methods }
    function _Gettext: JString;
    procedure _Settext(atext: JString);

    { methods }
    function getEnd: Integer; cdecl;
    function getStart: Integer; cdecl;

    { Property }
    property text: JString read _Gettext write _Settext;
  end;

  TJHashtagEntity = class(TJavaGenericImport<JHashtagEntityClass, JHashtagEntity>) end;

  JMediaClass = interface(JObjectClass)
  ['{AD58B3E6-AC46-49CD-8740-7F45D8BAD337}']
    { static Property Methods }

    { static Methods }
    {class} function init(mediaID: Int64; mediaIdString: JString; P3: Int64; size: JImage): JMedia; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Media')]
  JMedia = interface(JObject)
  ['{2620ED34-8841-40B4-8DDE-57DBACFF5D05}']
    { Property Methods }
    function _GetmediaId: Int64;
    procedure _SetmediaId(amediaId: Int64);
    function _GetmediaIdString: JString;
    procedure _SetmediaIdString(amediaIdString: JString);
    function _Getsize: Int64;
    procedure _Setsize(asize: Int64);
    function _Getimage: JImage;
    procedure _Setimage(aimage: JImage);

    { methods }

    { Property }
    property mediaId: Int64 read _GetmediaId write _SetmediaId;
    property mediaIdString: JString read _GetmediaIdString write _SetmediaIdString;
    property size: Int64 read _Getsize write _Setsize;
    property image: JImage read _Getimage write _Setimage;
  end;

  TJMedia = class(TJavaGenericImport<JMediaClass, JMedia>) end;

  JBindingValuesAdapterClass = interface(JObjectClass)
  ['{0071CDA0-BB39-4994-A802-D64546AADDD9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBindingValuesAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/BindingValuesAdapter')]
  JBindingValuesAdapter = interface(JObject)
  ['{69ED60AD-036D-486F-8742-9B06430CDA79}']
    { Property Methods }

    { methods }
//    function serialize(src: JBindingValues; typeOfSrc: JType; context: JJsonSerializationContext): JJsonElement; cdecl; overload;
//    function deserialize(json: JJsonElement; typeOfT: JType; context: JJsonDeserializationContext): JBindingValues; cdecl; overload;
//    function serialize(P1: JObject; P2: JType; P3: JJsonSerializationContext): JJsonElement; cdecl; overload;
//    function deserialize(P1: JJsonElement; P2: JType; P3: JJsonDeserializationContext): JObject; cdecl; overload;

    { Property }
  end;

  TJBindingValuesAdapter = class(TJavaGenericImport<JBindingValuesAdapterClass, JBindingValuesAdapter>) end;

  JMediaEntity_SizesClass = interface(JObjectClass)
  ['{1458372B-6392-4877-AA45-291667E492C4}']
    { static Property Methods }

    { static Methods }
    {class} function init(thumb: JMediaEntity_Size; small: JMediaEntity_Size; medium: JMediaEntity_Size; large: JMediaEntity_Size): JMediaEntity_Sizes; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/MediaEntity$Sizes')]
  JMediaEntity_Sizes = interface(JObject)
  ['{B23E42BD-E588-41C6-A203-3F9EA684EAD8}']
    { Property Methods }
    function _Getmedium: JMediaEntity_Size;
    procedure _Setmedium(amedium: JMediaEntity_Size);
    function _Getthumb: JMediaEntity_Size;
    procedure _Setthumb(athumb: JMediaEntity_Size);
    function _Getsmall: JMediaEntity_Size;
    procedure _Setsmall(asmall: JMediaEntity_Size);
    function _Getlarge: JMediaEntity_Size;
    procedure _Setlarge(alarge: JMediaEntity_Size);

    { methods }

    { Property }
    property medium: JMediaEntity_Size read _Getmedium write _Setmedium;
    property thumb: JMediaEntity_Size read _Getthumb write _Setthumb;
    property small: JMediaEntity_Size read _Getsmall write _Setsmall;
    property large: JMediaEntity_Size read _Getlarge write _Setlarge;
  end;

  TJMediaEntity_Sizes = class(TJavaGenericImport<JMediaEntity_SizesClass, JMediaEntity_Sizes>) end;

  JIdentifiableClass = interface(JObjectClass)
  ['{A04BB8E5-B8DF-4626-917B-BA46C9EE8C90}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Identifiable')]
  JIdentifiable = interface(IJavaInstance)
  ['{9308D3C6-6C0D-4BC0-8EE8-53980491C29D}']
    { Property Methods }

    { methods }
    function getId: Int64; cdecl;

    { Property }
  end;

  TJIdentifiable = class(TJavaGenericImport<JIdentifiableClass, JIdentifiable>) end;

  JCardClass = interface(JObjectClass)
  ['{8B984BBF-017A-4DE0-9801-2C6F9967B94F}']
    { static Property Methods }

    { static Methods }
    {class} function init(bindingValues: JBindingValues; name: JString): JCard; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Card')]
  JCard = interface(JObject)
  ['{09E05068-A166-48CD-94C0-79438BC1C6A9}']
    { Property Methods }
    function _GetbindingValues: JBindingValues;
    procedure _SetbindingValues(abindingValues: JBindingValues);
    function _Getname: JString;
    procedure _Setname(aname: JString);

    { methods }

    { Property }
    property bindingValues: JBindingValues read _GetbindingValues write _SetbindingValues;
    property name: JString read _Getname write _Setname;
  end;

  TJCard = class(TJavaGenericImport<JCardClass, JCard>) end;

  JUserBuilderClass = interface(JObjectClass)
  ['{707CD516-ECDD-4D9B-A19E-3F371E2E8CD6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUserBuilder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/UserBuilder')]
  JUserBuilder = interface(JObject)
  ['{9573426E-37C7-40B6-B112-F2897C210F17}']
    { Property Methods }

    { methods }
    function setContributorsEnabled(contributorsEnabled: Boolean): JUserBuilder; cdecl;
    function setCreatedAt(createdAt: JString): JUserBuilder; cdecl;
    function setDefaultProfile(defaultProfile: Boolean): JUserBuilder; cdecl;
    function setDefaultProfileImage(defaultProfileImage: Boolean): JUserBuilder; cdecl;
    function setDescription(description: JString): JUserBuilder; cdecl;
    function setEmail(email: JString): JUserBuilder; cdecl;
    function setEntities(entities: JUserEntities): JUserBuilder; cdecl;
    function setFavouritesCount(favouritesCount: Integer): JUserBuilder; cdecl;
    function setFollowRequestSent(followRequestSent: Boolean): JUserBuilder; cdecl;
    function setFollowersCount(followersCount: Integer): JUserBuilder; cdecl;
    function setFriendsCount(friendsCount: Integer): JUserBuilder; cdecl;
    function setGeoEnabled(geoEnabled: Boolean): JUserBuilder; cdecl;
    function setId(id: Int64): JUserBuilder; cdecl;
    function setIdStr(idStr: JString): JUserBuilder; cdecl;
    function setIsTranslator(isTranslator: Boolean): JUserBuilder; cdecl;
    function setLang(lang: JString): JUserBuilder; cdecl;
    function setListedCount(listedCount: Integer): JUserBuilder; cdecl;
    function setLocation(location: JString): JUserBuilder; cdecl;
    function setName(name: JString): JUserBuilder; cdecl;
    function setProfileBackgroundColor(profileBackgroundColor: JString): JUserBuilder; cdecl;
    function setProfileBackgroundImageUrl(profileBackgroundImageUrl: JString): JUserBuilder; cdecl;
    function setProfileBackgroundImageUrlHttps(profileBackgroundImageUrlHttps: JString): JUserBuilder; cdecl;
    function setProfileBackgroundTile(profileBackgroundTile: Boolean): JUserBuilder; cdecl;
    function setProfileBannerUrl(profileBannerUrl: JString): JUserBuilder; cdecl;
    function setProfileImageUrl(profileImageUrl: JString): JUserBuilder; cdecl;
    function setProfileImageUrlHttps(profileImageUrlHttps: JString): JUserBuilder; cdecl;
    function setProfileLinkColor(profileLinkColor: JString): JUserBuilder; cdecl;
    function setProfileSidebarBorderColor(profileSidebarBorderColor: JString): JUserBuilder; cdecl;
    function setProfileSidebarFillColor(profileSidebarFillColor: JString): JUserBuilder; cdecl;
    function setProfileTextColor(profileTextColor: JString): JUserBuilder; cdecl;
    function setProfileUseBackgroundImage(profileUseBackgroundImage: Boolean): JUserBuilder; cdecl;
    function setProtectedUser(protectedUser: Boolean): JUserBuilder; cdecl;
    function setScreenName(screenName: JString): JUserBuilder; cdecl;
    function setShowAllInlineMedia(showAllInlineMedia: Boolean): JUserBuilder; cdecl;
    function setStatus(status: JTweet): JUserBuilder; cdecl;
    function setStatusesCount(statusesCount: Integer): JUserBuilder; cdecl;
    function setTimeZone(timeZone: JString): JUserBuilder; cdecl;
    function setUrl(url: JString): JUserBuilder; cdecl;
    function setUtcOffset(utcOffset: Integer): JUserBuilder; cdecl;
    function setVerified(verified: Boolean): JUserBuilder; cdecl;
    function setWithheldInCountries(withheldInCountries: JList): JUserBuilder; cdecl;
    function setWithheldScope(withheldScope: JString): JUserBuilder; cdecl;
    function build: JUser; cdecl;

    { Property }
  end;

  TJUserBuilder = class(TJavaGenericImport<JUserBuilderClass, JUserBuilder>) end;

  JTwitterCollection_MetadataClass = interface(JObjectClass)
  ['{5C997E9D-4D48-468B-8A53-EBF80749A294}']
    { static Property Methods }

    { static Methods }
    {class} function init(timelineId: JString; position: JTwitterCollection_Metadata_Position; timelines: JList): JTwitterCollection_Metadata; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/TwitterCollection$Metadata')]
  JTwitterCollection_Metadata = interface(JObject)
  ['{57115AE4-31EA-4725-A93A-857F78427F68}']
    { Property Methods }
    function _GettimelineId: JString;
    procedure _SettimelineId(atimelineId: JString);
    function _Getposition: JTwitterCollection_Metadata_Position;
    procedure _Setposition(aposition: JTwitterCollection_Metadata_Position);
    function _GettimelineItems: JList;
    procedure _SettimelineItems(atimelineItems: JList);

    { methods }

    { Property }
    property timelineId: JString read _GettimelineId write _SettimelineId;
    property position: JTwitterCollection_Metadata_Position read _Getposition write _Setposition;
    property timelineItems: JList read _GettimelineItems write _SettimelineItems;
  end;

  TJTwitterCollection_Metadata = class(TJavaGenericImport<JTwitterCollection_MetadataClass, JTwitterCollection_Metadata>) end;

  JSafeMapAdapterClass = interface(JObjectClass)
  ['{055E0584-E085-4B70-9273-9474C296A6BF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSafeMapAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/SafeMapAdapter')]
  JSafeMapAdapter = interface(JObject)
  ['{5D7E0792-6696-47C3-A10C-C5DDE18F3F82}']
    { Property Methods }

    { methods }
//    function create(gson: JGson; tokenType: JTypeToken): JTypeAdapter; cdecl;

    { Property }
  end;

  TJSafeMapAdapter = class(TJavaGenericImport<JSafeMapAdapterClass, JSafeMapAdapter>) end;

  JUserValueClass = interface(JObjectClass)
  ['{59C7D8EA-D582-4D3C-A669-D65E7BF4C079}']
    { static Property Methods }

    { static Methods }
    {class} function init(idStr: JString): JUserValue; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/UserValue')]
  JUserValue = interface(JObject)
  ['{AFDE90B6-A25D-499B-AD79-8CA8E61BD830}']
    { Property Methods }
    function _GetidStr: JString;
    procedure _SetidStr(aidStr: JString);

    { methods }

    { Property }
    property idStr: JString read _GetidStr write _SetidStr;
  end;

  TJUserValue = class(TJavaGenericImport<JUserValueClass, JUserValue>) end;

  JImageValueClass = interface(JObjectClass)
  ['{A939EF9F-6BAA-4284-A6C8-C5F4B569E183}']
    { static Property Methods }

    { static Methods }
    {class} function init(height: Integer; width: Integer; url: JString; alt: JString): JImageValue; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/ImageValue')]
  JImageValue = interface(JObject)
  ['{4D000884-2CD5-4E71-8EDD-6DE187EA8168}']
    { Property Methods }
    function _Getheight: Integer;
    procedure _Setheight(aheight: Integer);
    function _Getwidth: Integer;
    procedure _Setwidth(awidth: Integer);
    function _Geturl: JString;
    procedure _Seturl(aurl: JString);
    function _Getalt: JString;
    procedure _Setalt(aalt: JString);

    { methods }

    { Property }
    property height: Integer read _Getheight write _Setheight;
    property width: Integer read _Getwidth write _Setwidth;
    property url: JString read _Geturl write _Seturl;
    property alt: JString read _Getalt write _Setalt;
  end;

  TJImageValue = class(TJavaGenericImport<JImageValueClass, JImageValue>) end;

  JUserEntities_UrlEntitiesClass = interface(JObjectClass)
  ['{4DE0391A-3F74-4663-980A-458920263695}']
    { static Property Methods }

    { static Methods }
    {class} function init(urls: JList): JUserEntities_UrlEntities; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/UserEntities$UrlEntities')]
  JUserEntities_UrlEntities = interface(JObject)
  ['{2AB89B4E-CC61-4AB6-9242-B7BDB6C3D085}']
    { Property Methods }
    function _Geturls: JList;
    procedure _Seturls(aurls: JList);

    { methods }

    { Property }
    property urls: JList read _Geturls write _Seturls;
  end;

  TJUserEntities_UrlEntities = class(TJavaGenericImport<JUserEntities_UrlEntitiesClass, JUserEntities_UrlEntities>) end;

  JBindingValuesClass = interface(JObjectClass)
  ['{F289B8CA-52FD-4D65-AA2B-F139EE27F35E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBindingValues; cdecl; overload;
    {class} function init(bindingValues: JMap): JBindingValues; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/BindingValues')]
  JBindingValues = interface(JObject)
  ['{1C9C0789-A0A6-43C1-8604-816B6FC863E1}']
    { Property Methods }

    { methods }
    function containsKey(key: JString): Boolean; cdecl;
    function get(key: JString): JObject; cdecl;

    { Property }
  end;

  TJBindingValues = class(TJavaGenericImport<JBindingValuesClass, JBindingValues>) end;

  JMediaEntityClass = interface(JObjectClass)
  ['{3F46699A-2F79-4EDD-B85A-1B82AC76FA0E}']
    { static Property Methods }

    { static Methods }
    {class} function init(url: JString; expandedUrl: JString; displayUrl: JString; start: Integer; aend: Integer; id: Int64; idStr: JString; P8: JString; mediaUrl: JString; mediaUrlHttps: JMediaEntity_Sizes; sizes: Int64; sourceStatusId: JString; atype: JString; sourceStatusIdStr: JVideoInfo; P15: JString): JMediaEntity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/MediaEntity')]
  JMediaEntity = interface(JObject)
  ['{12195294-4F7D-4193-ACFF-6CA4C8954026}']
    { Property Methods }
    function _Getid: Int64;
    procedure _Setid(aid: Int64);
    function _GetidStr: JString;
    procedure _SetidStr(aidStr: JString);
    function _GetmediaUrl: JString;
    procedure _SetmediaUrl(amediaUrl: JString);
    function _GetmediaUrlHttps: JString;
    procedure _SetmediaUrlHttps(amediaUrlHttps: JString);
    function _Getsizes: JMediaEntity_Sizes;
    procedure _Setsizes(asizes: JMediaEntity_Sizes);
    function _GetsourceStatusId: Int64;
    procedure _SetsourceStatusId(asourceStatusId: Int64);
    function _GetsourceStatusIdStr: JString;
    procedure _SetsourceStatusIdStr(asourceStatusIdStr: JString);
    function _Gettype: JString;
    procedure _Settype(atype: JString);
    function _GetvideoInfo: JVideoInfo;
    procedure _SetvideoInfo(avideoInfo: JVideoInfo);
    function _GetaltText: JString;
    procedure _SetaltText(aaltText: JString);

    { methods }

    { Property }
    property id: Int64 read _Getid write _Setid;
    property idStr: JString read _GetidStr write _SetidStr;
    property mediaUrl: JString read _GetmediaUrl write _SetmediaUrl;
    property mediaUrlHttps: JString read _GetmediaUrlHttps write _SetmediaUrlHttps;
    property sizes: JMediaEntity_Sizes read _Getsizes write _Setsizes;
    property sourceStatusId: Int64 read _GetsourceStatusId write _SetsourceStatusId;
    property sourceStatusIdStr: JString read _GetsourceStatusIdStr write _SetsourceStatusIdStr;
    property &type: JString read _Gettype write _Settype;
    property videoInfo: JVideoInfo read _GetvideoInfo write _SetvideoInfo;
    property altText: JString read _GetaltText write _SetaltText;
  end;

  TJMediaEntity = class(TJavaGenericImport<JMediaEntityClass, JMediaEntity>) end;

  JTwitterCollectionClass = interface(JObjectClass)
  ['{06389343-0008-4F93-AC20-DBE4036BCAA8}']
    { static Property Methods }

    { static Methods }
    {class} function init(contents: JTwitterCollection_Content; metadata: JTwitterCollection_Metadata): JTwitterCollection; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/TwitterCollection')]
  JTwitterCollection = interface(JObject)
  ['{706ADF75-3ABE-4C84-853B-243D729F42D4}']
    { Property Methods }
    function _Getcontents: JTwitterCollection_Content;
    procedure _Setcontents(acontents: JTwitterCollection_Content);
    function _Getmetadata: JTwitterCollection_Metadata;
    procedure _Setmetadata(ametadata: JTwitterCollection_Metadata);

    { methods }

    { Property }
    property contents: JTwitterCollection_Content read _Getcontents write _Setcontents;
    property metadata: JTwitterCollection_Metadata read _Getmetadata write _Setmetadata;
  end;

  TJTwitterCollection = class(TJavaGenericImport<JTwitterCollectionClass, JTwitterCollection>) end;

  JApiErrorsClass = interface(JObjectClass)
  ['{098237A9-6D44-4584-80F3-031134614106}']
    { static Property Methods }

    { static Methods }
    {class} function init(errors: JList): JApiErrors; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/ApiErrors')]
  JApiErrors = interface(JObject)
  ['{696D29E7-B365-4B75-B96D-FF9206DDCDAC}']
    { Property Methods }
    function _Geterrors: JList;
    procedure _Seterrors(aerrors: JList);

    { methods }

    { Property }
    property errors: JList read _Geterrors write _Seterrors;
  end;

  TJApiErrors = class(TJavaGenericImport<JApiErrorsClass, JApiErrors>) end;

  JUserClass = interface(JObjectClass)
  ['{081A25C9-30D1-4FC6-87A3-476DE1C43A9F}']
    { static Property Methods }
    {class} function _GetINVALID_ID: Int64;

    { static Methods }
    {class} function init(contributorsEnabled: Boolean; createdAt: JString; defaultProfile: Boolean; defaultProfileImage: Boolean; description: JString; emailAddress: JString; entities: JUserEntities; favouritesCount: Integer; followRequestSent: Boolean; followersCount: Integer; friendsCount: Integer; geoEnabled: Boolean; id: Int64; idStr: JString; P15: Boolean; isTranslator: JString; lang: Integer; listedCount: JString; location: JString; name: JString; profileBackgroundColor: JString; profileBackgroundImageUrl: JString; profileBackgroundImageUrlHttps: Boolean; profileBackgroundTile: JString; profileBannerUrl: JString; profileImageUrl: JString; profileImageUrlHttps: JString; profileLinkColor: JString; profileSidebarBorderColor: JString; profileSidebarFillColor: JString; profileTextColor: Boolean; profileUseBackgroundImage: Boolean; protectedUser: JString; screenName: Boolean; showAllInlineMedia: JTweet; status: Integer; statusesCount: JString; timeZone: JString; url: Integer; utcOffset: Boolean; verified: JList; withheldInCountries: JString): JUser; cdecl;

    { static Property }
    {class} property INVALID_ID: Int64 read _GetINVALID_ID;
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/User')]
  JUser = interface(JObject)
  ['{6FF9C7B7-AB74-4A16-8804-384280ADDDFD}']
    { Property Methods }
    function _GetcontributorsEnabled: Boolean;
    procedure _SetcontributorsEnabled(acontributorsEnabled: Boolean);
    function _GetcreatedAt: JString;
    procedure _SetcreatedAt(acreatedAt: JString);
    function _GetdefaultProfile: Boolean;
    procedure _SetdefaultProfile(adefaultProfile: Boolean);
    function _GetdefaultProfileImage: Boolean;
    procedure _SetdefaultProfileImage(adefaultProfileImage: Boolean);
    function _Getdescription: JString;
    procedure _Setdescription(adescription: JString);
    function _Getemail: JString;
    procedure _Setemail(aemail: JString);
    function _Getentities: JUserEntities;
    procedure _Setentities(aentities: JUserEntities);
    function _GetfavouritesCount: Integer;
    procedure _SetfavouritesCount(afavouritesCount: Integer);
    function _GetfollowRequestSent: Boolean;
    procedure _SetfollowRequestSent(afollowRequestSent: Boolean);
    function _GetfollowersCount: Integer;
    procedure _SetfollowersCount(afollowersCount: Integer);
    function _GetfriendsCount: Integer;
    procedure _SetfriendsCount(afriendsCount: Integer);
    function _GetgeoEnabled: Boolean;
    procedure _SetgeoEnabled(ageoEnabled: Boolean);
    function _Getid: Int64;
    procedure _Setid(aid: Int64);
    function _GetidStr: JString;
    procedure _SetidStr(aidStr: JString);
    function _GetisTranslator: Boolean;
    procedure _SetisTranslator(aisTranslator: Boolean);
    function _Getlang: JString;
    procedure _Setlang(alang: JString);
    function _GetlistedCount: Integer;
    procedure _SetlistedCount(alistedCount: Integer);
    function _Getlocation: JString;
    procedure _Setlocation(alocation: JString);
    function _Getname: JString;
    procedure _Setname(aname: JString);
    function _GetprofileBackgroundColor: JString;
    procedure _SetprofileBackgroundColor(aprofileBackgroundColor: JString);
    function _GetprofileBackgroundImageUrl: JString;
    procedure _SetprofileBackgroundImageUrl(aprofileBackgroundImageUrl: JString);
    function _GetprofileBackgroundImageUrlHttps: JString;
    procedure _SetprofileBackgroundImageUrlHttps(aprofileBackgroundImageUrlHttps: JString);
    function _GetprofileBackgroundTile: Boolean;
    procedure _SetprofileBackgroundTile(aprofileBackgroundTile: Boolean);
    function _GetprofileBannerUrl: JString;
    procedure _SetprofileBannerUrl(aprofileBannerUrl: JString);
    function _GetprofileImageUrl: JString;
    procedure _SetprofileImageUrl(aprofileImageUrl: JString);
    function _GetprofileImageUrlHttps: JString;
    procedure _SetprofileImageUrlHttps(aprofileImageUrlHttps: JString);
    function _GetprofileLinkColor: JString;
    procedure _SetprofileLinkColor(aprofileLinkColor: JString);
    function _GetprofileSidebarBorderColor: JString;
    procedure _SetprofileSidebarBorderColor(aprofileSidebarBorderColor: JString);
    function _GetprofileSidebarFillColor: JString;
    procedure _SetprofileSidebarFillColor(aprofileSidebarFillColor: JString);
    function _GetprofileTextColor: JString;
    procedure _SetprofileTextColor(aprofileTextColor: JString);
    function _GetprofileUseBackgroundImage: Boolean;
    procedure _SetprofileUseBackgroundImage(aprofileUseBackgroundImage: Boolean);
    function _GetprotectedUser: Boolean;
    procedure _SetprotectedUser(aprotectedUser: Boolean);
    function _GetscreenName: JString;
    procedure _SetscreenName(ascreenName: JString);
    function _GetshowAllInlineMedia: Boolean;
    procedure _SetshowAllInlineMedia(ashowAllInlineMedia: Boolean);
    function _Getstatus: JTweet;
    procedure _Setstatus(astatus: JTweet);
    function _GetstatusesCount: Integer;
    procedure _SetstatusesCount(astatusesCount: Integer);
    function _GettimeZone: JString;
    procedure _SettimeZone(atimeZone: JString);
    function _Geturl: JString;
    procedure _Seturl(aurl: JString);
    function _GetutcOffset: Integer;
    procedure _SetutcOffset(autcOffset: Integer);
    function _Getverified: Boolean;
    procedure _Setverified(averified: Boolean);
    function _GetwithheldInCountries: JList;
    procedure _SetwithheldInCountries(awithheldInCountries: JList);
    function _GetwithheldScope: JString;
    procedure _SetwithheldScope(awithheldScope: JString);

    { methods }
    function getId: Int64; cdecl;

    { Property }
    property contributorsEnabled: Boolean read _GetcontributorsEnabled write _SetcontributorsEnabled;
    property createdAt: JString read _GetcreatedAt write _SetcreatedAt;
    property defaultProfile: Boolean read _GetdefaultProfile write _SetdefaultProfile;
    property defaultProfileImage: Boolean read _GetdefaultProfileImage write _SetdefaultProfileImage;
    property description: JString read _Getdescription write _Setdescription;
    property email: JString read _Getemail write _Setemail;
    property entities: JUserEntities read _Getentities write _Setentities;
    property favouritesCount: Integer read _GetfavouritesCount write _SetfavouritesCount;
    property followRequestSent: Boolean read _GetfollowRequestSent write _SetfollowRequestSent;
    property followersCount: Integer read _GetfollowersCount write _SetfollowersCount;
    property friendsCount: Integer read _GetfriendsCount write _SetfriendsCount;
    property geoEnabled: Boolean read _GetgeoEnabled write _SetgeoEnabled;
    property id: Int64 read _Getid write _Setid;
    property idStr: JString read _GetidStr write _SetidStr;
    property isTranslator: Boolean read _GetisTranslator write _SetisTranslator;
    property lang: JString read _Getlang write _Setlang;
    property listedCount: Integer read _GetlistedCount write _SetlistedCount;
    property location: JString read _Getlocation write _Setlocation;
    property name: JString read _Getname write _Setname;
    property profileBackgroundColor: JString read _GetprofileBackgroundColor write _SetprofileBackgroundColor;
    property profileBackgroundImageUrl: JString read _GetprofileBackgroundImageUrl write _SetprofileBackgroundImageUrl;
    property profileBackgroundImageUrlHttps: JString read _GetprofileBackgroundImageUrlHttps write _SetprofileBackgroundImageUrlHttps;
    property profileBackgroundTile: Boolean read _GetprofileBackgroundTile write _SetprofileBackgroundTile;
    property profileBannerUrl: JString read _GetprofileBannerUrl write _SetprofileBannerUrl;
    property profileImageUrl: JString read _GetprofileImageUrl write _SetprofileImageUrl;
    property profileImageUrlHttps: JString read _GetprofileImageUrlHttps write _SetprofileImageUrlHttps;
    property profileLinkColor: JString read _GetprofileLinkColor write _SetprofileLinkColor;
    property profileSidebarBorderColor: JString read _GetprofileSidebarBorderColor write _SetprofileSidebarBorderColor;
    property profileSidebarFillColor: JString read _GetprofileSidebarFillColor write _SetprofileSidebarFillColor;
    property profileTextColor: JString read _GetprofileTextColor write _SetprofileTextColor;
    property profileUseBackgroundImage: Boolean read _GetprofileUseBackgroundImage write _SetprofileUseBackgroundImage;
    property protectedUser: Boolean read _GetprotectedUser write _SetprotectedUser;
    property screenName: JString read _GetscreenName write _SetscreenName;
    property showAllInlineMedia: Boolean read _GetshowAllInlineMedia write _SetshowAllInlineMedia;
    property status: JTweet read _Getstatus write _Setstatus;
    property statusesCount: Integer read _GetstatusesCount write _SetstatusesCount;
    property timeZone: JString read _GettimeZone write _SettimeZone;
    property url: JString read _Geturl write _Seturl;
    property utcOffset: Integer read _GetutcOffset write _SetutcOffset;
    property verified: Boolean read _Getverified write _Setverified;
    property withheldInCountries: JList read _GetwithheldInCountries write _SetwithheldInCountries;
    property withheldScope: JString read _GetwithheldScope write _SetwithheldScope;
  end;

  TJUser = class(TJavaGenericImport<JUserClass, JUser>) end;

  JSafeMapAdapter_1Class = interface(JObjectClass)
  ['{A3BDD041-22DD-4D7B-9446-B95116A7DD9E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/SafeMapAdapter$1')]
  JSafeMapAdapter_1 = interface(JObject)
  ['{00DC425A-B304-4BC3-A88A-799A1607AD3A}']
    { Property Methods }

    { methods }
//    procedure write(aout: JJsonWriter; value: JObject); cdecl;
//    function read(arg0: JJsonReader): JObject; cdecl;

    { Property }
  end;

  TJSafeMapAdapter_1 = class(TJavaGenericImport<JSafeMapAdapter_1Class, JSafeMapAdapter_1>) end;

  JSafeListAdapter_1Class = interface(JObjectClass)
  ['{942637D8-78B5-484C-A25C-7413DB5B1E36}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/SafeListAdapter$1')]
  JSafeListAdapter_1 = interface(JObject)
  ['{2CDFEB79-5A12-4163-9C6F-276CD8EA40F8}']
    { Property Methods }

    { methods }
//    procedure write(aout: JJsonWriter; value: JObject); cdecl;
//    function read(arg0: JJsonReader): JObject; cdecl;

    { Property }
  end;

  TJSafeListAdapter_1 = class(TJavaGenericImport<JSafeListAdapter_1Class, JSafeListAdapter_1>) end;

  JTwitterCollection_Metadata_PositionClass = interface(JObjectClass)
  ['{D7F48517-DCB1-40B5-8DB8-AFEC2F07CE98}']
    { static Property Methods }

    { static Methods }
    {class} function init(maxPosition: JLong; minPosition: JLong): JTwitterCollection_Metadata_Position; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/TwitterCollection$Metadata$Position')]
  JTwitterCollection_Metadata_Position = interface(JObject)
  ['{67ED694B-0878-4C1E-BD7D-B856035EC8A3}']
    { Property Methods }
    function _GetminPosition: JLong;
    procedure _SetminPosition(aminPosition: JLong);
    function _GetmaxPosition: JLong;
    procedure _SetmaxPosition(amaxPosition: JLong);

    { methods }

    { Property }
    property minPosition: JLong read _GetminPosition write _SetminPosition;
    property maxPosition: JLong read _GetmaxPosition write _SetmaxPosition;
  end;

  TJTwitterCollection_Metadata_Position = class(TJavaGenericImport<JTwitterCollection_Metadata_PositionClass, JTwitterCollection_Metadata_Position>) end;

  JVideoInfoClass = interface(JObjectClass)
  ['{A4DA3CB2-0277-4187-ADC4-8AF8C1418F38}']
    { static Property Methods }

    { static Methods }
    {class} function init(aspectRatio: JList; durationMillis: Int64; variants: JList): JVideoInfo; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/VideoInfo')]
  JVideoInfo = interface(JObject)
  ['{1308B17A-BA91-4A86-9211-C97346C2D3C7}']
    { Property Methods }
    function _GetaspectRatio: JList;
    procedure _SetaspectRatio(aaspectRatio: JList);
    function _GetdurationMillis: Int64;
    procedure _SetdurationMillis(adurationMillis: Int64);
    function _Getvariants: JList;
    procedure _Setvariants(avariants: JList);

    { methods }

    { Property }
    property aspectRatio: JList read _GetaspectRatio write _SetaspectRatio;
    property durationMillis: Int64 read _GetdurationMillis write _SetdurationMillis;
    property variants: JList read _Getvariants write _Setvariants;
  end;

  TJVideoInfo = class(TJavaGenericImport<JVideoInfoClass, JVideoInfo>) end;

  JTwitterCollection_TimelineItem_TweetItemClass = interface(JObjectClass)
  ['{880E054A-A5B9-41A8-BB9C-921A2942FE92}']
    { static Property Methods }

    { static Methods }
    {class} function init(id: JLong): JTwitterCollection_TimelineItem_TweetItem; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/TwitterCollection$TimelineItem$TweetItem')]
  JTwitterCollection_TimelineItem_TweetItem = interface(JObject)
  ['{76E3E049-9A8F-4528-B3A9-123F7BA668BD}']
    { Property Methods }
    function _Getid: JLong;
    procedure _Setid(aid: JLong);

    { methods }

    { Property }
    property id: JLong read _Getid write _Setid;
  end;

  TJTwitterCollection_TimelineItem_TweetItem = class(TJavaGenericImport<JTwitterCollection_TimelineItem_TweetItemClass, JTwitterCollection_TimelineItem_TweetItem>) end;

  JTweetClass = interface(JObjectClass)
  ['{CAC3D051-CC36-4D8E-AAB4-18007F7C5561}']
    { static Property Methods }
    {class} function _GetINVALID_ID: Int64;

    { static Methods }
    {class} function init(coordinates: JCoordinates; createdAt: JString; currentUserRetweet: JObject; entities: JTweetEntities; extendedEntities: JTweetEntities; favoriteCount: JInteger; favorited: Boolean; filterLevel: JString; id: Int64; idStr: JString; P11: JString; inReplyToScreenName: Int64; inReplyToStatusId: JString; inReplyToUserId: Int64; inReplyToStatusIdStr: JString; P16: JString; place: JPlace; inReplyToUserIdStr: Boolean; lang: JObject; P20: Int64; possiblySensitive: JString; scopes: JTweet; quotedStatusId: Integer; retweeted: Boolean; quotedStatusIdStr: JTweet; quotedStatus: JString; retweetCount: JString; P28: JList; retweetedStatus: Boolean; source: JUser; text: Boolean; displayTextRange: JList; truncated: JString; user: JCard): JTweet; cdecl;

    { static Property }
    {class} property INVALID_ID: Int64 read _GetINVALID_ID;
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Tweet')]
  JTweet = interface(JObject)
  ['{DCBFD1E8-1963-4BF3-93AE-6D663076B4F0}']
    { Property Methods }
    function _Getcoordinates: JCoordinates;
    procedure _Setcoordinates(acoordinates: JCoordinates);
    function _GetcreatedAt: JString;
    procedure _SetcreatedAt(acreatedAt: JString);
    function _GetcurrentUserRetweet: JObject;
    procedure _SetcurrentUserRetweet(acurrentUserRetweet: JObject);
    function _Getentities: JTweetEntities;
    procedure _Setentities(aentities: JTweetEntities);
    function _GetextendedEntities: JTweetEntities;
    procedure _SetextendedEntities(aextendedEntities: JTweetEntities);
    function _GetfavoriteCount: JInteger;
    procedure _SetfavoriteCount(afavoriteCount: JInteger);
    function _Getfavorited: Boolean;
    procedure _Setfavorited(afavorited: Boolean);
    function _GetfilterLevel: JString;
    procedure _SetfilterLevel(afilterLevel: JString);
    function _Getid: Int64;
    procedure _Setid(aid: Int64);
    function _GetidStr: JString;
    procedure _SetidStr(aidStr: JString);
    function _GetinReplyToScreenName: JString;
    procedure _SetinReplyToScreenName(ainReplyToScreenName: JString);
    function _GetinReplyToStatusId: Int64;
    procedure _SetinReplyToStatusId(ainReplyToStatusId: Int64);
    function _GetinReplyToStatusIdStr: JString;
    procedure _SetinReplyToStatusIdStr(ainReplyToStatusIdStr: JString);
    function _GetinReplyToUserId: Int64;
    procedure _SetinReplyToUserId(ainReplyToUserId: Int64);
    function _GetinReplyToUserIdStr: JString;
    procedure _SetinReplyToUserIdStr(ainReplyToUserIdStr: JString);
    function _Getlang: JString;
    procedure _Setlang(alang: JString);
    function _Getplace: JPlace;
    procedure _Setplace(aplace: JPlace);
    function _GetpossiblySensitive: Boolean;
    procedure _SetpossiblySensitive(apossiblySensitive: Boolean);
    function _Getscopes: JObject;
    procedure _Setscopes(ascopes: JObject);
    function _GetquotedStatusId: Int64;
    procedure _SetquotedStatusId(aquotedStatusId: Int64);
    function _GetquotedStatusIdStr: JString;
    procedure _SetquotedStatusIdStr(aquotedStatusIdStr: JString);
    function _GetquotedStatus: JTweet;
    procedure _SetquotedStatus(aquotedStatus: JTweet);
    function _GetretweetCount: Integer;
    procedure _SetretweetCount(aretweetCount: Integer);
    function _Getretweeted: Boolean;
    procedure _Setretweeted(aretweeted: Boolean);
    function _GetretweetedStatus: JTweet;
    procedure _SetretweetedStatus(aretweetedStatus: JTweet);
    function _Getsource: JString;
    procedure _Setsource(asource: JString);
    function _Gettext: JString;
    procedure _Settext(atext: JString);
    function _GetdisplayTextRange: JList;
    procedure _SetdisplayTextRange(adisplayTextRange: JList);
    function _Gettruncated: Boolean;
    procedure _Settruncated(atruncated: Boolean);
    function _Getuser: JUser;
    procedure _Setuser(auser: JUser);
    function _GetwithheldCopyright: Boolean;
    procedure _SetwithheldCopyright(awithheldCopyright: Boolean);
    function _GetwithheldInCountries: JList;
    procedure _SetwithheldInCountries(awithheldInCountries: JList);
    function _GetwithheldScope: JString;
    procedure _SetwithheldScope(awithheldScope: JString);
    function _Getcard: JCard;
    procedure _Setcard(acard: JCard);

    { methods }
    function getId: Int64; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property coordinates: JCoordinates read _Getcoordinates write _Setcoordinates;
    property createdAt: JString read _GetcreatedAt write _SetcreatedAt;
    property currentUserRetweet: JObject read _GetcurrentUserRetweet write _SetcurrentUserRetweet;
    property entities: JTweetEntities read _Getentities write _Setentities;
    property extendedEntities: JTweetEntities read _GetextendedEntities write _SetextendedEntities;
    property favoriteCount: JInteger read _GetfavoriteCount write _SetfavoriteCount;
    property favorited: Boolean read _Getfavorited write _Setfavorited;
    property filterLevel: JString read _GetfilterLevel write _SetfilterLevel;
    property id: Int64 read _Getid write _Setid;
    property idStr: JString read _GetidStr write _SetidStr;
    property inReplyToScreenName: JString read _GetinReplyToScreenName write _SetinReplyToScreenName;
    property inReplyToStatusId: Int64 read _GetinReplyToStatusId write _SetinReplyToStatusId;
    property inReplyToStatusIdStr: JString read _GetinReplyToStatusIdStr write _SetinReplyToStatusIdStr;
    property inReplyToUserId: Int64 read _GetinReplyToUserId write _SetinReplyToUserId;
    property inReplyToUserIdStr: JString read _GetinReplyToUserIdStr write _SetinReplyToUserIdStr;
    property lang: JString read _Getlang write _Setlang;
    property place: JPlace read _Getplace write _Setplace;
    property possiblySensitive: Boolean read _GetpossiblySensitive write _SetpossiblySensitive;
    property scopes: JObject read _Getscopes write _Setscopes;
    property quotedStatusId: Int64 read _GetquotedStatusId write _SetquotedStatusId;
    property quotedStatusIdStr: JString read _GetquotedStatusIdStr write _SetquotedStatusIdStr;
    property quotedStatus: JTweet read _GetquotedStatus write _SetquotedStatus;
    property retweetCount: Integer read _GetretweetCount write _SetretweetCount;
    property retweeted: Boolean read _Getretweeted write _Setretweeted;
    property retweetedStatus: JTweet read _GetretweetedStatus write _SetretweetedStatus;
    property source: JString read _Getsource write _Setsource;
    property text: JString read _Gettext write _Settext;
    property displayTextRange: JList read _GetdisplayTextRange write _SetdisplayTextRange;
    property truncated: Boolean read _Gettruncated write _Settruncated;
    property user: JUser read _Getuser write _Setuser;
    property withheldCopyright: Boolean read _GetwithheldCopyright write _SetwithheldCopyright;
    property withheldInCountries: JList read _GetwithheldInCountries write _SetwithheldInCountries;
    property withheldScope: JString read _GetwithheldScope write _SetwithheldScope;
    property card: JCard read _Getcard write _Setcard;
  end;

  TJTweet = class(TJavaGenericImport<JTweetClass, JTweet>) end;

  JVideoInfo_VariantClass = interface(JObjectClass)
  ['{D8FDA762-CF29-40B9-8588-155FB804FE4F}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitrate: Int64; contentType: JString; P3: JString): JVideoInfo_Variant; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/VideoInfo$Variant')]
  JVideoInfo_Variant = interface(JObject)
  ['{C0D2C5AD-EBAB-4E16-AF17-3E7CE2F8259F}']
    { Property Methods }
    function _Getbitrate: Int64;
    procedure _Setbitrate(abitrate: Int64);
    function _GetcontentType: JString;
    procedure _SetcontentType(acontentType: JString);
    function _Geturl: JString;
    procedure _Seturl(aurl: JString);

    { methods }

    { Property }
    property bitrate: Int64 read _Getbitrate write _Setbitrate;
    property contentType: JString read _GetcontentType write _SetcontentType;
    property url: JString read _Geturl write _Seturl;
  end;

  TJVideoInfo_Variant = class(TJavaGenericImport<JVideoInfo_VariantClass, JVideoInfo_Variant>) end;

  JTweetBuilderClass = interface(JObjectClass)
  ['{82A21A9F-ED59-414A-A7F9-F368E09CD122}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTweetBuilder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/TweetBuilder')]
  JTweetBuilder = interface(JObject)
  ['{3109F2D6-564C-40FA-9F73-393D954028E8}']
    { Property Methods }

    { methods }
    function setCoordinates(coordinates: JCoordinates): JTweetBuilder; cdecl;
    function setCreatedAt(createdAt: JString): JTweetBuilder; cdecl;
    function setCurrentUserRetweet(currentUserRetweet: JObject): JTweetBuilder; cdecl;
    function setEntities(entities: JTweetEntities): JTweetBuilder; cdecl;
    function setExtendedEntities(extendedEntities: JTweetEntities): JTweetBuilder; cdecl;
    function setFavoriteCount(favoriteCount: JInteger): JTweetBuilder; cdecl;
    function setFavorited(favorited: Boolean): JTweetBuilder; cdecl;
    function setFilterLevel(filterLevel: JString): JTweetBuilder; cdecl;
    function setId(id: Int64): JTweetBuilder; cdecl;
    function setIdStr(idStr: JString): JTweetBuilder; cdecl;
    function setInReplyToScreenName(inReplyToScreenName: JString): JTweetBuilder; cdecl;
    function setInReplyToStatusId(inReplyToStatusId: Int64): JTweetBuilder; cdecl;
    function setInReplyToStatusIdStr(inReplyToStatusIdStr: JString): JTweetBuilder; cdecl;
    function setInReplyToUserId(inReplyToUserId: Int64): JTweetBuilder; cdecl;
    function setInReplyToUserIdStr(inReplyToUserIdStr: JString): JTweetBuilder; cdecl;
    function setLang(lang: JString): JTweetBuilder; cdecl;
    function setPlace(place: JPlace): JTweetBuilder; cdecl;
    function setPossiblySensitive(possiblySensitive: Boolean): JTweetBuilder; cdecl;
    function setScopes(scopes: JObject): JTweetBuilder; cdecl;
    function setQuotedStatusId(quotedStatusId: Int64): JTweetBuilder; cdecl;
    function setQuotedStatusIdStr(quotedStatusIdStr: JString): JTweetBuilder; cdecl;
    function setQuotedStatus(quotedStatus: JTweet): JTweetBuilder; cdecl;
    function setRetweetCount(retweetCount: Integer): JTweetBuilder; cdecl;
    function setRetweeted(retweeted: Boolean): JTweetBuilder; cdecl;
    function setRetweetedStatus(retweetedStatus: JTweet): JTweetBuilder; cdecl;
    function setSource(source: JString): JTweetBuilder; cdecl;
    function setText(text: JString): JTweetBuilder; cdecl;
    function setDisplayTextRange(displayTextRange: JList): JTweetBuilder; cdecl;
    function setTruncated(truncated: Boolean): JTweetBuilder; cdecl;
    function setUser(user: JUser): JTweetBuilder; cdecl;
    function setWithheldCopyright(withheldCopyright: Boolean): JTweetBuilder; cdecl;
    function setWithheldInCountries(withheldInCountries: JList): JTweetBuilder; cdecl;
    function setWithheldScope(withheldScope: JString): JTweetBuilder; cdecl;
    function setCard(card: JCard): JTweetBuilder; cdecl;
    function copy(tweet: JTweet): JTweetBuilder; cdecl;
    function build: JTweet; cdecl;

    { Property }
  end;

  TJTweetBuilder = class(TJavaGenericImport<JTweetBuilderClass, JTweetBuilder>) end;

  JTweetEntitiesClass = interface(JObjectClass)
  ['{F1A241FC-052A-4CEA-840E-8DF960DB0629}']
    { static Property Methods }

    { static Methods }
    {class} function init(urls: JList; userMentions: JList; media: JList; hashtags: JList; symbols: JList): JTweetEntities; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/TweetEntities')]
  JTweetEntities = interface(JObject)
  ['{9E928424-7DF8-4AAB-8188-1EE6884BFFB8}']
    { Property Methods }
    function _Geturls: JList;
    procedure _Seturls(aurls: JList);
    function _GetuserMentions: JList;
    procedure _SetuserMentions(auserMentions: JList);
    function _Getmedia: JList;
    procedure _Setmedia(amedia: JList);
    function _Gethashtags: JList;
    procedure _Sethashtags(ahashtags: JList);
    function _Getsymbols: JList;
    procedure _Setsymbols(asymbols: JList);

    { methods }

    { Property }
    property urls: JList read _Geturls write _Seturls;
    property userMentions: JList read _GetuserMentions write _SetuserMentions;
    property media: JList read _Getmedia write _Setmedia;
    property hashtags: JList read _Gethashtags write _Sethashtags;
    property symbols: JList read _Getsymbols write _Setsymbols;
  end;

  TJTweetEntities = class(TJavaGenericImport<JTweetEntitiesClass, JTweetEntities>) end;

  JImageClass = interface(JObjectClass)
  ['{AF188079-7950-4DCE-99B0-EDE28CBBB401}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: Integer; h: Integer; imageType: JString): JImage; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Image')]
  JImage = interface(JObject)
  ['{2527D9F4-DCB2-4706-8E22-91473A992271}']
    { Property Methods }
    function _Getw: Integer;
    procedure _Setw(aw: Integer);
    function _Geth: Integer;
    procedure _Seth(ah: Integer);
    function _GetimageType: JString;
    procedure _SetimageType(aimageType: JString);

    { methods }

    { Property }
    property w: Integer read _Getw write _Setw;
    property h: Integer read _Geth write _Seth;
    property imageType: JString read _GetimageType write _SetimageType;
  end;

  TJImage = class(TJavaGenericImport<JImageClass, JImage>) end;

  JSearchMetadataClass = interface(JObjectClass)
  ['{64433E68-541D-4FC6-A0ED-016FFEC5C5B9}']
    { static Property Methods }

    { static Methods }
    {class} function init(maxId: Integer; sinceId: Integer; refreshUrl: JString; nextResults: JString; count: Integer; completedIn: Double; sinceIdStr: JString; P8: JString; query: JString): JSearchMetadata; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/SearchMetadata')]
  JSearchMetadata = interface(JObject)
  ['{57B4E48A-6F3F-49AA-9EBE-02A17B4A764A}']
    { Property Methods }
    function _GetmaxId: Int64;
    procedure _SetmaxId(amaxId: Int64);
    function _GetsinceId: Int64;
    procedure _SetsinceId(asinceId: Int64);
    function _GetrefreshUrl: JString;
    procedure _SetrefreshUrl(arefreshUrl: JString);
    function _GetnextResults: JString;
    procedure _SetnextResults(anextResults: JString);
    function _Getcount: Int64;
    procedure _Setcount(acount: Int64);
    function _GetcompletedIn: Double;
    procedure _SetcompletedIn(acompletedIn: Double);
    function _GetsinceIdStr: JString;
    procedure _SetsinceIdStr(asinceIdStr: JString);
    function _Getquery: JString;
    procedure _Setquery(aquery: JString);
    function _GetmaxIdStr: JString;
    procedure _SetmaxIdStr(amaxIdStr: JString);

    { methods }

    { Property }
    property maxId: Int64 read _GetmaxId write _SetmaxId;
    property sinceId: Int64 read _GetsinceId write _SetsinceId;
    property refreshUrl: JString read _GetrefreshUrl write _SetrefreshUrl;
    property nextResults: JString read _GetnextResults write _SetnextResults;
    property count: Int64 read _Getcount write _Setcount;
    property completedIn: Double read _GetcompletedIn write _SetcompletedIn;
    property sinceIdStr: JString read _GetsinceIdStr write _SetsinceIdStr;
    property query: JString read _Getquery write _Setquery;
    property maxIdStr: JString read _GetmaxIdStr write _SetmaxIdStr;
  end;

  TJSearchMetadata = class(TJavaGenericImport<JSearchMetadataClass, JSearchMetadata>) end;

  JUserEntitiesClass = interface(JObjectClass)
  ['{66AEBE91-ABD3-40F6-BFD5-F5E4EC74A020}']
    { static Property Methods }

    { static Methods }
    {class} function init(url: JUserEntities_UrlEntities; description: JUserEntities_UrlEntities): JUserEntities; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/UserEntities')]
  JUserEntities = interface(JObject)
  ['{794ECC7D-1D5D-41D3-9707-35DA62284037}']
    { Property Methods }
    function _Geturl: JUserEntities_UrlEntities;
    procedure _Seturl(aurl: JUserEntities_UrlEntities);
    function _Getdescription: JUserEntities_UrlEntities;
    procedure _Setdescription(adescription: JUserEntities_UrlEntities);

    { methods }

    { Property }
    property url: JUserEntities_UrlEntities read _Geturl write _Seturl;
    property description: JUserEntities_UrlEntities read _Getdescription write _Setdescription;
  end;

  TJUserEntities = class(TJavaGenericImport<JUserEntitiesClass, JUserEntities>) end;

  JUrlEntityClass = interface(JObjectClass)
  ['{F7848D56-54AE-483F-AA8B-8CBCC16B2808}']
    { static Property Methods }

    { static Methods }
    {class} function init(url: JString; expandedUrl: JString; displayUrl: JString; start: Integer; aend: Integer): JUrlEntity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/UrlEntity')]
  JUrlEntity = interface(JObject)
  ['{CDB06DD0-ACC5-4AED-81F0-A15093EBDB78}']
    { Property Methods }
    function _Geturl: JString;
    procedure _Seturl(aurl: JString);
    function _GetexpandedUrl: JString;
    procedure _SetexpandedUrl(aexpandedUrl: JString);
    function _GetdisplayUrl: JString;
    procedure _SetdisplayUrl(adisplayUrl: JString);

    { methods }
    function getEnd: Integer; cdecl;
    function getStart: Integer; cdecl;

    { Property }
    property url: JString read _Geturl write _Seturl;
    property expandedUrl: JString read _GetexpandedUrl write _SetexpandedUrl;
    property displayUrl: JString read _GetdisplayUrl write _SetdisplayUrl;
  end;

  TJUrlEntity = class(TJavaGenericImport<JUrlEntityClass, JUrlEntity>) end;

  JSymbolEntityClass = interface(JObjectClass)
  ['{59EA235B-3751-41D1-BAFB-030D0F861D73}']
    { static Property Methods }

    { static Methods }
    {class} function init(text: JString; start: Integer; aend: Integer): JSymbolEntity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/SymbolEntity')]
  JSymbolEntity = interface(JObject)
  ['{B2A478B1-F263-44BD-BFEC-4F61A2EC2F9E}']
    { Property Methods }
    function _Gettext: JString;
    procedure _Settext(atext: JString);

    { methods }
    function getEnd: Integer; cdecl;
    function getStart: Integer; cdecl;

    { Property }
    property text: JString read _Gettext write _Settext;
  end;

  TJSymbolEntity = class(TJavaGenericImport<JSymbolEntityClass, JSymbolEntity>) end;

  JMediaEntity_SizeClass = interface(JObjectClass)
  ['{D3EA17C6-3924-4B44-8852-4309C7C160EE}']
    { static Property Methods }

    { static Methods }
    {class} function init(w: Integer; h: Integer; resize: JString): JMediaEntity_Size; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/MediaEntity$Size')]
  JMediaEntity_Size = interface(JObject)
  ['{CA93DEE4-7FBF-4A6C-9EFC-567A51016C60}']
    { Property Methods }
    function _Getw: Integer;
    procedure _Setw(aw: Integer);
    function _Geth: Integer;
    procedure _Seth(ah: Integer);
    function _Getresize: JString;
    procedure _Setresize(aresize: JString);

    { methods }

    { Property }
    property w: Integer read _Getw write _Setw;
    property h: Integer read _Geth write _Seth;
    property resize: JString read _Getresize write _Setresize;
  end;

  TJMediaEntity_Size = class(TJavaGenericImport<JMediaEntity_SizeClass, JMediaEntity_Size>) end;

  JMentionEntityClass = interface(JObjectClass)
  ['{DF6659BA-BF65-4842-90A4-3E38AB82BF3F}']
    { static Property Methods }

    { static Methods }
    {class} function init(id: Int64; idStr: JString; P3: JString; name: JString; screenName: Integer; start: Integer): JMentionEntity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/MentionEntity')]
  JMentionEntity = interface(JObject)
  ['{40AB9E2E-A025-4642-8D57-51381E28D94B}']
    { Property Methods }
    function _Getid: Int64;
    procedure _Setid(aid: Int64);
    function _GetidStr: JString;
    procedure _SetidStr(aidStr: JString);
    function _Getname: JString;
    procedure _Setname(aname: JString);
    function _GetscreenName: JString;
    procedure _SetscreenName(ascreenName: JString);

    { methods }
    function getEnd: Integer; cdecl;
    function getStart: Integer; cdecl;

    { Property }
    property id: Int64 read _Getid write _Setid;
    property idStr: JString read _GetidStr write _SetidStr;
    property name: JString read _Getname write _Setname;
    property screenName: JString read _GetscreenName write _SetscreenName;
  end;

  TJMentionEntity = class(TJavaGenericImport<JMentionEntityClass, JMentionEntity>) end;

  JModelUtilsClass = interface(JObjectClass)
  ['{146950ED-B2AB-435B-B06C-87A68A5496C2}']
    { static Property Methods }

    { static Methods }
    {class} function getSafeList(P1: JList): JList; cdecl;
    {class} function getSafeMap(P1: JMap): JMap; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/ModelUtils')]
  JModelUtils = interface(JObject)
  ['{608F628D-0172-4B43-9E97-5F47C2A495DD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJModelUtils = class(TJavaGenericImport<JModelUtilsClass, JModelUtils>) end;

  JSearchClass = interface(JObjectClass)
  ['{AF88348A-BC6D-4CD1-B407-2A33DF073493}']
    { static Property Methods }

    { static Methods }
    {class} function init(tweets: JList; searchMetadata: JSearchMetadata): JSearch; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Search')]
  JSearch = interface(JObject)
  ['{0786BDFD-51EE-4736-932E-36E03F25BB95}']
    { Property Methods }
    function _Gettweets: JList;
    procedure _Settweets(atweets: JList);
    function _GetsearchMetadata: JSearchMetadata;
    procedure _SetsearchMetadata(asearchMetadata: JSearchMetadata);

    { methods }

    { Property }
    property tweets: JList read _Gettweets write _Settweets;
    property searchMetadata: JSearchMetadata read _GetsearchMetadata write _SetsearchMetadata;
  end;

  TJSearch = class(TJavaGenericImport<JSearchClass, JSearch>) end;

  JSafeListAdapterClass = interface(JObjectClass)
  ['{2293558E-EA7F-4889-93BF-974A5CDD821F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSafeListAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/SafeListAdapter')]
  JSafeListAdapter = interface(JObject)
  ['{8D40DA67-1A45-42DD-A759-A835DD26A423}']
    { Property Methods }

    { methods }
//    function create(gson: JGson; tokenType: JTypeToken): JTypeAdapter; cdecl;

    { Property }
  end;

  TJSafeListAdapter = class(TJavaGenericImport<JSafeListAdapterClass, JSafeListAdapter>) end;

  JConfigurationClass = interface(JObjectClass)
  ['{DD827ED1-17B9-4878-B6D5-35420AD78318}']
    { static Property Methods }

    { static Methods }
    {class} function init(dmTextCharacterLimit: Integer; nonUsernamePaths: JList; photoSizeLimit: Int64; photoSizes: JMediaEntity_Sizes; P5: Integer): JConfiguration; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/Configuration')]
  JConfiguration = interface(JObject)
  ['{CE77E248-69BB-4EAD-842A-29D25C934A12}']
    { Property Methods }
    function _GetdmTextCharacterLimit: Integer;
    procedure _SetdmTextCharacterLimit(admTextCharacterLimit: Integer);
    function _GetnonUsernamePaths: JList;
    procedure _SetnonUsernamePaths(anonUsernamePaths: JList);
    function _GetphotoSizeLimit: Int64;
    procedure _SetphotoSizeLimit(aphotoSizeLimit: Int64);
    function _GetphotoSizes: JMediaEntity_Sizes;
    procedure _SetphotoSizes(aphotoSizes: JMediaEntity_Sizes);
    function _GetshortUrlLengthHttps: Integer;
    procedure _SetshortUrlLengthHttps(ashortUrlLengthHttps: Integer);

    { methods }

    { Property }
    property dmTextCharacterLimit: Integer read _GetdmTextCharacterLimit write _SetdmTextCharacterLimit;
    property nonUsernamePaths: JList read _GetnonUsernamePaths write _SetnonUsernamePaths;
    property photoSizeLimit: Int64 read _GetphotoSizeLimit write _SetphotoSizeLimit;
    property photoSizes: JMediaEntity_Sizes read _GetphotoSizes write _SetphotoSizes;
    property shortUrlLengthHttps: Integer read _GetshortUrlLengthHttps write _SetshortUrlLengthHttps;
  end;

  TJConfiguration = class(TJavaGenericImport<JConfigurationClass, JConfiguration>) end;

  JApiErrorClass = interface(JObjectClass)
  ['{511782EB-F0C8-4924-8569-6BBB7DDDA2E6}']
    { static Property Methods }

    { static Methods }
    {class} function init(amessage: JString; code: Integer): JApiError; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/models/ApiError')]
  JApiError = interface(JObject)
  ['{93B075EF-9FC0-46AB-8DD0-597773FD65E1}']
    { Property Methods }
    function _Getmessage: JString;
    procedure _Setmessage(amessage: JString);
    function _Getcode: Integer;
    procedure _Setcode(acode: Integer);

    { methods }

    { Property }
    property &message: JString read _Getmessage write _Setmessage;
    property code: Integer read _Getcode write _Setcode;
  end;

  TJApiError = class(TJavaGenericImport<JApiErrorClass, JApiError>) end;

  JTwitterSession_SerializerClass = interface(JObjectClass)
  ['{A185EE82-9EF3-494F-BDC9-97E4F80C38CA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTwitterSession_Serializer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterSession$Serializer')]
  JTwitterSession_Serializer = interface(JObject)
  ['{9DD50746-963F-4333-B8A4-82A38B233FDF}']
    { Property Methods }

    { methods }
    function serialize(session: JTwitterSession): JString; cdecl; overload;
    function deserialize(serializedSession: JString): JTwitterSession; cdecl; overload;
//    function deserialize(P1: JString): JObject; cdecl; overload;
    function serialize(P1: JObject): JString; cdecl; overload;

    { Property }
  end;

  TJTwitterSession_Serializer = class(TJavaGenericImport<JTwitterSession_SerializerClass, JTwitterSession_Serializer>) end;

  JTwitterClass = interface(JObjectClass)
  ['{97B44945-22D6-47DC-A2C2-CF21277C469D}']
    { static Property Methods }
    {class} function _GetTAG: JString;

    { static Methods }
    {class} procedure initialize(config: JContext); cdecl; overload;
    {class} procedure initialize(P1: JTwitterConfig); cdecl; overload;
    {class} function getInstance: JTwitter; cdecl;
    {class} function isDebug: Boolean; cdecl;
    {class} function getLogger: JLogger; cdecl;

    { static Property }
    {class} property TAG: JString read _GetTAG;
  end;

  [JavaSignature('com/twitter/sdk/android/core/Twitter')]
  JTwitter = interface(JObject)
  ['{FBEEAE01-56E8-4EA2-A116-527A7F1B2170}']
    { Property Methods }

    { methods }
    function getContext(component: JString): JContext; cdecl;
    function getIdManager: JIdManager; cdecl;
    function getTwitterAuthConfig: JTwitterAuthConfig; cdecl;
    function getExecutorService: JExecutorService; cdecl;
    function getActivityLifecycleManager: JActivityLifecycleManager; cdecl;

    { Property }
  end;

  TJTwitter = class(TJavaGenericImport<JTwitterClass, JTwitter>) end;

  JTwitterApiClientClass = interface(JObjectClass)
  ['{1325B8A9-6DB4-420A-BE09-1192C5E9F5C9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTwitterApiClient; cdecl; overload;
//    {class} function init(client: JOkHttpClient): JTwitterApiClient; cdecl; overload;
    {class} function init(session: JTwitterSession): JTwitterApiClient; cdecl; overload;
//    {class} function init(session: JTwitterSession; client: JOkHttpClient): JTwitterApiClient; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterApiClient')]
  JTwitterApiClient = interface(JObject)
  ['{6F9D9FEE-F3A7-41C7-9F75-DD9E1F8D3406}']
    { Property Methods }

    { methods }
    function getAccountService: JAccountService; cdecl;
    function getFavoriteService: JFavoriteService; cdecl;
    function getStatusesService: JStatusesService; cdecl;
    function getSearchService: JSearchService; cdecl;
    function getListService: JListService; cdecl;
    function getCollectionService: JCollectionService; cdecl;
    function getConfigurationService: JConfigurationService; cdecl;
    function getMediaService: JMediaService; cdecl;

    { Property }
  end;

  TJTwitterApiClient = class(TJavaGenericImport<JTwitterApiClientClass, JTwitterApiClient>) end;

  JGuestSessionProvider_1Class = interface(JObjectClass)
  ['{8D7ECEA8-AA0A-48E4-8485-DBC161176A1E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/GuestSessionProvider$1')]
  JGuestSessionProvider_1 = interface(JObject)
  ['{B28FBD41-E489-47C6-B129-C47418C38AB3}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJGuestSessionProvider_1 = class(TJavaGenericImport<JGuestSessionProvider_1Class, JGuestSessionProvider_1>) end;

  JSessionClass = interface(JObjectClass)
  ['{E6097B76-696E-4C47-8D8F-3717708C051A}']
    { static Property Methods }

    { static Methods }
    {class} function init(authToken: JAuthToken; id: Int64): JSession; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/Session')]
  JSession = interface(JObject)
  ['{D806FFCD-CBC2-47DA-8FE7-A4817DED6F36}']
    { Property Methods }

    { methods }
    function getAuthToken: JAuthToken; cdecl;
    function getId: Int64; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJSession = class(TJavaGenericImport<JSessionClass, JSession>) end;

  JTwitterApiErrorConstantsClass = interface(JObjectClass)
  ['{241BEDB3-1E8C-480E-9069-A0E01162D945}']
    { static Property Methods }
    {class} function _GetRATE_LIMIT_EXCEEDED: Integer;
    {class} function _GetCOULD_NOT_AUTHENTICATE: Integer;
    {class} function _GetCLIENT_NOT_PRIVILEGED: Integer;
    {class} function _GetPAGE_NOT_EXIST: Integer;
    {class} function _GetUNKNOWN_ERROR: Integer;

    { static Methods }
    {class} function init: JTwitterApiErrorConstants; cdecl;

    { static Property }
    {class} property RATE_LIMIT_EXCEEDED: Integer read _GetRATE_LIMIT_EXCEEDED;
    {class} property COULD_NOT_AUTHENTICATE: Integer read _GetCOULD_NOT_AUTHENTICATE;
    {class} property CLIENT_NOT_PRIVILEGED: Integer read _GetCLIENT_NOT_PRIVILEGED;
    {class} property PAGE_NOT_EXIST: Integer read _GetPAGE_NOT_EXIST;
    {class} property UNKNOWN_ERROR: Integer read _GetUNKNOWN_ERROR;
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterApiErrorConstants')]
  JTwitterApiErrorConstants = interface(JObject)
  ['{500765A7-E2B0-4CE2-A64B-AA6D613E139A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterApiErrorConstants = class(TJavaGenericImport<JTwitterApiErrorConstantsClass, JTwitterApiErrorConstants>) end;

  JBuildConfigClass = interface(JObjectClass)
  ['{D540B958-4622-47F1-A3FC-D30214F26762}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;
    {class} function _GetAPPLICATION_ID: JString;
    {class} function _GetBUILD_TYPE: JString;
    {class} function _GetFLAVOR: JString;
    {class} function _GetVERSION_CODE: Integer;
    {class} function _GetVERSION_NAME: JString;
    {class} function _GetARTIFACT_ID: JString;
    {class} function _GetBUILD_NUMBER: JString;
    {class} function _GetBUILD_TIME: Int64;
    {class} function _GetGROUP: JString;
    {class} function _GetSCRIBE_ENDPOINT_OVERRIDE: JString;
    {class} function _GetSCRIBE_SEQUENCE: JString;

    { static Methods }
    {class} function init: JBuildConfig; cdecl;

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
    {class} property ARTIFACT_ID: JString read _GetARTIFACT_ID;
    {class} property BUILD_NUMBER: JString read _GetBUILD_NUMBER;
    {class} property BUILD_TIME: Int64 read _GetBUILD_TIME;
    {class} property GROUP: JString read _GetGROUP;
    {class} property SCRIBE_ENDPOINT_OVERRIDE: JString read _GetSCRIBE_ENDPOINT_OVERRIDE;
    {class} property SCRIBE_SEQUENCE: JString read _GetSCRIBE_SEQUENCE;
  end;

  [JavaSignature('com/twitter/sdk/android/core/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{64D11C51-E7F7-4161-BDC7-7162C48D2630}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JTwitterAuthTokenClass = interface(JObjectClass)
  ['{CD908585-53C8-4DDC-BE1C-720F969FB468}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;

    { static Methods }
    {class} function init(token: JString; secret: JString): JTwitterAuthToken; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterAuthToken')]
  JTwitterAuthToken = interface(JObject)
  ['{AA2D8078-D94C-4D84-82B8-744F0C3C9250}']
    { Property Methods }
    function _Gettoken: JString;
    procedure _Settoken(atoken: JString);
    function _Getsecret: JString;
    procedure _Setsecret(asecret: JString);

    { methods }
    function isExpired: Boolean; cdecl;
    function toString: JString; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(aout: JParcel; flags: Integer); cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property token: JString read _Gettoken write _Settoken;
    property secret: JString read _Getsecret write _Setsecret;
  end;

  TJTwitterAuthToken = class(TJavaGenericImport<JTwitterAuthTokenClass, JTwitterAuthToken>) end;

  JTwitterExceptionClass = interface(JObjectClass)
  ['{F3525CFC-CDBA-42DD-B092-32C65E833E78}']
    { static Property Methods }

    { static Methods }
    {class} function init(detailMessage: JString): JTwitterException; cdecl; overload;
    {class} function init(detailMessage: JString; throwable: JThrowable): JTwitterException; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterException')]
  JTwitterException = interface(JObject)
  ['{F69BFE18-D17B-4CDC-8936-DCB23E6E2553}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterException = class(TJavaGenericImport<JTwitterExceptionClass, JTwitterException>) end;

  JTwitterContextClass = interface(JObjectClass)
  ['{A5837D24-0B2E-4B0C-800C-C4270B29EBFB}']
    { static Property Methods }

    { static Methods }
    {class} function init(base: JContext; componentName: JString; componentPath: JString): JTwitterContext; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterContext')]
  JTwitterContext = interface(JObject)
  ['{3FB095CC-5827-447F-9722-219D25EEDA5E}']
    { Property Methods }

    { methods }
    function getDatabasePath(name: JString): JFile; cdecl;
    function openOrCreateDatabase(name: JString; mode: Integer; factory: JSQLiteDatabase_CursorFactory): JSQLiteDatabase; cdecl; overload;
    function openOrCreateDatabase(name: JString; mode: Integer; factory: JSQLiteDatabase_CursorFactory; errorHandler: JDatabaseErrorHandler): JSQLiteDatabase; cdecl; overload;
    function getFilesDir: JFile; cdecl;
    function getExternalFilesDir(atype: JString): JFile; cdecl;
    function getCacheDir: JFile; cdecl;
    function getExternalCacheDir: JFile; cdecl;
    function getSharedPreferences(name: JString; mode: Integer): JSharedPreferences; cdecl;

    { Property }
  end;

  TJTwitterContext = class(TJavaGenericImport<JTwitterContextClass, JTwitterContext>) end;

  JMediaServiceClass = interface(JObjectClass)
  ['{4BDBD77A-7E11-4A16-85BD-4BAF66D558FE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/MediaService')]
  JMediaService = interface(IJavaInstance)
  ['{41C6C1AE-F71F-41C7-9624-CFB7FEE6C524}']
    { Property Methods }

    { methods }
//    function upload(P1: JRequestBody; P2: JRequestBody; P3: JRequestBody): JCall; cdecl;

    { Property }
  end;

  TJMediaService = class(TJavaGenericImport<JMediaServiceClass, JMediaService>) end;

  JCollectionServiceClass = interface(JObjectClass)
  ['{15A34449-11BF-4D55-8D1C-BDC9915EDB67}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/CollectionService')]
  JCollectionService = interface(IJavaInstance)
  ['{F8AD38F9-8A04-4DD1-ABAF-2E35DDC2D135}']
    { Property Methods }

    { methods }
//    function collection(P1: JString; P2: JInteger; P3: JLong; P4: JLong): JCall; cdecl;

    { Property }
  end;

  TJCollectionService = class(TJavaGenericImport<JCollectionServiceClass, JCollectionService>) end;

  JFavoriteServiceClass = interface(JObjectClass)
  ['{6115A207-31AD-4842-BB3E-4B9465406C0B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/FavoriteService')]
  JFavoriteService = interface(IJavaInstance)
  ['{DB844E73-819F-4DDE-9EEE-D4DDD214A2BC}']
    { Property Methods }

    { methods }
//    function list(P1: JLong; P2: JString; P3: JInteger; P4: JString; P5: JString; P6: JBoolean): JCall; cdecl;
//    function destroy(P1: JLong; P2: JBoolean): JCall; cdecl;
//    function create(P1: JLong; P2: JBoolean): JCall; cdecl;

    { Property }
  end;

  TJFavoriteService = class(TJavaGenericImport<JFavoriteServiceClass, JFavoriteService>) end;

  JStatusesServiceClass = interface(JObjectClass)
  ['{330A7746-B19C-4A18-800E-47D6F4CADC7B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/StatusesService')]
  JStatusesService = interface(IJavaInstance)
  ['{1AB90D0F-CF12-4E82-BC94-D82E2DDF2F25}']
    { Property Methods }

    { methods }
//    function mentionsTimeline(P1: JInteger; P2: JLong; P3: JLong; P4: JBoolean; P5: JBoolean; P6: JBoolean): JCall; cdecl;
//    function userTimeline(P1: JLong; P2: JString; P3: JInteger; P4: JLong; P5: JLong; P6: JBoolean; P7: JBoolean; P8: JBoolean; P9: JBoolean): JCall; cdecl;
//    function homeTimeline(P1: JInteger; P2: JLong; P3: JLong; P4: JBoolean; P5: JBoolean; P6: JBoolean; P7: JBoolean): JCall; cdecl;
//    function retweetsOfMe(P1: JInteger; P2: JLong; P3: JLong; P4: JBoolean; P5: JBoolean; P6: JBoolean): JCall; cdecl;
//    function show(P1: JLong; P2: JBoolean; P3: JBoolean; P4: JBoolean): JCall; cdecl;
//    function lookup(P1: JString; P2: JBoolean; P3: JBoolean; P4: JBoolean): JCall; cdecl;
//    function update(P1: JString; P2: JLong; P3: JBoolean; P4: JDouble; P5: JDouble; P6: JString; P7: JBoolean; P8: JBoolean; P9: JString): JCall; cdecl;
//    function retweet(P1: JLong; P2: JBoolean): JCall; cdecl;
//    function destroy(P1: JLong; P2: JBoolean): JCall; cdecl;
//    function unretweet(P1: JLong; P2: JBoolean): JCall; cdecl;

    { Property }
  end;

  TJStatusesService = class(TJavaGenericImport<JStatusesServiceClass, JStatusesService>) end;

  JSearchServiceClass = interface(JObjectClass)
  ['{C2D589C0-8F06-4F81-8E86-C54664B081FC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/SearchService')]
  JSearchService = interface(IJavaInstance)
  ['{82E6647E-A639-41F4-BB02-D1D1C37F103F}']
    { Property Methods }

    { methods }
//    function tweets(P1: JString; P2: JGeocode; P3: JString; P4: JString; P5: JString; P6: JInteger; P7: JString; P8: JLong; P9: JLong; P10: JBoolean): JCall; cdecl;

    { Property }
  end;

  TJSearchService = class(TJavaGenericImport<JSearchServiceClass, JSearchService>) end;

  JAccountServiceClass = interface(JObjectClass)
  ['{786E4EB6-169C-4308-B630-45F703D6291B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/AccountService')]
  JAccountService = interface(IJavaInstance)
  ['{D5C184FE-1543-4F62-B1EA-5AD7C3FE7CEE}']
    { Property Methods }

    { methods }
//    function verifyCredentials(P1: JBoolean; P2: JBoolean; P3: JBoolean): JCall; cdecl;

    { Property }
  end;

  TJAccountService = class(TJavaGenericImport<JAccountServiceClass, JAccountService>) end;

  JConfigurationServiceClass = interface(JObjectClass)
  ['{3C3FC4C2-48B4-4D07-A7B9-CCD3DD6BF26A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/ConfigurationService')]
  JConfigurationService = interface(IJavaInstance)
  ['{E9C0C313-1162-4AE2-8D6B-6124A9C1EAFE}']
    { Property Methods }

    { methods }
//    function configuration: JCall; cdecl;

    { Property }
  end;

  TJConfigurationService = class(TJavaGenericImport<JConfigurationServiceClass, JConfigurationService>) end;

  JListServiceClass = interface(JObjectClass)
  ['{77FCDFE1-1EF7-4144-9972-ED5A16C6B8C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/ListService')]
  JListService = interface(IJavaInstance)
  ['{5B67E6EF-7DC6-495A-8BDB-0966196089C1}']
    { Property Methods }

    { methods }
//    function statuses(P1: JLong; P2: JString; P3: JString; P4: JLong; P5: JLong; P6: JLong; P7: JInteger; P8: JBoolean; P9: JBoolean): JCall; cdecl;

    { Property }
  end;

  TJListService = class(TJavaGenericImport<JListServiceClass, JListService>) end;

  JGeocodeClass = interface(JObjectClass)
  ['{7D6D3BE7-2C27-47A1-B71B-8FBC03895703}']
    { static Property Methods }

    { static Methods }
    {class} function init(latitude: Double; longitude: Double; P3: Integer; distance: JGeocode_Distance): JGeocode; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/params/Geocode')]
  JGeocode = interface(JObject)
  ['{6ED1E20C-8CEB-4753-802A-DDD1B05E5955}']
    { Property Methods }
    function _Getlatitude: Double;
    procedure _Setlatitude(alatitude: Double);
    function _Getlongitude: Double;
    procedure _Setlongitude(alongitude: Double);
    function _Getradius: Integer;
    procedure _Setradius(aradius: Integer);
    function _Getdistance: JGeocode_Distance;
    procedure _Setdistance(adistance: JGeocode_Distance);

    { methods }
    function toString: JString; cdecl;

    { Property }
    property latitude: Double read _Getlatitude write _Setlatitude;
    property longitude: Double read _Getlongitude write _Setlongitude;
    property radius: Integer read _Getradius write _Setradius;
    property distance: JGeocode_Distance read _Getdistance write _Setdistance;
  end;

  TJGeocode = class(TJavaGenericImport<JGeocodeClass, JGeocode>) end;

  JGeocode_DistanceClass = interface(JObjectClass)
  ['{304B4492-9450-49F0-8A39-49EE5BBC3E4D}']
    { static Property Methods }
    {class} function _GetMILES: JGeocode_Distance;
    {class} function _GetKILOMETERS: JGeocode_Distance;

    { static Methods }
    {class} function values: TJavaObjectArray<JGeocode_Distance>; cdecl;
    {class} function valueOf(P1: JString): JGeocode_Distance; cdecl;

    { static Property }
    {class} property MILES: JGeocode_Distance read _GetMILES;
    {class} property KILOMETERS: JGeocode_Distance read _GetKILOMETERS;
  end;

  [JavaSignature('com/twitter/sdk/android/core/services/params/Geocode$Distance')]
  JGeocode_Distance = interface(JObject)
  ['{4FD6E8D2-AA80-4DAC-B09B-331794CE6A30}']
    { Property Methods }
    function _Getidentifier: JString;
    procedure _Setidentifier(aidentifier: JString);

    { methods }

    { Property }
    property identifier: JString read _Getidentifier write _Setidentifier;
  end;

  TJGeocode_Distance = class(TJavaGenericImport<JGeocode_DistanceClass, JGeocode_Distance>) end;

  JDefaultLoggerClass = interface(JObjectClass)
  ['{097B6F8C-D9BD-4EEA-AC41-AEB70D97D75A}']
    { static Property Methods }

    { static Methods }
    {class} function init(logLevel: Integer): JDefaultLogger; cdecl; overload;
    {class} function init: JDefaultLogger; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/DefaultLogger')]
  JDefaultLogger = interface(JObject)
  ['{9A9D0928-5E51-4127-B14C-459FB1370853}']
    { Property Methods }

    { methods }
    function isLoggable(tag: JString; level: Integer): Boolean; cdecl;
    function getLogLevel: Integer; cdecl;
    procedure setLogLevel(logLevel: Integer); cdecl;
    procedure d(tag: JString; text: JString; throwable: JThrowable); cdecl; overload;
    procedure v(tag: JString; text: JString; throwable: JThrowable); cdecl; overload;
    procedure i(tag: JString; text: JString; throwable: JThrowable); cdecl; overload;
    procedure w(tag: JString; text: JString; throwable: JThrowable); cdecl; overload;
    procedure e(tag: JString; text: JString; throwable: JThrowable); cdecl; overload;
    procedure d(tag: JString; text: JString); cdecl; overload;
    procedure v(tag: JString; text: JString); cdecl; overload;
    procedure i(tag: JString; text: JString); cdecl; overload;
    procedure w(tag: JString; text: JString); cdecl; overload;
    procedure e(tag: JString; text: JString); cdecl; overload;
    procedure log(priority: Integer; tag: JString; msg: JString); cdecl; overload;
    procedure log(priority: Integer; tag: JString; msg: JString; forceLog: Boolean); cdecl; overload;

    { Property }
  end;

  TJDefaultLogger = class(TJavaGenericImport<JDefaultLoggerClass, JDefaultLogger>) end;

  JOAuthSigningClass = interface(JObjectClass)
  ['{65AC4B4E-3392-488C-B919-0B75D2DE30FF}']
    { static Property Methods }

    { static Methods }
    {class} function init(authConfig: JTwitterAuthConfig; authToken: JTwitterAuthToken): JOAuthSigning; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/OAuthSigning')]
  JOAuthSigning = interface(JObject)
  ['{26709635-95C0-4417-BF27-E13B22EE392F}']
    { Property Methods }

    { methods }
    function getAuthorizationHeader(method: JString; url: JString; postParams: JMap): JString; cdecl;
    function getOAuthEchoHeaders(method: JString; url: JString; postParams: JMap): JMap; cdecl;
    function getOAuthEchoHeadersForVerifyCredentials: JMap; cdecl;

    { Property }
  end;

  TJOAuthSigning = class(TJavaGenericImport<JOAuthSigningClass, JOAuthSigning>) end;

  JGuestSessionProviderClass = interface(JObjectClass)
  ['{3254C185-2CBB-4CBD-BC80-10E8C0E647DC}']
    { static Property Methods }

    { static Methods }
    {class} function init(oAuth2Service: JOAuth2Service; sessionManager: JSessionManager): JGuestSessionProvider; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/GuestSessionProvider')]
  JGuestSessionProvider = interface(JObject)
  ['{D1199B15-E3D3-472B-9EC4-86E0E8DE7222}']
    { Property Methods }

    { methods }
    function getCurrentSession: JGuestSession; cdecl;
    function refreshCurrentSession(expiredSession: JGuestSession): JGuestSession; cdecl;

    { Property }
  end;

  TJGuestSessionProvider = class(TJavaGenericImport<JGuestSessionProviderClass, JGuestSessionProvider>) end;

  JGuestSessionClass = interface(JObjectClass)
  ['{078BB1BC-563F-4283-8F66-6A72F1F7A091}']
    { static Property Methods }
    {class} function _GetLOGGED_OUT_USER_ID: Int64;

    { static Methods }
    {class} function init(authToken: JGuestAuthToken): JGuestSession; cdecl;

    { static Property }
    {class} property LOGGED_OUT_USER_ID: Int64 read _GetLOGGED_OUT_USER_ID;
  end;

  [JavaSignature('com/twitter/sdk/android/core/GuestSession')]
  JGuestSession = interface(JObject)
  ['{13E65225-E2D2-485A-88E6-97009CF9B78F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGuestSession = class(TJavaGenericImport<JGuestSessionClass, JGuestSession>) end;

  JTwitterAuthConfigClass = interface(JObjectClass)
  ['{4621B2C2-2CCD-40A7-9284-AFBD48B3EC2A}']
    { static Property Methods }
    {class} function _GetDEFAULT_AUTH_REQUEST_CODE: Integer;
    {class} function _GetCREATOR: JParcelable_Creator;

    { static Methods }
    {class} function init(consumerKey: JString; consumerSecret: JString): JTwitterAuthConfig; cdecl;

    { static Property }
    {class} property DEFAULT_AUTH_REQUEST_CODE: Integer read _GetDEFAULT_AUTH_REQUEST_CODE;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterAuthConfig')]
  JTwitterAuthConfig = interface(JObject)
  ['{2F59BE14-5359-477B-8A80-E869674C1C60}']
    { Property Methods }

    { methods }
    function getConsumerKey: JString; cdecl;
    function getConsumerSecret: JString; cdecl;
    function getRequestCode: Integer; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(aout: JParcel; flags: Integer); cdecl;

    { Property }
  end;

  TJTwitterAuthConfig = class(TJavaGenericImport<JTwitterAuthConfigClass, JTwitterAuthConfig>) end;

  JResultClass = interface(JObjectClass)
  ['{058FB1B7-2C4E-4AF3-AAC4-415A426D694E}']
    { static Property Methods }

    { static Methods }
//    {class} function init(data: JObject; response: JResponse): JResult; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/Result')]
  JResult = interface(JObject)
  ['{A76E5F70-F3B7-40F5-A196-A82E0E1E8B91}']
    { Property Methods }
    function _Getdata: JObject;
    procedure _Setdata(adata: JObject);
//    function _Getresponse: JResponse;
//    procedure _Setresponse(aresponse: JResponse);

    { methods }

    { Property }
    property data: JObject read _Getdata write _Setdata;
//    property response: JResponse read _Getresponse write _Setresponse;
  end;

  TJResult = class(TJavaGenericImport<JResultClass, JResult>) end;

  JTwitterRateLimitClass = interface(JObjectClass)
  ['{161D8F89-7180-4226-B53B-92B0487EA0CD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterRateLimit')]
  JTwitterRateLimit = interface(JObject)
  ['{6C1BD415-2CF2-40D2-A300-8E77EE53FDB7}']
    { Property Methods }

    { methods }
    function getLimit: Integer; cdecl;
    function getRemaining: Integer; cdecl;
    function getReset: Int64; cdecl;

    { Property }
  end;

  TJTwitterRateLimit = class(TJavaGenericImport<JTwitterRateLimitClass, JTwitterRateLimit>) end;

  JAuthTokenAdapterClass = interface(JObjectClass)
  ['{5ED08247-068A-43E3-9A54-211B3D30A16A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAuthTokenAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/AuthTokenAdapter')]
  JAuthTokenAdapter = interface(JObject)
  ['{740D5ED7-A0F3-4474-8A39-E0538FBC136C}']
    { Property Methods }

    { methods }
//    function serialize(src: JAuthToken; typeOfSrc: JType; context: JJsonSerializationContext): JJsonElement; cdecl; overload;
//    function deserialize(json: JJsonElement; typeOfT: JType; context: JJsonDeserializationContext): JAuthToken; cdecl; overload;
//    function serialize(P1: JObject; P2: JType; P3: JJsonSerializationContext): JJsonElement; cdecl; overload;
//    function deserialize(P1: JJsonElement; P2: JType; P3: JJsonDeserializationContext): JObject; cdecl; overload;

    { Property }
  end;

  TJAuthTokenAdapter = class(TJavaGenericImport<JAuthTokenAdapterClass, JAuthTokenAdapter>) end;

  JTwitterConfig_1Class = interface(JObjectClass)
  ['{0EBEFA19-5C6B-49DE-81C4-EA1A55BB121D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterConfig$1')]
  JTwitterConfig_1 = interface(JObject)
  ['{45B113EB-5085-4A0F-9E09-F6F40CF66EC4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterConfig_1 = class(TJavaGenericImport<JTwitterConfig_1Class, JTwitterConfig_1>) end;

  JLoggerClass = interface(JObjectClass)
  ['{2894CD04-EE82-47FB-AD25-271E6098FA8B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/Logger')]
  JLogger = interface(IJavaInstance)
  ['{4F9BBE80-F124-456B-9819-4302597A8E60}']
    { Property Methods }

    { methods }
    function isLoggable(P1: JString; P2: Integer): Boolean; cdecl;
    function getLogLevel: Integer; cdecl;
    procedure setLogLevel(P1: Integer); cdecl;
    procedure d(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
    procedure v(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
    procedure i(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
    procedure w(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
    procedure e(P1: JString; P2: JString; P3: JThrowable); cdecl; overload;
    procedure d(P1: JString; P2: JString); cdecl; overload;
    procedure v(P1: JString; P2: JString); cdecl; overload;
    procedure i(P1: JString; P2: JString); cdecl; overload;
    procedure w(P1: JString; P2: JString); cdecl; overload;
    procedure e(P1: JString; P2: JString); cdecl; overload;
    procedure log(P1: Integer; P2: JString; P3: JString); cdecl; overload;
    procedure log(P1: Integer; P2: JString; P3: JString; P4: Boolean); cdecl; overload;

    { Property }
  end;

  TJLogger = class(TJavaGenericImport<JLoggerClass, JLogger>) end;

  JPersistedSessionManagerClass = interface(JObjectClass)
  ['{37C9BA2C-FC53-4B7B-8E92-D4B0274FFEB7}']
    { static Property Methods }

    { static Methods }
    {class} function init(preferenceStore: JPreferenceStore; serializer: JSerializationStrategy; prefKeyActiveSession: JString; prefKeySession: JString): JPersistedSessionManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/PersistedSessionManager')]
  JPersistedSessionManager = interface(JObject)
  ['{17AFDA78-D902-4630-B943-F9A6BF1FC324}']
    { Property Methods }

    { methods }
    function getActiveSession: JSession; cdecl;
    procedure setActiveSession(session: JSession); cdecl;
    procedure clearActiveSession; cdecl;
    function getSession(id: Int64): JSession; cdecl;
    procedure setSession(id: Int64; session: JSession); cdecl;
    function getSessionMap: JMap; cdecl;
    procedure clearSession(id: Int64); cdecl;

    { Property }
  end;

  TJPersistedSessionManager = class(TJavaGenericImport<JPersistedSessionManagerClass, JPersistedSessionManager>) end;

  JSessionManagerClass = interface(JObjectClass)
  ['{E08D8EA5-A141-4742-B7F8-926120E4A3F8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/SessionManager')]
  JSessionManager = interface(IJavaInstance)
  ['{1A8CCD0B-ECF1-4FEF-B818-E85FC6B694E8}']
    { Property Methods }

    { methods }
    function getActiveSession: JSession; cdecl;
    procedure setActiveSession(P1: JSession); cdecl;
    procedure clearActiveSession; cdecl;
    function getSession(P1: Int64): JSession; cdecl;
    procedure setSession(P1: Int64; P2: JSession); cdecl;
    procedure clearSession(P1: Int64); cdecl;
    function getSessionMap: JMap; cdecl;

    { Property }
  end;

  TJSessionManager = class(TJavaGenericImport<JSessionManagerClass, JSessionManager>) end;

  JTwitterSessionClass = interface(JObjectClass)
  ['{7EEC4501-59A5-4134-B642-CF23030C26CB}']
    { static Property Methods }
    {class} function _GetUNKNOWN_USER_ID: Int64;
    {class} function _GetUNKNOWN_USER_NAME: JString;

    { static Methods }
    {class} function init(authToken: JTwitterAuthToken; userId: Int64; userName: JString): JTwitterSession; cdecl;

    { static Property }
    {class} property UNKNOWN_USER_ID: Int64 read _GetUNKNOWN_USER_ID;
    {class} property UNKNOWN_USER_NAME: JString read _GetUNKNOWN_USER_NAME;
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterSession')]
  JTwitterSession = interface(JObject)
  ['{225B43C4-4F8B-4EF5-BD6E-E428FD413CD3}']
    { Property Methods }

    { methods }
    function getUserId: Int64; cdecl;
    function getUserName: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJTwitterSession = class(TJavaGenericImport<JTwitterSessionClass, JTwitterSession>) end;

  JSystemCurrentTimeProviderClass = interface(JObjectClass)
  ['{15C8A638-795A-4B5B-A84D-4F8CFB4F3494}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSystemCurrentTimeProvider; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/SystemCurrentTimeProvider')]
  JSystemCurrentTimeProvider = interface(JObject)
  ['{859411E4-621E-4651-B58B-940235EE11B2}']
    { Property Methods }

    { methods }
    function getCurrentTimeMillis: Int64; cdecl;

    { Property }
  end;

  TJSystemCurrentTimeProvider = class(TJavaGenericImport<JSystemCurrentTimeProviderClass, JSystemCurrentTimeProvider>) end;

  JTwitterApiConstants_ErrorsClass = interface(JObjectClass)
  ['{5EDB2937-83CD-49C3-BB63-6998D54E813C}']
    { static Property Methods }
    {class} function _GetAPP_AUTH_ERROR_CODE: Integer;
    {class} function _GetALREADY_FAVORITED: Integer;
    {class} function _GetALREADY_UNFAVORITED: Integer;
    {class} function _GetGUEST_AUTH_ERROR_CODE: Integer;

    { static Methods }
    {class} function init: JTwitterApiConstants_Errors; cdecl;

    { static Property }
    {class} property APP_AUTH_ERROR_CODE: Integer read _GetAPP_AUTH_ERROR_CODE;
    {class} property ALREADY_FAVORITED: Integer read _GetALREADY_FAVORITED;
    {class} property ALREADY_UNFAVORITED: Integer read _GetALREADY_UNFAVORITED;
    {class} property GUEST_AUTH_ERROR_CODE: Integer read _GetGUEST_AUTH_ERROR_CODE;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/TwitterApiConstants$Errors')]
  JTwitterApiConstants_Errors = interface(JObject)
  ['{E3F7DDB0-99BA-4B55-908A-E6DCD020C929}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterApiConstants_Errors = class(TJavaGenericImport<JTwitterApiConstants_ErrorsClass, JTwitterApiConstants_Errors>) end;

  JTwitterSessionVerifierClass = interface(JObjectClass)
  ['{68AAA431-A259-431D-BD94-EA30964EE2CA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTwitterSessionVerifier; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/TwitterSessionVerifier')]
  JTwitterSessionVerifier = interface(JObject)
  ['{83900800-E1D5-4AE7-AEEF-33737BEA5F6F}']
    { Property Methods }

    { methods }
    procedure verifySession(session: JTwitterSession); cdecl; overload;
    procedure verifySession(P1: JSession); cdecl; overload;

    { Property }
  end;

  TJTwitterSessionVerifier = class(TJavaGenericImport<JTwitterSessionVerifierClass, JTwitterSessionVerifier>) end;

  JAdvertisingInfoServiceStrategy_AdvertisingConnectionClass = interface(JObjectClass)
  ['{CE7ED645-F7E3-4153-BA5C-6B3B4E8A7579}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfoServiceStrategy$AdvertisingConnection')]
  JAdvertisingInfoServiceStrategy_AdvertisingConnection = interface(JObject)
  ['{A7DE46B3-E72D-49CA-B08E-1323FABF7EF3}']
    { Property Methods }

    { methods }
    procedure onServiceConnected(name: JComponentName; service: JIBinder); cdecl;
    procedure onServiceDisconnected(name: JComponentName); cdecl;

    { Property }
  end;

  TJAdvertisingInfoServiceStrategy_AdvertisingConnection = class(TJavaGenericImport<JAdvertisingInfoServiceStrategy_AdvertisingConnectionClass, JAdvertisingInfoServiceStrategy_AdvertisingConnection>) end;

  JUserUtilsClass = interface(JObjectClass)
  ['{DED64E86-AA5A-4168-B9B6-F493085555BB}']
    { static Property Methods }

    { static Methods }
    {class} function getProfileImageUrlHttps(size: JUser; url: JUserUtils_AvatarSize): JString; cdecl;
    {class} function formatScreenName(P1: JCharSequence): JCharSequence; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/UserUtils')]
  JUserUtils = interface(JObject)
  ['{DB269291-10D6-4629-A9E8-3482DAA7D82A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUserUtils = class(TJavaGenericImport<JUserUtilsClass, JUserUtils>) end;

  JUserUtils_1Class = interface(JObjectClass)
  ['{68C08D2C-1B34-4645-8358-28F6C60DBD90}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/UserUtils$1')]
  JUserUtils_1 = interface(JObject)
  ['{62B52DD0-21D0-4992-A6CD-3D17C744CEAE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUserUtils_1 = class(TJavaGenericImport<JUserUtils_1Class, JUserUtils_1>) end;

  JActivityLifecycleManager_CallbacksClass = interface(JObjectClass)
  ['{CC45D244-0D3B-4BA4-BB2D-AC9BD05F9337}']
    { static Property Methods }

    { static Methods }
    {class} function init: JActivityLifecycleManager_Callbacks; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/ActivityLifecycleManager$Callbacks')]
  JActivityLifecycleManager_Callbacks = interface(JObject)
  ['{3D949D60-34E1-4E43-B42F-3262AAD78865}']
    { Property Methods }

    { methods }
    procedure onActivityCreated(activity: JActivity; bundle: JBundle); cdecl;
    procedure onActivityStarted(activity: JActivity); cdecl;
    procedure onActivityResumed(activity: JActivity); cdecl;
    procedure onActivityPaused(activity: JActivity); cdecl;
    procedure onActivityStopped(activity: JActivity); cdecl;
    procedure onActivitySaveInstanceState(activity: JActivity; bundle: JBundle); cdecl;
    procedure onActivityDestroyed(activity: JActivity); cdecl;

    { Property }
  end;

  TJActivityLifecycleManager_Callbacks = class(TJavaGenericImport<JActivityLifecycleManager_CallbacksClass, JActivityLifecycleManager_Callbacks>) end;

  JSessionMonitor_MonitorStateClass = interface(JObjectClass)
  ['{47ED8E67-44BA-4518-9501-450AF42AE54B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSessionMonitor_MonitorState; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/SessionMonitor$MonitorState')]
  JSessionMonitor_MonitorState = interface(JObject)
  ['{185C8AF8-D96C-47D1-ABD8-D1851ECD600F}']
    { Property Methods }
    function _Getverifying: Boolean;
    procedure _Setverifying(averifying: Boolean);
    function _GetlastVerification: Int64;
    procedure _SetlastVerification(alastVerification: Int64);

    { methods }
    function beginVerification(currentTime: Int64): Boolean; cdecl;
    procedure endVerification(currentTime: Int64); cdecl;

    { Property }
    property verifying: Boolean read _Getverifying write _Setverifying;
    property lastVerification: Int64 read _GetlastVerification write _SetlastVerification;
  end;

  TJSessionMonitor_MonitorState = class(TJavaGenericImport<JSessionMonitor_MonitorStateClass, JSessionMonitor_MonitorState>) end;

  JSessionVerifierClass = interface(JObjectClass)
  ['{B9A06AB5-45D9-4D6C-98E2-ABA5C7B3EE96}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/SessionVerifier')]
  JSessionVerifier = interface(IJavaInstance)
  ['{5DEF99A5-568B-4B48-94BF-3AC66D27A2B6}']
    { Property Methods }

    { methods }
    procedure verifySession(P1: JSession); cdecl;

    { Property }
  end;

  TJSessionVerifier = class(TJavaGenericImport<JSessionVerifierClass, JSessionVerifier>) end;

  JSessionMonitorClass = interface(JObjectClass)
  ['{0DA3CABA-12D7-46DC-90A7-C3A2E7E107A3}']
    { static Property Methods }

    { static Methods }
    {class} function init(sessionManager: JSessionManager; executorService: JExecutorService; sessionVerifier: JSessionVerifier): JSessionMonitor; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/SessionMonitor')]
  JSessionMonitor = interface(JObject)
  ['{CFDD0DAF-2BD4-4730-BEDC-1B0A8301197C}']
    { Property Methods }

    { methods }
    procedure monitorActivityLifecycle(activityLifecycleManager: JActivityLifecycleManager); cdecl;
    procedure triggerVerificationIfNecessary; cdecl;

    { Property }
  end;

  TJSessionMonitor = class(TJavaGenericImport<JSessionMonitorClass, JSessionMonitor>) end;

  JPreferenceStoreImplClass = interface(JObjectClass)
  ['{FFFD1D55-242F-465A-838D-2F20D745E216}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; name: JString): JPreferenceStoreImpl; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/persistence/PreferenceStoreImpl')]
  JPreferenceStoreImpl = interface(JObject)
  ['{356D8257-5828-4687-9C48-2DF964AA5155}']
    { Property Methods }

    { methods }
    function get: JSharedPreferences; cdecl;
    function edit: JSharedPreferences_Editor; cdecl;
    function save(editor: JSharedPreferences_Editor): Boolean; cdecl;

    { Property }
  end;

  TJPreferenceStoreImpl = class(TJavaGenericImport<JPreferenceStoreImplClass, JPreferenceStoreImpl>) end;

  JPreferenceStoreClass = interface(JObjectClass)
  ['{5E8C36E0-9E5F-40B1-8726-38251560D2BD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/persistence/PreferenceStore')]
  JPreferenceStore = interface(IJavaInstance)
  ['{8A67D9E0-112E-43F1-BB97-B4BD60005D70}']
    { Property Methods }

    { methods }
    function get: JSharedPreferences; cdecl;
    function edit: JSharedPreferences_Editor; cdecl;
    function save(P1: JSharedPreferences_Editor): Boolean; cdecl;

    { Property }
  end;

  TJPreferenceStore = class(TJavaGenericImport<JPreferenceStoreClass, JPreferenceStore>) end;

  JFileStoreImplClass = interface(JObjectClass)
  ['{C211163E-8168-49D9-A29E-80C35B1C4577}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JFileStoreImpl; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/persistence/FileStoreImpl')]
  JFileStoreImpl = interface(JObject)
  ['{1228BFAE-60FA-44AC-84EA-C496EA3CF6F8}']
    { Property Methods }

    { methods }
    function getCacheDir: JFile; cdecl;
    function getExternalCacheDir: JFile; cdecl;
    function getFilesDir: JFile; cdecl;
    function getExternalFilesDir: JFile; cdecl;

    { Property }
  end;

  TJFileStoreImpl = class(TJavaGenericImport<JFileStoreImplClass, JFileStoreImpl>) end;

  JPersistenceStrategyClass = interface(JObjectClass)
  ['{C5D47F33-47A0-4B48-9452-2C7F81B21092}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/persistence/PersistenceStrategy')]
  JPersistenceStrategy = interface(IJavaInstance)
  ['{BAA39125-5DBE-45A4-A22F-FEA6A7303964}']
    { Property Methods }

    { methods }
    procedure save(P1: JObject); cdecl;
    function restore: JObject; cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJPersistenceStrategy = class(TJavaGenericImport<JPersistenceStrategyClass, JPersistenceStrategy>) end;

  JPreferenceStoreStrategyClass = interface(JObjectClass)
  ['{6A1FC8D3-555B-4458-8101-C0040D2B1EDD}']
    { static Property Methods }

    { static Methods }
    {class} function init(store: JPreferenceStore; serializer: JSerializationStrategy; preferenceKey: JString): JPreferenceStoreStrategy; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/persistence/PreferenceStoreStrategy')]
  JPreferenceStoreStrategy = interface(JObject)
  ['{4A858C01-E174-4DEA-884C-BB2766BAC78E}']
    { Property Methods }

    { methods }
    procedure save(aobject: JObject); cdecl;
    function restore: JObject; cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJPreferenceStoreStrategy = class(TJavaGenericImport<JPreferenceStoreStrategyClass, JPreferenceStoreStrategy>) end;

  JFileStoreClass = interface(JObjectClass)
  ['{50F8EEDD-FE0B-4F25-BCF5-F2A6989C66AD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/persistence/FileStore')]
  JFileStore = interface(IJavaInstance)
  ['{84CB1430-E1D2-42AF-B28A-15E967F46B91}']
    { Property Methods }

    { methods }
    function getCacheDir: JFile; cdecl;
    function getExternalCacheDir: JFile; cdecl;
    function getFilesDir: JFile; cdecl;
    function getExternalFilesDir: JFile; cdecl;

    { Property }
  end;

  TJFileStore = class(TJavaGenericImport<JFileStoreClass, JFileStore>) end;

  JSerializationStrategyClass = interface(JObjectClass)
  ['{77393C6C-24A5-4798-B3DB-27120F99FAF9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/persistence/SerializationStrategy')]
  JSerializationStrategy = interface(IJavaInstance)
  ['{AADFF971-EA51-4BEA-8739-FB664158C1E3}']
    { Property Methods }

    { methods }
    function serialize(P1: JObject): JString; cdecl;
    function deserialize(P1: JString): JObject; cdecl;

    { Property }
  end;

  TJSerializationStrategy = class(TJavaGenericImport<JSerializationStrategyClass, JSerializationStrategy>) end;

  JGuestTokenResponseClass = interface(JObjectClass)
  ['{82E6260F-CBC0-402C-B6CE-D999AC1A4CCA}']
    { static Property Methods }

    { static Methods }
    {class} function init(guestToken: JString): JGuestTokenResponse; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/GuestTokenResponse')]
  JGuestTokenResponse = interface(JObject)
  ['{6B1A5F65-F8E4-4F97-A52B-EA960A94B4B0}']
    { Property Methods }
    function _GetguestToken: JString;
    procedure _SetguestToken(aguestToken: JString);

    { methods }

    { Property }
    property guestToken: JString read _GetguestToken write _SetguestToken;
  end;

  TJGuestTokenResponse = class(TJavaGenericImport<JGuestTokenResponseClass, JGuestTokenResponse>) end;

  JGuestAuthTokenClass = interface(JObjectClass)
  ['{5DAFADE0-313B-46E6-83E7-FF26F758112C}']
    { static Property Methods }
    {class} function _GetHEADER_GUEST_TOKEN: JString;

    { static Methods }
    {class} function init(tokenType: JString; accessToken: JString; guestToken: JString): JGuestAuthToken; cdecl; overload;
    {class} function init(tokenType: JString; accessToken: JString; guestToken: JString; createdAt: Int64): JGuestAuthToken; cdecl; overload;

    { static Property }
    {class} property HEADER_GUEST_TOKEN: JString read _GetHEADER_GUEST_TOKEN;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/GuestAuthToken')]
  JGuestAuthToken = interface(JObject)
  ['{B5DCFE28-C3C4-4888-911B-725FEC6CBF47}']
    { Property Methods }

    { methods }
    function getGuestToken: JString; cdecl;
    function isExpired: Boolean; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJGuestAuthToken = class(TJavaGenericImport<JGuestAuthTokenClass, JGuestAuthToken>) end;

  JOAuth1aService_1Class = interface(JObjectClass)
  ['{C4BAE211-2874-4771-94C2-1BACBA7542FC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth1aService$1')]
  JOAuth1aService_1 = interface(JObject)
  ['{CF186941-213A-4D59-AC7F-E6D9F765A1E3}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJOAuth1aService_1 = class(TJavaGenericImport<JOAuth1aService_1Class, JOAuth1aService_1>) end;

  JOAuthConstantsClass = interface(JObjectClass)
  ['{04EBFBA4-0B1F-4660-8943-3FFFACF07CC8}']
    { static Property Methods }
    {class} function _GetHEADER_AUTHORIZATION: JString;
    {class} function _GetHEADER_GUEST_TOKEN: JString;
    {class} function _GetPARAM_CALLBACK: JString;
    {class} function _GetPARAM_CONSUMER_KEY: JString;
    {class} function _GetPARAM_NONCE: JString;
    {class} function _GetPARAM_SIGNATURE_METHOD: JString;
    {class} function _GetPARAM_TIMESTAMP: JString;
    {class} function _GetPARAM_TOKEN: JString;
    {class} function _GetPARAM_TOKEN_SECRET: JString;
    {class} function _GetPARAM_VERSION: JString;
    {class} function _GetPARAM_SIGNATURE: JString;
    {class} function _GetPARAM_VERIFIER: JString;
    {class} function _GetAUTHORIZATION_BASIC: JString;
    {class} function _GetAUTHORIZATION_BEARER: JString;
    {class} function _GetPARAM_GRANT_TYPE: JString;
    {class} function _GetGRANT_TYPE_CLIENT_CREDENTIALS: JString;

    { static Methods }
    {class} function init: JOAuthConstants; cdecl;

    { static Property }
    {class} property HEADER_AUTHORIZATION: JString read _GetHEADER_AUTHORIZATION;
    {class} property HEADER_GUEST_TOKEN: JString read _GetHEADER_GUEST_TOKEN;
    {class} property PARAM_CALLBACK: JString read _GetPARAM_CALLBACK;
    {class} property PARAM_CONSUMER_KEY: JString read _GetPARAM_CONSUMER_KEY;
    {class} property PARAM_NONCE: JString read _GetPARAM_NONCE;
    {class} property PARAM_SIGNATURE_METHOD: JString read _GetPARAM_SIGNATURE_METHOD;
    {class} property PARAM_TIMESTAMP: JString read _GetPARAM_TIMESTAMP;
    {class} property PARAM_TOKEN: JString read _GetPARAM_TOKEN;
    {class} property PARAM_TOKEN_SECRET: JString read _GetPARAM_TOKEN_SECRET;
    {class} property PARAM_VERSION: JString read _GetPARAM_VERSION;
    {class} property PARAM_SIGNATURE: JString read _GetPARAM_SIGNATURE;
    {class} property PARAM_VERIFIER: JString read _GetPARAM_VERIFIER;
    {class} property AUTHORIZATION_BASIC: JString read _GetAUTHORIZATION_BASIC;
    {class} property AUTHORIZATION_BEARER: JString read _GetAUTHORIZATION_BEARER;
    {class} property PARAM_GRANT_TYPE: JString read _GetPARAM_GRANT_TYPE;
    {class} property GRANT_TYPE_CLIENT_CREDENTIALS: JString read _GetGRANT_TYPE_CLIENT_CREDENTIALS;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuthConstants')]
  JOAuthConstants = interface(JObject)
  ['{F3D7A2FA-B725-4BB0-80D9-511FD57FDE8F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOAuthConstants = class(TJavaGenericImport<JOAuthConstantsClass, JOAuthConstants>) end;

  JOAuth2Service_OAuth2ApiClass = interface(JObjectClass)
  ['{B940FE61-DA59-4D16-852B-68EA259771EB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth2Service$OAuth2Api')]
  JOAuth2Service_OAuth2Api = interface(IJavaInstance)
  ['{121B75B9-4BF7-4133-83D5-D88C6C77A9AB}']
    { Property Methods }

    { methods }
//    function getGuestToken(P1: JString): JCall; cdecl;
//    function getAppAuthToken(P1: JString; P2: JString): JCall; cdecl;

    { Property }
  end;

  TJOAuth2Service_OAuth2Api = class(TJavaGenericImport<JOAuth2Service_OAuth2ApiClass, JOAuth2Service_OAuth2Api>) end;

  JOAuthResponse_1Class = interface(JObjectClass)
  ['{A9159D67-14B7-4510-A8A9-F8B5BDA16E7A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuthResponse$1')]
  JOAuthResponse_1 = interface(JObject)
  ['{70339715-B5BD-47E4-A03D-55749AF0EA88}']
    { Property Methods }

    { methods }
    function createFromParcel(ain: JParcel): JOAuthResponse; cdecl; overload;
    function newArray(size: Integer): TJavaObjectArray<JOAuthResponse>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;

    { Property }
  end;

  TJOAuthResponse_1 = class(TJavaGenericImport<JOAuthResponse_1Class, JOAuthResponse_1>) end;

  JOAuthServiceClass = interface(JObjectClass)
  ['{1CC2C26E-3FAB-44B3-B331-642AC80A054D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuthService')]
  JOAuthService = interface(JObject)
  ['{6E3058BC-BCD5-4B77-A285-E87BC23C2ECB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOAuthService = class(TJavaGenericImport<JOAuthServiceClass, JOAuthService>) end;

  JOAuth1aServiceClass = interface(JObjectClass)
  ['{FF554CF4-3AA9-4AB9-8AE8-9220BC0103DF}']
    { static Property Methods }

    { static Methods }
    {class} function init(twitterCore: JTwitterCore; api: JTwitterApi): JOAuth1aService; cdecl;
    {class} function parseAuthResponse(params: JString): JOAuthResponse; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth1aService')]
  JOAuth1aService = interface(JObject)
  ['{872B8219-4C99-4727-9E9F-A2538C2675C6}']
    { Property Methods }

    { methods }
    procedure requestTempToken(callback: JCallback); cdecl;
    function buildCallbackUrl(authConfig: JTwitterAuthConfig): JString; cdecl;
    procedure requestAccessToken(callback: JCallback; requestToken: JTwitterAuthToken; verifier: JString); cdecl;
    function getAuthorizeUrl(requestToken: JTwitterAuthToken): JString; cdecl;

    { Property }
  end;

  TJOAuth1aService = class(TJavaGenericImport<JOAuth1aServiceClass, JOAuth1aService>) end;

  JOAuthResponseClass = interface(JObjectClass)
  ['{657D4C7D-FC14-4434-B20F-0F895F92E35D}']
    { static Property Methods }
    {class} function _GetCREATOR: JParcelable_Creator;

    { static Methods }
    {class} function init(authToken: JTwitterAuthToken; userName: JString; userId: Int64): JOAuthResponse; cdecl;

    { static Property }
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuthResponse')]
  JOAuthResponse = interface(JObject)
  ['{2E24B94C-8847-4272-AF66-8B285F86B201}']
    { Property Methods }
    function _GetauthToken: JTwitterAuthToken;
    procedure _SetauthToken(aauthToken: JTwitterAuthToken);
    function _GetuserName: JString;
    procedure _SetuserName(auserName: JString);
    function _GetuserId: Int64;
    procedure _SetuserId(auserId: Int64);

    { methods }
    function toString: JString; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(aout: JParcel; flags: Integer); cdecl;

    { Property }
    property authToken: JTwitterAuthToken read _GetauthToken write _SetauthToken;
    property userName: JString read _GetuserName write _SetuserName;
    property userId: Int64 read _GetuserId write _SetuserId;
  end;

  TJOAuthResponse = class(TJavaGenericImport<JOAuthResponseClass, JOAuthResponse>) end;

  JOAuth1aService_OAuthApiClass = interface(JObjectClass)
  ['{7E6B346E-B922-45AA-9ADC-3C440A35ECE9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth1aService$OAuthApi')]
  JOAuth1aService_OAuthApi = interface(IJavaInstance)
  ['{6207FCC9-F1C7-442C-8C78-1741980E5C48}']
    { Property Methods }

    { methods }
//    function getTempToken(P1: JString): JCall; cdecl;
//    function getAccessToken(P1: JString; P2: JString): JCall; cdecl;

    { Property }
  end;

  TJOAuth1aService_OAuthApi = class(TJavaGenericImport<JOAuth1aService_OAuthApiClass, JOAuth1aService_OAuthApi>) end;

  JOAuth1aParametersClass = interface(JObjectClass)
  ['{8F62850E-04CB-47C9-99CB-87265176D7AD}']
    { static Property Methods }

    { static Methods }
    {class} function init(authConfig: JTwitterAuthConfig; authToken: JTwitterAuthToken; callback: JString; method: JString; url: JString; postParams: JMap): JOAuth1aParameters; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth1aParameters')]
  JOAuth1aParameters = interface(JObject)
  ['{59CC7781-8341-4766-8C67-504823659A28}']
    { Property Methods }

    { methods }
    function getAuthorizationHeader: JString; cdecl;

    { Property }
  end;

  TJOAuth1aParameters = class(TJavaGenericImport<JOAuth1aParametersClass, JOAuth1aParameters>) end;

  JOAuth2TokenClass = interface(JObjectClass)
  ['{5BCA0500-56F9-4CBF-91D7-FEE78FBE34DC}']
    { static Property Methods }
    {class} function _GetTOKEN_TYPE_BEARER: JString;
    {class} function _GetCREATOR: JParcelable_Creator;

    { static Methods }
    {class} function init(tokenType: JString; accessToken: JString): JOAuth2Token; cdecl; overload;
    {class} function init(tokenType: JString; accessToken: JString; createdAt: Int64): JOAuth2Token; cdecl; overload;

    { static Property }
    {class} property TOKEN_TYPE_BEARER: JString read _GetTOKEN_TYPE_BEARER;
    {class} property CREATOR: JParcelable_Creator read _GetCREATOR;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth2Token')]
  JOAuth2Token = interface(JObject)
  ['{6C3FE6EB-26BF-4C4A-8058-8AC001BCC462}']
    { Property Methods }

    { methods }
    function getTokenType: JString; cdecl;
    function getAccessToken: JString; cdecl;
    function isExpired: Boolean; cdecl;
    function describeContents: Integer; cdecl;
    procedure writeToParcel(aout: JParcel; flags: Integer); cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJOAuth2Token = class(TJavaGenericImport<JOAuth2TokenClass, JOAuth2Token>) end;

  JOAuthService_1Class = interface(JObjectClass)
  ['{47059ED0-3E85-4895-AB24-531A467A5AEA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuthService$1')]
  JOAuthService_1 = interface(JObject)
  ['{163D565A-C6DB-492E-9B6A-05A2BA85F421}']
    { Property Methods }

    { methods }
//    function intercept(chain: JInterceptor_Chain): JResponse; cdecl;

    { Property }
  end;

  TJOAuthService_1 = class(TJavaGenericImport<JOAuthService_1Class, JOAuthService_1>) end;

  JOAuth1aHeadersClass = interface(JObjectClass)
  ['{3AF60427-DB57-4901-AA56-8C02D654BB83}']
    { static Property Methods }
    {class} function _GetHEADER_AUTH_SERVICE_PROVIDER: JString;
    {class} function _GetHEADER_AUTH_CREDENTIALS: JString;

    { static Methods }
    {class} function init: JOAuth1aHeaders; cdecl;

    { static Property }
    {class} property HEADER_AUTH_SERVICE_PROVIDER: JString read _GetHEADER_AUTH_SERVICE_PROVIDER;
    {class} property HEADER_AUTH_CREDENTIALS: JString read _GetHEADER_AUTH_CREDENTIALS;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth1aHeaders')]
  JOAuth1aHeaders = interface(JObject)
  ['{05AB54A1-D584-4D0B-BC90-F9E82B58459F}']
    { Property Methods }

    { methods }
    function getAuthorizationHeader(authConfig: JTwitterAuthConfig; authToken: JTwitterAuthToken; callback: JString; method: JString; url: JString; postParams: JMap): JString; cdecl;
    function getOAuthEchoHeaders(authConfig: JTwitterAuthConfig; authToken: JTwitterAuthToken; callback: JString; method: JString; url: JString; postParams: JMap): JMap; cdecl;

    { Property }
  end;

  TJOAuth1aHeaders = class(TJavaGenericImport<JOAuth1aHeadersClass, JOAuth1aHeaders>) end;

  JOAuth2Service_1Class = interface(JObjectClass)
  ['{E8332F9D-D066-4E1A-94A8-FFB3799AAAD6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth2Service$1')]
  JOAuth2Service_1 = interface(JObject)
  ['{A7E362DD-D5E6-44B2-A445-20CB73F0DB94}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(error: JTwitterException); cdecl;

    { Property }
  end;

  TJOAuth2Service_1 = class(TJavaGenericImport<JOAuth2Service_1Class, JOAuth2Service_1>) end;

  JOAuth2Service_1_1Class = interface(JObjectClass)
  ['{89ADD8B1-F089-4DEE-9767-7035880FA021}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth2Service$1$1')]
  JOAuth2Service_1_1 = interface(JObject)
  ['{F41E5F40-3C0A-4E2D-9273-AC9C85F2AB42}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(error: JTwitterException); cdecl;

    { Property }
  end;

  TJOAuth2Service_1_1 = class(TJavaGenericImport<JOAuth2Service_1_1Class, JOAuth2Service_1_1>) end;

  JOAuth2ServiceClass = interface(JObjectClass)
  ['{9250AF10-9C66-4E06-9585-13D3FE3DEF8A}']
    { static Property Methods }

    { static Methods }
    {class} function init(twitterCore: JTwitterCore; api: JTwitterApi): JOAuth2Service; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth2Service')]
  JOAuth2Service = interface(JObject)
  ['{7A96548D-604B-41A0-8914-F130F0297878}']
    { Property Methods }

    { methods }
    procedure requestGuestAuthToken(callback: JCallback); cdecl;

    { Property }
  end;

  TJOAuth2Service = class(TJavaGenericImport<JOAuth2ServiceClass, JOAuth2Service>) end;

  JOAuth2Token_1Class = interface(JObjectClass)
  ['{E9A03C50-B17F-45BE-A511-85AEC4E6F113}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/oauth/OAuth2Token$1')]
  JOAuth2Token_1 = interface(JObject)
  ['{DFAA1997-12C3-4AC2-977B-F1624F257714}']
    { Property Methods }

    { methods }
    function createFromParcel(ain: JParcel): JOAuth2Token; cdecl; overload;
    function newArray(size: Integer): TJavaObjectArray<JOAuth2Token>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;

    { Property }
  end;

  TJOAuth2Token_1 = class(TJavaGenericImport<JOAuth2Token_1Class, JOAuth2Token_1>) end;

  JTwitterApiConstantsClass = interface(JObjectClass)
  ['{C3C0A4BC-E48F-4A73-9479-54C40E29E3A6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTwitterApiConstants; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/TwitterApiConstants')]
  JTwitterApiConstants = interface(JObject)
  ['{5F3F4D7C-0791-4D36-841A-D036000F288B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterApiConstants = class(TJavaGenericImport<JTwitterApiConstantsClass, JTwitterApiConstants>) end;

  JActivityLifecycleManager_ActivityLifecycleCallbacksWrapperClass = interface(JObjectClass)
  ['{EA652A15-E327-4BCC-9CAB-39A9033B6624}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/ActivityLifecycleManager$ActivityLifecycleCallbacksWrapper')]
  JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper = interface(JObject)
  ['{27E88A1A-D9BE-474D-AFA0-F1FFCA26F36B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJActivityLifecycleManager_ActivityLifecycleCallbacksWrapper = class(TJavaGenericImport<JActivityLifecycleManager_ActivityLifecycleCallbacksWrapperClass, JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper>) end;

  JActivityLifecycleManagerClass = interface(JObjectClass)
  ['{8979D52D-F417-4CFC-BD4C-7C8CA88C284D}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JActivityLifecycleManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/ActivityLifecycleManager')]
  JActivityLifecycleManager = interface(JObject)
  ['{BC66DED4-7F50-4686-A4AE-CF898BAE8FEA}']
    { Property Methods }

    { methods }
    function registerCallbacks(callbacks: JActivityLifecycleManager_Callbacks): Boolean; cdecl;
    procedure resetCallbacks; cdecl;

    { Property }
  end;

  TJActivityLifecycleManager = class(TJavaGenericImport<JActivityLifecycleManagerClass, JActivityLifecycleManager>) end;

  JTwitterApiClass = interface(JObjectClass)
  ['{93D74B20-199F-4638-BFDB-22D58DE7A1D3}']
    { static Property Methods }
    {class} function _GetBASE_HOST: JString;
    {class} function _GetBASE_HOST_URL: JString;

    { static Methods }
    {class} function init: JTwitterApi; cdecl; overload;
    {class} function init(baseHostUrl: JString): JTwitterApi; cdecl; overload;
    {class} function buildUserAgent(version: JString; ua: JString): JString; cdecl;

    { static Property }
    {class} property BASE_HOST: JString read _GetBASE_HOST;
    {class} property BASE_HOST_URL: JString read _GetBASE_HOST_URL;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/TwitterApi')]
  JTwitterApi = interface(JObject)
  ['{9310B172-C874-4817-B0F6-296E7129ADCE}']
    { Property Methods }

    { methods }
    function getBaseHostUrl: JString; cdecl;
    function buildUponBaseHostUrl(paths: TJavaObjectArray<JString>): JUri_Builder; cdecl;

    { Property }
  end;

  TJTwitterApi = class(TJavaGenericImport<JTwitterApiClass, JTwitterApi>) end;

  JGuestAuthInterceptorClass = interface(JObjectClass)
  ['{94EE7EF9-C0FA-41F8-810F-9FDA50E2D363}']
    { static Property Methods }

    { static Methods }
    {class} function init(guestSessionProvider: JGuestSessionProvider): JGuestAuthInterceptor; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/network/GuestAuthInterceptor')]
  JGuestAuthInterceptor = interface(JObject)
  ['{41EE3257-F5D4-4F54-A0C6-15E471528323}']
    { Property Methods }

    { methods }
//    function intercept(chain: JInterceptor_Chain): JResponse; cdecl;

    { Property }
  end;

  TJGuestAuthInterceptor = class(TJavaGenericImport<JGuestAuthInterceptorClass, JGuestAuthInterceptor>) end;

  JGuestAuthenticatorClass = interface(JObjectClass)
  ['{D2035697-39F9-4B51-9AEF-1E385817EF17}']
    { static Property Methods }

    { static Methods }
    {class} function init(guestSessionProvider: JGuestSessionProvider): JGuestAuthenticator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/network/GuestAuthenticator')]
  JGuestAuthenticator = interface(JObject)
  ['{DB0DF87C-0BD0-424A-9700-5B928E2DD041}']
    { Property Methods }

    { methods }
//    function authenticate(route: JRoute; response: JResponse): JRequest; cdecl;

    { Property }
  end;

  TJGuestAuthenticator = class(TJavaGenericImport<JGuestAuthenticatorClass, JGuestAuthenticator>) end;

  JUrlUtilsClass = interface(JObjectClass)
  ['{B4FD7081-9CAD-4D37-B902-D4DC6B45192F}']
    { static Property Methods }
    {class} function _GetUTF8: JString;

    { static Methods }
//    {class} function getQueryParams(decode: JURI; P2: Boolean): JTreeMap; cdecl; overload;
//    {class} function getQueryParams(decode: JString; params: Boolean): JTreeMap; cdecl; overload;
//    {class} function urlEncode(unlikely: JString): JString; cdecl;
//    {class} function urlDecode(unlikely: JString): JString; cdecl;
//    {class} function percentEncode(sb: JString): JString; cdecl;

    { static Property }
    {class} property UTF8: JString read _GetUTF8;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/network/UrlUtils')]
  JUrlUtils = interface(JObject)
  ['{11BB26F3-E96B-4F1F-847B-6E86D2EE3D70}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUrlUtils = class(TJavaGenericImport<JUrlUtilsClass, JUrlUtils>) end;

  JGuestAuthNetworkInterceptorClass = interface(JObjectClass)
  ['{2BEC597C-C2AB-40AC-98D9-61BE4E65D1A2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGuestAuthNetworkInterceptor; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/network/GuestAuthNetworkInterceptor')]
  JGuestAuthNetworkInterceptor = interface(JObject)
  ['{30796AE8-964F-43D5-8BF5-3381EB1D7CE1}']
    { Property Methods }

    { methods }
//    function intercept(chain: JInterceptor_Chain): JResponse; cdecl;

    { Property }
  end;

  TJGuestAuthNetworkInterceptor = class(TJavaGenericImport<JGuestAuthNetworkInterceptorClass, JGuestAuthNetworkInterceptor>) end;

  JOAuth1aInterceptorClass = interface(JObjectClass)
  ['{6DB410DB-E206-4261-94E6-6D6401F09877}']
    { static Property Methods }

    { static Methods }
    {class} function init(session: JSession; authConfig: JTwitterAuthConfig): JOAuth1aInterceptor; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/network/OAuth1aInterceptor')]
  JOAuth1aInterceptor = interface(JObject)
  ['{0992A85B-7EA4-436D-BEB7-8471B8BFCA26}']
    { Property Methods }

    { methods }
//    function intercept(chain: JInterceptor_Chain): JResponse; cdecl;

    { Property }
  end;

  TJOAuth1aInterceptor = class(TJavaGenericImport<JOAuth1aInterceptorClass, JOAuth1aInterceptor>) end;

  JOkHttpClientHelperClass = interface(JObjectClass)
  ['{C85305F1-DF18-4ED4-BD42-AF1E19BB05FC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOkHttpClientHelper; cdecl;
//    {class} function getOkHttpClient(P1: JGuestSessionProvider): JOkHttpClient; cdecl; overload;
//    {class} function getOkHttpClient(authConfig: JSession; P2: JTwitterAuthConfig): JOkHttpClient; cdecl; overload;
//    {class} function getCustomOkHttpClient(guestSessionProvider: JOkHttpClient; P2: JGuestSessionProvider): JOkHttpClient; cdecl; overload;
//    {class} function getCustomOkHttpClient(session: JOkHttpClient; authConfig: JSession; P3: JTwitterAuthConfig): JOkHttpClient; cdecl; overload;
//    {class} function getCertificatePinner: JCertificatePinner; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/network/OkHttpClientHelper')]
  JOkHttpClientHelper = interface(JObject)
  ['{BF8B4F6B-DF4F-43A8-B1BD-AC1A885AEFCF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJOkHttpClientHelper = class(TJavaGenericImport<JOkHttpClientHelperClass, JOkHttpClientHelper>) end;

  JAdvertisingInfoProvider_1Class = interface(JObjectClass)
  ['{6E8A6A8C-E6BA-46EF-8029-85F8F808C04A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfoProvider$1')]
  JAdvertisingInfoProvider_1 = interface(JObject)
  ['{3F94C96F-777C-4DDE-94F1-493009FF5C97}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJAdvertisingInfoProvider_1 = class(TJavaGenericImport<JAdvertisingInfoProvider_1Class, JAdvertisingInfoProvider_1>) end;

  JAdvertisingInfoServiceStrategy_1Class = interface(JObjectClass)
  ['{BAA6E80C-00AB-4F84-B865-4336580E3D87}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfoServiceStrategy$1')]
  JAdvertisingInfoServiceStrategy_1 = interface(JObject)
  ['{F656F6C3-BF0A-4E4E-AF34-829790934EC1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAdvertisingInfoServiceStrategy_1 = class(TJavaGenericImport<JAdvertisingInfoServiceStrategy_1Class, JAdvertisingInfoServiceStrategy_1>) end;

  JExecutorUtils_2Class = interface(JObjectClass)
  ['{88637D89-320A-4AC5-9C35-C665750BBF65}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/ExecutorUtils$2')]
  JExecutorUtils_2 = interface(JObject)
  ['{786BB882-15EE-4DD8-A121-DDDF1787B87F}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJExecutorUtils_2 = class(TJavaGenericImport<JExecutorUtils_2Class, JExecutorUtils_2>) end;

  JUserUtils_AvatarSizeClass = interface(JObjectClass)
  ['{1795B45A-3A59-41E8-83B4-222F5738BDF0}']
    { static Property Methods }
    {class} function _GetNORMAL: JUserUtils_AvatarSize;
    {class} function _GetBIGGER: JUserUtils_AvatarSize;
    {class} function _GetMINI: JUserUtils_AvatarSize;
    {class} function _GetORIGINAL: JUserUtils_AvatarSize;
    {class} function _GetREASONABLY_SMALL: JUserUtils_AvatarSize;

    { static Methods }
    {class} function values: TJavaObjectArray<JUserUtils_AvatarSize>; cdecl;
    {class} function valueOf(P1: JString): JUserUtils_AvatarSize; cdecl;

    { static Property }
    {class} property NORMAL: JUserUtils_AvatarSize read _GetNORMAL;
    {class} property BIGGER: JUserUtils_AvatarSize read _GetBIGGER;
    {class} property MINI: JUserUtils_AvatarSize read _GetMINI;
    {class} property ORIGINAL: JUserUtils_AvatarSize read _GetORIGINAL;
    {class} property REASONABLY_SMALL: JUserUtils_AvatarSize read _GetREASONABLY_SMALL;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/UserUtils$AvatarSize')]
  JUserUtils_AvatarSize = interface(JObject)
  ['{97B68032-74D0-4CEC-9818-A2A62F5021DB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUserUtils_AvatarSize = class(TJavaGenericImport<JUserUtils_AvatarSizeClass, JUserUtils_AvatarSize>) end;

  JCurrentTimeProviderClass = interface(JObjectClass)
  ['{01EFD979-E2EF-4C59-8974-D3C5A112D40C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/CurrentTimeProvider')]
  JCurrentTimeProvider = interface(IJavaInstance)
  ['{F36A874D-7349-4807-A358-D6FC67F1CBFB}']
    { Property Methods }

    { methods }
    function getCurrentTimeMillis: Int64; cdecl;

    { Property }
  end;

  TJCurrentTimeProvider = class(TJavaGenericImport<JCurrentTimeProviderClass, JCurrentTimeProvider>) end;

  JAdvertisingInfoServiceStrategyClass = interface(JObjectClass)
  ['{3E055241-CBB1-427C-AE57-14E556A8044C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfoServiceStrategy')]
  JAdvertisingInfoServiceStrategy = interface(JObject)
  ['{3C7D5A2D-1007-4835-BE75-98A48401299F}']
    { Property Methods }

    { methods }
    function getAdvertisingInfo: JAdvertisingInfo; cdecl;

    { Property }
  end;

  TJAdvertisingInfoServiceStrategy = class(TJavaGenericImport<JAdvertisingInfoServiceStrategyClass, JAdvertisingInfoServiceStrategy>) end;

  JIdManagerClass = interface(JObjectClass)
  ['{5F94DE48-F67C-4D8D-AC88-44F1B5AA826B}']
    { static Property Methods }

    { static Methods }
    {class} function init(appContext: JContext): JIdManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/IdManager')]
  JIdManager = interface(JObject)
  ['{DCF4CD47-EDDD-4365-92E4-C746327E7D74}']
    { Property Methods }

    { methods }
    function getAppIdentifier: JString; cdecl;
    function getOsVersionString: JString; cdecl;
    function getOsDisplayVersionString: JString; cdecl;
    function getOsBuildVersionString: JString; cdecl;
    function getModelName: JString; cdecl;
    function getDeviceUUID: JString; cdecl;
    function isLimitAdTrackingEnabled: JBoolean; cdecl;
    function getAdvertisingId: JString; cdecl;

    { Property }
  end;

  TJIdManager = class(TJavaGenericImport<JIdManagerClass, JIdManager>) end;

  JAdvertisingInfoProviderClass = interface(JObjectClass)
  ['{9F5C800D-2E28-4B6A-9830-81CB637353CC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfoProvider')]
  JAdvertisingInfoProvider = interface(JObject)
  ['{66474C49-CAE8-4C74-BD1C-758906AC4A02}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAdvertisingInfoProvider = class(TJavaGenericImport<JAdvertisingInfoProviderClass, JAdvertisingInfoProvider>) end;

  JCommonUtilsClass = interface(JObjectClass)
  ['{4462B731-A964-430A-8B71-411C2F70720C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCommonUtils; cdecl;
    {class} function streamToString(s: JInputStream): JString; cdecl;
    {class} procedure copyStream(os: JInputStream; buffer: JOutputStream; count: TJavaArray<Byte>); cdecl;
    {class} procedure closeQuietly(rethrown: JCloseable); cdecl;
    {class} procedure closeOrLog(amessage: JCloseable; P2: JString); cdecl;
    {class} function getBooleanResourceValue(key: JContext; defaultValue: JString; resources: Boolean): Boolean; cdecl;
    {class} function getStringResourceValue(key: JContext; defaultValue: JString; resources: JString): JString; cdecl;
    {class} procedure logControlled(msg: JContext; P2: JString); cdecl; overload;
    {class} procedure logControlledError(msg: JContext; tr: JString; P3: JThrowable); cdecl;
    {class} procedure logControlled(level: JContext; tag: Integer; msg: JString; P4: JString); cdecl; overload;
    {class} procedure logOrThrowIllegalStateException(errorMsg: JString; P2: JString); cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/CommonUtils')]
  JCommonUtils = interface(JObject)
  ['{D961CFB0-5E47-4C58-8ACA-F79D361F253A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJCommonUtils = class(TJavaGenericImport<JCommonUtilsClass, JCommonUtils>) end;

  JAdvertisingInfoServiceStrategy_AdvertisingInterfaceClass = interface(JObjectClass)
  ['{B84B0931-BDCE-428B-BA2F-2588C4BD3ECA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfoServiceStrategy$AdvertisingInterface')]
  JAdvertisingInfoServiceStrategy_AdvertisingInterface = interface(JObject)
  ['{066F9488-FD7C-49C1-9966-6935D67CAE2F}']
    { Property Methods }

    { methods }
    function asBinder: JIBinder; cdecl;
    function getId: JString; cdecl;

    { Property }
  end;

  TJAdvertisingInfoServiceStrategy_AdvertisingInterface = class(TJavaGenericImport<JAdvertisingInfoServiceStrategy_AdvertisingInterfaceClass, JAdvertisingInfoServiceStrategy_AdvertisingInterface>) end;

  JExecutorUtilsClass = interface(JObjectClass)
  ['{DE9D5B3D-47BD-4AD2-8896-380936804C30}']
    { static Property Methods }

    { static Methods }
    {class} function buildThreadPoolExecutorService(threadFactory: JString): JExecutorService; cdecl;
//    {class} function buildSingleThreadScheduledExecutorService(threadFactory: JString): JScheduledExecutorService; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/ExecutorUtils')]
  JExecutorUtils = interface(JObject)
  ['{2D3EE09D-A7A4-4EA9-BA6A-E422C1ADAC91}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExecutorUtils = class(TJavaGenericImport<JExecutorUtilsClass, JExecutorUtils>) end;

  JAdvertisingInfoClass = interface(JObjectClass)
  ['{8B0281BD-21B6-4DCF-96A5-9181B66E142B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfo')]
  JAdvertisingInfo = interface(JObject)
  ['{673041E6-53EF-4781-80ED-EE0F5CC4F052}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAdvertisingInfo = class(TJavaGenericImport<JAdvertisingInfoClass, JAdvertisingInfo>) end;

  JAdvertisingInfoReflectionStrategyClass = interface(JObjectClass)
  ['{F91F2A49-E66F-46F8-A963-49CCE9B61F0E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfoReflectionStrategy')]
  JAdvertisingInfoReflectionStrategy = interface(JObject)
  ['{21C0C7B8-F6A0-48CE-B8DD-144BD4DC3267}']
    { Property Methods }

    { methods }
    function getAdvertisingInfo: JAdvertisingInfo; cdecl;

    { Property }
  end;

  TJAdvertisingInfoReflectionStrategy = class(TJavaGenericImport<JAdvertisingInfoReflectionStrategyClass, JAdvertisingInfoReflectionStrategy>) end;

  JExecutorUtils_1Class = interface(JObjectClass)
  ['{466C7488-8E89-436C-AE04-B403EE69CAD5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/ExecutorUtils$1')]
  JExecutorUtils_1 = interface(JObject)
  ['{A9CFE9CF-8CE9-4DA0-AABA-6D83C582F2EB}']
    { Property Methods }

    { methods }
    function newThread(runnable: JRunnable): JThread; cdecl;

    { Property }
  end;

  TJExecutorUtils_1 = class(TJavaGenericImport<JExecutorUtils_1Class, JExecutorUtils_1>) end;

  JEventNamespace_BuilderClass = interface(JObjectClass)
  ['{547E32EF-670B-41CF-8182-8EF084FE1E2C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEventNamespace_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventNamespace$Builder')]
  JEventNamespace_Builder = interface(JObject)
  ['{E21764E6-A655-48BF-9AF7-5C043F53BE1E}']
    { Property Methods }

    { methods }
    function setClient(client: JString): JEventNamespace_Builder; cdecl;
    function setPage(page: JString): JEventNamespace_Builder; cdecl;
    function setSection(section: JString): JEventNamespace_Builder; cdecl;
    function setComponent(component: JString): JEventNamespace_Builder; cdecl;
    function setElement(element: JString): JEventNamespace_Builder; cdecl;
    function setAction(action: JString): JEventNamespace_Builder; cdecl;
    function builder: JEventNamespace; cdecl;

    { Property }
  end;

  TJEventNamespace_Builder = class(TJavaGenericImport<JEventNamespace_BuilderClass, JEventNamespace_Builder>) end;

  JFileRollOverManagerClass = interface(JObjectClass)
  ['{F0DD47FD-0F32-478B-81CA-AEF200D352EC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/FileRollOverManager')]
  JFileRollOverManager = interface(IJavaInstance)
  ['{E3C45BF7-90F1-452E-B479-E7AF85B19768}']
    { Property Methods }

    { methods }
    function rollFileOver: Boolean; cdecl;
    procedure scheduleTimeBasedRollOverIfNeeded; cdecl;
    procedure cancelTimeBasedFileRollOver; cdecl;

    { Property }
  end;

  TJFileRollOverManager = class(TJavaGenericImport<JFileRollOverManagerClass, JFileRollOverManager>) end;

  JScribeItem_1Class = interface(JObjectClass)
  ['{323F9430-9C3B-4C5A-ABAA-CD4FA6983688}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeItem$1')]
  JScribeItem_1 = interface(JObject)
  ['{9F205C15-7D9C-4538-8246-033FF9C07DEC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScribeItem_1 = class(TJavaGenericImport<JScribeItem_1Class, JScribeItem_1>) end;

  JEventsManagerClass = interface(JObjectClass)
  ['{7A45802A-6E1E-42AB-91BE-0346DAB5B76E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsManager')]
  JEventsManager = interface(IJavaInstance)
  ['{845D5DB3-90BE-43FA-8431-CBA1CBCBBDFC}']
    { Property Methods }

    { methods }
    procedure sendEvents; cdecl;
    procedure deleteAllEvents; cdecl;
    procedure recordEvent(P1: JObject); cdecl;

    { Property }
  end;

  TJEventsManager = class(TJavaGenericImport<JEventsManagerClass, JEventsManager>) end;

  JScribeItem_CardEventClass = interface(JObjectClass)
  ['{D708AB82-CBEE-4E79-BBEA-8A58E6A4CA23}']
    { static Property Methods }

    { static Methods }
    {class} function init(cardType: Integer): JScribeItem_CardEvent; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeItem$CardEvent')]
  JScribeItem_CardEvent = interface(JObject)
  ['{357DB644-36C0-4204-89AE-CBD72C479E92}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJScribeItem_CardEvent = class(TJavaGenericImport<JScribeItem_CardEventClass, JScribeItem_CardEvent>) end;

  JEventsStorageClass = interface(JObjectClass)
  ['{B0220EBF-5BAF-4211-BF46-41BBD3D3B7F2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsStorage')]
  JEventsStorage = interface(IJavaInstance)
  ['{2E56F255-B0F5-4139-A7E6-E5CB6C914291}']
    { Property Methods }

    { methods }
    procedure add(P1: TJavaArray<Byte>); cdecl;
    function getWorkingFileUsedSizeInBytes: Integer; cdecl;
    function isWorkingFileEmpty: Boolean; cdecl;
    procedure rollOver(P1: JString); cdecl;
    function getWorkingDirectory: JFile; cdecl;
    function getRollOverDirectory: JFile; cdecl;
    function getBatchOfFilesToSend(P1: Integer): JList; cdecl;
    function getAllFilesInRollOverDirectory: JList; cdecl;
    procedure deleteFilesInRollOverDirectory(P1: JList); cdecl;
    procedure deleteWorkingFile; cdecl;
    function canWorkingFileStore(P1: Integer; P2: Integer): Boolean; cdecl;

    { Property }
  end;

  TJEventsStorage = class(TJavaGenericImport<JEventsStorageClass, JEventsStorage>) end;

  JEnabledScribeStrategyClass = interface(JObjectClass)
  ['{B91ECCCF-BA83-4907-B05B-6940E6A18502}']
    { static Property Methods }

    { static Methods }
//    {class} function init(context: JContext; executorService: JScheduledExecutorService; filesManager: JScribeFilesManager; config: JScribeConfig; filesSender: JScribeFilesSender): JEnabledScribeStrategy; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EnabledScribeStrategy')]
  JEnabledScribeStrategy = interface(JObject)
  ['{2EA5F17B-9EE5-479B-8EFC-D76D4EA98286}']
    { Property Methods }

    { methods }
    function getFilesSender: JFilesSender; cdecl;

    { Property }
  end;

  TJEnabledScribeStrategy = class(TJavaGenericImport<JEnabledScribeStrategyClass, JEnabledScribeStrategy>) end;

  JSyndicatedSdkImpressionEvent_ExternalIdsClass = interface(JObjectClass)
  ['{278A5393-4066-48A7-97E5-D28A83EA67CA}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JSyndicatedSdkImpressionEvent; adId: JString): JSyndicatedSdkImpressionEvent_ExternalIds; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent$ExternalIds')]
  JSyndicatedSdkImpressionEvent_ExternalIds = interface(JObject)
  ['{E45B8597-1898-4BAB-966C-B784B5CABF4E}']
    { Property Methods }
    function _GetadId: JString;
    procedure _SetadId(aadId: JString);

    { methods }

    { Property }
    property adId: JString read _GetadId write _SetadId;
  end;

  TJSyndicatedSdkImpressionEvent_ExternalIds = class(TJavaGenericImport<JSyndicatedSdkImpressionEvent_ExternalIdsClass, JSyndicatedSdkImpressionEvent_ExternalIds>) end;

  JEventNamespaceClass = interface(JObjectClass)
  ['{1D639DF2-2750-4DCF-A26B-62537AB041A1}']
    { static Property Methods }

    { static Methods }
    {class} function init(client: JString; page: JString; section: JString; component: JString; element: JString; action: JString): JEventNamespace; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventNamespace')]
  JEventNamespace = interface(JObject)
  ['{EB35291D-685D-48ED-9C4F-F1230C4653E3}']
    { Property Methods }
    function _Getclient: JString;
    procedure _Setclient(aclient: JString);
    function _Getpage: JString;
    procedure _Setpage(apage: JString);
    function _Getsection: JString;
    procedure _Setsection(asection: JString);
    function _Getcomponent: JString;
    procedure _Setcomponent(acomponent: JString);
    function _Getelement: JString;
    procedure _Setelement(aelement: JString);
    function _Getaction: JString;
    procedure _Setaction(aaction: JString);

    { methods }
    function toString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property client: JString read _Getclient write _Setclient;
    property page: JString read _Getpage write _Setpage;
    property section: JString read _Getsection write _Setsection;
    property component: JString read _Getcomponent write _Setcomponent;
    property element: JString read _Getelement write _Setelement;
    property action: JString read _Getaction write _Setaction;
  end;

  TJEventNamespace = class(TJavaGenericImport<JEventNamespaceClass, JEventNamespace>) end;

  JTwitterCoreScribeClientHolderClass = interface(JObjectClass)
  ['{8AD202E4-8B90-45F3-84C2-9E48F081A7AB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTwitterCoreScribeClientHolder; cdecl;
    {class} function getScribeClient: JDefaultScribeClient; cdecl;
    {class} procedure initialize(sessionManagers: JContext; guestSessionProvider: JSessionManager; idManager: JGuestSessionProvider; kitName: JIdManager; kitVersion: JString; config: JString); cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/TwitterCoreScribeClientHolder')]
  JTwitterCoreScribeClientHolder = interface(JObject)
  ['{63514D06-B338-4F2C-9364-2626981FEC1E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterCoreScribeClientHolder = class(TJavaGenericImport<JTwitterCoreScribeClientHolderClass, JTwitterCoreScribeClientHolder>) end;

  JScribeConfigClass = interface(JObjectClass)
  ['{E8EF2DD9-2D59-485F-9E5B-74CDE8C65598}']
    { static Property Methods }
    {class} function _GetBASE_URL: JString;
    {class} function _GetDEFAULT_MAX_FILES_TO_KEEP: Integer;
    {class} function _GetDEFAULT_SEND_INTERVAL_SECONDS: Integer;

    { static Methods }
    {class} function init(isEnabled: Boolean; baseUrl: JString; pathVersion: JString; pathType: JString; sequence: JString; userAgent: JString; maxFilesToKeep: Integer; sendIntervalSeconds: Integer): JScribeConfig; cdecl;

    { static Property }
    {class} property BASE_URL: JString read _GetBASE_URL;
    {class} property DEFAULT_MAX_FILES_TO_KEEP: Integer read _GetDEFAULT_MAX_FILES_TO_KEEP;
    {class} property DEFAULT_SEND_INTERVAL_SECONDS: Integer read _GetDEFAULT_SEND_INTERVAL_SECONDS;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeConfig')]
  JScribeConfig = interface(JObject)
  ['{B2102686-5EFF-47FA-BCE1-8F4F6CF44CF6}']
    { Property Methods }
    function _GetisEnabled: Boolean;
    procedure _SetisEnabled(aisEnabled: Boolean);
    function _GetbaseUrl: JString;
    procedure _SetbaseUrl(abaseUrl: JString);
    function _GetpathVersion: JString;
    procedure _SetpathVersion(apathVersion: JString);
    function _GetpathType: JString;
    procedure _SetpathType(apathType: JString);
    function _Getsequence: JString;
    procedure _Setsequence(asequence: JString);
    function _GetuserAgent: JString;
    procedure _SetuserAgent(auserAgent: JString);
    function _GetmaxFilesToKeep: Integer;
    procedure _SetmaxFilesToKeep(amaxFilesToKeep: Integer);
    function _GetsendIntervalSeconds: Integer;
    procedure _SetsendIntervalSeconds(asendIntervalSeconds: Integer);

    { methods }

    { Property }
    property isEnabled: Boolean read _GetisEnabled write _SetisEnabled;
    property baseUrl: JString read _GetbaseUrl write _SetbaseUrl;
    property pathVersion: JString read _GetpathVersion write _SetpathVersion;
    property pathType: JString read _GetpathType write _SetpathType;
    property sequence: JString read _Getsequence write _Setsequence;
    property userAgent: JString read _GetuserAgent write _SetuserAgent;
    property maxFilesToKeep: Integer read _GetmaxFilesToKeep write _SetmaxFilesToKeep;
    property sendIntervalSeconds: Integer read _GetsendIntervalSeconds write _SetsendIntervalSeconds;
  end;

  TJScribeConfig = class(TJavaGenericImport<JScribeConfigClass, JScribeConfig>) end;

  JFilesSenderClass = interface(JObjectClass)
  ['{17D23949-21F8-4160-B443-F1190A7B1ECC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/FilesSender')]
  JFilesSender = interface(IJavaInstance)
  ['{8678A354-7ACF-45C8-8450-8228CE92422C}']
    { Property Methods }

    { methods }
    function send(P1: JList): Boolean; cdecl;

    { Property }
  end;

  TJFilesSender = class(TJavaGenericImport<JFilesSenderClass, JFilesSender>) end;

  JQueueFile_1Class = interface(JObjectClass)
  ['{182A9E53-FDEB-4D95-B4B8-D265F5058799}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/QueueFile$1')]
  JQueueFile_1 = interface(JObject)
  ['{A491AA78-FA63-4E6A-A1D2-F829D1C232BA}']
    { Property Methods }

    { methods }
    procedure read(ain: JInputStream; length: Integer); cdecl;

    { Property }
  end;

  TJQueueFile_1 = class(TJavaGenericImport<JQueueFile_1Class, JQueueFile_1>) end;

  JEventsStrategyClass = interface(JObjectClass)
  ['{B1906D79-FB16-4E63-BA55-68219F9C726D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsStrategy')]
  JEventsStrategy = interface(IJavaInstance)
  ['{6E9C3924-9880-4285-9039-DEC3F4409875}']
    { Property Methods }

    { methods }
    function getFilesSender: JFilesSender; cdecl;

    { Property }
  end;

  TJEventsStrategy = class(TJavaGenericImport<JEventsStrategyClass, JEventsStrategy>) end;

  JSyndicationClientEvent_ExternalIdsClass = interface(JObjectClass)
  ['{B88B09CF-1298-4389-89EF-B0454FF64A96}']
    { static Property Methods }

    { static Methods }
//    {class} function init(this$0: JSyndicationClientEvent; adId: JString): JSyndicationClientEvent_ExternalIds; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/SyndicationClientEvent$ExternalIds')]
  JSyndicationClientEvent_ExternalIds = interface(JObject)
  ['{282D0143-A7E2-49D3-8A9E-AB9D7092E25C}']
    { Property Methods }
    function _GetadId: JString;
    procedure _SetadId(aadId: JString);

    { methods }

    { Property }
    property adId: JString read _GetadId write _SetadId;
  end;

  TJSyndicationClientEvent_ExternalIds = class(TJavaGenericImport<JSyndicationClientEvent_ExternalIdsClass, JSyndicationClientEvent_ExternalIds>) end;

  JDefaultScribeClientClass = interface(JObjectClass)
  ['{BBBB9FA1-4E28-400F-928C-DE949158810B}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; sessionManager: JSessionManager; guestSessionProvider: JGuestSessionProvider; idManager: JIdManager; scribeConfig: JScribeConfig): JDefaultScribeClient; cdecl;
    {class} function getScribeConfig(kitVersion: JString; scribeUrl: JString): JScribeConfig; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/DefaultScribeClient')]
  JDefaultScribeClient = interface(JObject)
  ['{9FD5647A-C59B-425D-A721-96C879DAB670}']
    { Property Methods }

    { methods }
    procedure scribe(namespaces: TJavaObjectArray<JEventNamespace>); cdecl; overload;
    procedure scribe(namespace: JEventNamespace; items: JList); cdecl; overload;
    procedure scribe(event: JScribeEvent); cdecl; overload;
    procedure scribe(namespace: JEventNamespace; eventInfo: JString); cdecl; overload;

    { Property }
  end;

  TJDefaultScribeClient = class(TJavaGenericImport<JDefaultScribeClientClass, JDefaultScribeClient>) end;

  JDisabledEventsStrategyClass = interface(JObjectClass)
  ['{C9254270-5C6E-4982-887D-1405770D086E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDisabledEventsStrategy; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/DisabledEventsStrategy')]
  JDisabledEventsStrategy = interface(JObject)
  ['{F43409C5-1710-442F-ABA2-0435C274A14D}']
    { Property Methods }

    { methods }
    procedure sendEvents; cdecl;
    procedure deleteAllEvents; cdecl;
    procedure recordEvent(event: JObject); cdecl;
    procedure cancelTimeBasedFileRollOver; cdecl;
    procedure scheduleTimeBasedRollOverIfNeeded; cdecl;
    function rollFileOver: Boolean; cdecl;
    function getFilesSender: JFilesSender; cdecl;

    { Property }
  end;

  TJDisabledEventsStrategy = class(TJavaGenericImport<JDisabledEventsStrategyClass, JDisabledEventsStrategy>) end;

  JEventsFilesManager_1Class = interface(JObjectClass)
  ['{28BA15A1-784F-4241-9778-7EA8262B1B07}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsFilesManager$1')]
  JEventsFilesManager_1 = interface(JObject)
  ['{602F4443-96C3-47B4-9053-175708AF73B2}']
    { Property Methods }

    { methods }
    function compare(arg0: JEventsFilesManager_FileWithTimestamp; arg1: JEventsFilesManager_FileWithTimestamp): Integer; cdecl; overload;
    function compare(P1: JObject; P2: JObject): Integer; cdecl; overload;

    { Property }
  end;

  TJEventsFilesManager_1 = class(TJavaGenericImport<JEventsFilesManager_1Class, JEventsFilesManager_1>) end;

  JQueueFile_ElementClass = interface(JObjectClass)
  ['{FDA2768D-D0CE-4B41-A3BB-C9DA91C46488}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/QueueFile$Element')]
  JQueueFile_Element = interface(JObject)
  ['{A86B73DC-CF0A-412F-9488-ADA240D8D457}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;

    { Property }
  end;

  TJQueueFile_Element = class(TJavaGenericImport<JQueueFile_ElementClass, JQueueFile_Element>) end;

  JTimeBasedFileRollOverRunnableClass = interface(JObjectClass)
  ['{66216B35-9AF5-4063-AE30-642C24A8E112}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; fileRollOverManager: JFileRollOverManager): JTimeBasedFileRollOverRunnable; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/TimeBasedFileRollOverRunnable')]
  JTimeBasedFileRollOverRunnable = interface(JObject)
  ['{E73C8ECD-94ED-45A0-AC46-638AF3E9F52E}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJTimeBasedFileRollOverRunnable = class(TJavaGenericImport<JTimeBasedFileRollOverRunnableClass, JTimeBasedFileRollOverRunnable>) end;

  JEventTransformClass = interface(JObjectClass)
  ['{9CE66CD4-F22A-487C-AE91-12F1748192E3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventTransform')]
  JEventTransform = interface(IJavaInstance)
  ['{2F5CF3F8-CB14-4244-99F8-1AA0F52D43EE}']
    { Property Methods }

    { methods }
    function toBytes(P1: JObject): TJavaArray<Byte>; cdecl;

    { Property }
  end;

  TJEventTransform = class(TJavaGenericImport<JEventTransformClass, JEventTransform>) end;

  JEventsHandler_1Class = interface(JObjectClass)
  ['{5BFBF4EA-D071-432B-B4EC-384CDDE86FD3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsHandler$1')]
  JEventsHandler_1 = interface(JObject)
  ['{E4EEE76A-0251-4DF6-AD83-1FABCB4D95DB}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJEventsHandler_1 = class(TJavaGenericImport<JEventsHandler_1Class, JEventsHandler_1>) end;

  JEventsStorageListenerClass = interface(JObjectClass)
  ['{C143355A-EC24-4171-A038-56753AB2F546}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsStorageListener')]
  JEventsStorageListener = interface(IJavaInstance)
  ['{501F28CD-8DB8-49F4-B911-0C0025F5319A}']
    { Property Methods }

    { methods }
    procedure onRollOver(P1: JString); cdecl;

    { Property }
  end;

  TJEventsStorageListener = class(TJavaGenericImport<JEventsStorageListenerClass, JEventsStorageListener>) end;

  JQueueFile_ElementInputStreamClass = interface(JObjectClass)
  ['{03A72513-E30A-4D62-B111-9F03340D77F9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/QueueFile$ElementInputStream')]
  JQueueFile_ElementInputStream = interface(JObject)
  ['{2C14130B-648B-44D5-96DE-C0BE24869C9B}']
    { Property Methods }

    { methods }
    function read(buffer: TJavaArray<Byte>; offset: Integer; length: Integer): Integer; cdecl; overload;
    function read: Integer; cdecl; overload;

    { Property }
  end;

  TJQueueFile_ElementInputStream = class(TJavaGenericImport<JQueueFile_ElementInputStreamClass, JQueueFile_ElementInputStream>) end;

  JQueueFile_ElementReaderClass = interface(JObjectClass)
  ['{DD8F60E6-04B4-46C0-99D2-E659A34AA9B0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/QueueFile$ElementReader')]
  JQueueFile_ElementReader = interface(IJavaInstance)
  ['{2DA22757-8127-4F62-911F-649184D00D2D}']
    { Property Methods }

    { methods }
    procedure read(P1: JInputStream; P2: Integer); cdecl;

    { Property }
  end;

  TJQueueFile_ElementReader = class(TJavaGenericImport<JQueueFile_ElementReaderClass, JQueueFile_ElementReader>) end;

  JScribeItem_BuilderClass = interface(JObjectClass)
  ['{1444BDD4-7CB0-450C-9780-47085590217F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScribeItem_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeItem$Builder')]
  JScribeItem_Builder = interface(JObject)
  ['{BC9556F7-DB43-491E-B95F-06B50795E68D}']
    { Property Methods }

    { methods }
    function setItemType(itemType: Integer): JScribeItem_Builder; cdecl;
    function setId(id: Int64): JScribeItem_Builder; cdecl;
    function setDescription(description: JString): JScribeItem_Builder; cdecl;
    function setCardEvent(cardEvent: JScribeItem_CardEvent): JScribeItem_Builder; cdecl;
    function setMediaDetails(mediaDetails: JScribeItem_MediaDetails): JScribeItem_Builder; cdecl;
    function build: JScribeItem; cdecl;

    { Property }
  end;

  TJScribeItem_Builder = class(TJavaGenericImport<JScribeItem_BuilderClass, JScribeItem_Builder>) end;

  JScribeFilesSender_ConfigRequestInterceptorClass = interface(JObjectClass)
  ['{6905B8AC-6993-44AF-99D2-89BE698BDBAC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ConfigRequestInterceptor')]
  JScribeFilesSender_ConfigRequestInterceptor = interface(JObject)
  ['{24287300-6085-400D-BFED-0FBA0B7782DE}']
    { Property Methods }

    { methods }
//    function intercept(chain: JInterceptor_Chain): JResponse; cdecl;

    { Property }
  end;

  TJScribeFilesSender_ConfigRequestInterceptor = class(TJavaGenericImport<JScribeFilesSender_ConfigRequestInterceptorClass, JScribeFilesSender_ConfigRequestInterceptor>) end;

  JEventsFilesManager_FileWithTimestampClass = interface(JObjectClass)
  ['{CA8B7778-D377-4764-A0D9-614957C972C2}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile; timestamp: Int64): JEventsFilesManager_FileWithTimestamp; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsFilesManager$FileWithTimestamp')]
  JEventsFilesManager_FileWithTimestamp = interface(JObject)
  ['{CECBD74F-0CD9-4A42-8BBB-446895475C1E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEventsFilesManager_FileWithTimestamp = class(TJavaGenericImport<JEventsFilesManager_FileWithTimestampClass, JEventsFilesManager_FileWithTimestamp>) end;

  JScribeItem_MediaDetailsClass = interface(JObjectClass)
  ['{6A924E88-6E78-40CF-8D25-4E7D36E91BB5}']
    { static Property Methods }
    {class} function _GetTYPE_CONSUMER: Integer;
    {class} function _GetTYPE_AMPLIFY: Integer;
    {class} function _GetTYPE_ANIMATED_GIF: Integer;
    {class} function _GetTYPE_VINE: Integer;
    {class} function _GetGIF_TYPE: JString;

    { static Methods }
    {class} function init(contentId: Int64; mediaType: Integer; P3: Int64): JScribeItem_MediaDetails; cdecl;

    { static Property }
    {class} property TYPE_CONSUMER: Integer read _GetTYPE_CONSUMER;
    {class} property TYPE_AMPLIFY: Integer read _GetTYPE_AMPLIFY;
    {class} property TYPE_ANIMATED_GIF: Integer read _GetTYPE_ANIMATED_GIF;
    {class} property TYPE_VINE: Integer read _GetTYPE_VINE;
    {class} property GIF_TYPE: JString read _GetGIF_TYPE;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeItem$MediaDetails')]
  JScribeItem_MediaDetails = interface(JObject)
  ['{1CEBFE89-9907-4566-8043-C33B94B6E8B1}']
    { Property Methods }
    function _GetcontentId: Int64;
    procedure _SetcontentId(acontentId: Int64);
    function _GetmediaType: Integer;
    procedure _SetmediaType(amediaType: Integer);
    function _GetpublisherId: Int64;
    procedure _SetpublisherId(apublisherId: Int64);

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property contentId: Int64 read _GetcontentId write _SetcontentId;
    property mediaType: Integer read _GetmediaType write _SetmediaType;
    property publisherId: Int64 read _GetpublisherId write _SetpublisherId;
  end;

  TJScribeItem_MediaDetails = class(TJavaGenericImport<JScribeItem_MediaDetailsClass, JScribeItem_MediaDetails>) end;

  JEnabledEventsStrategyClass = interface(JObjectClass)
  ['{D3D6E48A-AE22-4C0B-BF8D-6D234D38955F}']
    { static Property Methods }

    { static Methods }
//    {class} function init(context: JContext; executorService: JScheduledExecutorService; filesManager: JEventsFilesManager): JEnabledEventsStrategy; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EnabledEventsStrategy')]
  JEnabledEventsStrategy = interface(JObject)
  ['{CE794737-2F59-48CC-A129-E9C2CB90C3C7}']
    { Property Methods }

    { methods }
    procedure scheduleTimeBasedRollOverIfNeeded; cdecl;
    procedure sendEvents; cdecl;
    procedure cancelTimeBasedFileRollOver; cdecl;
    procedure deleteAllEvents; cdecl;
    procedure recordEvent(event: JObject); cdecl;
    function rollFileOver: Boolean; cdecl;
    function getRollover: Integer; cdecl;

    { Property }
  end;

  TJEnabledEventsStrategy = class(TJavaGenericImport<JEnabledEventsStrategyClass, JEnabledEventsStrategy>) end;

  JScribeEventClass = interface(JObjectClass)
  ['{BC4C0423-AA3C-487B-924C-26A1C7ED4A3A}']
    { static Property Methods }

    { static Methods }
    {class} function init(category: JString; eventNamespace: JEventNamespace; timestamp: Int64): JScribeEvent; cdecl; overload;
    {class} function init(category: JString; eventNamespace: JEventNamespace; timestamp: Int64; items: JList): JScribeEvent; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeEvent')]
  JScribeEvent = interface(JObject)
  ['{D3D88C52-AB6B-4E92-A253-70C228B5F5FD}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJScribeEvent = class(TJavaGenericImport<JScribeEventClass, JScribeEvent>) end;

  JEventsHandler_3Class = interface(JObjectClass)
  ['{1F021157-8B29-4ED0-BC9A-D7B0FF6DD6A5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsHandler$3')]
  JEventsHandler_3 = interface(JObject)
  ['{EB5C6B50-FB56-467F-AB62-B87C9C47E7C0}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJEventsHandler_3 = class(TJavaGenericImport<JEventsHandler_3Class, JEventsHandler_3>) end;

  JScribeClientClass = interface(JObjectClass)
  ['{D38F1139-E7F2-4CF5-B991-0E8868D5B643}']
    { static Property Methods }

    { static Methods }
//    {class} function init(context: JContext; executor: JScheduledExecutorService; scribeConfig: JScribeConfig; transform: JScribeEvent_Transform; authConfig: JTwitterAuthConfig; sessionManager: JSessionManager; guestSessionProvider: JGuestSessionProvider; idManager: JIdManager): JScribeClient; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeClient')]
  JScribeClient = interface(JObject)
  ['{35AD18CB-4DDB-433C-ACC0-DCCE8B42370D}']
    { Property Methods }

    { methods }
    function scribe(event: JScribeEvent; ownerId: Int64): Boolean; cdecl;
    function scribeAndFlush(event: JScribeEvent; ownerId: Int64): Boolean; cdecl;

    { Property }
  end;

  TJScribeClient = class(TJavaGenericImport<JScribeClientClass, JScribeClient>) end;

  JEventsHandler_2Class = interface(JObjectClass)
  ['{1136EFA2-0DFD-4725-8335-16AE84F8B37C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsHandler$2')]
  JEventsHandler_2 = interface(JObject)
  ['{E95DEB8F-C436-45AF-B90E-C166B76E7F2F}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJEventsHandler_2 = class(TJavaGenericImport<JEventsHandler_2Class, JEventsHandler_2>) end;

  JSyndicatedSdkImpressionEventClass = interface(JObjectClass)
  ['{69E40835-B830-46BF-810B-F2456D8E6451}']
    { static Property Methods }
    {class} function _GetCLIENT_NAME: JString;

    { static Methods }
    {class} function init(eventNamespace: JEventNamespace; timestamp: Int64; language: JString; P4: JString): JSyndicatedSdkImpressionEvent; cdecl; overload;
    {class} function init(eventNamespace: JEventNamespace; timestamp: Int64; language: JString; P4: JString; adId: JList): JSyndicatedSdkImpressionEvent; cdecl; overload;

    { static Property }
    {class} property CLIENT_NAME: JString read _GetCLIENT_NAME;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/SyndicatedSdkImpressionEvent')]
  JSyndicatedSdkImpressionEvent = interface(JObject)
  ['{4C02E2AC-7E4C-4DBA-9F40-97CA3C4EDBE5}']
    { Property Methods }
    function _GetexternalIds: JSyndicatedSdkImpressionEvent_ExternalIds;
    procedure _SetexternalIds(aexternalIds: JSyndicatedSdkImpressionEvent_ExternalIds);
    function _GetdeviceIdCreatedAt: Int64;
    procedure _SetdeviceIdCreatedAt(adeviceIdCreatedAt: Int64);
    function _Getlanguage: JString;
    procedure _Setlanguage(alanguage: JString);

    { methods }

    { Property }
    property externalIds: JSyndicatedSdkImpressionEvent_ExternalIds read _GetexternalIds write _SetexternalIds;
    property deviceIdCreatedAt: Int64 read _GetdeviceIdCreatedAt write _SetdeviceIdCreatedAt;
    property language: JString read _Getlanguage write _Setlanguage;
  end;

  TJSyndicatedSdkImpressionEvent = class(TJavaGenericImport<JSyndicatedSdkImpressionEventClass, JSyndicatedSdkImpressionEvent>) end;

  JScribeFilesSenderClass = interface(JObjectClass)
  ['{9B184299-7124-48A4-A117-B7AB0FE043B3}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; scribeConfig: JScribeConfig; ownerId: Int64; authConfig: JTwitterAuthConfig; P5: JSessionManager; sessionManager: JGuestSessionProvider; guestSessionProvider: JExecutorService; executorService: JIdManager): JScribeFilesSender; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeFilesSender')]
  JScribeFilesSender = interface(JObject)
  ['{DC5F60E5-7C19-453B-A401-EA49DFD4E8CA}']
    { Property Methods }

    { methods }
    function send(files: JList): Boolean; cdecl;

    { Property }
  end;

  TJScribeFilesSender = class(TJavaGenericImport<JScribeFilesSenderClass, JScribeFilesSender>) end;

  JScribeFilesManagerClass = interface(JObjectClass)
  ['{9DD69C78-AD73-4394-AD45-C2E6020F1279}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; transform: JEventTransform; currentTimeProvider: JCurrentTimeProvider; eventsStorage: JQueueFileEventStorage; defaultMaxFilesToKeep: Integer): JScribeFilesManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeFilesManager')]
  JScribeFilesManager = interface(JObject)
  ['{74D329DB-C78E-484E-98F8-91824ED359F9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScribeFilesManager = class(TJavaGenericImport<JScribeFilesManagerClass, JScribeFilesManager>) end;

  JScribeFilesSender_1Class = interface(JObjectClass)
  ['{BA637600-FB85-4F02-855A-5B32E17734ED}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$1')]
  JScribeFilesSender_1 = interface(JObject)
  ['{FB36B649-E86E-4576-936F-01B569631C61}']
    { Property Methods }

    { methods }
    procedure read(ain: JInputStream; length: Integer); cdecl;

    { Property }
  end;

  TJScribeFilesSender_1 = class(TJavaGenericImport<JScribeFilesSender_1Class, JScribeFilesSender_1>) end;

  JQueueFileClass = interface(JObjectClass)
  ['{A96D580C-AB9D-4DB5-A1A6-5155B260D699}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile): JQueueFile; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/QueueFile')]
  JQueueFile = interface(JObject)
  ['{D194D247-9E9B-41A3-825F-03DBC6B33E71}']
    { Property Methods }

    { methods }
    procedure add(data: TJavaArray<Byte>); cdecl; overload;
    procedure add(data: TJavaArray<Byte>; offset: Integer; count: Integer); cdecl; overload;
    function usedBytes: Integer; cdecl;
    function isEmpty: Boolean; cdecl;
    function peek: TJavaArray<Byte>; cdecl; overload;
    procedure peek(reader: JQueueFile_ElementReader); cdecl; overload;
    procedure forEach(reader: JQueueFile_ElementReader); cdecl;
    function size: Integer; cdecl;
    procedure remove; cdecl;
    procedure clear; cdecl;
    procedure close; cdecl;
    function hasSpaceFor(dataSizeBytes: Integer; maxSizeBytes: Integer): Boolean; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJQueueFile = class(TJavaGenericImport<JQueueFileClass, JQueueFile>) end;

  JScribeEvent_TransformClass = interface(JObjectClass)
  ['{5AD86FD4-9274-4363-8D57-2215AE4CA987}']
    { static Property Methods }

    { static Methods }
//    {class} function init(gson: JGson): JScribeEvent_Transform; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeEvent$Transform')]
  JScribeEvent_Transform = interface(JObject)
  ['{5CD77D27-1A45-4986-8EE5-58D1F4554714}']
    { Property Methods }

    { methods }
    function toBytes(event: JScribeEvent): TJavaArray<Byte>; cdecl; overload;
    function toBytes(P1: JObject): TJavaArray<Byte>; cdecl; overload;

    { Property }
  end;

  TJScribeEvent_Transform = class(TJavaGenericImport<JScribeEvent_TransformClass, JScribeEvent_Transform>) end;

  JScribeFilesSender_ScribeServiceClass = interface(JObjectClass)
  ['{16D514F6-A00A-44DF-AE8E-C2CDF736616C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeFilesSender$ScribeService')]
  JScribeFilesSender_ScribeService = interface(IJavaInstance)
  ['{9C3D2C52-C3A0-404F-A21B-0E916FF4579A}']
    { Property Methods }

    { methods }
//    function upload(P1: JString; P2: JString; P3: JString): JCall; cdecl;
//    function uploadSequence(P1: JString; P2: JString): JCall; cdecl;

    { Property }
  end;

  TJScribeFilesSender_ScribeService = class(TJavaGenericImport<JScribeFilesSender_ScribeServiceClass, JScribeFilesSender_ScribeService>) end;

  JEventsHandler_4Class = interface(JObjectClass)
  ['{1E0FAE88-CEBA-4AEB-BB1B-FF82EFA1B388}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsHandler$4')]
  JEventsHandler_4 = interface(JObject)
  ['{2A8A7F94-AF47-45EB-ABB3-E5B41BE81EFD}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJEventsHandler_4 = class(TJavaGenericImport<JEventsHandler_4Class, JEventsHandler_4>) end;

  JScribeEventFactoryClass = interface(JObjectClass)
  ['{BE6CB336-6246-4F73-8229-7B1253D1E511}']
    { static Property Methods }

    { static Methods }
    {class} function init: JScribeEventFactory; cdecl;
    {class} function newScribeEvent(timestamp: JEventNamespace; language: Int64; P3: JString; advertisingId: JString): JScribeEvent; cdecl; overload;
    {class} function newScribeEvent(eventInfo: JEventNamespace; timestamp: JString; language: Int64; P4: JString; advertisingId: JString; items: JList): JScribeEvent; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeEventFactory')]
  JScribeEventFactory = interface(JObject)
  ['{FC851096-DE5C-4AF1-AB4D-FCA21632E0EB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJScribeEventFactory = class(TJavaGenericImport<JScribeEventFactoryClass, JScribeEventFactory>) end;

  JQueueFileEventStorageClass = interface(JObjectClass)
  ['{4A5C2742-3797-4676-A277-719CDA7E2204}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; workingDirectory: JFile; workingFileName: JString; targetDirectoryName: JString): JQueueFileEventStorage; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/QueueFileEventStorage')]
  JQueueFileEventStorage = interface(JObject)
  ['{7FD656FD-48AA-41F8-A1C9-90EB2E8B1DA1}']
    { Property Methods }

    { methods }
    procedure add(data: TJavaArray<Byte>); cdecl;
    function getWorkingFileUsedSizeInBytes: Integer; cdecl;
    procedure rollOver(targetName: JString); cdecl;
    function getMoveOutputStream(targetFile: JFile): JOutputStream; cdecl;
    function getWorkingDirectory: JFile; cdecl;
    function getRollOverDirectory: JFile; cdecl;
    function getBatchOfFilesToSend(maxBatchSize: Integer): JList; cdecl;
    procedure deleteFilesInRollOverDirectory(files: JList); cdecl;
    function getAllFilesInRollOverDirectory: JList; cdecl;
    procedure deleteWorkingFile; cdecl;
    function isWorkingFileEmpty: Boolean; cdecl;
    function canWorkingFileStore(newEventSizeInBytes: Integer; maxByteSizePerFile: Integer): Boolean; cdecl;

    { Property }
  end;

  TJQueueFileEventStorage = class(TJavaGenericImport<JQueueFileEventStorageClass, JQueueFileEventStorage>) end;

  JEventsFilesManagerClass = interface(JObjectClass)
  ['{C22CB4D3-5934-4BB6-95E0-3961C0D42C87}']
    { static Property Methods }
    {class} function _GetROLL_OVER_FILE_NAME_SEPARATOR: JString;
    {class} function _GetMAX_BYTE_SIZE_PER_FILE: Integer;
    {class} function _GetMAX_FILES_IN_BATCH: Integer;
    {class} function _GetMAX_FILES_TO_KEEP: Integer;

    { static Methods }
    {class} function init(context: JContext; transform: JEventTransform; currentTimeProvider: JCurrentTimeProvider; eventStorage: JEventsStorage; defaultMaxFilesToKeep: Integer): JEventsFilesManager; cdecl;

    { static Property }
    {class} property ROLL_OVER_FILE_NAME_SEPARATOR: JString read _GetROLL_OVER_FILE_NAME_SEPARATOR;
    {class} property MAX_BYTE_SIZE_PER_FILE: Integer read _GetMAX_BYTE_SIZE_PER_FILE;
    {class} property MAX_FILES_IN_BATCH: Integer read _GetMAX_FILES_IN_BATCH;
    {class} property MAX_FILES_TO_KEEP: Integer read _GetMAX_FILES_TO_KEEP;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsFilesManager')]
  JEventsFilesManager = interface(JObject)
  ['{77F729F1-ECA7-4366-B10E-8FD54CFFAE27}']
    { Property Methods }

    { methods }
    procedure writeEvent(event: JObject); cdecl;
    procedure registerRollOverListener(listener: JEventsStorageListener); cdecl;
    function rollFileOver: Boolean; cdecl;
    function getLastRollOverTime: Int64; cdecl;
    function getBatchOfFilesToSend: JList; cdecl;
    procedure deleteSentFiles(files: JList); cdecl;
    procedure deleteAllEventsFiles; cdecl;
    procedure deleteOldestInRollOverIfOverMax; cdecl;
    function parseCreationTimestampFromFileName(fileName: JString): Int64; cdecl;

    { Property }
  end;

  TJEventsFilesManager = class(TJavaGenericImport<JEventsFilesManagerClass, JEventsFilesManager>) end;

  JScribeHandlerClass = interface(JObjectClass)
  ['{127A1016-1C3C-4097-964C-7FADC563D7AC}']
    { static Property Methods }

    { static Methods }
//    {class} function init(context: JContext; strategy: JEventsStrategy; filesManager: JEventsFilesManager; executorService: JScheduledExecutorService): JScribeHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeHandler')]
  JScribeHandler = interface(JObject)
  ['{E1660989-A6F6-4629-8CC0-F8A099752730}']
    { Property Methods }

    { methods }
    procedure scribe(event: JScribeEvent); cdecl;
    procedure scribeAndFlush(event: JScribeEvent); cdecl;

    { Property }
  end;

  TJScribeHandler = class(TJavaGenericImport<JScribeHandlerClass, JScribeHandler>) end;

  JScribeItemClass = interface(JObjectClass)
  ['{CA5D5D08-0F05-40AA-AB94-479573AB3EBB}']
    { static Property Methods }
    {class} function _GetTYPE_TWEET: Integer;
    {class} function _GetTYPE_USER: Integer;
    {class} function _GetTYPE_MESSAGE: Integer;

    { static Methods }
    {class} function fromTweet(P1: JTweet): JScribeItem; cdecl;
    {class} function fromUser(P1: JUser): JScribeItem; cdecl;
    {class} function fromMessage(P1: JString): JScribeItem; cdecl;
    {class} function fromTweetCard(card: Int64; P2: JCard): JScribeItem; cdecl;
    {class} function fromMediaEntity(mediaEntity: Int64; P2: JMediaEntity): JScribeItem; cdecl;

    { static Property }
    {class} property TYPE_TWEET: Integer read _GetTYPE_TWEET;
    {class} property TYPE_USER: Integer read _GetTYPE_USER;
    {class} property TYPE_MESSAGE: Integer read _GetTYPE_MESSAGE;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/ScribeItem')]
  JScribeItem = interface(JObject)
  ['{E11564A0-4D4C-4ECE-9929-C261D268C0D4}']
    { Property Methods }
    function _GetitemType: JInteger;
    procedure _SetitemType(aitemType: JInteger);
    function _Getid: JLong;
    procedure _Setid(aid: JLong);
    function _Getdescription: JString;
    procedure _Setdescription(adescription: JString);
    function _GetcardEvent: JScribeItem_CardEvent;
    procedure _SetcardEvent(acardEvent: JScribeItem_CardEvent);
    function _GetmediaDetails: JScribeItem_MediaDetails;
    procedure _SetmediaDetails(amediaDetails: JScribeItem_MediaDetails);

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
    property itemType: JInteger read _GetitemType write _SetitemType;
    property id: JLong read _Getid write _Setid;
    property description: JString read _Getdescription write _Setdescription;
    property cardEvent: JScribeItem_CardEvent read _GetcardEvent write _SetcardEvent;
    property mediaDetails: JScribeItem_MediaDetails read _GetmediaDetails write _SetmediaDetails;
  end;

  TJScribeItem = class(TJavaGenericImport<JScribeItemClass, JScribeItem>) end;

  JEventsHandlerClass = interface(JObjectClass)
  ['{1201501A-4B8E-4E95-9F44-3CD0015D8BEC}']
    { static Property Methods }

    { static Methods }
//    {class} function init(context: JContext; strategy: JEventsStrategy; filesManager: JEventsFilesManager; executor: JScheduledExecutorService): JEventsHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/EventsHandler')]
  JEventsHandler = interface(JObject)
  ['{72281BFB-F128-4149-9AC7-E227A4C21C7A}']
    { Property Methods }

    { methods }
    procedure recordEventAsync(event: JObject; sendImmediately: Boolean); cdecl;
    procedure recordEventSync(event: JObject); cdecl;
    procedure onRollOver(rolledOverFile: JString); cdecl;
    procedure disable; cdecl;

    { Property }
  end;

  TJEventsHandler = class(TJavaGenericImport<JEventsHandlerClass, JEventsHandler>) end;

  JSyndicationClientEventClass = interface(JObjectClass)
  ['{3A0B76D5-0457-4F8C-B74E-B88235148018}']
    { static Property Methods }
    {class} function _GetCLIENT_NAME: JString;

    { static Methods }
    {class} function init(eventNamespace: JEventNamespace; eventInfo: JString; timestamp: Int64; language: JString; P5: JString; adId: JList): JSyndicationClientEvent; cdecl;

    { static Property }
    {class} property CLIENT_NAME: JString read _GetCLIENT_NAME;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/scribe/SyndicationClientEvent')]
  JSyndicationClientEvent = interface(JObject)
  ['{83605250-CDC0-40DB-B32C-870780CC6C29}']
    { Property Methods }
    function _Getlanguage: JString;
    procedure _Setlanguage(alanguage: JString);
    function _GeteventInfo: JString;
    procedure _SeteventInfo(aeventInfo: JString);
    function _GetexternalIds: JSyndicationClientEvent_ExternalIds;
    procedure _SetexternalIds(aexternalIds: JSyndicationClientEvent_ExternalIds);

    { methods }

    { Property }
    property language: JString read _Getlanguage write _Setlanguage;
    property eventInfo: JString read _GeteventInfo write _SeteventInfo;
    property externalIds: JSyndicationClientEvent_ExternalIds read _GetexternalIds write _SetexternalIds;
  end;

  TJSyndicationClientEvent = class(TJavaGenericImport<JSyndicationClientEventClass, JSyndicationClientEvent>) end;

  JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper_1Class = interface(JObjectClass)
  ['{A93E0392-7FD5-4687-87D9-82C4843016C9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/ActivityLifecycleManager$ActivityLifecycleCallbacksWrapper$1')]
  JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper_1 = interface(JObject)
  ['{917874CD-5CA9-4B27-A6DB-E00CEC82239C}']
    { Property Methods }

    { methods }
    procedure onActivityCreated(activity: JActivity; bundle: JBundle); cdecl;
    procedure onActivityStarted(activity: JActivity); cdecl;
    procedure onActivityResumed(activity: JActivity); cdecl;
    procedure onActivityPaused(activity: JActivity); cdecl;
    procedure onActivityStopped(activity: JActivity); cdecl;
    procedure onActivitySaveInstanceState(activity: JActivity; bundle: JBundle); cdecl;
    procedure onActivityDestroyed(activity: JActivity); cdecl;

    { Property }
  end;

  TJActivityLifecycleManager_ActivityLifecycleCallbacksWrapper_1 = class(TJavaGenericImport<JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper_1Class, JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper_1>) end;

  JSessionMonitor_1Class = interface(JObjectClass)
  ['{1E891C57-BFFF-49EB-9835-0089AFCBD2F8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/SessionMonitor$1')]
  JSessionMonitor_1 = interface(JObject)
  ['{8B77ABC0-E171-4821-8D39-D51171CDC026}']
    { Property Methods }

    { methods }
    procedure onActivityStarted(activity: JActivity); cdecl;

    { Property }
  end;

  TJSessionMonitor_1 = class(TJavaGenericImport<JSessionMonitor_1Class, JSessionMonitor_1>) end;

  JVineCardUtilsClass = interface(JObjectClass)
  ['{9B66B84A-9231-4414-A0BE-AD1078A43276}']
    { static Property Methods }
    {class} function _GetPLAYER_CARD: JString;
    {class} function _GetVINE_CARD: JString;
    {class} function _GetVINE_USER_ID: Int64;

    { static Methods }
    {class} function isVine(P1: JCard): Boolean; cdecl;
    {class} function getPublisherId(user_value: JCard): JString; cdecl;
    {class} function getStreamUrl(P1: JCard): JString; cdecl;
    {class} function getImageValue(P1: JCard): JImageValue; cdecl;

    { static Property }
    {class} property PLAYER_CARD: JString read _GetPLAYER_CARD;
    {class} property VINE_CARD: JString read _GetVINE_CARD;
    {class} property VINE_USER_ID: Int64 read _GetVINE_USER_ID;
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/VineCardUtils')]
  JVineCardUtils = interface(JObject)
  ['{565E03CA-9B32-489F-AEE9-CC3CA5F4F396}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVineCardUtils = class(TJavaGenericImport<JVineCardUtilsClass, JVineCardUtils>) end;

  JAdvertisingInfoStrategyClass = interface(JObjectClass)
  ['{6D70C79A-1960-4D3C-BFB7-60FAD0BE5547}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/AdvertisingInfoStrategy')]
  JAdvertisingInfoStrategy = interface(IJavaInstance)
  ['{BEC2B2B0-30E0-4F25-BD17-B21D1EB93097}']
    { Property Methods }

    { methods }
    function getAdvertisingInfo: JAdvertisingInfo; cdecl;

    { Property }
  end;

  TJAdvertisingInfoStrategy = class(TJavaGenericImport<JAdvertisingInfoStrategyClass, JAdvertisingInfoStrategy>) end;

  JTwitterSessionVerifier_AccountServiceProviderClass = interface(JObjectClass)
  ['{B9A349F9-7BC8-4E86-9193-70EF6C5230C5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/TwitterSessionVerifier$AccountServiceProvider')]
  JTwitterSessionVerifier_AccountServiceProvider = interface(JObject)
  ['{AF857658-88CB-4A33-859B-9B8DD50EE2B7}']
    { Property Methods }

    { methods }
    function getAccountService(session: JTwitterSession): JAccountService; cdecl;

    { Property }
  end;

  TJTwitterSessionVerifier_AccountServiceProvider = class(TJavaGenericImport<JTwitterSessionVerifier_AccountServiceProviderClass, JTwitterSessionVerifier_AccountServiceProvider>) end;

  JSessionMonitor_2Class = interface(JObjectClass)
  ['{8FFF0524-7339-4C1F-8198-3BE8CBABF43B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/internal/SessionMonitor$2')]
  JSessionMonitor_2 = interface(JObject)
  ['{D03EF95F-98A0-425D-8329-A68A6617A012}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJSessionMonitor_2 = class(TJavaGenericImport<JSessionMonitor_2Class, JSessionMonitor_2>) end;

  JAuthTokenClass = interface(JObjectClass)
  ['{7D08E8F4-F725-4867-9937-671465680520}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAuthToken; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/AuthToken')]
  JAuthToken = interface(JObject)
  ['{37CAD66D-60E7-4F90-A657-DE9F54B6019A}']
    { Property Methods }

    { methods }
    function isExpired: Boolean; cdecl;

    { Property }
  end;

  TJAuthToken = class(TJavaGenericImport<JAuthTokenClass, JAuthToken>) end;

  JTwitterAuthConfig_1Class = interface(JObjectClass)
  ['{696AE517-72E0-4858-8E6C-1F0444B1DACB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterAuthConfig$1')]
  JTwitterAuthConfig_1 = interface(JObject)
  ['{4A4C7920-F90B-4414-9FFC-4DDFBE15B075}']
    { Property Methods }

    { methods }
    function createFromParcel(ain: JParcel): JTwitterAuthConfig; cdecl; overload;
    function newArray(size: Integer): TJavaObjectArray<JTwitterAuthConfig>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;

    { Property }
  end;

  TJTwitterAuthConfig_1 = class(TJavaGenericImport<JTwitterAuthConfig_1Class, JTwitterAuthConfig_1>) end;

  JTwitterAuthToken_1Class = interface(JObjectClass)
  ['{324CE18C-E60C-4369-9775-59D4F2805948}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterAuthToken$1')]
  JTwitterAuthToken_1 = interface(JObject)
  ['{F5A3C568-3C22-4164-9CE1-509C5C4B2FD3}']
    { Property Methods }

    { methods }
    function createFromParcel(ain: JParcel): JTwitterAuthToken; cdecl; overload;
    function newArray(size: Integer): TJavaObjectArray<JTwitterAuthToken>; cdecl; overload;
//    function newArray(P1: Integer): TJavaObjectArray<JObject>; cdecl; overload;
//    function createFromParcel(P1: JParcel): JObject; cdecl; overload;

    { Property }
  end;

  TJTwitterAuthToken_1 = class(TJavaGenericImport<JTwitterAuthToken_1Class, JTwitterAuthToken_1>) end;

  JTwitterApiExceptionClass = interface(JObjectClass)
  ['{E4DF7C80-7839-49A1-9ECB-16E905B928E7}']
    { static Property Methods }
    {class} function _GetDEFAULT_ERROR_CODE: Integer;

    { static Methods }
//    {class} function init(response: JResponse): JTwitterApiException; cdecl;
//    {class} function readApiRateLimit(P1: JResponse): JTwitterRateLimit; cdecl;
//    {class} function readApiError(body: JResponse): JApiError; cdecl;

    { static Property }
    {class} property DEFAULT_ERROR_CODE: Integer read _GetDEFAULT_ERROR_CODE;
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterApiException')]
  JTwitterApiException = interface(JObject)
  ['{0BC3B6E1-10D4-4D51-A9A3-826958008C5E}']
    { Property Methods }

    { methods }
    function getStatusCode: Integer; cdecl;
    function getErrorCode: Integer; cdecl;
    function getErrorMessage: JString; cdecl;
    function getTwitterRateLimit: JTwitterRateLimit; cdecl;
//    function getResponse: JResponse; cdecl;

    { Property }
  end;

  TJTwitterApiException = class(TJavaGenericImport<JTwitterApiExceptionClass, JTwitterApiException>) end;

  JTwitterConfigClass = interface(JObjectClass)
  ['{0173AF38-3915-46C3-9A34-9B82CAC55459}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterConfig')]
  JTwitterConfig = interface(JObject)
  ['{095E37EB-C515-42D4-873A-79ADBC398B5F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterConfig = class(TJavaGenericImport<JTwitterConfigClass, JTwitterConfig>) end;

  JGuestSession_SerializerClass = interface(JObjectClass)
  ['{2C9F9651-9E04-4A91-8035-957178AD0FF1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGuestSession_Serializer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/GuestSession$Serializer')]
  JGuestSession_Serializer = interface(JObject)
  ['{A0F52A19-8283-46C6-9015-0B433A5EB67A}']
    { Property Methods }

    { methods }
    function serialize(session: JGuestSession): JString; cdecl; overload;
    function deserialize(serializedSession: JString): JGuestSession; cdecl; overload;
//    function deserialize(P1: JString): JObject; cdecl; overload;
    function serialize(P1: JObject): JString; cdecl; overload;

    { Property }
  end;

  TJGuestSession_Serializer = class(TJavaGenericImport<JGuestSession_SerializerClass, JGuestSession_Serializer>) end;

  JTwitterAuthExceptionClass = interface(JObjectClass)
  ['{8F265F2F-F638-40F9-A24D-7EF2D362D649}']
    { static Property Methods }

    { static Methods }
    {class} function init(detailMessage: JString): JTwitterAuthException; cdecl; overload;
    {class} function init(detailMessage: JString; throwable: JThrowable): JTwitterAuthException; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterAuthException')]
  JTwitterAuthException = interface(JObject)
  ['{2F3589C7-D8E7-42A7-B16C-430579D7FBE5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterAuthException = class(TJavaGenericImport<JTwitterAuthExceptionClass, JTwitterAuthException>) end;

  JTwitterCore_1Class = interface(JObjectClass)
  ['{012ED2F0-C1BB-4F45-BB2A-8302CACECD01}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterCore$1')]
  JTwitterCore_1 = interface(JObject)
  ['{31F9FAD8-8771-4A0B-96DB-FC38A9438E8E}']
    { Property Methods }

    { methods }
    procedure run; cdecl;

    { Property }
  end;

  TJTwitterCore_1 = class(TJavaGenericImport<JTwitterCore_1Class, JTwitterCore_1>) end;

  JTwitterConfig_BuilderClass = interface(JObjectClass)
  ['{13F58DD1-E8EC-4047-88B0-29198748DD0E}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JTwitterConfig_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/TwitterConfig$Builder')]
  JTwitterConfig_Builder = interface(JObject)
  ['{244E612D-A8D3-4B78-816D-6EEC5C08A53E}']
    { Property Methods }

    { methods }
    function logger(logger: JLogger): JTwitterConfig_Builder; cdecl;
    function twitterAuthConfig(authConfig: JTwitterAuthConfig): JTwitterConfig_Builder; cdecl;
    function executorService(executorService: JExecutorService): JTwitterConfig_Builder; cdecl;
    function debug(debug: Boolean): JTwitterConfig_Builder; cdecl;
    function build: JTwitterConfig; cdecl;

    { Property }
  end;

  TJTwitterConfig_Builder = class(TJavaGenericImport<JTwitterConfig_BuilderClass, JTwitterConfig_Builder>) end;

  JTwitterLoginButton_1Class = interface(JObjectClass)
  ['{20E485E0-801F-4202-8BC3-CF465E76B1F4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/TwitterLoginButton$1')]
  JTwitterLoginButton_1 = interface(JObject)
  ['{6610D544-EACA-467C-95E9-CA84ED75744A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterLoginButton_1 = class(TJavaGenericImport<JTwitterLoginButton_1Class, JTwitterLoginButton_1>) end;

  JOAuthWebViewClientClass = interface(JObjectClass)
  ['{875847D7-E608-49DF-92D9-300DC0929007}']
    { static Property Methods }

    { static Methods }
    {class} function init(completeUrl: JString; listener: JOAuthWebViewClient_Listener): JOAuthWebViewClient; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthWebViewClient')]
  JOAuthWebViewClient = interface(JObject)
  ['{70B70133-1B22-480A-B708-C9F7DE1C49AA}']
    { Property Methods }

    { methods }
    procedure onPageFinished(view: JWebView; url: JString); cdecl;
    function shouldOverrideUrlLoading(view: JWebView; url: JString): Boolean; cdecl;
    procedure onReceivedError(view: JWebView; errorCode: Integer; description: JString; failingUrl: JString); cdecl;
    procedure onReceivedSslError(view: JWebView; handler: JSslErrorHandler; error: JSslError); cdecl;

    { Property }
  end;

  TJOAuthWebViewClient = class(TJavaGenericImport<JOAuthWebViewClientClass, JOAuthWebViewClient>) end;

  JWebViewExceptionClass = interface(JObjectClass)
  ['{3F38C34E-2477-41C8-A0EC-BBBCED3152B2}']
    { static Property Methods }

    { static Methods }
    {class} function init(errorCode: Integer; description: JString; failingUrl: JString): JWebViewException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/WebViewException')]
  JWebViewException = interface(JObject)
  ['{5DADAFD1-937B-4ADB-840C-B7D9C726F747}']
    { Property Methods }

    { methods }
    function getErrorCode: Integer; cdecl;
    function getDescription: JString; cdecl;
    function getFailingUrl: JString; cdecl;

    { Property }
  end;

  TJWebViewException = class(TJavaGenericImport<JWebViewExceptionClass, JWebViewException>) end;

  JOAuthHandlerClass = interface(JObjectClass)
  ['{10CD2F4C-D837-4DEB-B294-BC757CB0E338}']
    { static Property Methods }

    { static Methods }
    {class} function init(authConfig: JTwitterAuthConfig; callback: JCallback; requestCode: Integer): JOAuthHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthHandler')]
  JOAuthHandler = interface(JObject)
  ['{822E8DE6-545E-4E75-B396-10C972632387}']
    { Property Methods }

    { methods }
    function authorize(activity: JActivity): Boolean; cdecl;

    { Property }
  end;

  TJOAuthHandler = class(TJavaGenericImport<JOAuthHandlerClass, JOAuthHandler>) end;

  JOAuthController_1Class = interface(JObjectClass)
  ['{A29364E2-C612-4E2E-8926-DCA0E054FFD2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthController$1')]
  JOAuthController_1 = interface(JObject)
  ['{918A97CB-98D2-4EFA-9E99-3027B2FDBD0C}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(error: JTwitterException); cdecl;

    { Property }
  end;

  TJOAuthController_1 = class(TJavaGenericImport<JOAuthController_1Class, JOAuthController_1>) end;

  JOAuthControllerClass = interface(JObjectClass)
  ['{F1567A37-024B-4DC7-9937-1110D735B8CA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthController')]
  JOAuthController = interface(JObject)
  ['{C1C67814-BF18-4FC0-B141-DA50E56F336C}']
    { Property Methods }

    { methods }
    procedure onPageFinished(webView: JWebView; url: JString); cdecl;
    procedure onSuccess(bundle: JBundle); cdecl;
    procedure onError(exception: JWebViewException); cdecl;

    { Property }
  end;

  TJOAuthController = class(TJavaGenericImport<JOAuthControllerClass, JOAuthController>) end;

  JOAuthController_ListenerClass = interface(JObjectClass)
  ['{92F2541F-75E2-40E1-B932-747265930ACD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthController$Listener')]
  JOAuthController_Listener = interface(IJavaInstance)
  ['{B10A583E-2110-403F-AB2E-375850207D30}']
    { Property Methods }

    { methods }
    procedure onComplete(P1: Integer; P2: JIntent); cdecl;

    { Property }
  end;

  TJOAuthController_Listener = class(TJavaGenericImport<JOAuthController_ListenerClass, JOAuthController_Listener>) end;

  JOAuthWebViewClient_ListenerClass = interface(JObjectClass)
  ['{E3EA9A72-3470-47E8-AD6A-5729E227F701}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthWebViewClient$Listener')]
  JOAuthWebViewClient_Listener = interface(IJavaInstance)
  ['{7A97F2A3-1745-4300-A7A5-69B83F9739C7}']
    { Property Methods }

    { methods }
    procedure onPageFinished(P1: JWebView; P2: JString); cdecl;
    procedure onSuccess(P1: JBundle); cdecl;
    procedure onError(P1: JWebViewException); cdecl;

    { Property }
  end;

  TJOAuthWebViewClient_Listener = class(TJavaGenericImport<JOAuthWebViewClient_ListenerClass, JOAuthWebViewClient_Listener>) end;

  JOAuthActivityClass = interface(JObjectClass)
  ['{77AB137A-BF44-4A10-861A-C37071A949B2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOAuthActivity; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthActivity')]
  JOAuthActivity = interface(JObject)
  ['{A80FEAB1-4403-4B69-8413-974265B6386E}']
    { Property Methods }

    { methods }
    procedure onBackPressed; cdecl;
    procedure onComplete(resultCode: Integer; data: JIntent); cdecl;

    { Property }
  end;

  TJOAuthActivity = class(TJavaGenericImport<JOAuthActivityClass, JOAuthActivity>) end;

  JTwitterAuthClient_AuthStateLazyHolderClass = interface(JObjectClass)
  ['{F098A351-37AC-4905-92B8-65A04D5CEB93}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/TwitterAuthClient$AuthStateLazyHolder')]
  JTwitterAuthClient_AuthStateLazyHolder = interface(JObject)
  ['{85143F03-125F-486A-998B-E638DB482966}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTwitterAuthClient_AuthStateLazyHolder = class(TJavaGenericImport<JTwitterAuthClient_AuthStateLazyHolderClass, JTwitterAuthClient_AuthStateLazyHolder>) end;

  JAuthHandlerClass = interface(JObjectClass)
  ['{B7177523-1E89-4376-A8A2-9DFCCD2325E2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/AuthHandler')]
  JAuthHandler = interface(JObject)
  ['{5E453D43-4576-4164-A7C8-23151A365DDA}']
    { Property Methods }

    { methods }
    function authorize(P1: JActivity): Boolean; cdecl;
    function handleOnActivityResult(requestCode: Integer; resultCode: Integer; data: JIntent): Boolean; cdecl;

    { Property }
  end;

  TJAuthHandler = class(TJavaGenericImport<JAuthHandlerClass, JAuthHandler>) end;

  JAuthStateClass = interface(JObjectClass)
  ['{F4977B85-BABE-4DFF-845B-DBC14BD0127F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/AuthState')]
  JAuthState = interface(JObject)
  ['{E52B0254-94F4-4C85-8911-EC1349CD136D}']
    { Property Methods }

    { methods }
    function beginAuthorize(activity: JActivity; authHandler: JAuthHandler): Boolean; cdecl;
    procedure endAuthorize; cdecl;
    function isAuthorizeInProgress: Boolean; cdecl;
    function getAuthHandler: JAuthHandler; cdecl;

    { Property }
  end;

  TJAuthState = class(TJavaGenericImport<JAuthStateClass, JAuthState>) end;

  JTwitterLoginButton_LoginClickListenerClass = interface(JObjectClass)
  ['{737C39AB-B49B-4FB4-98C6-D4980F4F9682}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/TwitterLoginButton$LoginClickListener')]
  JTwitterLoginButton_LoginClickListener = interface(JObject)
  ['{800C6EFF-3156-4142-8AF0-A80BF6FAD122}']
    { Property Methods }

    { methods }
    procedure onClick(view: JView); cdecl;

    { Property }
  end;

  TJTwitterLoginButton_LoginClickListener = class(TJavaGenericImport<JTwitterLoginButton_LoginClickListenerClass, JTwitterLoginButton_LoginClickListener>) end;

  JOAuthWebChromeClientClass = interface(JObjectClass)
  ['{C1B36F28-9AE1-4224-9A3B-397B1E86FCE2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthWebChromeClient')]
  JOAuthWebChromeClient = interface(JObject)
  ['{5D192B81-846D-4C46-A66F-E56CCF48E3C5}']
    { Property Methods }

    { methods }
    function onConsoleMessage(consoleMessage: JConsoleMessage): Boolean; cdecl;

    { Property }
  end;

  TJOAuthWebChromeClient = class(TJavaGenericImport<JOAuthWebChromeClientClass, JOAuthWebChromeClient>) end;

  JTwitterLoginButtonClass = interface(JObjectClass)
  ['{4875F91B-4590-460F-A899-EE8B37F65EC1}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JTwitterLoginButton; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet): JTwitterLoginButton; cdecl; overload;
    {class} function init(context: JContext; attrs: JAttributeSet; defStyle: Integer): JTwitterLoginButton; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/TwitterLoginButton')]
  JTwitterLoginButton = interface(JObject)
  ['{116A4906-3211-4BBC-BA47-8184CCC37264}']
    { Property Methods }

    { methods }
    procedure setCallback(callback: JCallback); cdecl;
    function getCallback: JCallback; cdecl;
    procedure onActivityResult(requestCode: Integer; resultCode: Integer; data: JIntent); cdecl;
    procedure setOnClickListener(onClickListener: JView_OnClickListener); cdecl;

    { Property }
  end;

  TJTwitterLoginButton = class(TJavaGenericImport<JTwitterLoginButtonClass, JTwitterLoginButton>) end;

  JTwitterAuthClientClass = interface(JObjectClass)
  ['{AEB92E00-D0FF-4591-ADA5-93BED0CA3287}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTwitterAuthClient; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/TwitterAuthClient')]
  JTwitterAuthClient = interface(JObject)
  ['{4915AB74-D78A-4534-B259-06FCCF489AD5}']
    { Property Methods }

    { methods }
    function getRequestCode: Integer; cdecl;
    procedure authorize(activity: JActivity; callback: JCallback); cdecl;
    procedure cancelAuthorize; cdecl;
    procedure onActivityResult(requestCode: Integer; resultCode: Integer; data: JIntent); cdecl;
    procedure requestEmail(session: JTwitterSession; callback: JCallback); cdecl;

    { Property }
  end;

  TJTwitterAuthClient = class(TJavaGenericImport<JTwitterAuthClientClass, JTwitterAuthClient>) end;

  JOAuthController_2Class = interface(JObjectClass)
  ['{242C3C76-9062-4524-9AF0-CAE453C428D2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/OAuthController$2')]
  JOAuthController_2 = interface(JObject)
  ['{D1F5FFB0-CBB8-4634-8111-D51042F03D1E}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(error: JTwitterException); cdecl;

    { Property }
  end;

  TJOAuthController_2 = class(TJavaGenericImport<JOAuthController_2Class, JOAuthController_2>) end;

  JTwitterAuthClient_CallbackWrapperClass = interface(JObjectClass)
  ['{6870AFB8-A753-4B7A-889C-897E82CD406B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/TwitterAuthClient$CallbackWrapper')]
  JTwitterAuthClient_CallbackWrapper = interface(JObject)
  ['{AD66492F-633B-47B4-AA41-40D8130D5075}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJTwitterAuthClient_CallbackWrapper = class(TJavaGenericImport<JTwitterAuthClient_CallbackWrapperClass, JTwitterAuthClient_CallbackWrapper>) end;

  JSSOAuthHandlerClass = interface(JObjectClass)
  ['{21BE82F4-7D30-4F26-BB5A-F1DDB7261A44}']
    { static Property Methods }

    { static Methods }
    {class} function init(authConfig: JTwitterAuthConfig; callback: JCallback; requestCode: Integer): JSSOAuthHandler; cdecl;
    {class} function availableSSOPackage(P1: JPackageManager): JString; cdecl;
    {class} function isAvailable(pm: JContext): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/SSOAuthHandler')]
  JSSOAuthHandler = interface(JObject)
  ['{9F2D1145-D5CF-4240-A94F-AEF3AB9AB80D}']
    { Property Methods }

    { methods }
    function authorize(activity: JActivity): Boolean; cdecl;

    { Property }
  end;

  TJSSOAuthHandler = class(TJavaGenericImport<JSSOAuthHandlerClass, JSSOAuthHandler>) end;

  JTwitterAuthClient_1Class = interface(JObjectClass)
  ['{CCF13468-2C87-4F8B-8D52-B15A5021F163}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/identity/TwitterAuthClient$1')]
  JTwitterAuthClient_1 = interface(JObject)
  ['{BA7BCFD9-ACF3-4D21-BFA9-032CE851C9BE}']
    { Property Methods }

    { methods }
    procedure success(result: JResult); cdecl;
    procedure failure(exception: JTwitterException); cdecl;

    { Property }
  end;

  TJTwitterAuthClient_1 = class(TJavaGenericImport<JTwitterAuthClient_1Class, JTwitterAuthClient_1>) end;

  JIntentUtilsClass = interface(JObjectClass)
  ['{3366DBA7-6A41-46B2-AD08-50A821056309}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIntentUtils; cdecl;
    {class} function isActivityAvailable(intent: JContext; packageManager: JIntent): Boolean; cdecl;
    {class} function safeStartActivity(intent: JContext; P2: JIntent): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/IntentUtils')]
  JIntentUtils = interface(JObject)
  ['{B30F5517-CD79-405B-B41E-E9CCC6EA7046}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJIntentUtils = class(TJavaGenericImport<JIntentUtilsClass, JIntentUtils>) end;

  JCallbackClass = interface(JObjectClass)
  ['{6AD983E5-4771-4B3B-BF75-2E37057C2E60}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCallback; cdecl;

    { static Property }
  end;

  [JavaSignature('com/twitter/sdk/android/core/Callback')]
  JCallback = interface(JObject)
  ['{5D36DF67-1D64-4B59-91EF-CFF474E1E8CB}']
    { Property Methods }

    { methods }
//    procedure onResponse(call: JCall; response: JResponse); cdecl;
//    procedure onFailure(call: JCall; t: JThrowable); cdecl;
    procedure success(P1: JResult); cdecl;
    procedure failure(P1: JTwitterException); cdecl;

    { Property }
  end;

  TJCallback = class(TJavaGenericImport<JCallbackClass, JCallback>) end;

{$ENDIF}
implementation
{$IFDEF ANDROID}


procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCore', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCore));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEntity', 
    TypeInfo(Androidapi.JNI.classes.JEntity));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JPlace', 
    TypeInfo(Androidapi.JNI.classes.JPlace));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JCoordinates', 
    TypeInfo(Androidapi.JNI.classes.JCoordinates));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCollection_TimelineItem', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCollection_TimelineItem));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCollection_Content', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCollection_Content));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JPlace_BoundingBox', 
    TypeInfo(Androidapi.JNI.classes.JPlace_BoundingBox));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JHashtagEntity', 
    TypeInfo(Androidapi.JNI.classes.JHashtagEntity));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JMedia', 
    TypeInfo(Androidapi.JNI.classes.JMedia));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JBindingValuesAdapter', 
    TypeInfo(Androidapi.JNI.classes.JBindingValuesAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JMediaEntity_Sizes', 
    TypeInfo(Androidapi.JNI.classes.JMediaEntity_Sizes));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JIdentifiable', 
    TypeInfo(Androidapi.JNI.classes.JIdentifiable));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JCard', 
    TypeInfo(Androidapi.JNI.classes.JCard));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUserBuilder', 
    TypeInfo(Androidapi.JNI.classes.JUserBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCollection_Metadata', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCollection_Metadata));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSafeMapAdapter', 
    TypeInfo(Androidapi.JNI.classes.JSafeMapAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUserValue', 
    TypeInfo(Androidapi.JNI.classes.JUserValue));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JImageValue', 
    TypeInfo(Androidapi.JNI.classes.JImageValue));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUserEntities_UrlEntities', 
    TypeInfo(Androidapi.JNI.classes.JUserEntities_UrlEntities));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JBindingValues', 
    TypeInfo(Androidapi.JNI.classes.JBindingValues));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JMediaEntity', 
    TypeInfo(Androidapi.JNI.classes.JMediaEntity));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCollection', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCollection));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JApiErrors', 
    TypeInfo(Androidapi.JNI.classes.JApiErrors));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUser', 
    TypeInfo(Androidapi.JNI.classes.JUser));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSafeMapAdapter_1', 
    TypeInfo(Androidapi.JNI.classes.JSafeMapAdapter_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSafeListAdapter_1', 
    TypeInfo(Androidapi.JNI.classes.JSafeListAdapter_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCollection_Metadata_Position', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCollection_Metadata_Position));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JVideoInfo', 
    TypeInfo(Androidapi.JNI.classes.JVideoInfo));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCollection_TimelineItem_TweetItem', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCollection_TimelineItem_TweetItem));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTweet', 
    TypeInfo(Androidapi.JNI.classes.JTweet));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JVideoInfo_Variant', 
    TypeInfo(Androidapi.JNI.classes.JVideoInfo_Variant));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTweetBuilder', 
    TypeInfo(Androidapi.JNI.classes.JTweetBuilder));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTweetEntities', 
    TypeInfo(Androidapi.JNI.classes.JTweetEntities));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JImage', 
    TypeInfo(Androidapi.JNI.classes.JImage));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSearchMetadata', 
    TypeInfo(Androidapi.JNI.classes.JSearchMetadata));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUserEntities', 
    TypeInfo(Androidapi.JNI.classes.JUserEntities));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUrlEntity', 
    TypeInfo(Androidapi.JNI.classes.JUrlEntity));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSymbolEntity', 
    TypeInfo(Androidapi.JNI.classes.JSymbolEntity));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JMediaEntity_Size', 
    TypeInfo(Androidapi.JNI.classes.JMediaEntity_Size));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JMentionEntity', 
    TypeInfo(Androidapi.JNI.classes.JMentionEntity));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JModelUtils', 
    TypeInfo(Androidapi.JNI.classes.JModelUtils));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSearch', 
    TypeInfo(Androidapi.JNI.classes.JSearch));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSafeListAdapter', 
    TypeInfo(Androidapi.JNI.classes.JSafeListAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JConfiguration', 
    TypeInfo(Androidapi.JNI.classes.JConfiguration));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JApiError', 
    TypeInfo(Androidapi.JNI.classes.JApiError));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterSession_Serializer', 
    TypeInfo(Androidapi.JNI.classes.JTwitterSession_Serializer));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitter', 
    TypeInfo(Androidapi.JNI.classes.JTwitter));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterApiClient', 
    TypeInfo(Androidapi.JNI.classes.JTwitterApiClient));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestSessionProvider_1', 
    TypeInfo(Androidapi.JNI.classes.JGuestSessionProvider_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSession', 
    TypeInfo(Androidapi.JNI.classes.JSession));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterApiErrorConstants', 
    TypeInfo(Androidapi.JNI.classes.JTwitterApiErrorConstants));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JBuildConfig', 
    TypeInfo(Androidapi.JNI.classes.JBuildConfig));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthToken', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthToken));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterException', 
    TypeInfo(Androidapi.JNI.classes.JTwitterException));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterContext', 
    TypeInfo(Androidapi.JNI.classes.JTwitterContext));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JMediaService', 
    TypeInfo(Androidapi.JNI.classes.JMediaService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JCollectionService', 
    TypeInfo(Androidapi.JNI.classes.JCollectionService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JFavoriteService', 
    TypeInfo(Androidapi.JNI.classes.JFavoriteService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JStatusesService', 
    TypeInfo(Androidapi.JNI.classes.JStatusesService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSearchService', 
    TypeInfo(Androidapi.JNI.classes.JSearchService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAccountService', 
    TypeInfo(Androidapi.JNI.classes.JAccountService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JConfigurationService', 
    TypeInfo(Androidapi.JNI.classes.JConfigurationService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JListService', 
    TypeInfo(Androidapi.JNI.classes.JListService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGeocode', 
    TypeInfo(Androidapi.JNI.classes.JGeocode));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGeocode_Distance', 
    TypeInfo(Androidapi.JNI.classes.JGeocode_Distance));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JDefaultLogger', 
    TypeInfo(Androidapi.JNI.classes.JDefaultLogger));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthSigning', 
    TypeInfo(Androidapi.JNI.classes.JOAuthSigning));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestSessionProvider', 
    TypeInfo(Androidapi.JNI.classes.JGuestSessionProvider));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestSession', 
    TypeInfo(Androidapi.JNI.classes.JGuestSession));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthConfig', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthConfig));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JResult', 
    TypeInfo(Androidapi.JNI.classes.JResult));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterRateLimit', 
    TypeInfo(Androidapi.JNI.classes.JTwitterRateLimit));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAuthTokenAdapter', 
    TypeInfo(Androidapi.JNI.classes.JAuthTokenAdapter));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterConfig_1', 
    TypeInfo(Androidapi.JNI.classes.JTwitterConfig_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JLogger', 
    TypeInfo(Androidapi.JNI.classes.JLogger));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JPersistedSessionManager', 
    TypeInfo(Androidapi.JNI.classes.JPersistedSessionManager));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSessionManager', 
    TypeInfo(Androidapi.JNI.classes.JSessionManager));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterSession', 
    TypeInfo(Androidapi.JNI.classes.JTwitterSession));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSystemCurrentTimeProvider', 
    TypeInfo(Androidapi.JNI.classes.JSystemCurrentTimeProvider));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterApiConstants_Errors', 
    TypeInfo(Androidapi.JNI.classes.JTwitterApiConstants_Errors));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterSessionVerifier', 
    TypeInfo(Androidapi.JNI.classes.JTwitterSessionVerifier));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfoServiceStrategy_AdvertisingConnection', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfoServiceStrategy_AdvertisingConnection));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUserUtils', 
    TypeInfo(Androidapi.JNI.classes.JUserUtils));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUserUtils_1', 
    TypeInfo(Androidapi.JNI.classes.JUserUtils_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JActivityLifecycleManager_Callbacks', 
    TypeInfo(Androidapi.JNI.classes.JActivityLifecycleManager_Callbacks));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSessionMonitor_MonitorState', 
    TypeInfo(Androidapi.JNI.classes.JSessionMonitor_MonitorState));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSessionVerifier', 
    TypeInfo(Androidapi.JNI.classes.JSessionVerifier));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSessionMonitor', 
    TypeInfo(Androidapi.JNI.classes.JSessionMonitor));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JPreferenceStoreImpl', 
    TypeInfo(Androidapi.JNI.classes.JPreferenceStoreImpl));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JPreferenceStore', 
    TypeInfo(Androidapi.JNI.classes.JPreferenceStore));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JFileStoreImpl', 
    TypeInfo(Androidapi.JNI.classes.JFileStoreImpl));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JPersistenceStrategy', 
    TypeInfo(Androidapi.JNI.classes.JPersistenceStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JPreferenceStoreStrategy', 
    TypeInfo(Androidapi.JNI.classes.JPreferenceStoreStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JFileStore', 
    TypeInfo(Androidapi.JNI.classes.JFileStore));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSerializationStrategy', 
    TypeInfo(Androidapi.JNI.classes.JSerializationStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestTokenResponse', 
    TypeInfo(Androidapi.JNI.classes.JGuestTokenResponse));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestAuthToken', 
    TypeInfo(Androidapi.JNI.classes.JGuestAuthToken));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth1aService_1', 
    TypeInfo(Androidapi.JNI.classes.JOAuth1aService_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthConstants', 
    TypeInfo(Androidapi.JNI.classes.JOAuthConstants));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth2Service_OAuth2Api', 
    TypeInfo(Androidapi.JNI.classes.JOAuth2Service_OAuth2Api));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthResponse_1', 
    TypeInfo(Androidapi.JNI.classes.JOAuthResponse_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthService', 
    TypeInfo(Androidapi.JNI.classes.JOAuthService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth1aService', 
    TypeInfo(Androidapi.JNI.classes.JOAuth1aService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthResponse', 
    TypeInfo(Androidapi.JNI.classes.JOAuthResponse));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth1aService_OAuthApi', 
    TypeInfo(Androidapi.JNI.classes.JOAuth1aService_OAuthApi));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth1aParameters', 
    TypeInfo(Androidapi.JNI.classes.JOAuth1aParameters));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth2Token', 
    TypeInfo(Androidapi.JNI.classes.JOAuth2Token));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthService_1', 
    TypeInfo(Androidapi.JNI.classes.JOAuthService_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth1aHeaders', 
    TypeInfo(Androidapi.JNI.classes.JOAuth1aHeaders));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth2Service_1', 
    TypeInfo(Androidapi.JNI.classes.JOAuth2Service_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth2Service_1_1', 
    TypeInfo(Androidapi.JNI.classes.JOAuth2Service_1_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth2Service', 
    TypeInfo(Androidapi.JNI.classes.JOAuth2Service));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth2Token_1', 
    TypeInfo(Androidapi.JNI.classes.JOAuth2Token_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterApiConstants', 
    TypeInfo(Androidapi.JNI.classes.JTwitterApiConstants));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper', 
    TypeInfo(Androidapi.JNI.classes.JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JActivityLifecycleManager', 
    TypeInfo(Androidapi.JNI.classes.JActivityLifecycleManager));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterApi', 
    TypeInfo(Androidapi.JNI.classes.JTwitterApi));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestAuthInterceptor', 
    TypeInfo(Androidapi.JNI.classes.JGuestAuthInterceptor));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestAuthenticator', 
    TypeInfo(Androidapi.JNI.classes.JGuestAuthenticator));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUrlUtils', 
    TypeInfo(Androidapi.JNI.classes.JUrlUtils));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestAuthNetworkInterceptor', 
    TypeInfo(Androidapi.JNI.classes.JGuestAuthNetworkInterceptor));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuth1aInterceptor', 
    TypeInfo(Androidapi.JNI.classes.JOAuth1aInterceptor));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOkHttpClientHelper', 
    TypeInfo(Androidapi.JNI.classes.JOkHttpClientHelper));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfoProvider_1', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfoProvider_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfoServiceStrategy_1', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfoServiceStrategy_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JExecutorUtils_2', 
    TypeInfo(Androidapi.JNI.classes.JExecutorUtils_2));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JUserUtils_AvatarSize', 
    TypeInfo(Androidapi.JNI.classes.JUserUtils_AvatarSize));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JCurrentTimeProvider', 
    TypeInfo(Androidapi.JNI.classes.JCurrentTimeProvider));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfoServiceStrategy', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfoServiceStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JIdManager', 
    TypeInfo(Androidapi.JNI.classes.JIdManager));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfoProvider', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfoProvider));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JCommonUtils', 
    TypeInfo(Androidapi.JNI.classes.JCommonUtils));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfoServiceStrategy_AdvertisingInterface', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfoServiceStrategy_AdvertisingInterface));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JExecutorUtils', 
    TypeInfo(Androidapi.JNI.classes.JExecutorUtils));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfo', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfo));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfoReflectionStrategy', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfoReflectionStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JExecutorUtils_1', 
    TypeInfo(Androidapi.JNI.classes.JExecutorUtils_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventNamespace_Builder', 
    TypeInfo(Androidapi.JNI.classes.JEventNamespace_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JFileRollOverManager', 
    TypeInfo(Androidapi.JNI.classes.JFileRollOverManager));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeItem_1', 
    TypeInfo(Androidapi.JNI.classes.JScribeItem_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsManager', 
    TypeInfo(Androidapi.JNI.classes.JEventsManager));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeItem_CardEvent', 
    TypeInfo(Androidapi.JNI.classes.JScribeItem_CardEvent));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsStorage', 
    TypeInfo(Androidapi.JNI.classes.JEventsStorage));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEnabledScribeStrategy', 
    TypeInfo(Androidapi.JNI.classes.JEnabledScribeStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSyndicatedSdkImpressionEvent_ExternalIds', 
    TypeInfo(Androidapi.JNI.classes.JSyndicatedSdkImpressionEvent_ExternalIds));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventNamespace', 
    TypeInfo(Androidapi.JNI.classes.JEventNamespace));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCoreScribeClientHolder', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCoreScribeClientHolder));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeConfig', 
    TypeInfo(Androidapi.JNI.classes.JScribeConfig));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JFilesSender', 
    TypeInfo(Androidapi.JNI.classes.JFilesSender));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JQueueFile_1', 
    TypeInfo(Androidapi.JNI.classes.JQueueFile_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsStrategy', 
    TypeInfo(Androidapi.JNI.classes.JEventsStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSyndicationClientEvent_ExternalIds', 
    TypeInfo(Androidapi.JNI.classes.JSyndicationClientEvent_ExternalIds));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JDefaultScribeClient', 
    TypeInfo(Androidapi.JNI.classes.JDefaultScribeClient));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JDisabledEventsStrategy', 
    TypeInfo(Androidapi.JNI.classes.JDisabledEventsStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsFilesManager_1', 
    TypeInfo(Androidapi.JNI.classes.JEventsFilesManager_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JQueueFile_Element', 
    TypeInfo(Androidapi.JNI.classes.JQueueFile_Element));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTimeBasedFileRollOverRunnable', 
    TypeInfo(Androidapi.JNI.classes.JTimeBasedFileRollOverRunnable));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventTransform', 
    TypeInfo(Androidapi.JNI.classes.JEventTransform));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsHandler_1', 
    TypeInfo(Androidapi.JNI.classes.JEventsHandler_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsStorageListener', 
    TypeInfo(Androidapi.JNI.classes.JEventsStorageListener));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JQueueFile_ElementInputStream', 
    TypeInfo(Androidapi.JNI.classes.JQueueFile_ElementInputStream));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JQueueFile_ElementReader', 
    TypeInfo(Androidapi.JNI.classes.JQueueFile_ElementReader));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeItem_Builder', 
    TypeInfo(Androidapi.JNI.classes.JScribeItem_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeFilesSender_ConfigRequestInterceptor', 
    TypeInfo(Androidapi.JNI.classes.JScribeFilesSender_ConfigRequestInterceptor));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsFilesManager_FileWithTimestamp', 
    TypeInfo(Androidapi.JNI.classes.JEventsFilesManager_FileWithTimestamp));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeItem_MediaDetails', 
    TypeInfo(Androidapi.JNI.classes.JScribeItem_MediaDetails));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEnabledEventsStrategy', 
    TypeInfo(Androidapi.JNI.classes.JEnabledEventsStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeEvent', 
    TypeInfo(Androidapi.JNI.classes.JScribeEvent));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsHandler_3', 
    TypeInfo(Androidapi.JNI.classes.JEventsHandler_3));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeClient', 
    TypeInfo(Androidapi.JNI.classes.JScribeClient));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsHandler_2', 
    TypeInfo(Androidapi.JNI.classes.JEventsHandler_2));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSyndicatedSdkImpressionEvent', 
    TypeInfo(Androidapi.JNI.classes.JSyndicatedSdkImpressionEvent));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeFilesSender', 
    TypeInfo(Androidapi.JNI.classes.JScribeFilesSender));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeFilesManager', 
    TypeInfo(Androidapi.JNI.classes.JScribeFilesManager));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeFilesSender_1', 
    TypeInfo(Androidapi.JNI.classes.JScribeFilesSender_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JQueueFile', 
    TypeInfo(Androidapi.JNI.classes.JQueueFile));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeEvent_Transform', 
    TypeInfo(Androidapi.JNI.classes.JScribeEvent_Transform));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeFilesSender_ScribeService', 
    TypeInfo(Androidapi.JNI.classes.JScribeFilesSender_ScribeService));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsHandler_4', 
    TypeInfo(Androidapi.JNI.classes.JEventsHandler_4));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeEventFactory', 
    TypeInfo(Androidapi.JNI.classes.JScribeEventFactory));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JQueueFileEventStorage', 
    TypeInfo(Androidapi.JNI.classes.JQueueFileEventStorage));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsFilesManager', 
    TypeInfo(Androidapi.JNI.classes.JEventsFilesManager));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeHandler', 
    TypeInfo(Androidapi.JNI.classes.JScribeHandler));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JScribeItem', 
    TypeInfo(Androidapi.JNI.classes.JScribeItem));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JEventsHandler', 
    TypeInfo(Androidapi.JNI.classes.JEventsHandler));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSyndicationClientEvent', 
    TypeInfo(Androidapi.JNI.classes.JSyndicationClientEvent));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper_1', 
    TypeInfo(Androidapi.JNI.classes.JActivityLifecycleManager_ActivityLifecycleCallbacksWrapper_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSessionMonitor_1', 
    TypeInfo(Androidapi.JNI.classes.JSessionMonitor_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JVineCardUtils', 
    TypeInfo(Androidapi.JNI.classes.JVineCardUtils));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAdvertisingInfoStrategy', 
    TypeInfo(Androidapi.JNI.classes.JAdvertisingInfoStrategy));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterSessionVerifier_AccountServiceProvider', 
    TypeInfo(Androidapi.JNI.classes.JTwitterSessionVerifier_AccountServiceProvider));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSessionMonitor_2', 
    TypeInfo(Androidapi.JNI.classes.JSessionMonitor_2));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAuthToken', 
    TypeInfo(Androidapi.JNI.classes.JAuthToken));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthConfig_1', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthConfig_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthToken_1', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthToken_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterApiException', 
    TypeInfo(Androidapi.JNI.classes.JTwitterApiException));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterConfig', 
    TypeInfo(Androidapi.JNI.classes.JTwitterConfig));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JGuestSession_Serializer', 
    TypeInfo(Androidapi.JNI.classes.JGuestSession_Serializer));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthException', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthException));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterCore_1', 
    TypeInfo(Androidapi.JNI.classes.JTwitterCore_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterConfig_Builder', 
    TypeInfo(Androidapi.JNI.classes.JTwitterConfig_Builder));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterLoginButton_1', 
    TypeInfo(Androidapi.JNI.classes.JTwitterLoginButton_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthWebViewClient', 
    TypeInfo(Androidapi.JNI.classes.JOAuthWebViewClient));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JWebViewException', 
    TypeInfo(Androidapi.JNI.classes.JWebViewException));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthHandler', 
    TypeInfo(Androidapi.JNI.classes.JOAuthHandler));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthController_1', 
    TypeInfo(Androidapi.JNI.classes.JOAuthController_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthController', 
    TypeInfo(Androidapi.JNI.classes.JOAuthController));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthController_Listener', 
    TypeInfo(Androidapi.JNI.classes.JOAuthController_Listener));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthWebViewClient_Listener', 
    TypeInfo(Androidapi.JNI.classes.JOAuthWebViewClient_Listener));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthActivity', 
    TypeInfo(Androidapi.JNI.classes.JOAuthActivity));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthClient_AuthStateLazyHolder', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthClient_AuthStateLazyHolder));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAuthHandler', 
    TypeInfo(Androidapi.JNI.classes.JAuthHandler));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JAuthState', 
    TypeInfo(Androidapi.JNI.classes.JAuthState));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterLoginButton_LoginClickListener', 
    TypeInfo(Androidapi.JNI.classes.JTwitterLoginButton_LoginClickListener));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthWebChromeClient', 
    TypeInfo(Androidapi.JNI.classes.JOAuthWebChromeClient));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterLoginButton', 
    TypeInfo(Androidapi.JNI.classes.JTwitterLoginButton));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthClient', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthClient));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JOAuthController_2', 
    TypeInfo(Androidapi.JNI.classes.JOAuthController_2));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthClient_CallbackWrapper', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthClient_CallbackWrapper));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JSSOAuthHandler', 
    TypeInfo(Androidapi.JNI.classes.JSSOAuthHandler));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JTwitterAuthClient_1', 
    TypeInfo(Androidapi.JNI.classes.JTwitterAuthClient_1));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JIntentUtils', 
    TypeInfo(Androidapi.JNI.classes.JIntentUtils));
  TRegTypes.RegisterType('Androidapi.JNI.classes.JCallback', 
    TypeInfo(Androidapi.JNI.classes.JCallback));
end;


initialization
  RegisterTypes;

{$ENDIF}

end.
