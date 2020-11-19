//Code Fix By [金华]DelphiTeacher(452330643)

//====================================================
//
//  转换来自JarOrClass2Pas(原JavaClassToDelphiUnit)
//  原始作者：ying32
//  QQ: 1444386932、396506155
//  Email：yuanfen3287@vip.qq.com
//
//  修改 By：Flying Wang & 爱吃猪头肉
//  请不要移除以上的任何信息。
//  请不要将本版本发到城通网盘，否则死全家。
//
//  Email：1765535979@qq.com
//  QQ Group：165232328
//
//  生成时间：2020-11-14 13:33:42
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.glide_glide_4_7_1;

interface

{$IFDEF ANDROID}
uses
  Androidapi.JNIBridge,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.App,
  Androidapi.JNI.Support,
  Androidapi.JNI.Widget,
  Androidapi.JNI.os,
  Androidapi.JNI.Net,
//  Androidapi.JNI.java.net.HttpURLConnection,
//  Androidapi.JNI.java.net.URL,
//  Androidapi.JNI.Java.Security,
//  Androidapi.JNI.java.nio.ByteBuffer,
//  Androidapi.JNI.java.nio.charset.Charset,
//  Androidapi.JNI.com.bumptech.glide.gifdecoder.GifDecoder,
  Androidapi.JNI.Util,
  Androidapi.JNI.Media;


type

// ===== Forward declarations =====

  JBuildConfig = interface; //com.bumptech.glide.BuildConfig
  JGeneratedAppGlideModule = interface; //com.bumptech.glide.GeneratedAppGlideModule
  JGenericTransitionOptions = interface; //com.bumptech.glide.GenericTransitionOptions
  JGlide = interface; //com.bumptech.glide.Glide
  JGlideBuilder = interface; //com.bumptech.glide.GlideBuilder
  JGlideContext = interface; //com.bumptech.glide.GlideContext
  JListPreloader_PreloadModelProvider = interface; //com.bumptech.glide.ListPreloader$PreloadModelProvider
  JListPreloader_PreloadSizeProvider = interface; //com.bumptech.glide.ListPreloader$PreloadSizeProvider
  JListPreloader_PreloadTarget = interface; //com.bumptech.glide.ListPreloader$PreloadTarget
  JListPreloader_PreloadTargetQueue = interface; //com.bumptech.glide.ListPreloader$PreloadTargetQueue
  JListPreloader = interface; //com.bumptech.glide.ListPreloader
  JAssetFileDescriptorLocalUriFetcher = interface; //com.bumptech.glide.load.data.AssetFileDescriptorLocalUriFetcher
  JAssetPathFetcher = interface; //com.bumptech.glide.load.data.AssetPathFetcher
  JBufferedOutputStream = interface; //com.bumptech.glide.load.data.BufferedOutputStream
  JDataFetcher_DataCallback = interface; //com.bumptech.glide.load.data.DataFetcher$DataCallback
  JDataFetcher = interface; //com.bumptech.glide.load.data.DataFetcher
  JDataRewinder_Factory = interface; //com.bumptech.glide.load.data.DataRewinder$Factory
  JDataRewinder = interface; //com.bumptech.glide.load.data.DataRewinder
//  JDataRewinderRegistry_1 = interface; //com.bumptech.glide.load.data.DataRewinderRegistry$1
  JDataRewinderRegistry_DefaultRewinder = interface; //com.bumptech.glide.load.data.DataRewinderRegistry$DefaultRewinder
  JDataRewinderRegistry = interface; //com.bumptech.glide.load.data.DataRewinderRegistry
//  JExifOrientationStream = interface; //com.bumptech.glide.load.data.ExifOrientationStream
  JFileDescriptorAssetPathFetcher = interface; //com.bumptech.glide.load.data.FileDescriptorAssetPathFetcher
  JFileDescriptorLocalUriFetcher = interface; //com.bumptech.glide.load.data.FileDescriptorLocalUriFetcher
  JHttpUrlFetcher_DefaultHttpUrlConnectionFactory = interface; //com.bumptech.glide.load.data.HttpUrlFetcher$DefaultHttpUrlConnectionFactory
  JHttpUrlFetcher_HttpUrlConnectionFactory = interface; //com.bumptech.glide.load.data.HttpUrlFetcher$HttpUrlConnectionFactory
  JHttpUrlFetcher = interface; //com.bumptech.glide.load.data.HttpUrlFetcher
  JInputStreamRewinder_Factory = interface; //com.bumptech.glide.load.data.InputStreamRewinder$Factory
  JInputStreamRewinder = interface; //com.bumptech.glide.load.data.InputStreamRewinder
  JLocalUriFetcher = interface; //com.bumptech.glide.load.data.LocalUriFetcher
  JFileService = interface; //com.bumptech.glide.load.data.mediastore.FileService
  JMediaStoreUtil = interface; //com.bumptech.glide.load.data.mediastore.MediaStoreUtil
  JThumbFetcher_ImageThumbnailQuery = interface; //com.bumptech.glide.load.data.mediastore.ThumbFetcher$ImageThumbnailQuery
  JThumbFetcher_VideoThumbnailQuery = interface; //com.bumptech.glide.load.data.mediastore.ThumbFetcher$VideoThumbnailQuery
  JThumbFetcher = interface; //com.bumptech.glide.load.data.mediastore.ThumbFetcher
  JThumbnailQuery = interface; //com.bumptech.glide.load.data.mediastore.ThumbnailQuery
  JThumbnailStreamOpener = interface; //com.bumptech.glide.load.data.mediastore.ThumbnailStreamOpener
  JStreamAssetPathFetcher = interface; //com.bumptech.glide.load.data.StreamAssetPathFetcher
  JStreamLocalUriFetcher = interface; //com.bumptech.glide.load.data.StreamLocalUriFetcher
  JDataSource = interface; //com.bumptech.glide.load.DataSource
  JDecodeFormat = interface; //com.bumptech.glide.load.DecodeFormat
  JEncoder = interface; //com.bumptech.glide.load.Encoder
  JEncodeStrategy = interface; //com.bumptech.glide.load.EncodeStrategy
//  JActiveResources_1 = interface; //com.bumptech.glide.load.engine.ActiveResources$1
//  JActiveResources_2 = interface; //com.bumptech.glide.load.engine.ActiveResources$2
  JActiveResources_DequeuedResourceCallback = interface; //com.bumptech.glide.load.engine.ActiveResources$DequeuedResourceCallback
//  JActiveResources_ResourceWeakReference = interface; //com.bumptech.glide.load.engine.ActiveResources$ResourceWeakReference
  JActiveResources = interface; //com.bumptech.glide.load.engine.ActiveResources
  JArrayAdapterInterface = interface; //com.bumptech.glide.load.engine.bitmap_recycle.ArrayAdapterInterface
  JArrayPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool
  JAttributeStrategy_Key = interface; //com.bumptech.glide.load.engine.bitmap_recycle.AttributeStrategy$Key
  JAttributeStrategy_KeyPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.AttributeStrategy$KeyPool
  JAttributeStrategy = interface; //com.bumptech.glide.load.engine.bitmap_recycle.AttributeStrategy
  JBaseKeyPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.BaseKeyPool
  JBitmapPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.BitmapPool
  JBitmapPoolAdapter = interface; //com.bumptech.glide.load.engine.bitmap_recycle.BitmapPoolAdapter
  JByteArrayAdapter = interface; //com.bumptech.glide.load.engine.bitmap_recycle.ByteArrayAdapter
  JGroupedLinkedMap_LinkedEntry = interface; //com.bumptech.glide.load.engine.bitmap_recycle.GroupedLinkedMap$LinkedEntry
  JGroupedLinkedMap = interface; //com.bumptech.glide.load.engine.bitmap_recycle.GroupedLinkedMap
  JIntegerArrayAdapter = interface; //com.bumptech.glide.load.engine.bitmap_recycle.IntegerArrayAdapter
  JLruArrayPool_Key = interface; //com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$Key
  JLruArrayPool_KeyPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool$KeyPool
  JLruArrayPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.LruArrayPool
  JLruBitmapPool_BitmapTracker = interface; //com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool$BitmapTracker
  JLruBitmapPool_NullBitmapTracker = interface; //com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool$NullBitmapTracker
  JLruBitmapPool_ThrowingBitmapTracker = interface; //com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool$ThrowingBitmapTracker
  JLruBitmapPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.LruBitmapPool
  JLruPoolStrategy = interface; //com.bumptech.glide.load.engine.bitmap_recycle.LruPoolStrategy
  JPoolable = interface; //com.bumptech.glide.load.engine.bitmap_recycle.Poolable
//  JPrettyPrintTreeMap = interface; //com.bumptech.glide.load.engine.bitmap_recycle.PrettyPrintTreeMap
//  JSizeConfigStrategy_1 = interface; //com.bumptech.glide.load.engine.bitmap_recycle.SizeConfigStrategy$1
  JSizeConfigStrategy_Key = interface; //com.bumptech.glide.load.engine.bitmap_recycle.SizeConfigStrategy$Key
  JSizeConfigStrategy_KeyPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.SizeConfigStrategy$KeyPool
  JSizeConfigStrategy = interface; //com.bumptech.glide.load.engine.bitmap_recycle.SizeConfigStrategy
  JSizeStrategy_Key = interface; //com.bumptech.glide.load.engine.bitmap_recycle.SizeStrategy$Key
  JSizeStrategy_KeyPool = interface; //com.bumptech.glide.load.engine.bitmap_recycle.SizeStrategy$KeyPool
  JSizeStrategy = interface; //com.bumptech.glide.load.engine.bitmap_recycle.SizeStrategy
  JDiskCache_Factory = interface; //com.bumptech.glide.load.engine.cache.DiskCache$Factory
  JDiskCache_Writer = interface; //com.bumptech.glide.load.engine.cache.DiskCache$Writer
  JDiskCache = interface; //com.bumptech.glide.load.engine.cache.DiskCache
  JDiskCacheAdapter_Factory = interface; //com.bumptech.glide.load.engine.cache.DiskCacheAdapter$Factory
  JDiskCacheAdapter = interface; //com.bumptech.glide.load.engine.cache.DiskCacheAdapter
  JDiskCacheWriteLocker_WriteLock = interface; //com.bumptech.glide.load.engine.cache.DiskCacheWriteLocker$WriteLock
  JDiskCacheWriteLocker_WriteLockPool = interface; //com.bumptech.glide.load.engine.cache.DiskCacheWriteLocker$WriteLockPool
  JDiskCacheWriteLocker = interface; //com.bumptech.glide.load.engine.cache.DiskCacheWriteLocker
//  JDiskLruCacheFactory_1 = interface; //com.bumptech.glide.load.engine.cache.DiskLruCacheFactory$1
//  JDiskLruCacheFactory_2 = interface; //com.bumptech.glide.load.engine.cache.DiskLruCacheFactory$2
  JDiskLruCacheFactory_CacheDirectoryGetter = interface; //com.bumptech.glide.load.engine.cache.DiskLruCacheFactory$CacheDirectoryGetter
  JDiskLruCacheFactory = interface; //com.bumptech.glide.load.engine.cache.DiskLruCacheFactory
  JDiskLruCacheWrapper = interface; //com.bumptech.glide.load.engine.cache.DiskLruCacheWrapper
//  JExternalCacheDiskCacheFactory_1 = interface; //com.bumptech.glide.load.engine.cache.ExternalCacheDiskCacheFactory$1
  JExternalCacheDiskCacheFactory = interface; //com.bumptech.glide.load.engine.cache.ExternalCacheDiskCacheFactory
//  JExternalPreferredCacheDiskCacheFactory_1 = interface; //com.bumptech.glide.load.engine.cache.ExternalPreferredCacheDiskCacheFactory$1
  JExternalPreferredCacheDiskCacheFactory = interface; //com.bumptech.glide.load.engine.cache.ExternalPreferredCacheDiskCacheFactory
//  JInternalCacheDiskCacheFactory_1 = interface; //com.bumptech.glide.load.engine.cache.InternalCacheDiskCacheFactory$1
  JInternalCacheDiskCacheFactory = interface; //com.bumptech.glide.load.engine.cache.InternalCacheDiskCacheFactory
  JLruResourceCache = interface; //com.bumptech.glide.load.engine.cache.LruResourceCache
  JMemoryCache_ResourceRemovedListener = interface; //com.bumptech.glide.load.engine.cache.MemoryCache$ResourceRemovedListener
  JMemoryCache = interface; //com.bumptech.glide.load.engine.cache.MemoryCache
  JMemoryCacheAdapter = interface; //com.bumptech.glide.load.engine.cache.MemoryCacheAdapter
  JMemorySizeCalculator_Builder = interface; //com.bumptech.glide.load.engine.cache.MemorySizeCalculator$Builder
  JMemorySizeCalculator_DisplayMetricsScreenDimensions = interface; //com.bumptech.glide.load.engine.cache.MemorySizeCalculator$DisplayMetricsScreenDimensions
  JMemorySizeCalculator_ScreenDimensions = interface; //com.bumptech.glide.load.engine.cache.MemorySizeCalculator$ScreenDimensions
  JMemorySizeCalculator = interface; //com.bumptech.glide.load.engine.cache.MemorySizeCalculator
//  JSafeKeyGenerator_1 = interface; //com.bumptech.glide.load.engine.cache.SafeKeyGenerator$1
  JSafeKeyGenerator_PoolableDigestContainer = interface; //com.bumptech.glide.load.engine.cache.SafeKeyGenerator$PoolableDigestContainer
  JSafeKeyGenerator = interface; //com.bumptech.glide.load.engine.cache.SafeKeyGenerator
  JDataCacheGenerator = interface; //com.bumptech.glide.load.engine.DataCacheGenerator
  JDataCacheKey = interface; //com.bumptech.glide.load.engine.DataCacheKey
  JDataCacheWriter = interface; //com.bumptech.glide.load.engine.DataCacheWriter
  JDataFetcherGenerator_FetcherReadyCallback = interface; //com.bumptech.glide.load.engine.DataFetcherGenerator$FetcherReadyCallback
  JDataFetcherGenerator = interface; //com.bumptech.glide.load.engine.DataFetcherGenerator
  JDecodeHelper = interface; //com.bumptech.glide.load.engine.DecodeHelper
//  JDecodeJob_1 = interface; //com.bumptech.glide.load.engine.DecodeJob$1
  JDecodeJob_Callback = interface; //com.bumptech.glide.load.engine.DecodeJob$Callback
  JDecodeJob_DecodeCallback = interface; //com.bumptech.glide.load.engine.DecodeJob$DecodeCallback
  JDecodeJob_DeferredEncodeManager = interface; //com.bumptech.glide.load.engine.DecodeJob$DeferredEncodeManager
  JDecodeJob_DiskCacheProvider = interface; //com.bumptech.glide.load.engine.DecodeJob$DiskCacheProvider
  JDecodeJob_ReleaseManager = interface; //com.bumptech.glide.load.engine.DecodeJob$ReleaseManager
  JDecodeJob_RunReason = interface; //com.bumptech.glide.load.engine.DecodeJob$RunReason
  JDecodeJob_Stage = interface; //com.bumptech.glide.load.engine.DecodeJob$Stage
  JDecodeJob = interface; //com.bumptech.glide.load.engine.DecodeJob
  JDecodePath_DecodeCallback = interface; //com.bumptech.glide.load.engine.DecodePath$DecodeCallback
  JDecodePath = interface; //com.bumptech.glide.load.engine.DecodePath
//  JDiskCacheStrategy_1 = interface; //com.bumptech.glide.load.engine.DiskCacheStrategy$1
//  JDiskCacheStrategy_2 = interface; //com.bumptech.glide.load.engine.DiskCacheStrategy$2
//  JDiskCacheStrategy_3 = interface; //com.bumptech.glide.load.engine.DiskCacheStrategy$3
//  JDiskCacheStrategy_4 = interface; //com.bumptech.glide.load.engine.DiskCacheStrategy$4
//  JDiskCacheStrategy_5 = interface; //com.bumptech.glide.load.engine.DiskCacheStrategy$5
  JDiskCacheStrategy = interface; //com.bumptech.glide.load.engine.DiskCacheStrategy
//  JEngine_DecodeJobFactory_1 = interface; //com.bumptech.glide.load.engine.Engine$DecodeJobFactory$1
  JEngine_DecodeJobFactory = interface; //com.bumptech.glide.load.engine.Engine$DecodeJobFactory
//  JEngine_EngineJobFactory_1 = interface; //com.bumptech.glide.load.engine.Engine$EngineJobFactory$1
  JEngine_EngineJobFactory = interface; //com.bumptech.glide.load.engine.Engine$EngineJobFactory
  JEngine_LazyDiskCacheProvider = interface; //com.bumptech.glide.load.engine.Engine$LazyDiskCacheProvider
  JEngine_LoadStatus = interface; //com.bumptech.glide.load.engine.Engine$LoadStatus
  JEngine = interface; //com.bumptech.glide.load.engine.Engine
  JEngineJob_EngineResourceFactory = interface; //com.bumptech.glide.load.engine.EngineJob$EngineResourceFactory
  JEngineJob_MainThreadCallback = interface; //com.bumptech.glide.load.engine.EngineJob$MainThreadCallback
  JEngineJob = interface; //com.bumptech.glide.load.engine.EngineJob
  JEngineJobListener = interface; //com.bumptech.glide.load.engine.EngineJobListener
  JEngineKey = interface; //com.bumptech.glide.load.engine.EngineKey
  JEngineKeyFactory = interface; //com.bumptech.glide.load.engine.EngineKeyFactory
  JEngineResource_ResourceListener = interface; //com.bumptech.glide.load.engine.EngineResource$ResourceListener
  JEngineResource = interface; //com.bumptech.glide.load.engine.EngineResource
//  JGlideExecutor_DefaultThreadFactory_1 = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$DefaultThreadFactory$1
  JGlideExecutor_DefaultThreadFactory = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$DefaultThreadFactory
//  JGlideExecutor_UncaughtThrowableStrategy_1 = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$UncaughtThrowableStrategy$1
//  JGlideExecutor_UncaughtThrowableStrategy_2 = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$UncaughtThrowableStrategy$2
//  JGlideExecutor_UncaughtThrowableStrategy_3 = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$UncaughtThrowableStrategy$3
  JGlideExecutor_UncaughtThrowableStrategy = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$UncaughtThrowableStrategy
  JGlideExecutor = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor
//  JRuntimeCompat_1 = interface; //com.bumptech.glide.load.engine.executor.RuntimeCompat$1
  JRuntimeCompat = interface; //com.bumptech.glide.load.engine.executor.RuntimeCompat
  JGlideException_IndentedAppendable = interface; //com.bumptech.glide.load.engine.GlideException$IndentedAppendable
  JGlideException = interface; //com.bumptech.glide.load.engine.GlideException
  JInitializable = interface; //com.bumptech.glide.load.engine.Initializable
  JJobs = interface; //com.bumptech.glide.load.engine.Jobs
  JLoadPath = interface; //com.bumptech.glide.load.engine.LoadPath
//  JLockedResource_1 = interface; //com.bumptech.glide.load.engine.LockedResource$1
  JLockedResource = interface; //com.bumptech.glide.load.engine.LockedResource
  JBitmapPreFiller = interface; //com.bumptech.glide.load.engine.prefill.BitmapPreFiller
  JBitmapPreFillRunner_Clock = interface; //com.bumptech.glide.load.engine.prefill.BitmapPreFillRunner$Clock
  JBitmapPreFillRunner_UniqueKey = interface; //com.bumptech.glide.load.engine.prefill.BitmapPreFillRunner$UniqueKey
  JBitmapPreFillRunner = interface; //com.bumptech.glide.load.engine.prefill.BitmapPreFillRunner
  JPreFillQueue = interface; //com.bumptech.glide.load.engine.prefill.PreFillQueue
  JPreFillType_Builder = interface; //com.bumptech.glide.load.engine.prefill.PreFillType$Builder
  JPreFillType = interface; //com.bumptech.glide.load.engine.prefill.PreFillType
  JResource = interface; //com.bumptech.glide.load.engine.Resource
  JResourceCacheGenerator = interface; //com.bumptech.glide.load.engine.ResourceCacheGenerator
  JResourceCacheKey = interface; //com.bumptech.glide.load.engine.ResourceCacheKey
  JResourceRecycler_ResourceRecyclerCallback = interface; //com.bumptech.glide.load.engine.ResourceRecycler$ResourceRecyclerCallback
  JResourceRecycler = interface; //com.bumptech.glide.load.engine.ResourceRecycler
  JSourceGenerator = interface; //com.bumptech.glide.load.engine.SourceGenerator
  JHttpException = interface; //com.bumptech.glide.load.HttpException
  JImageHeaderParser_ImageType = interface; //com.bumptech.glide.load.ImageHeaderParser$ImageType
  JImageHeaderParser = interface; //com.bumptech.glide.load.ImageHeaderParser
  JImageHeaderParserUtils = interface; //com.bumptech.glide.load.ImageHeaderParserUtils
  JKey = interface; //com.bumptech.glide.load.Key
  JAssetUriLoader_AssetFetcherFactory = interface; //com.bumptech.glide.load.model.AssetUriLoader$AssetFetcherFactory
  JAssetUriLoader_FileDescriptorFactory = interface; //com.bumptech.glide.load.model.AssetUriLoader$FileDescriptorFactory
  JAssetUriLoader_StreamFactory = interface; //com.bumptech.glide.load.model.AssetUriLoader$StreamFactory
  JAssetUriLoader = interface; //com.bumptech.glide.load.model.AssetUriLoader
//  JByteArrayLoader_ByteBufferFactory_1 = interface; //com.bumptech.glide.load.model.ByteArrayLoader$ByteBufferFactory$1
  JByteArrayLoader_ByteBufferFactory = interface; //com.bumptech.glide.load.model.ByteArrayLoader$ByteBufferFactory
  JByteArrayLoader_Converter = interface; //com.bumptech.glide.load.model.ByteArrayLoader$Converter
  JByteArrayLoader_Fetcher = interface; //com.bumptech.glide.load.model.ByteArrayLoader$Fetcher
//  JByteArrayLoader_StreamFactory_1 = interface; //com.bumptech.glide.load.model.ByteArrayLoader$StreamFactory$1
  JByteArrayLoader_StreamFactory = interface; //com.bumptech.glide.load.model.ByteArrayLoader$StreamFactory
  JByteArrayLoader = interface; //com.bumptech.glide.load.model.ByteArrayLoader
  JByteBufferEncoder = interface; //com.bumptech.glide.load.model.ByteBufferEncoder
  JByteBufferFileLoader_ByteBufferFetcher = interface; //com.bumptech.glide.load.model.ByteBufferFileLoader$ByteBufferFetcher
  JByteBufferFileLoader_Factory = interface; //com.bumptech.glide.load.model.ByteBufferFileLoader$Factory
  JByteBufferFileLoader = interface; //com.bumptech.glide.load.model.ByteBufferFileLoader
  JDataUrlLoader_DataDecoder = interface; //com.bumptech.glide.load.model.DataUrlLoader$DataDecoder
  JDataUrlLoader_DataUriFetcher = interface; //com.bumptech.glide.load.model.DataUrlLoader$DataUriFetcher
//  JDataUrlLoader_StreamFactory_1 = interface; //com.bumptech.glide.load.model.DataUrlLoader$StreamFactory$1
  JDataUrlLoader_StreamFactory = interface; //com.bumptech.glide.load.model.DataUrlLoader$StreamFactory
  JDataUrlLoader = interface; //com.bumptech.glide.load.model.DataUrlLoader
  JFileLoader_Factory = interface; //com.bumptech.glide.load.model.FileLoader$Factory
//  JFileLoader_FileDescriptorFactory_1 = interface; //com.bumptech.glide.load.model.FileLoader$FileDescriptorFactory$1
  JFileLoader_FileDescriptorFactory = interface; //com.bumptech.glide.load.model.FileLoader$FileDescriptorFactory
  JFileLoader_FileFetcher = interface; //com.bumptech.glide.load.model.FileLoader$FileFetcher
  JFileLoader_FileOpener = interface; //com.bumptech.glide.load.model.FileLoader$FileOpener
//  JFileLoader_StreamFactory_1 = interface; //com.bumptech.glide.load.model.FileLoader$StreamFactory$1
  JFileLoader_StreamFactory = interface; //com.bumptech.glide.load.model.FileLoader$StreamFactory
  JFileLoader = interface; //com.bumptech.glide.load.model.FileLoader
  JGlideUrl = interface; //com.bumptech.glide.load.model.GlideUrl
//  JHeaders_1 = interface; //com.bumptech.glide.load.model.Headers$1
  JHeaders = interface; //com.bumptech.glide.load.model.Headers
  JLazyHeaderFactory = interface; //com.bumptech.glide.load.model.LazyHeaderFactory
  JLazyHeaders_Builder = interface; //com.bumptech.glide.load.model.LazyHeaders$Builder
  JLazyHeaders_StringHeaderFactory = interface; //com.bumptech.glide.load.model.LazyHeaders$StringHeaderFactory
  JLazyHeaders = interface; //com.bumptech.glide.load.model.LazyHeaders
  JMediaStoreFileLoader_Factory = interface; //com.bumptech.glide.load.model.MediaStoreFileLoader$Factory
  JMediaStoreFileLoader_FilePathFetcher = interface; //com.bumptech.glide.load.model.MediaStoreFileLoader$FilePathFetcher
  JMediaStoreFileLoader = interface; //com.bumptech.glide.load.model.MediaStoreFileLoader
  JModel = interface; //com.bumptech.glide.load.model.Model
//  JModelCache_1 = interface; //com.bumptech.glide.load.model.ModelCache$1
  JModelCache_ModelKey = interface; //com.bumptech.glide.load.model.ModelCache$ModelKey
  JModelCache = interface; //com.bumptech.glide.load.model.ModelCache
  JModelLoader_LoadData = interface; //com.bumptech.glide.load.model.ModelLoader$LoadData
  JModelLoader = interface; //com.bumptech.glide.load.model.ModelLoader
  JModelLoaderFactory = interface; //com.bumptech.glide.load.model.ModelLoaderFactory
  JModelLoaderRegistry_ModelLoaderCache_Entry = interface; //com.bumptech.glide.load.model.ModelLoaderRegistry$ModelLoaderCache$Entry
  JModelLoaderRegistry_ModelLoaderCache = interface; //com.bumptech.glide.load.model.ModelLoaderRegistry$ModelLoaderCache
  JModelLoaderRegistry = interface; //com.bumptech.glide.load.model.ModelLoaderRegistry
  JMultiModelLoader_MultiFetcher = interface; //com.bumptech.glide.load.model.MultiModelLoader$MultiFetcher
  JMultiModelLoader = interface; //com.bumptech.glide.load.model.MultiModelLoader
  JMultiModelLoaderFactory_EmptyModelLoader = interface; //com.bumptech.glide.load.model.MultiModelLoaderFactory$EmptyModelLoader
  JMultiModelLoaderFactory_Entry = interface; //com.bumptech.glide.load.model.MultiModelLoaderFactory$Entry
  JMultiModelLoaderFactory_Factory = interface; //com.bumptech.glide.load.model.MultiModelLoaderFactory$Factory
  JMultiModelLoaderFactory = interface; //com.bumptech.glide.load.model.MultiModelLoaderFactory
  JResourceLoader_AssetFileDescriptorFactory = interface; //com.bumptech.glide.load.model.ResourceLoader$AssetFileDescriptorFactory
  JResourceLoader_FileDescriptorFactory = interface; //com.bumptech.glide.load.model.ResourceLoader$FileDescriptorFactory
  JResourceLoader_StreamFactory = interface; //com.bumptech.glide.load.model.ResourceLoader$StreamFactory
  JResourceLoader_UriFactory = interface; //com.bumptech.glide.load.model.ResourceLoader$UriFactory
  JResourceLoader = interface; //com.bumptech.glide.load.model.ResourceLoader
  JBaseGlideUrlLoader = interface; //com.bumptech.glide.load.model.stream.BaseGlideUrlLoader
  JHttpGlideUrlLoader_Factory = interface; //com.bumptech.glide.load.model.stream.HttpGlideUrlLoader$Factory
  JHttpGlideUrlLoader = interface; //com.bumptech.glide.load.model.stream.HttpGlideUrlLoader
  JHttpUriLoader_Factory = interface; //com.bumptech.glide.load.model.stream.HttpUriLoader$Factory
  JHttpUriLoader = interface; //com.bumptech.glide.load.model.stream.HttpUriLoader
  JMediaStoreImageThumbLoader_Factory = interface; //com.bumptech.glide.load.model.stream.MediaStoreImageThumbLoader$Factory
  JMediaStoreImageThumbLoader = interface; //com.bumptech.glide.load.model.stream.MediaStoreImageThumbLoader
  JMediaStoreVideoThumbLoader_Factory = interface; //com.bumptech.glide.load.model.stream.MediaStoreVideoThumbLoader$Factory
  JMediaStoreVideoThumbLoader = interface; //com.bumptech.glide.load.model.stream.MediaStoreVideoThumbLoader
  JUrlLoader_StreamFactory = interface; //com.bumptech.glide.load.model.stream.UrlLoader$StreamFactory
  JUrlLoader = interface; //com.bumptech.glide.load.model.stream.UrlLoader
  JStreamEncoder = interface; //com.bumptech.glide.load.model.StreamEncoder
  JStringLoader_AssetFileDescriptorFactory = interface; //com.bumptech.glide.load.model.StringLoader$AssetFileDescriptorFactory
  JStringLoader_FileDescriptorFactory = interface; //com.bumptech.glide.load.model.StringLoader$FileDescriptorFactory
  JStringLoader_StreamFactory = interface; //com.bumptech.glide.load.model.StringLoader$StreamFactory
  JStringLoader = interface; //com.bumptech.glide.load.model.StringLoader
  JUnitModelLoader_Factory = interface; //com.bumptech.glide.load.model.UnitModelLoader$Factory
  JUnitModelLoader_UnitFetcher = interface; //com.bumptech.glide.load.model.UnitModelLoader$UnitFetcher
  JUnitModelLoader = interface; //com.bumptech.glide.load.model.UnitModelLoader
  JUriLoader_AssetFileDescriptorFactory = interface; //com.bumptech.glide.load.model.UriLoader$AssetFileDescriptorFactory
  JUriLoader_FileDescriptorFactory = interface; //com.bumptech.glide.load.model.UriLoader$FileDescriptorFactory
  JUriLoader_LocalUriFetcherFactory = interface; //com.bumptech.glide.load.model.UriLoader$LocalUriFetcherFactory
  JUriLoader_StreamFactory = interface; //com.bumptech.glide.load.model.UriLoader$StreamFactory
  JUriLoader = interface; //com.bumptech.glide.load.model.UriLoader
  JUrlUriLoader_StreamFactory = interface; //com.bumptech.glide.load.model.UrlUriLoader$StreamFactory
  JUrlUriLoader = interface; //com.bumptech.glide.load.model.UrlUriLoader
  JMultiTransformation = interface; //com.bumptech.glide.load.MultiTransformation
//  JOption_1 = interface; //com.bumptech.glide.load.Option$1
  JOption_CacheKeyUpdater = interface; //com.bumptech.glide.load.Option$CacheKeyUpdater
  JOption = interface; //com.bumptech.glide.load.Option
  JOptions = interface; //com.bumptech.glide.load.Options
  JBitmapDrawableDecoder = interface; //com.bumptech.glide.load.resource.bitmap.BitmapDrawableDecoder
  JBitmapDrawableEncoder = interface; //com.bumptech.glide.load.resource.bitmap.BitmapDrawableEncoder
  JBitmapDrawableResource = interface; //com.bumptech.glide.load.resource.bitmap.BitmapDrawableResource
  JBitmapDrawableTransformation = interface; //com.bumptech.glide.load.resource.bitmap.BitmapDrawableTransformation
  JBitmapEncoder = interface; //com.bumptech.glide.load.resource.bitmap.BitmapEncoder
  JBitmapResource = interface; //com.bumptech.glide.load.resource.bitmap.BitmapResource
  JBitmapTransformation = interface; //com.bumptech.glide.load.resource.bitmap.BitmapTransformation
  JBitmapTransitionOptions = interface; //com.bumptech.glide.load.resource.bitmap.BitmapTransitionOptions
  JByteBufferBitmapDecoder = interface; //com.bumptech.glide.load.resource.bitmap.ByteBufferBitmapDecoder
  JCenterCrop = interface; //com.bumptech.glide.load.resource.bitmap.CenterCrop
  JCenterInside = interface; //com.bumptech.glide.load.resource.bitmap.CenterInside
  JCircleCrop = interface; //com.bumptech.glide.load.resource.bitmap.CircleCrop
  JDefaultImageHeaderParser_ByteBufferReader = interface; //com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser$ByteBufferReader
  JDefaultImageHeaderParser_RandomAccessReader = interface; //com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser$RandomAccessReader
  JDefaultImageHeaderParser_Reader = interface; //com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser$Reader
  JDefaultImageHeaderParser_StreamReader = interface; //com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser$StreamReader
  JDefaultImageHeaderParser = interface; //com.bumptech.glide.load.resource.bitmap.DefaultImageHeaderParser
//  JDownsampler_1 = interface; //com.bumptech.glide.load.resource.bitmap.Downsampler$1
  JDownsampler_DecodeCallbacks = interface; //com.bumptech.glide.load.resource.bitmap.Downsampler$DecodeCallbacks
  JDownsampler = interface; //com.bumptech.glide.load.resource.bitmap.Downsampler
  JDownsampleStrategy_AtLeast = interface; //com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$AtLeast
  JDownsampleStrategy_AtMost = interface; //com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$AtMost
  JDownsampleStrategy_CenterInside = interface; //com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$CenterInside
  JDownsampleStrategy_CenterOutside = interface; //com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$CenterOutside
  JDownsampleStrategy_FitCenter = interface; //com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$FitCenter
  JDownsampleStrategy_None = interface; //com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$None
  JDownsampleStrategy_SampleSizeRounding = interface; //com.bumptech.glide.load.resource.bitmap.DownsampleStrategy$SampleSizeRounding
  JDownsampleStrategy = interface; //com.bumptech.glide.load.resource.bitmap.DownsampleStrategy
//  JDrawableToBitmapConverter_1 = interface; //com.bumptech.glide.load.resource.bitmap.DrawableToBitmapConverter$1
  JDrawableToBitmapConverter = interface; //com.bumptech.glide.load.resource.bitmap.DrawableToBitmapConverter
  JDrawableTransformation = interface; //com.bumptech.glide.load.resource.bitmap.DrawableTransformation
  JFitCenter = interface; //com.bumptech.glide.load.resource.bitmap.FitCenter
  JHardwareConfigState = interface; //com.bumptech.glide.load.resource.bitmap.HardwareConfigState
  JLazyBitmapDrawableResource = interface; //com.bumptech.glide.load.resource.bitmap.LazyBitmapDrawableResource
  JRecyclableBufferedInputStream_InvalidMarkException = interface; //com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream$InvalidMarkException
//  JRecyclableBufferedInputStream = interface; //com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream
  JResourceBitmapDecoder = interface; //com.bumptech.glide.load.resource.bitmap.ResourceBitmapDecoder
  JRoundedCorners = interface; //com.bumptech.glide.load.resource.bitmap.RoundedCorners
  JStreamBitmapDecoder_UntrustedCallbacks = interface; //com.bumptech.glide.load.resource.bitmap.StreamBitmapDecoder$UntrustedCallbacks
  JStreamBitmapDecoder = interface; //com.bumptech.glide.load.resource.bitmap.StreamBitmapDecoder
  JTransformationUtils_NoLock = interface; //com.bumptech.glide.load.resource.bitmap.TransformationUtils$NoLock
  JTransformationUtils = interface; //com.bumptech.glide.load.resource.bitmap.TransformationUtils
  JUnitBitmapDecoder_NonOwnedBitmapResource = interface; //com.bumptech.glide.load.resource.bitmap.UnitBitmapDecoder$NonOwnedBitmapResource
  JUnitBitmapDecoder = interface; //com.bumptech.glide.load.resource.bitmap.UnitBitmapDecoder
  JVideoBitmapDecoder = interface; //com.bumptech.glide.load.resource.bitmap.VideoBitmapDecoder
//  JVideoDecoder_1 = interface; //com.bumptech.glide.load.resource.bitmap.VideoDecoder$1
//  JVideoDecoder_2 = interface; //com.bumptech.glide.load.resource.bitmap.VideoDecoder$2
  JVideoDecoder_AssetFileDescriptorInitializer = interface; //com.bumptech.glide.load.resource.bitmap.VideoDecoder$AssetFileDescriptorInitializer
  JVideoDecoder_MediaMetadataRetrieverFactory = interface; //com.bumptech.glide.load.resource.bitmap.VideoDecoder$MediaMetadataRetrieverFactory
  JVideoDecoder_MediaMetadataRetrieverInitializer = interface; //com.bumptech.glide.load.resource.bitmap.VideoDecoder$MediaMetadataRetrieverInitializer
  JVideoDecoder_ParcelFileDescriptorInitializer = interface; //com.bumptech.glide.load.resource.bitmap.VideoDecoder$ParcelFileDescriptorInitializer
  JVideoDecoder = interface; //com.bumptech.glide.load.resource.bitmap.VideoDecoder
  JByteBufferRewinder_Factory = interface; //com.bumptech.glide.load.resource.bytes.ByteBufferRewinder$Factory
  JByteBufferRewinder = interface; //com.bumptech.glide.load.resource.bytes.ByteBufferRewinder
  JBytesResource = interface; //com.bumptech.glide.load.resource.bytes.BytesResource
  JDrawableDecoderCompat = interface; //com.bumptech.glide.load.resource.drawable.DrawableDecoderCompat
  JDrawableResource = interface; //com.bumptech.glide.load.resource.drawable.DrawableResource
  JDrawableTransitionOptions = interface; //com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
  JNonOwnedDrawableResource = interface; //com.bumptech.glide.load.resource.drawable.NonOwnedDrawableResource
  JResourceDrawableDecoder = interface; //com.bumptech.glide.load.resource.drawable.ResourceDrawableDecoder
  JUnitDrawableDecoder = interface; //com.bumptech.glide.load.resource.drawable.UnitDrawableDecoder
  JFileDecoder = interface; //com.bumptech.glide.load.resource.file.FileDecoder
  JFileResource = interface; //com.bumptech.glide.load.resource.file.FileResource
  JByteBufferGifDecoder_GifDecoderFactory = interface; //com.bumptech.glide.load.resource.gif.ByteBufferGifDecoder$GifDecoderFactory
  JByteBufferGifDecoder_GifHeaderParserPool = interface; //com.bumptech.glide.load.resource.gif.ByteBufferGifDecoder$GifHeaderParserPool
  JByteBufferGifDecoder = interface; //com.bumptech.glide.load.resource.gif.ByteBufferGifDecoder
  JGifBitmapProvider = interface; //com.bumptech.glide.load.resource.gif.GifBitmapProvider
  JGifDrawable_GifState = interface; //com.bumptech.glide.load.resource.gif.GifDrawable$GifState
  JGifDrawable = interface; //com.bumptech.glide.load.resource.gif.GifDrawable
  JGifDrawableEncoder = interface; //com.bumptech.glide.load.resource.gif.GifDrawableEncoder
  JGifDrawableResource = interface; //com.bumptech.glide.load.resource.gif.GifDrawableResource
  JGifDrawableTransformation = interface; //com.bumptech.glide.load.resource.gif.GifDrawableTransformation
  JGifFrameLoader_DelayTarget = interface; //com.bumptech.glide.load.resource.gif.GifFrameLoader$DelayTarget
  JGifFrameLoader_FrameCallback = interface; //com.bumptech.glide.load.resource.gif.GifFrameLoader$FrameCallback
  JGifFrameLoader_FrameLoaderCallback = interface; //com.bumptech.glide.load.resource.gif.GifFrameLoader$FrameLoaderCallback
  JGifFrameLoader_OnEveryFrameListener = interface; //com.bumptech.glide.load.resource.gif.GifFrameLoader$OnEveryFrameListener
  JGifFrameLoader = interface; //com.bumptech.glide.load.resource.gif.GifFrameLoader
  JGifFrameResourceDecoder = interface; //com.bumptech.glide.load.resource.gif.GifFrameResourceDecoder
  JGifOptions = interface; //com.bumptech.glide.load.resource.gif.GifOptions
  JStreamGifDecoder = interface; //com.bumptech.glide.load.resource.gif.StreamGifDecoder
  JSimpleResource = interface; //com.bumptech.glide.load.resource.SimpleResource
  JBitmapBytesTranscoder = interface; //com.bumptech.glide.load.resource.transcode.BitmapBytesTranscoder
  JBitmapDrawableTranscoder = interface; //com.bumptech.glide.load.resource.transcode.BitmapDrawableTranscoder
  JDrawableBytesTranscoder = interface; //com.bumptech.glide.load.resource.transcode.DrawableBytesTranscoder
  JGifDrawableBytesTranscoder = interface; //com.bumptech.glide.load.resource.transcode.GifDrawableBytesTranscoder
  JResourceTranscoder = interface; //com.bumptech.glide.load.resource.transcode.ResourceTranscoder
  JTranscoderRegistry_Entry = interface; //com.bumptech.glide.load.resource.transcode.TranscoderRegistry$Entry
  JTranscoderRegistry = interface; //com.bumptech.glide.load.resource.transcode.TranscoderRegistry
  JUnitTranscoder = interface; //com.bumptech.glide.load.resource.transcode.UnitTranscoder
  JUnitTransformation = interface; //com.bumptech.glide.load.resource.UnitTransformation
  JResourceDecoder = interface; //com.bumptech.glide.load.ResourceDecoder
  JResourceEncoder = interface; //com.bumptech.glide.load.ResourceEncoder
  JTransformation = interface; //com.bumptech.glide.load.Transformation
  JActivityFragmentLifecycle = interface; //com.bumptech.glide.manager.ActivityFragmentLifecycle
  JApplicationLifecycle = interface; //com.bumptech.glide.manager.ApplicationLifecycle
  JConnectivityMonitor_ConnectivityListener = interface; //com.bumptech.glide.manager.ConnectivityMonitor$ConnectivityListener
  JConnectivityMonitor = interface; //com.bumptech.glide.manager.ConnectivityMonitor
  JConnectivityMonitorFactory = interface; //com.bumptech.glide.manager.ConnectivityMonitorFactory
//  JDefaultConnectivityMonitor_1 = interface; //com.bumptech.glide.manager.DefaultConnectivityMonitor$1
  JDefaultConnectivityMonitor = interface; //com.bumptech.glide.manager.DefaultConnectivityMonitor
  JDefaultConnectivityMonitorFactory = interface; //com.bumptech.glide.manager.DefaultConnectivityMonitorFactory
  JEmptyRequestManagerTreeNode = interface; //com.bumptech.glide.manager.EmptyRequestManagerTreeNode
  JLifecycle = interface; //com.bumptech.glide.manager.Lifecycle
  JLifecycleListener = interface; //com.bumptech.glide.manager.LifecycleListener
  JNullConnectivityMonitor = interface; //com.bumptech.glide.manager.NullConnectivityMonitor
  JRequestManagerFragment_FragmentRequestManagerTreeNode = interface; //com.bumptech.glide.manager.RequestManagerFragment$FragmentRequestManagerTreeNode
  JRequestManagerFragment = interface; //com.bumptech.glide.manager.RequestManagerFragment
//  JRequestManagerRetriever_1 = interface; //com.bumptech.glide.manager.RequestManagerRetriever$1
  JRequestManagerRetriever_RequestManagerFactory = interface; //com.bumptech.glide.manager.RequestManagerRetriever$RequestManagerFactory
  JRequestManagerRetriever = interface; //com.bumptech.glide.manager.RequestManagerRetriever
  JRequestManagerTreeNode = interface; //com.bumptech.glide.manager.RequestManagerTreeNode
  JRequestTracker = interface; //com.bumptech.glide.manager.RequestTracker
  JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNode = interface; //com.bumptech.glide.manager.SupportRequestManagerFragment$SupportFragmentRequestManagerTreeNode
  JSupportRequestManagerFragment = interface; //com.bumptech.glide.manager.SupportRequestManagerFragment
  JTargetTracker = interface; //com.bumptech.glide.manager.TargetTracker
  JMemoryCategory = interface; //com.bumptech.glide.MemoryCategory
  JModelTypes = interface; //com.bumptech.glide.ModelTypes
  JAppGlideModule = interface; //com.bumptech.glide.module.AppGlideModule
  JAppliesOptions = interface; //com.bumptech.glide.module.AppliesOptions
  JGlideModule = interface; //com.bumptech.glide.module.GlideModule
  JLibraryGlideModule = interface; //com.bumptech.glide.module.LibraryGlideModule
  JManifestParser = interface; //com.bumptech.glide.module.ManifestParser
  JRegistersComponents = interface; //com.bumptech.glide.module.RegistersComponents
  JPriority = interface; //com.bumptech.glide.Priority
  JEncoderRegistry_Entry = interface; //com.bumptech.glide.provider.EncoderRegistry$Entry
  JEncoderRegistry = interface; //com.bumptech.glide.provider.EncoderRegistry
  JImageHeaderParserRegistry = interface; //com.bumptech.glide.provider.ImageHeaderParserRegistry
  JLoadPathCache = interface; //com.bumptech.glide.provider.LoadPathCache
  JModelToResourceClassCache = interface; //com.bumptech.glide.provider.ModelToResourceClassCache
  JResourceDecoderRegistry_Entry = interface; //com.bumptech.glide.provider.ResourceDecoderRegistry$Entry
  JResourceDecoderRegistry = interface; //com.bumptech.glide.provider.ResourceDecoderRegistry
  JResourceEncoderRegistry_Entry = interface; //com.bumptech.glide.provider.ResourceEncoderRegistry$Entry
  JResourceEncoderRegistry = interface; //com.bumptech.glide.provider.ResourceEncoderRegistry
  JRegistry_MissingComponentException = interface; //com.bumptech.glide.Registry$MissingComponentException
  JRegistry_NoImageHeaderParserException = interface; //com.bumptech.glide.Registry$NoImageHeaderParserException
  JRegistry_NoModelLoaderAvailableException = interface; //com.bumptech.glide.Registry$NoModelLoaderAvailableException
  JRegistry_NoResultEncoderAvailableException = interface; //com.bumptech.glide.Registry$NoResultEncoderAvailableException
  JRegistry_NoSourceEncoderAvailableException = interface; //com.bumptech.glide.Registry$NoSourceEncoderAvailableException
  JRegistry = interface; //com.bumptech.glide.Registry
  JErrorRequestCoordinator = interface; //com.bumptech.glide.request.ErrorRequestCoordinator
  JFutureTarget = interface; //com.bumptech.glide.request.FutureTarget
  JRequest = interface; //com.bumptech.glide.request.Request
  JRequestCoordinator = interface; //com.bumptech.glide.request.RequestCoordinator
  JRequestFutureTarget_Waiter = interface; //com.bumptech.glide.request.RequestFutureTarget$Waiter
  JRequestFutureTarget = interface; //com.bumptech.glide.request.RequestFutureTarget
  JRequestListener = interface; //com.bumptech.glide.request.RequestListener
  JRequestOptions = interface; //com.bumptech.glide.request.RequestOptions
  JResourceCallback = interface; //com.bumptech.glide.request.ResourceCallback
//  JSingleRequest_1 = interface; //com.bumptech.glide.request.SingleRequest$1
  JSingleRequest_Status = interface; //com.bumptech.glide.request.SingleRequest$Status
  JSingleRequest = interface; //com.bumptech.glide.request.SingleRequest
  JAppWidgetTarget = interface; //com.bumptech.glide.request.target.AppWidgetTarget
  JBaseTarget = interface; //com.bumptech.glide.request.target.BaseTarget
  JBitmapImageViewTarget = interface; //com.bumptech.glide.request.target.BitmapImageViewTarget
  JBitmapThumbnailImageViewTarget = interface; //com.bumptech.glide.request.target.BitmapThumbnailImageViewTarget
  JDrawableImageViewTarget = interface; //com.bumptech.glide.request.target.DrawableImageViewTarget
  JDrawableThumbnailImageViewTarget = interface; //com.bumptech.glide.request.target.DrawableThumbnailImageViewTarget
  JFixedSizeDrawable_State = interface; //com.bumptech.glide.request.target.FixedSizeDrawable$State
  JFixedSizeDrawable = interface; //com.bumptech.glide.request.target.FixedSizeDrawable
  JImageViewTarget = interface; //com.bumptech.glide.request.target.ImageViewTarget
  JImageViewTargetFactory = interface; //com.bumptech.glide.request.target.ImageViewTargetFactory
  JNotificationTarget = interface; //com.bumptech.glide.request.target.NotificationTarget
//  JPreloadTarget_1 = interface; //com.bumptech.glide.request.target.PreloadTarget$1
  JPreloadTarget = interface; //com.bumptech.glide.request.target.PreloadTarget
  JSimpleTarget = interface; //com.bumptech.glide.request.target.SimpleTarget
  JSizeReadyCallback = interface; //com.bumptech.glide.request.target.SizeReadyCallback
  JTarget = interface; //com.bumptech.glide.request.target.Target
  JThumbnailImageViewTarget = interface; //com.bumptech.glide.request.target.ThumbnailImageViewTarget
//  JViewTarget_1 = interface; //com.bumptech.glide.request.target.ViewTarget$1
  JViewTarget_SizeDeterminer_SizeDeterminerLayoutListener = interface; //com.bumptech.glide.request.target.ViewTarget$SizeDeterminer$SizeDeterminerLayoutListener
  JViewTarget_SizeDeterminer = interface; //com.bumptech.glide.request.target.ViewTarget$SizeDeterminer
  JViewTarget = interface; //com.bumptech.glide.request.target.ViewTarget
  JThumbnailRequestCoordinator = interface; //com.bumptech.glide.request.ThumbnailRequestCoordinator
  JBitmapContainerTransitionFactory_BitmapGlideAnimation = interface; //com.bumptech.glide.request.transition.BitmapContainerTransitionFactory$BitmapGlideAnimation
  JBitmapContainerTransitionFactory = interface; //com.bumptech.glide.request.transition.BitmapContainerTransitionFactory
  JBitmapTransitionFactory = interface; //com.bumptech.glide.request.transition.BitmapTransitionFactory
  JDrawableCrossFadeFactory_Builder = interface; //com.bumptech.glide.request.transition.DrawableCrossFadeFactory$Builder
  JDrawableCrossFadeFactory = interface; //com.bumptech.glide.request.transition.DrawableCrossFadeFactory
  JDrawableCrossFadeTransition = interface; //com.bumptech.glide.request.transition.DrawableCrossFadeTransition
  JNoTransition_NoAnimationFactory = interface; //com.bumptech.glide.request.transition.NoTransition$NoAnimationFactory
  JNoTransition = interface; //com.bumptech.glide.request.transition.NoTransition
  JTransition_ViewAdapter = interface; //com.bumptech.glide.request.transition.Transition$ViewAdapter
  JTransition = interface; //com.bumptech.glide.request.transition.Transition
  JTransitionFactory = interface; //com.bumptech.glide.request.transition.TransitionFactory
  JViewAnimationFactory_ConcreteViewTransitionAnimationFactory = interface; //com.bumptech.glide.request.transition.ViewAnimationFactory$ConcreteViewTransitionAnimationFactory
  JViewAnimationFactory_ResourceViewTransitionAnimationFactory = interface; //com.bumptech.glide.request.transition.ViewAnimationFactory$ResourceViewTransitionAnimationFactory
  JViewAnimationFactory = interface; //com.bumptech.glide.request.transition.ViewAnimationFactory
  JViewPropertyAnimationFactory = interface; //com.bumptech.glide.request.transition.ViewPropertyAnimationFactory
  JViewPropertyTransition_Animator = interface; //com.bumptech.glide.request.transition.ViewPropertyTransition$Animator
  JViewPropertyTransition = interface; //com.bumptech.glide.request.transition.ViewPropertyTransition
  JViewTransition_ViewTransitionAnimationFactory = interface; //com.bumptech.glide.request.transition.ViewTransition$ViewTransitionAnimationFactory
  JViewTransition = interface; //com.bumptech.glide.request.transition.ViewTransition
//  JRequestBuilder_1 = interface; //com.bumptech.glide.RequestBuilder$1
//  JRequestBuilder_2 = interface; //com.bumptech.glide.RequestBuilder$2
  JRequestBuilder = interface; //com.bumptech.glide.RequestBuilder
//  JRequestManager_1 = interface; //com.bumptech.glide.RequestManager$1
//  JRequestManager_2 = interface; //com.bumptech.glide.RequestManager$2
  JRequestManager_ClearTarget = interface; //com.bumptech.glide.RequestManager$ClearTarget
  JRequestManager_RequestManagerConnectivityListener = interface; //com.bumptech.glide.RequestManager$RequestManagerConnectivityListener
  JRequestManager = interface; //com.bumptech.glide.RequestManager
  JApplicationVersionSignature = interface; //com.bumptech.glide.signature.ApplicationVersionSignature
  JEmptySignature = interface; //com.bumptech.glide.signature.EmptySignature
  JMediaStoreSignature = interface; //com.bumptech.glide.signature.MediaStoreSignature
  JObjectKey = interface; //com.bumptech.glide.signature.ObjectKey
  JTransitionOptions = interface; //com.bumptech.glide.TransitionOptions
  JByteBufferUtil_ByteBufferStream = interface; //com.bumptech.glide.util.ByteBufferUtil$ByteBufferStream
  JByteBufferUtil_SafeArray = interface; //com.bumptech.glide.util.ByteBufferUtil$SafeArray
  JByteBufferUtil = interface; //com.bumptech.glide.util.ByteBufferUtil
//  JCachedHashCodeArrayMap = interface; //com.bumptech.glide.util.CachedHashCodeArrayMap
//  JContentLengthInputStream = interface; //com.bumptech.glide.util.ContentLengthInputStream
  JExceptionCatchingInputStream = interface; //com.bumptech.glide.util.ExceptionCatchingInputStream
  JFixedPreloadSizeProvider = interface; //com.bumptech.glide.util.FixedPreloadSizeProvider
  JLogTime = interface; //com.bumptech.glide.util.LogTime
  JLruCache = interface; //com.bumptech.glide.util.LruCache
//  JMarkEnforcingInputStream = interface; //com.bumptech.glide.util.MarkEnforcingInputStream
  JMultiClassKey = interface; //com.bumptech.glide.util.MultiClassKey
//  JFactoryPools_1 = interface; //com.bumptech.glide.util.pool.FactoryPools$1
//  JFactoryPools_2 = interface; //com.bumptech.glide.util.pool.FactoryPools$2
//  JFactoryPools_3 = interface; //com.bumptech.glide.util.pool.FactoryPools$3
  JFactoryPools_Factory = interface; //com.bumptech.glide.util.pool.FactoryPools$Factory
  JFactoryPools_FactoryPool = interface; //com.bumptech.glide.util.pool.FactoryPools$FactoryPool
  JFactoryPools_Poolable = interface; //com.bumptech.glide.util.pool.FactoryPools$Poolable
  JFactoryPools_Resetter = interface; //com.bumptech.glide.util.pool.FactoryPools$Resetter
  JFactoryPools = interface; //com.bumptech.glide.util.pool.FactoryPools
  JGlideTrace = interface; //com.bumptech.glide.util.pool.GlideTrace
//  JStateVerifier_1 = interface; //com.bumptech.glide.util.pool.StateVerifier$1
  JStateVerifier_DebugStateVerifier = interface; //com.bumptech.glide.util.pool.StateVerifier$DebugStateVerifier
  JStateVerifier_DefaultStateVerifier = interface; //com.bumptech.glide.util.pool.StateVerifier$DefaultStateVerifier
  JStateVerifier = interface; //com.bumptech.glide.util.pool.StateVerifier
  JPreconditions = interface; //com.bumptech.glide.util.Preconditions
  JSynthetic = interface; //com.bumptech.glide.util.Synthetic
//  JUtil_1 = interface; //com.bumptech.glide.util.Util$1
  JUtil = interface; //com.bumptech.glide.util.Util
  JViewPreloadSizeProvider_SizeViewTarget = interface; //com.bumptech.glide.util.ViewPreloadSizeProvider$SizeViewTarget
  JViewPreloadSizeProvider = interface; //com.bumptech.glide.util.ViewPreloadSizeProvider

// ===== Forward SuperClasses declarations =====



  JBuildConfigClass = interface(JObjectClass)
  ['{F96887C4-4B36-4B44-9F8B-CACA0DA7DD4E}']
    { static Property Methods }
    {class} function _GetDEBUG: Boolean;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Z
    {class} function _GetAPPLICATION_ID: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUILD_TYPE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetFLAVOR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetVERSION_CODE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetVERSION_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JBuildConfig; cdecl; //()V

    { static Property }
    {class} property DEBUG: Boolean read _GetDEBUG;
    {class} property APPLICATION_ID: JString read _GetAPPLICATION_ID;
    {class} property BUILD_TYPE: JString read _GetBUILD_TYPE;
    {class} property FLAVOR: JString read _GetFLAVOR;
    {class} property VERSION_CODE: Integer read _GetVERSION_CODE;
    {class} property VERSION_NAME: JString read _GetVERSION_NAME;
  end;

  [JavaSignature('com/bumptech/glide/BuildConfig')]
  JBuildConfig = interface(JObject)
  ['{873F622E-3E06-4C09-949B-6DF22C87A7A9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBuildConfig = class(TJavaGenericImport<JBuildConfigClass, JBuildConfig>) end;

  JLibraryGlideModuleClass = interface(JObjectClass)
  ['{3D2F8E53-A57E-4D26-88D7-3FDCB4938617}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLibraryGlideModule; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/LibraryGlideModule')]
  JLibraryGlideModule = interface(JObject)
  ['{40EA3EB5-E49A-4928-8418-B848ED678071}']
    { Property Methods }

    { methods }
    procedure registerComponents(context: JContext; glide: JGlide; registry: JRegistry); cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/Registry;)V

    { Property }
  end;

  TJLibraryGlideModule = class(TJavaGenericImport<JLibraryGlideModuleClass, JLibraryGlideModule>) end;

  JAppGlideModuleClass = interface(JLibraryGlideModuleClass) // or JObjectClass // SuperSignature: com/bumptech/glide/module/LibraryGlideModule
  ['{42121904-4E5A-48A8-9E68-249859F15A90}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAppGlideModule; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/AppGlideModule')]
  JAppGlideModule = interface(JLibraryGlideModule) // or JObject // SuperSignature: com/bumptech/glide/module/LibraryGlideModule
  ['{0C36AEA2-E39B-4B0C-98FE-9F7607454D0A}']
    { Property Methods }

    { methods }
    function isManifestParsingEnabled: Boolean; cdecl; //()Z
    procedure applyOptions(context: JContext; builder: JGlideBuilder); cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V

    { Property }
  end;

  TJAppGlideModule = class(TJavaGenericImport<JAppGlideModuleClass, JAppGlideModule>) end;

  JGeneratedAppGlideModuleClass = interface(JAppGlideModuleClass) // or JObjectClass // SuperSignature: com/bumptech/glide/module/AppGlideModule
  ['{66F9C4B0-72CD-45F9-8F2D-643ED646DD9F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GeneratedAppGlideModule')]
  JGeneratedAppGlideModule = interface(JAppGlideModule) // or JObject // SuperSignature: com/bumptech/glide/module/AppGlideModule
  ['{E2A76A21-E588-4257-B42E-75C778E23D39}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGeneratedAppGlideModule = class(TJavaGenericImport<JGeneratedAppGlideModuleClass, JGeneratedAppGlideModule>) end;

  JTransitionOptionsClass = interface(JObjectClass)
  ['{9E02704D-8BBC-48F2-B7FB-0846733FAE71}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTransitionOptions; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/TransitionOptions')]
  JTransitionOptions = interface(JObject)
  ['{B8DC727A-1A9F-43E7-A958-7C4CDC75442B}']
    { Property Methods }

    { methods }
    function dontTransition: JTransitionOptions; cdecl; //()Lcom/bumptech/glide/TransitionOptions;
    function transition(viewAnimationId: Integer): JTransitionOptions; cdecl; overload; //(I)Lcom/bumptech/glide/TransitionOptions;
    function transition(animator: JViewPropertyTransition_Animator): JTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/ViewPropertyTransition$Animator;)Lcom/bumptech/glide/TransitionOptions;
    function transition(transitionFactory: JTransitionFactory): JTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/TransitionFactory;)Lcom/bumptech/glide/TransitionOptions;
    function clone: JTransitionOptions; cdecl; overload; //()Lcom/bumptech/glide/TransitionOptions;
//    function clone: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJTransitionOptions = class(TJavaGenericImport<JTransitionOptionsClass, JTransitionOptions>) end;

  JGenericTransitionOptionsClass = interface(JTransitionOptionsClass) // or JObjectClass // SuperSignature: com/bumptech/glide/TransitionOptions
  ['{0BD2FCEB-FDE6-466C-9366-313A92C54161}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGenericTransitionOptions; cdecl; //()V
    {class} function withNoTransition: JGenericTransitionOptions; cdecl; //()Lcom/bumptech/glide/GenericTransitionOptions;
    {class} function &with(viewAnimationId: Integer): JGenericTransitionOptions; cdecl; overload; //(I)Lcom/bumptech/glide/GenericTransitionOptions;
    {class} function &with(animator: JViewPropertyTransition_Animator): JGenericTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/ViewPropertyTransition$Animator;)Lcom/bumptech/glide/GenericTransitionOptions;
    {class} function &with(transitionFactory: JTransitionFactory): JGenericTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/TransitionFactory;)Lcom/bumptech/glide/GenericTransitionOptions;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GenericTransitionOptions')]
  JGenericTransitionOptions = interface(JTransitionOptions) // or JObject // SuperSignature: com/bumptech/glide/TransitionOptions
  ['{AAC90AE5-F8B4-488D-841F-2EB8BA307961}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGenericTransitionOptions = class(TJavaGenericImport<JGenericTransitionOptionsClass, JGenericTransitionOptions>) end;

  JGlideClass = interface(JObjectClass)
  ['{5A1EEE60-D27D-4BB0-8B7B-C8A27DFB0CD8}']
    { static Property Methods }

    { static Methods }
    {class} function getPhotoCacheDir(context: JContext): JFile; cdecl; overload; //(Landroid/content/Context;)Ljava/io/File;
    {class} function getPhotoCacheDir(context: JContext; cacheName: JString): JFile; cdecl; overload; //(Landroid/content/Context;Ljava/lang/String;)Ljava/io/File;
    {class} function get(context: JContext): JGlide; cdecl; //(Landroid/content/Context;)Lcom/bumptech/glide/Glide;
    {class} procedure init(glide: JGlide); cdecl; overload; //Deprecated //(Lcom/bumptech/glide/Glide;)V
    {class} procedure init(context: JContext; builder: JGlideBuilder); cdecl; overload; //(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V
    {class} procedure tearDown; cdecl; //()V
    {class} function &with(context: JContext): JRequestManager; cdecl; overload; //(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
    {class} function &with(activity: JActivity): JRequestManager; cdecl; overload; //(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;
//    {class} function &with(activity: JFragmentActivity): JRequestManager; cdecl; overload; //(Landroid/support/v4/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;
    {class} function &with(fragment: JFragment): JRequestManager; cdecl; overload; //(Landroid/support/v4/app/Fragment;)Lcom/bumptech/glide/RequestManager;
//    {class} function &with(fragment: JFragment): JRequestManager; cdecl; overload; //Deprecated //(Landroid/app/Fragment;)Lcom/bumptech/glide/RequestManager;
    {class} function &with(view: JView): JRequestManager; cdecl; overload; //(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Glide')]
  JGlide = interface(JObject)
  ['{EDC9E420-F58B-4E3B-889D-0CC5EB26CB84}']
    { Property Methods }

    { methods }
    function getBitmapPool: JBitmapPool; cdecl; //()Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;
    function getArrayPool: JArrayPool; cdecl; //()Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;
    function getContext: JContext; cdecl; //()Landroid/content/Context;
    procedure preFillBitmapPool(bitmapAttributeBuilders: TJavaObjectArray<JPreFillType_Builder>); cdecl; //([Lcom/bumptech/glide/load/engine/prefill/PreFillType$Builder;)V
    procedure clearMemory; cdecl; //()V
    procedure trimMemory(level: Integer); cdecl; //(I)V
    procedure clearDiskCache; cdecl; //()V
    function getRequestManagerRetriever: JRequestManagerRetriever; cdecl; //()Lcom/bumptech/glide/manager/RequestManagerRetriever;
    function setMemoryCategory(memoryCategory: JMemoryCategory): JMemoryCategory; cdecl; //(Lcom/bumptech/glide/MemoryCategory;)Lcom/bumptech/glide/MemoryCategory;
    function getRegistry: JRegistry; cdecl; //()Lcom/bumptech/glide/Registry;
    procedure onTrimMemory(level: Integer); cdecl; //(I)V
    procedure onConfigurationChanged(newConfig: JConfiguration); cdecl; //(Landroid/content/res/Configuration;)V
    procedure onLowMemory; cdecl; //()V

    { Property }
  end;

  TJGlide = class(TJavaGenericImport<JGlideClass, JGlide>) end;

  JGlideBuilderClass = interface(JObjectClass)
  ['{915C0CA3-CFE1-4AFD-B1DD-4A6913EF9B33}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGlideBuilder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GlideBuilder')]
  JGlideBuilder = interface(JObject)
  ['{B163E8AD-19EA-4DFA-B05B-F4FDF91063E3}']
    { Property Methods }

    { methods }
    function setBitmapPool(bitmapPool: JBitmapPool): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Lcom/bumptech/glide/GlideBuilder;
    function setArrayPool(arrayPool: JArrayPool): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)Lcom/bumptech/glide/GlideBuilder;
    function setMemoryCache(memoryCache: JMemoryCache): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/load/engine/cache/MemoryCache;)Lcom/bumptech/glide/GlideBuilder;
    function setDiskCache(diskCacheFactory: JDiskCache_Factory): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;)Lcom/bumptech/glide/GlideBuilder;
    function setResizeExecutor(service: JGlideExecutor): JGlideBuilder; cdecl; //Deprecated //(Lcom/bumptech/glide/load/engine/executor/GlideExecutor;)Lcom/bumptech/glide/GlideBuilder;
    function setSourceExecutor(service: JGlideExecutor): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/load/engine/executor/GlideExecutor;)Lcom/bumptech/glide/GlideBuilder;
    function setDiskCacheExecutor(service: JGlideExecutor): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/load/engine/executor/GlideExecutor;)Lcom/bumptech/glide/GlideBuilder;
    function setAnimationExecutor(service: JGlideExecutor): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/load/engine/executor/GlideExecutor;)Lcom/bumptech/glide/GlideBuilder;
    function setDefaultRequestOptions(requestOptions: JRequestOptions): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/GlideBuilder;
    function setDefaultTransitionOptions(clazz: Jlang_Class; P2: JTransitionOptions): JGlideBuilder; cdecl; //(Ljava/lang/Class;Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/GlideBuilder;
    function setMemorySizeCalculator(builder: JMemorySizeCalculator_Builder): JGlideBuilder; cdecl; overload; //(Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;)Lcom/bumptech/glide/GlideBuilder;
    function setMemorySizeCalculator(calculator: JMemorySizeCalculator): JGlideBuilder; cdecl; overload; //(Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;)Lcom/bumptech/glide/GlideBuilder;
    function setConnectivityMonitorFactory(factory: JConnectivityMonitorFactory): JGlideBuilder; cdecl; //(Lcom/bumptech/glide/manager/ConnectivityMonitorFactory;)Lcom/bumptech/glide/GlideBuilder;
    function setLogLevel(logLevel: Integer): JGlideBuilder; cdecl; //(I)Lcom/bumptech/glide/GlideBuilder;
    function setIsActiveResourceRetentionAllowed(isActiveResourceRetentionAllowed: Boolean): JGlideBuilder; cdecl; //(Z)Lcom/bumptech/glide/GlideBuilder;

    { Property }
  end;

  TJGlideBuilder = class(TJavaGenericImport<JGlideBuilderClass, JGlideBuilder>) end;

  JGlideContextClass = interface(JContextWrapperClass) // or JObjectClass // SuperSignature: android/content/ContextWrapper
  ['{BD6BE82D-7E74-4223-9EB0-E76FF63C50FA}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; arrayPool: JArrayPool; registry: JRegistry; imageViewTargetFactory: JImageViewTargetFactory; defaultRequestOptions: JRequestOptions; defaultTransitionOptions: JMap; P7: JEngine; logLevel: Integer): JGlideContext; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;Lcom/bumptech/glide/Registry;Lcom/bumptech/glide/request/target/ImageViewTargetFactory;Lcom/bumptech/glide/request/RequestOptions;Ljava/util/Map;Lcom/bumptech/glide/load/engine/Engine;I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GlideContext')]
  JGlideContext = interface(JContextWrapper) // or JObject // SuperSignature: android/content/ContextWrapper
  ['{86BBE293-02D9-4149-B701-FF3BAA14D7F4}']
    { Property Methods }

    { methods }
    function getDefaultRequestOptions: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function getDefaultTransitionOptions(transcodeClass: Jlang_Class): JTransitionOptions; cdecl; //(Ljava/lang/Class;)Lcom/bumptech/glide/TransitionOptions;
    function buildImageViewTarget(imageView: JImageView; transcodeClass: Jlang_Class): JViewTarget; cdecl; //(Landroid/widget/ImageView;Ljava/lang/Class;)Lcom/bumptech/glide/request/target/ViewTarget;
    function getMainHandler: JHandler; cdecl; //()Landroid/os/Handler;
    function getEngine: JEngine; cdecl; //()Lcom/bumptech/glide/load/engine/Engine;
    function getRegistry: JRegistry; cdecl; //()Lcom/bumptech/glide/Registry;
    function getLogLevel: Integer; cdecl; //()I
    function getArrayPool: JArrayPool; cdecl; //()Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;

    { Property }
  end;

  TJGlideContext = class(TJavaGenericImport<JGlideContextClass, JGlideContext>) end;

  JListPreloader_PreloadModelProviderClass = interface(JObjectClass)
  ['{878DC186-D385-406B-9A08-651D39BA36F0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader$PreloadModelProvider')]
  JListPreloader_PreloadModelProvider = interface(IJavaInstance)
  ['{AB08B3CF-4361-4065-A467-54DC933B4C77}']
    { Property Methods }

    { methods }
    function getPreloadItems(P1: Integer): JList; cdecl; //(I)Ljava/util/List;
    function getPreloadRequestBuilder(P1: JObject): JRequestBuilder; cdecl; //(Ljava/lang/Object;)Lcom/bumptech/glide/RequestBuilder;

    { Property }
  end;

  TJListPreloader_PreloadModelProvider = class(TJavaGenericImport<JListPreloader_PreloadModelProviderClass, JListPreloader_PreloadModelProvider>) end;

  JListPreloader_PreloadSizeProviderClass = interface(JObjectClass)
  ['{14FA3AF3-D5BE-4F2E-891D-E4FB87ADC047}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader$PreloadSizeProvider')]
  JListPreloader_PreloadSizeProvider = interface(IJavaInstance)
  ['{0F24A989-0064-40C8-B7EA-02C09786EA7F}']
    { Property Methods }

    { methods }
    function getPreloadSize(P1: JObject; P2: Integer; P3: Integer): TJavaArray<Integer>; cdecl; //(Ljava/lang/Object;II)[I

    { Property }
  end;

  TJListPreloader_PreloadSizeProvider = class(TJavaGenericImport<JListPreloader_PreloadSizeProviderClass, JListPreloader_PreloadSizeProvider>) end;

  JBaseTargetClass = interface(JObjectClass)
  ['{85D6B97A-A6CB-416C-9932-D0ECB677FE99}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBaseTarget; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/BaseTarget')]
  JBaseTarget = interface(JObject)
  ['{FCEA213F-1A6C-4A7E-A169-32AEBD912816}']
    { Property Methods }

    { methods }
    procedure setRequest(request: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    function getRequest: JRequest; cdecl; //()Lcom/bumptech/glide/request/Request;
    procedure onLoadCleared(placeholder: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onLoadStarted(placeholder: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onLoadFailed(errorDrawable: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V

    { Property }
  end;

  TJBaseTarget = class(TJavaGenericImport<JBaseTargetClass, JBaseTarget>) end;

  JListPreloader_PreloadTargetClass = interface(JBaseTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/BaseTarget
  ['{4233869F-15E0-4F72-A7E6-A7C3D595D68E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader$PreloadTarget')]
  JListPreloader_PreloadTarget = interface(JBaseTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/BaseTarget
  ['{4A18CF86-89F2-4120-86C9-B5062A61AFA1}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    procedure getSize(cb: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    procedure removeCallback(cb: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V

    { Property }
  end;

  TJListPreloader_PreloadTarget = class(TJavaGenericImport<JListPreloader_PreloadTargetClass, JListPreloader_PreloadTarget>) end;

  JListPreloader_PreloadTargetQueueClass = interface(JObjectClass)
  ['{EE09EE1B-903C-443D-9123-F12C5436FE9B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader$PreloadTargetQueue')]
  JListPreloader_PreloadTargetQueue = interface(JObject)
  ['{5063963C-7714-4A8D-A8D7-D9518747D1D7}']
    { Property Methods }

    { methods }
    function next(width: Integer; height: Integer): JListPreloader_PreloadTarget; cdecl; //(II)Lcom/bumptech/glide/ListPreloader$PreloadTarget;

    { Property }
  end;

  TJListPreloader_PreloadTargetQueue = class(TJavaGenericImport<JListPreloader_PreloadTargetQueueClass, JListPreloader_PreloadTargetQueue>) end;

  JListPreloaderClass = interface(JObjectClass)
  ['{3AB64FC0-57B6-485C-A9EA-58499EDC4D67}']
    { static Property Methods }

    { static Methods }
    {class} function init(requestManager: JRequestManager; preloadModelProvider: JListPreloader_PreloadModelProvider; preloadDimensionProvider: JListPreloader_PreloadSizeProvider; maxPreload: Integer): JListPreloader; cdecl; //(Lcom/bumptech/glide/RequestManager;Lcom/bumptech/glide/ListPreloader$PreloadModelProvider;Lcom/bumptech/glide/ListPreloader$PreloadSizeProvider;I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader')]
  JListPreloader = interface(JObject)
  ['{9CC44C5B-A259-45F0-9DF1-546EA862B35F}']
    { Property Methods }

    { methods }
    procedure onScrollStateChanged(absListView: JAbsListView; scrollState: Integer); cdecl; //(Landroid/widget/AbsListView;I)V
    procedure onScroll(absListView: JAbsListView; firstVisible: Integer; visibleCount: Integer; totalCount: Integer); cdecl; //(Landroid/widget/AbsListView;III)V

    { Property }
  end;

  TJListPreloader = class(TJavaGenericImport<JListPreloaderClass, JListPreloader>) end;

  JLocalUriFetcherClass = interface(JObjectClass)
  ['{FF176BCD-EEC3-43D5-8AD7-225DE27D6904}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver; uri: Jnet_Uri): JLocalUriFetcher; cdecl; //(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/LocalUriFetcher')]
  JLocalUriFetcher = interface(JObject)
  ['{92E41EC2-CFF4-4F9E-B5DC-9A5F849408BE}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJLocalUriFetcher = class(TJavaGenericImport<JLocalUriFetcherClass, JLocalUriFetcher>) end;

  JAssetFileDescriptorLocalUriFetcherClass = interface(JLocalUriFetcherClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/data/LocalUriFetcher
  ['{F86A4D60-1CBD-4745-AFB4-AF6EE7E894FD}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver; uri: Jnet_Uri): JAssetFileDescriptorLocalUriFetcher; cdecl; //(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/AssetFileDescriptorLocalUriFetcher')]
  JAssetFileDescriptorLocalUriFetcher = interface(JLocalUriFetcher) // or JObject // SuperSignature: com/bumptech/glide/load/data/LocalUriFetcher
  ['{43C6578F-E13C-429F-83A3-E98CBC53B60E}']
    { Property Methods }

    { methods }
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJAssetFileDescriptorLocalUriFetcher = class(TJavaGenericImport<JAssetFileDescriptorLocalUriFetcherClass, JAssetFileDescriptorLocalUriFetcher>) end;

  JAssetPathFetcherClass = interface(JObjectClass)
  ['{F20D0189-B185-41D5-A6F4-4BBFDB2E2AB6}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager; assetPath: JString): JAssetPathFetcher; cdecl; //(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/AssetPathFetcher')]
  JAssetPathFetcher = interface(JObject)
  ['{DD7FEE92-8632-47F3-8C60-4481E48CF2E8}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJAssetPathFetcher = class(TJavaGenericImport<JAssetPathFetcherClass, JAssetPathFetcher>) end;

  JBufferedOutputStreamClass = interface(JOutputStreamClass) // or JObjectClass // SuperSignature: java/io/OutputStream
  ['{776723B2-C005-418D-861B-DCA94C5861F9}']
    { static Property Methods }

    { static Methods }
    {class} function init(aout: JOutputStream; arrayPool: JArrayPool): JBufferedOutputStream; cdecl; //(Ljava/io/OutputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/BufferedOutputStream')]
  JBufferedOutputStream = interface(JOutputStream) // or JObject // SuperSignature: java/io/OutputStream
  ['{56332E68-9540-4A96-9B30-0B6F3729028E}']
    { Property Methods }

    { methods }
    procedure write(b: Integer); cdecl; overload; //(I)V
    procedure write(b: TJavaArray<Byte>); cdecl; overload; //([B)V
    procedure write(b: TJavaArray<Byte>; initialOffset: Integer; length: Integer); cdecl; overload; //([BII)V
    procedure flush; cdecl; //()V
    procedure close; cdecl; //()V

    { Property }
  end;

  TJBufferedOutputStream = class(TJavaGenericImport<JBufferedOutputStreamClass, JBufferedOutputStream>) end;

  JDataFetcher_DataCallbackClass = interface(JObjectClass)
  ['{90AF3834-7471-4EAD-B74B-85E22D14683F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataFetcher$DataCallback')]
  JDataFetcher_DataCallback = interface(IJavaInstance)
  ['{300C38BF-21CD-466E-92DA-71DE7A248308}']
    { Property Methods }

    { methods }
    procedure onDataReady(P1: JObject); cdecl; //(Ljava/lang/Object;)V
    procedure onLoadFailed(P1: JException); cdecl; //(Ljava/lang/Exception;)V

    { Property }
  end;

  TJDataFetcher_DataCallback = class(TJavaGenericImport<JDataFetcher_DataCallbackClass, JDataFetcher_DataCallback>) end;

  JDataFetcherClass = interface(JObjectClass)
  ['{E2031714-EBD6-4970-A40C-466588E966D3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataFetcher')]
  JDataFetcher = interface(IJavaInstance)
  ['{B32A1204-40D9-443B-9BE5-39C30F1D32F3}']
    { Property Methods }

    { methods }
    procedure loadData(P1: JPriority; P2: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJDataFetcher = class(TJavaGenericImport<JDataFetcherClass, JDataFetcher>) end;

  JDataRewinder_FactoryClass = interface(JObjectClass)
  ['{B273F671-82E9-4108-A8C5-4D02A44BFF73}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataRewinder$Factory')]
  JDataRewinder_Factory = interface(IJavaInstance)
  ['{B0D4C984-EA50-4D16-B69D-CBDF4B479490}']
    { Property Methods }

    { methods }
    function build(P1: JObject): JDataRewinder; cdecl; //(Ljava/lang/Object;)Lcom/bumptech/glide/load/data/DataRewinder;
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJDataRewinder_Factory = class(TJavaGenericImport<JDataRewinder_FactoryClass, JDataRewinder_Factory>) end;

  JDataRewinderClass = interface(JObjectClass)
  ['{48049F69-8743-4065-937F-9EED8B5DA8FD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataRewinder')]
  JDataRewinder = interface(IJavaInstance)
  ['{80F25C44-AC24-47D1-A800-013C6FB7B219}']
    { Property Methods }

    { methods }
    function rewindAndGet: JObject; cdecl; //()Ljava/lang/Object;
    procedure cleanup; cdecl; //()V

    { Property }
  end;

  TJDataRewinder = class(TJavaGenericImport<JDataRewinderClass, JDataRewinder>) end;

  JDataRewinderRegistry_DefaultRewinderClass = interface(JObjectClass)
  ['{7687D6BA-1364-40A7-AA94-1FD008388F8C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataRewinderRegistry$DefaultRewinder')]
  JDataRewinderRegistry_DefaultRewinder = interface(JObject)
  ['{2DDE8FCB-B5F4-45B6-94B8-8C8D8F05DBF6}']
    { Property Methods }

    { methods }
    function rewindAndGet: JObject; cdecl; //()Ljava/lang/Object;
    procedure cleanup; cdecl; //()V

    { Property }
  end;

  TJDataRewinderRegistry_DefaultRewinder = class(TJavaGenericImport<JDataRewinderRegistry_DefaultRewinderClass, JDataRewinderRegistry_DefaultRewinder>) end;

  JDataRewinderRegistryClass = interface(JObjectClass)
  ['{A0F63EF8-577E-4A52-8AAA-81055A4D5DC8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataRewinderRegistry; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataRewinderRegistry')]
  JDataRewinderRegistry = interface(JObject)
  ['{93BE9E53-8B10-41B2-9D41-20F4E8D77E3D}']
    { Property Methods }

    { methods }
    procedure &register(factory: JDataRewinder_Factory); cdecl; //(Lcom/bumptech/glide/load/data/DataRewinder$Factory;)V
    function build(data: JObject): JDataRewinder; cdecl; //(Ljava/lang/Object;)Lcom/bumptech/glide/load/data/DataRewinder;

    { Property }
  end;

  TJDataRewinderRegistry = class(TJavaGenericImport<JDataRewinderRegistryClass, JDataRewinderRegistry>) end;

//  JExifOrientationStreamClass = interface(JFilterInputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterInputStream
//  ['{6DCDAB6A-87A3-4BF4-825E-4D3C80E8998C}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream; orientation: Integer): JExifOrientationStream; cdecl; //(Ljava/io/InputStream;I)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/data/ExifOrientationStream')]
//  JExifOrientationStream = interface(JFilterInputStream) // or JObject // SuperSignature: java/io/FilterInputStream
//  ['{3C875D10-23A9-4094-923A-848043B6AE03}']
//    { Property Methods }
//
//    { methods }
//    function markSupported: Boolean; cdecl; //()Z
//    procedure mark(readLimit: Integer); cdecl; //(I)V
//    function read: Integer; cdecl; overload; //()I
//    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload; //([BII)I
//    function skip(byteCount: Int64): Int64; cdecl; //(J)J
//    procedure reset; cdecl; //()V
//
//    { Property }
//  end;
//
//  TJExifOrientationStream = class(TJavaGenericImport<JExifOrientationStreamClass, JExifOrientationStream>) end;

  JFileDescriptorAssetPathFetcherClass = interface(JAssetPathFetcherClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/data/AssetPathFetcher
  ['{07019C25-E7C8-44D3-BD1D-6601D2F865E3}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager; assetPath: JString): JFileDescriptorAssetPathFetcher; cdecl; //(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/FileDescriptorAssetPathFetcher')]
  JFileDescriptorAssetPathFetcher = interface(JAssetPathFetcher) // or JObject // SuperSignature: com/bumptech/glide/load/data/AssetPathFetcher
  ['{64DB2A84-BC26-4648-B03B-775A82C7DB58}']
    { Property Methods }

    { methods }
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJFileDescriptorAssetPathFetcher = class(TJavaGenericImport<JFileDescriptorAssetPathFetcherClass, JFileDescriptorAssetPathFetcher>) end;

  JFileDescriptorLocalUriFetcherClass = interface(JLocalUriFetcherClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/data/LocalUriFetcher
  ['{825E1C51-EA48-45CC-A56F-A298C595D168}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver; uri: Jnet_Uri): JFileDescriptorLocalUriFetcher; cdecl; //(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/FileDescriptorLocalUriFetcher')]
  JFileDescriptorLocalUriFetcher = interface(JLocalUriFetcher) // or JObject // SuperSignature: com/bumptech/glide/load/data/LocalUriFetcher
  ['{E5CDFF65-9964-4324-8FF7-4E2F7389467C}']
    { Property Methods }

    { methods }
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJFileDescriptorLocalUriFetcher = class(TJavaGenericImport<JFileDescriptorLocalUriFetcherClass, JFileDescriptorLocalUriFetcher>) end;

  JHttpUrlFetcher_DefaultHttpUrlConnectionFactoryClass = interface(JObjectClass)
  ['{BFCF915F-7CAE-4E40-9F05-E781ED8DDE28}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/HttpUrlFetcher$DefaultHttpUrlConnectionFactory')]
  JHttpUrlFetcher_DefaultHttpUrlConnectionFactory = interface(JObject)
  ['{DBEEE293-E1C8-4F21-B312-9402DF31BEBA}']
    { Property Methods }

    { methods }
//    function build(url: JURL): JHttpURLConnection; cdecl; //(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    { Property }
  end;

  TJHttpUrlFetcher_DefaultHttpUrlConnectionFactory = class(TJavaGenericImport<JHttpUrlFetcher_DefaultHttpUrlConnectionFactoryClass, JHttpUrlFetcher_DefaultHttpUrlConnectionFactory>) end;

  JHttpUrlFetcher_HttpUrlConnectionFactoryClass = interface(JObjectClass)
  ['{B7D83816-6328-48D6-81DA-F3B0164732FD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory')]
  JHttpUrlFetcher_HttpUrlConnectionFactory = interface(IJavaInstance)
  ['{D204A512-883E-4BBC-B0F4-5DEB261D1D18}']
    { Property Methods }

    { methods }
//    function build(P1: JURL): JHttpURLConnection; cdecl; //(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    { Property }
  end;

  TJHttpUrlFetcher_HttpUrlConnectionFactory = class(TJavaGenericImport<JHttpUrlFetcher_HttpUrlConnectionFactoryClass, JHttpUrlFetcher_HttpUrlConnectionFactory>) end;

  JHttpUrlFetcherClass = interface(JObjectClass)
  ['{570C2D7B-93F5-49CD-9A35-39BB14C04CA1}']
    { static Property Methods }

    { static Methods }
    {class} function init(glideUrl: JGlideUrl; timeout: Integer): JHttpUrlFetcher; cdecl; //(Lcom/bumptech/glide/load/model/GlideUrl;I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/HttpUrlFetcher')]
  JHttpUrlFetcher = interface(JObject)
  ['{655291E0-1C09-4629-867F-A5227B29D207}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJHttpUrlFetcher = class(TJavaGenericImport<JHttpUrlFetcherClass, JHttpUrlFetcher>) end;

  JInputStreamRewinder_FactoryClass = interface(JObjectClass)
  ['{A1300599-E566-42B9-98DA-A6384CF83FE6}']
    { static Property Methods }

    { static Methods }
    {class} function init(byteArrayPool: JArrayPool): JInputStreamRewinder_Factory; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/InputStreamRewinder$Factory')]
  JInputStreamRewinder_Factory = interface(JObject)
  ['{09031E20-62EE-4904-BD2E-BB1EC0A4C7B5}']
    { Property Methods }

    { methods }
    function build(data: JInputStream): JDataRewinder; cdecl; overload; //(Ljava/io/InputStream;)Lcom/bumptech/glide/load/data/DataRewinder;
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function build(this: JObject): JDataRewinder; cdecl; overload; //(Ljava/lang/Object;)Lcom/bumptech/glide/load/data/DataRewinder;

    { Property }
  end;

  TJInputStreamRewinder_Factory = class(TJavaGenericImport<JInputStreamRewinder_FactoryClass, JInputStreamRewinder_Factory>) end;

  JInputStreamRewinderClass = interface(JObjectClass)
  ['{4B8C68FF-0C83-4715-B591-8988F5C0B2CF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/InputStreamRewinder')]
  JInputStreamRewinder = interface(JObject)
  ['{C832879F-C727-46AC-BDAA-A6D2BA859D23}']
    { Property Methods }

    { methods }
    function rewindAndGet: JInputStream; cdecl; overload; //()Ljava/io/InputStream;
    procedure cleanup; cdecl; //()V
//    function rewindAndGet: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJInputStreamRewinder = class(TJavaGenericImport<JInputStreamRewinderClass, JInputStreamRewinder>) end;

  JFileServiceClass = interface(JObjectClass)
  ['{A5CFA216-0B28-40E1-9D95-4099286F2446}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/FileService')]
  JFileService = interface(JObject)
  ['{9D8A156D-E979-4D24-AF10-68E2369AEE01}']
    { Property Methods }

    { methods }
    function exists(afile: JFile): Boolean; cdecl; //(Ljava/io/File;)Z
    function length(afile: JFile): Int64; cdecl; //(Ljava/io/File;)J
    function get(path: JString): JFile; cdecl; //(Ljava/lang/String;)Ljava/io/File;

    { Property }
  end;

  TJFileService = class(TJavaGenericImport<JFileServiceClass, JFileService>) end;

  JMediaStoreUtilClass = interface(JObjectClass)
  ['{0A44C3AB-DBEE-42D8-A32D-7E5E163362E3}']
    { static Property Methods }

    { static Methods }
    {class} function isMediaStoreUri(uri: Jnet_Uri): Boolean; cdecl; //(Landroid/net/Uri;)Z
    {class} function isMediaStoreVideoUri(uri: Jnet_Uri): Boolean; cdecl; //(Landroid/net/Uri;)Z
    {class} function isMediaStoreImageUri(uri: Jnet_Uri): Boolean; cdecl; //(Landroid/net/Uri;)Z
    {class} function isThumbnailSize(width: Integer; height: Integer): Boolean; cdecl; //(II)Z

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/MediaStoreUtil')]
  JMediaStoreUtil = interface(JObject)
  ['{A9852AA9-AF87-42F1-BFDE-E50CEE4CCD22}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMediaStoreUtil = class(TJavaGenericImport<JMediaStoreUtilClass, JMediaStoreUtil>) end;

  JThumbFetcher_ImageThumbnailQueryClass = interface(JObjectClass)
  ['{FB741679-61E9-47CA-8250-DA5DDC81DFC9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbFetcher$ImageThumbnailQuery')]
  JThumbFetcher_ImageThumbnailQuery = interface(JObject)
  ['{7EBA803A-D9BD-4CEA-BD1B-2D720873B697}']
    { Property Methods }

    { methods }
    function query(uri: Jnet_Uri): JCursor; cdecl; //(Landroid/net/Uri;)Landroid/database/Cursor;

    { Property }
  end;

  TJThumbFetcher_ImageThumbnailQuery = class(TJavaGenericImport<JThumbFetcher_ImageThumbnailQueryClass, JThumbFetcher_ImageThumbnailQuery>) end;

  JThumbFetcher_VideoThumbnailQueryClass = interface(JObjectClass)
  ['{38A5AEC6-79D1-4528-8E4D-A6A3CA70AF3A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbFetcher$VideoThumbnailQuery')]
  JThumbFetcher_VideoThumbnailQuery = interface(JObject)
  ['{EF421CC1-FDCB-4801-83B8-D01E89E142D5}']
    { Property Methods }

    { methods }
    function query(uri: Jnet_Uri): JCursor; cdecl; //(Landroid/net/Uri;)Landroid/database/Cursor;

    { Property }
  end;

  TJThumbFetcher_VideoThumbnailQuery = class(TJavaGenericImport<JThumbFetcher_VideoThumbnailQueryClass, JThumbFetcher_VideoThumbnailQuery>) end;

  JThumbFetcherClass = interface(JObjectClass)
  ['{D98882DD-1244-4239-A66B-FFBC89B9F3E7}']
    { static Property Methods }

    { static Methods }
    {class} function buildImageFetcher(context: JContext; uri: Jnet_Uri): JThumbFetcher; cdecl; //(Landroid/content/Context;Landroid/net/Uri;)Lcom/bumptech/glide/load/data/mediastore/ThumbFetcher;
    {class} function buildVideoFetcher(context: JContext; uri: Jnet_Uri): JThumbFetcher; cdecl; //(Landroid/content/Context;Landroid/net/Uri;)Lcom/bumptech/glide/load/data/mediastore/ThumbFetcher;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbFetcher')]
  JThumbFetcher = interface(JObject)
  ['{0CBA67F3-9128-4DE4-B3CC-838745CAC0B9}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJThumbFetcher = class(TJavaGenericImport<JThumbFetcherClass, JThumbFetcher>) end;

  JThumbnailQueryClass = interface(JObjectClass)
  ['{4ECB9E15-CF6F-4B3B-A87C-D7C74BDA35FA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbnailQuery')]
  JThumbnailQuery = interface(IJavaInstance)
  ['{7FF44799-C851-4611-8ECA-E5A758A5D69A}']
    { Property Methods }

    { methods }
    function query(P1: Jnet_Uri): JCursor; cdecl; //(Landroid/net/Uri;)Landroid/database/Cursor;

    { Property }
  end;

  TJThumbnailQuery = class(TJavaGenericImport<JThumbnailQueryClass, JThumbnailQuery>) end;

  JThumbnailStreamOpenerClass = interface(JObjectClass)
  ['{41FF8044-0E69-43C9-822C-6DF9874CA4B9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbnailStreamOpener')]
  JThumbnailStreamOpener = interface(JObject)
  ['{11D0FB3E-F8CE-44A7-BFC4-CB49B310AD8A}']
    { Property Methods }

    { methods }
    function open(uri: Jnet_Uri): JInputStream; cdecl; //(Landroid/net/Uri;)Ljava/io/InputStream;

    { Property }
  end;

  TJThumbnailStreamOpener = class(TJavaGenericImport<JThumbnailStreamOpenerClass, JThumbnailStreamOpener>) end;

  JStreamAssetPathFetcherClass = interface(JAssetPathFetcherClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/data/AssetPathFetcher
  ['{EFA43298-5F82-4105-9492-2386E2348455}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager; assetPath: JString): JStreamAssetPathFetcher; cdecl; //(Landroid/content/res/AssetManager;Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/StreamAssetPathFetcher')]
  JStreamAssetPathFetcher = interface(JAssetPathFetcher) // or JObject // SuperSignature: com/bumptech/glide/load/data/AssetPathFetcher
  ['{878177CE-1A5F-4F24-8F1A-874E18A50EFB}']
    { Property Methods }

    { methods }
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJStreamAssetPathFetcher = class(TJavaGenericImport<JStreamAssetPathFetcherClass, JStreamAssetPathFetcher>) end;

  JStreamLocalUriFetcherClass = interface(JLocalUriFetcherClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/data/LocalUriFetcher
  ['{9025A52F-5228-4239-9A33-9BFE43CC686B}']
    { static Property Methods }

    { static Methods }
    {class} function init(resolver: JContentResolver; uri: Jnet_Uri): JStreamLocalUriFetcher; cdecl; //(Landroid/content/ContentResolver;Landroid/net/Uri;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/StreamLocalUriFetcher')]
  JStreamLocalUriFetcher = interface(JLocalUriFetcher) // or JObject // SuperSignature: com/bumptech/glide/load/data/LocalUriFetcher
  ['{88487105-CE86-4A79-95B4-4E7D0BD13E01}']
    { Property Methods }

    { methods }
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJStreamLocalUriFetcher = class(TJavaGenericImport<JStreamLocalUriFetcherClass, JStreamLocalUriFetcher>) end;

  JDataSourceClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{4D24DBBD-05E7-4C13-845F-1A92BB38A40C}']
    { static Property Methods }
    {class} function _GetLOCAL: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DataSource;
    {class} function _GetREMOTE: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DataSource;
    {class} function _GetDATA_DISK_CACHE: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DataSource;
    {class} function _GetRESOURCE_DISK_CACHE: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DataSource;
    {class} function _GetMEMORY_CACHE: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DataSource;

    { static Methods }
    {class} function values: TJavaObjectArray<JDataSource>; cdecl; //()[Lcom/bumptech/glide/load/DataSource;
    {class} function valueOf(name: JString): JDataSource; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/load/DataSource;

    { static Property }
    {class} property LOCAL: JDataSource read _GetLOCAL;
    {class} property REMOTE: JDataSource read _GetREMOTE;
    {class} property DATA_DISK_CACHE: JDataSource read _GetDATA_DISK_CACHE;
    {class} property RESOURCE_DISK_CACHE: JDataSource read _GetRESOURCE_DISK_CACHE;
    {class} property MEMORY_CACHE: JDataSource read _GetMEMORY_CACHE;
  end;

  [JavaSignature('com/bumptech/glide/load/DataSource')]
  JDataSource = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{4761CD04-5CBE-4A02-B86D-4233116AC8ED}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataSource = class(TJavaGenericImport<JDataSourceClass, JDataSource>) end;

  JDecodeFormatClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{16F227D6-319F-4F55-AA75-A432108CC284}']
    { static Property Methods }
    {class} function _GetPREFER_ARGB_8888: JDecodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DecodeFormat;
    {class} function _GetPREFER_ARGB_8888_DISALLOW_HARDWARE: JDecodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DecodeFormat;
    {class} function _GetPREFER_RGB_565: JDecodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DecodeFormat;
    {class} function _GetDEFAULT: JDecodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/DecodeFormat;

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodeFormat>; cdecl; //()[Lcom/bumptech/glide/load/DecodeFormat;
    {class} function valueOf(name: JString): JDecodeFormat; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/load/DecodeFormat;

    { static Property }
    {class} property PREFER_ARGB_8888: JDecodeFormat read _GetPREFER_ARGB_8888;
    {class} property PREFER_ARGB_8888_DISALLOW_HARDWARE: JDecodeFormat read _GetPREFER_ARGB_8888_DISALLOW_HARDWARE;
    {class} property PREFER_RGB_565: JDecodeFormat read _GetPREFER_RGB_565;
    {class} property DEFAULT: JDecodeFormat read _GetDEFAULT;
  end;

  [JavaSignature('com/bumptech/glide/load/DecodeFormat')]
  JDecodeFormat = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{C452B36E-AA2A-4042-8C1B-2E3AA0B31B15}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeFormat = class(TJavaGenericImport<JDecodeFormatClass, JDecodeFormat>) end;

  JEncoderClass = interface(JObjectClass)
  ['{7F88F060-152A-4259-9D10-4FA73160D483}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Encoder')]
  JEncoder = interface(IJavaInstance)
  ['{474113B2-C4E7-4AEB-A200-14238EDF0516}']
    { Property Methods }

    { methods }
    function encode(P1: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; //(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJEncoder = class(TJavaGenericImport<JEncoderClass, JEncoder>) end;

  JEncodeStrategyClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{CEA7D5FD-A139-4F41-8DE8-FD100A170726}']
    { static Property Methods }
    {class} function _GetSOURCE: JEncodeStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/EncodeStrategy;
    {class} function _GetTRANSFORMED: JEncodeStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/EncodeStrategy;
    {class} function _GetNONE: JEncodeStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/EncodeStrategy;

    { static Methods }
    {class} function values: TJavaObjectArray<JEncodeStrategy>; cdecl; //()[Lcom/bumptech/glide/load/EncodeStrategy;
    {class} function valueOf(name: JString): JEncodeStrategy; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/load/EncodeStrategy;

    { static Property }
    {class} property SOURCE: JEncodeStrategy read _GetSOURCE;
    {class} property TRANSFORMED: JEncodeStrategy read _GetTRANSFORMED;
    {class} property NONE: JEncodeStrategy read _GetNONE;
  end;

  [JavaSignature('com/bumptech/glide/load/EncodeStrategy')]
  JEncodeStrategy = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{6743E787-49D8-4D89-89ED-C27352A8CBE7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncodeStrategy = class(TJavaGenericImport<JEncodeStrategyClass, JEncodeStrategy>) end;

//  JActiveResources_1Class = interface(JObjectClass)
//  ['{1B68EE1A-EB30-44D7-A93F-1FCFEAADB157}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/ActiveResources$1')]
//  JActiveResources_1 = interface(JObject)
//  ['{A87F6A61-1FBF-473B-9C1F-38F01650149A}']
//    { Property Methods }
//
//    { methods }
//    function handleMessage(msg: JMessage): Boolean; cdecl; //(Landroid/os/Message;)Z
//
//    { Property }
//  end;
//
//  TJActiveResources_1 = class(TJavaGenericImport<JActiveResources_1Class, JActiveResources_1>) end;

  JActiveResources_DequeuedResourceCallbackClass = interface(JObjectClass)
  ['{AFBB1D30-C349-4815-BBFF-18E9AB6D331E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ActiveResources$DequeuedResourceCallback')]
  JActiveResources_DequeuedResourceCallback = interface(IJavaInstance)
  ['{F6D5CCCE-57F0-4C76-B26D-E493AF6EFADB}']
    { Property Methods }

    { methods }
    procedure onResourceDequeued; cdecl; //()V

    { Property }
  end;

  TJActiveResources_DequeuedResourceCallback = class(TJavaGenericImport<JActiveResources_DequeuedResourceCallbackClass, JActiveResources_DequeuedResourceCallback>) end;

//  JActiveResources_ResourceWeakReferenceClass = interface(JWeakReferenceClass) // or JObjectClass // SuperSignature: java/lang/ref/WeakReference
//  ['{ACD379E8-23BA-4802-98CD-27B8E8F68C27}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/ActiveResources$ResourceWeakReference')]
//  JActiveResources_ResourceWeakReference = interface(JWeakReference) // or JObject // SuperSignature: java/lang/ref/WeakReference
//  ['{456A181E-9DEC-4CCB-A46D-A88CAD5E11FE}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJActiveResources_ResourceWeakReference = class(TJavaGenericImport<JActiveResources_ResourceWeakReferenceClass, JActiveResources_ResourceWeakReference>) end;

  JActiveResourcesClass = interface(JObjectClass)
  ['{37BC7F15-F29B-424D-B884-F79ADC3E62B7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ActiveResources')]
  JActiveResources = interface(JObject)
  ['{7726AF2E-EAD2-4C72-AE36-893A0EF665AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJActiveResources = class(TJavaGenericImport<JActiveResourcesClass, JActiveResources>) end;

  JArrayAdapterInterfaceClass = interface(JObjectClass)
  ['{457936C0-2F50-43D1-B3A8-A2D4AB03A4D3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/ArrayAdapterInterface')]
  JArrayAdapterInterface = interface(IJavaInstance)
  ['{CA9176F3-7D29-4515-8EE6-E60ED745FA15}']
    { Property Methods }

    { methods }
    function getTag: JString; cdecl; //()Ljava/lang/String;
    function getArrayLength(P1: JObject): Integer; cdecl; //(Ljava/lang/Object;)I
    function newArray(P1: Integer): JObject; cdecl; //(I)Ljava/lang/Object;
    function getElementSizeInBytes: Integer; cdecl; //()I

    { Property }
  end;

  TJArrayAdapterInterface = class(TJavaGenericImport<JArrayAdapterInterfaceClass, JArrayAdapterInterface>) end;

  JArrayPoolClass = interface(JObjectClass)
  ['{39EEB387-40F8-4EF0-A46E-41246AF14379}']
    { static Property Methods }
    {class} function _GetSTANDARD_BUFFER_SIZE_BYTES: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }

    { static Property }
    {class} property STANDARD_BUFFER_SIZE_BYTES: Integer read _GetSTANDARD_BUFFER_SIZE_BYTES;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/ArrayPool')]
  JArrayPool = interface(IJavaInstance)
  ['{6A9D8D98-1A76-4525-87EB-4244A9E8F407}']
    { Property Methods }

    { methods }
    procedure put(P1: JObject; P2: Jlang_Class); cdecl; overload; //Deprecated //(Ljava/lang/Object;Ljava/lang/Class;)V
    procedure put(P1: JObject); cdecl; overload; //(Ljava/lang/Object;)V
    function get(P1: Integer; P2: Jlang_Class): JObject; cdecl; //(ILjava/lang/Class;)Ljava/lang/Object;
    function getExact(P1: Integer; P2: Jlang_Class): JObject; cdecl; //(ILjava/lang/Class;)Ljava/lang/Object;
    procedure clearMemory; cdecl; //()V
    procedure trimMemory(P1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJArrayPool = class(TJavaGenericImport<JArrayPoolClass, JArrayPool>) end;

  JAttributeStrategy_KeyClass = interface(JObjectClass)
  ['{BE726FBC-B3B3-448D-92C6-495E6B44CAE5}']
    { static Property Methods }

    { static Methods }
    {class} function init(pool: JAttributeStrategy_KeyPool): JAttributeStrategy_Key; cdecl; overload; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$Key')]
  JAttributeStrategy_Key = interface(JObject)
  ['{B39270D1-7136-4FBE-89A8-EAF1AE054283}']
    { Property Methods }

    { methods }
    procedure init(width: Integer; height: Integer; config: JBitmap_Config); cdecl; overload; //(IILandroid/graphics/Bitmap$Config;)V
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;
    procedure offer; cdecl; //()V

    { Property }
  end;

  TJAttributeStrategy_Key = class(TJavaGenericImport<JAttributeStrategy_KeyClass, JAttributeStrategy_Key>) end;

  JBaseKeyPoolClass = interface(JObjectClass)
  ['{703CC543-F946-4206-97A3-6462411E54B7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool')]
  JBaseKeyPool = interface(JObject)
  ['{5539B474-E79D-45E9-A049-EB1BF713B4CE}']
    { Property Methods }

    { methods }
    procedure offer(key: JPoolable); cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/Poolable;)V

    { Property }
  end;

  TJBaseKeyPool = class(TJavaGenericImport<JBaseKeyPoolClass, JBaseKeyPool>) end;

  JAttributeStrategy_KeyPoolClass = interface(JBaseKeyPoolClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool
  ['{8361F3D0-ED30-44A0-9A6A-5A60A15EFDAF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool')]
  JAttributeStrategy_KeyPool = interface(JBaseKeyPool) // or JObject // SuperSignature: com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool
  ['{426770B4-4881-4415-9A1D-4A47B7E758B1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJAttributeStrategy_KeyPool = class(TJavaGenericImport<JAttributeStrategy_KeyPoolClass, JAttributeStrategy_KeyPool>) end;

  JAttributeStrategyClass = interface(JObjectClass)
  ['{73329AB1-FE0A-4E50-852E-D1CFB0C358FA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy')]
  JAttributeStrategy = interface(JObject)
  ['{0D2CA504-A22F-4DC0-9953-96C3CBDFA438}']
    { Property Methods }

    { methods }
    procedure put(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    function removeLast: JBitmap; cdecl; //()Landroid/graphics/Bitmap;
    function logBitmap(bitmap: JBitmap): JString; cdecl; overload; //(Landroid/graphics/Bitmap;)Ljava/lang/String;
    function logBitmap(width: Integer; height: Integer; config: JBitmap_Config): JString; cdecl; overload; //(IILandroid/graphics/Bitmap$Config;)Ljava/lang/String;
    function getSize(bitmap: JBitmap): Integer; cdecl; //(Landroid/graphics/Bitmap;)I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJAttributeStrategy = class(TJavaGenericImport<JAttributeStrategyClass, JAttributeStrategy>) end;

  JBitmapPoolClass = interface(JObjectClass)
  ['{90D383B3-9DB5-4515-8EF4-373532835FBA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/BitmapPool')]
  JBitmapPool = interface(IJavaInstance)
  ['{5398BD7B-BE0E-42B1-A0C8-BD34A7119F06}']
    { Property Methods }

    { methods }
    function getMaxSize: Int64; cdecl; //()J
    procedure setSizeMultiplier(P1: Single); cdecl; //(F)V
    procedure put(P1: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    function get(P1: Integer; P2: Integer; P3: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    function getDirty(P1: Integer; P2: Integer; P3: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    procedure clearMemory; cdecl; //()V
    procedure trimMemory(P1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJBitmapPool = class(TJavaGenericImport<JBitmapPoolClass, JBitmapPool>) end;

  JBitmapPoolAdapterClass = interface(JObjectClass)
  ['{F7348D71-7155-4B24-ADFD-80F78E87FA78}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapPoolAdapter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter')]
  JBitmapPoolAdapter = interface(JObject)
  ['{137C59E5-1F2C-4CAE-BD42-5E57F8924336}']
    { Property Methods }

    { methods }
    function getMaxSize: Int64; cdecl; //()J
    procedure setSizeMultiplier(sizeMultiplier: Single); cdecl; //(F)V
    procedure put(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    function getDirty(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    procedure clearMemory; cdecl; //()V
    procedure trimMemory(level: Integer); cdecl; //(I)V

    { Property }
  end;

  TJBitmapPoolAdapter = class(TJavaGenericImport<JBitmapPoolAdapterClass, JBitmapPoolAdapter>) end;

  JByteArrayAdapterClass = interface(JObjectClass)
  ['{508C081D-E375-4F32-A661-E09B5E46F570}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteArrayAdapter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/ByteArrayAdapter')]
  JByteArrayAdapter = interface(JObject)
  ['{09A3ADC1-503D-4F31-917B-C7D6894C8F83}']
    { Property Methods }

    { methods }
    function getTag: JString; cdecl; //()Ljava/lang/String;
    function getArrayLength(aarray: TJavaArray<Byte>): Integer; cdecl; overload; //([B)I
    function newArray(length: Integer): TJavaArray<Byte>; cdecl; overload; //(I)[B
    function getElementSizeInBytes: Integer; cdecl; //()I
//    function newArray(this: Integer): JObject; cdecl; overload; //(I)Ljava/lang/Object;
    function getArrayLength(this: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;)I

    { Property }
  end;

  TJByteArrayAdapter = class(TJavaGenericImport<JByteArrayAdapterClass, JByteArrayAdapter>) end;

  JGroupedLinkedMap_LinkedEntryClass = interface(JObjectClass)
  ['{789E1E1B-3D80-4F88-BBCF-1866D3DCDD77}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/GroupedLinkedMap$LinkedEntry')]
  JGroupedLinkedMap_LinkedEntry = interface(JObject)
  ['{07D28318-0D9B-446A-BB16-5AA55C4EC0AD}']
    { Property Methods }

    { methods }
    function removeLast: JObject; cdecl; //()Ljava/lang/Object;
    function size: Integer; cdecl; //()I
    procedure add(value: JObject); cdecl; //(Ljava/lang/Object;)V

    { Property }
  end;

  TJGroupedLinkedMap_LinkedEntry = class(TJavaGenericImport<JGroupedLinkedMap_LinkedEntryClass, JGroupedLinkedMap_LinkedEntry>) end;

  JGroupedLinkedMapClass = interface(JObjectClass)
  ['{02143AEA-436A-44CE-B94B-1E2BF83398A1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/GroupedLinkedMap')]
  JGroupedLinkedMap = interface(JObject)
  ['{0BEC1F81-45E1-4694-B7BD-4051237121FC}']
    { Property Methods }

    { methods }
    procedure put(key: JPoolable; value: JObject); cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/Poolable;Ljava/lang/Object;)V
    function get(key: JPoolable): JObject; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/Poolable;)Ljava/lang/Object;
    function removeLast: JObject; cdecl; //()Ljava/lang/Object;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJGroupedLinkedMap = class(TJavaGenericImport<JGroupedLinkedMapClass, JGroupedLinkedMap>) end;

  JIntegerArrayAdapterClass = interface(JObjectClass)
  ['{4D6B522E-DAED-469B-981B-039F907155DE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIntegerArrayAdapter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/IntegerArrayAdapter')]
  JIntegerArrayAdapter = interface(JObject)
  ['{24DC3090-5826-46F1-BB54-339224FE1CCB}']
    { Property Methods }

    { methods }
    function getTag: JString; cdecl; //()Ljava/lang/String;
    function getArrayLength(aarray: TJavaArray<Integer>): Integer; cdecl; overload; //([I)I
    function newArray(length: Integer): TJavaArray<Integer>; cdecl; overload; //(I)[I
    function getElementSizeInBytes: Integer; cdecl; //()I
//    function newArray(this: Integer): JObject; cdecl; overload; //(I)Ljava/lang/Object;
    function getArrayLength(this: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;)I

    { Property }
  end;

  TJIntegerArrayAdapter = class(TJavaGenericImport<JIntegerArrayAdapterClass, JIntegerArrayAdapter>) end;

  JLruArrayPool_KeyClass = interface(JObjectClass)
  ['{28AF5258-CAA3-49E5-A7B3-D549B832CD7F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruArrayPool$Key')]
  JLruArrayPool_Key = interface(JObject)
  ['{4791B135-6AFE-402E-8C80-F3F482237708}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function toString: JString; cdecl; //()Ljava/lang/String;
    procedure offer; cdecl; //()V
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJLruArrayPool_Key = class(TJavaGenericImport<JLruArrayPool_KeyClass, JLruArrayPool_Key>) end;

  JLruArrayPool_KeyPoolClass = interface(JBaseKeyPoolClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool
  ['{E5DCB4E1-9DE0-4A02-BCBA-1173D4CCBD4E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruArrayPool$KeyPool')]
  JLruArrayPool_KeyPool = interface(JBaseKeyPool) // or JObject // SuperSignature: com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool
  ['{B2DA125B-7023-474E-B0A8-F3560D63D21B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLruArrayPool_KeyPool = class(TJavaGenericImport<JLruArrayPool_KeyPoolClass, JLruArrayPool_KeyPool>) end;

  JLruArrayPoolClass = interface(JObjectClass)
  ['{74E95BCC-F1A4-4A1C-8BB6-A6B94F46AE36}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLruArrayPool; cdecl; overload; //()V
    {class} function init(maxSize: Integer): JLruArrayPool; cdecl; overload; //(I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruArrayPool')]
  JLruArrayPool = interface(JObject)
  ['{1A39B76C-AE07-4AF4-9B90-1449BA87EE68}']
    { Property Methods }

    { methods }
    procedure put(aarray: JObject; P2: Jlang_Class); cdecl; overload; //Deprecated //(Ljava/lang/Object;Ljava/lang/Class;)V
    procedure put(aarray: JObject); cdecl; overload; //(Ljava/lang/Object;)V
    function getExact(size: Integer; arrayClass: Jlang_Class): JObject; cdecl; //(ILjava/lang/Class;)Ljava/lang/Object;
    function get(size: Integer; arrayClass: Jlang_Class): JObject; cdecl; //(ILjava/lang/Class;)Ljava/lang/Object;
    procedure clearMemory; cdecl; //()V
    procedure trimMemory(level: Integer); cdecl; //(I)V

    { Property }
  end;

  TJLruArrayPool = class(TJavaGenericImport<JLruArrayPoolClass, JLruArrayPool>) end;

  JLruBitmapPool_BitmapTrackerClass = interface(JObjectClass)
  ['{326D008C-328B-481D-B7B1-C43C2E2EE28D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$BitmapTracker')]
  JLruBitmapPool_BitmapTracker = interface(IJavaInstance)
  ['{F846CBFF-B5ED-4C3A-89D4-D2D70F2917E8}']
    { Property Methods }

    { methods }
    procedure add(P1: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    procedure remove(P1: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJLruBitmapPool_BitmapTracker = class(TJavaGenericImport<JLruBitmapPool_BitmapTrackerClass, JLruBitmapPool_BitmapTracker>) end;

  JLruBitmapPool_NullBitmapTrackerClass = interface(JObjectClass)
  ['{F9FA646F-CD74-4DEE-A745-7664A3C48E27}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$NullBitmapTracker')]
  JLruBitmapPool_NullBitmapTracker = interface(JObject)
  ['{93FB3D89-5280-4E9A-8108-2BF1BAF7C957}']
    { Property Methods }

    { methods }
    procedure add(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    procedure remove(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJLruBitmapPool_NullBitmapTracker = class(TJavaGenericImport<JLruBitmapPool_NullBitmapTrackerClass, JLruBitmapPool_NullBitmapTracker>) end;

  JLruBitmapPool_ThrowingBitmapTrackerClass = interface(JObjectClass)
  ['{51A14635-2CF2-4010-9609-5F7444D59087}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$ThrowingBitmapTracker')]
  JLruBitmapPool_ThrowingBitmapTracker = interface(JObject)
  ['{54DAFA3F-44A7-4D66-8524-7DF780D41F4F}']
    { Property Methods }

    { methods }
    procedure add(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    procedure remove(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJLruBitmapPool_ThrowingBitmapTracker = class(TJavaGenericImport<JLruBitmapPool_ThrowingBitmapTrackerClass, JLruBitmapPool_ThrowingBitmapTracker>) end;

  JLruBitmapPoolClass = interface(JObjectClass)
  ['{51A84679-817A-48F7-AF95-1313589C869D}']
    { static Property Methods }

    { static Methods }
    {class} function init(maxSize: Int64): JLruBitmapPool; cdecl; overload; //(J)V
    {class} function init(maxSize: Int64; P2: JSet): JLruBitmapPool; cdecl; overload; //(JLjava/util/Set;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool')]
  JLruBitmapPool = interface(JObject)
  ['{AD78D773-ECF5-4730-BA92-FB0C3ECB5D96}']
    { Property Methods }

    { methods }
    function getMaxSize: Int64; cdecl; //()J
    procedure setSizeMultiplier(sizeMultiplier: Single); cdecl; //(F)V
    procedure put(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    function getDirty(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    procedure clearMemory; cdecl; //()V
    procedure trimMemory(level: Integer); cdecl; //(I)V

    { Property }
  end;

  TJLruBitmapPool = class(TJavaGenericImport<JLruBitmapPoolClass, JLruBitmapPool>) end;

  JLruPoolStrategyClass = interface(JObjectClass)
  ['{8722CD0D-0F92-44B1-8A48-D3A18A2F6FCF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruPoolStrategy')]
  JLruPoolStrategy = interface(IJavaInstance)
  ['{9AFCF677-CAE6-45F3-AD21-06616CA704FC}']
    { Property Methods }

    { methods }
    procedure put(P1: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    function get(P1: Integer; P2: Integer; P3: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    function removeLast: JBitmap; cdecl; //()Landroid/graphics/Bitmap;
    function logBitmap(P1: JBitmap): JString; cdecl; overload; //(Landroid/graphics/Bitmap;)Ljava/lang/String;
    function logBitmap(P1: Integer; P2: Integer; P3: JBitmap_Config): JString; cdecl; overload; //(IILandroid/graphics/Bitmap$Config;)Ljava/lang/String;
    function getSize(P1: JBitmap): Integer; cdecl; //(Landroid/graphics/Bitmap;)I

    { Property }
  end;

  TJLruPoolStrategy = class(TJavaGenericImport<JLruPoolStrategyClass, JLruPoolStrategy>) end;

  JPoolableClass = interface(JObjectClass)
  ['{E730AF01-5541-4A61-9484-BAD9C1B2F63C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/Poolable')]
  JPoolable = interface(IJavaInstance)
  ['{DF79CF8D-C5C6-4A9F-98C1-0687EF68432A}']
    { Property Methods }

    { methods }
    procedure offer; cdecl; //()V

    { Property }
  end;

  TJPoolable = class(TJavaGenericImport<JPoolableClass, JPoolable>) end;

//  JPrettyPrintTreeMapClass = interface(JTreeMapClass) // or JObjectClass // SuperSignature: java/util/TreeMap
//  ['{7A0D6258-B7EC-496D-BC78-0B369D22E0A3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/PrettyPrintTreeMap')]
//  JPrettyPrintTreeMap = interface(JTreeMap) // or JObject // SuperSignature: java/util/TreeMap
//  ['{172105E3-CE0C-4898-937B-67B640FE89AC}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl; //()Ljava/lang/String;
//
//    { Property }
//  end;
//
//  TJPrettyPrintTreeMap = class(TJavaGenericImport<JPrettyPrintTreeMapClass, JPrettyPrintTreeMap>) end;

  JSizeConfigStrategy_KeyClass = interface(JObjectClass)
  ['{3398E4DE-F03A-4650-A87E-34B13B897AF5}']
    { static Property Methods }

    { static Methods }
    {class} function init(pool: JSizeConfigStrategy_KeyPool): JSizeConfigStrategy_Key; cdecl; overload; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$KeyPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key')]
  JSizeConfigStrategy_Key = interface(JObject)
  ['{89EA94C3-EEEA-4B7B-9C9D-89497FA51828}']
    { Property Methods }

    { methods }
    procedure init(size: Integer; config: JBitmap_Config); cdecl; overload; //(ILandroid/graphics/Bitmap$Config;)V
    procedure offer; cdecl; //()V
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJSizeConfigStrategy_Key = class(TJavaGenericImport<JSizeConfigStrategy_KeyClass, JSizeConfigStrategy_Key>) end;

  JSizeConfigStrategy_KeyPoolClass = interface(JBaseKeyPoolClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool
  ['{3D4AFBE1-402A-408D-A6F0-FEDCD957DC9D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$KeyPool')]
  JSizeConfigStrategy_KeyPool = interface(JBaseKeyPool) // or JObject // SuperSignature: com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool
  ['{4E4118F6-4C28-463E-B7AD-072120A1AC66}']
    { Property Methods }

    { methods }
    function get(size: Integer; config: JBitmap_Config): JSizeConfigStrategy_Key; cdecl; //(ILandroid/graphics/Bitmap$Config;)Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key;

    { Property }
  end;

  TJSizeConfigStrategy_KeyPool = class(TJavaGenericImport<JSizeConfigStrategy_KeyPoolClass, JSizeConfigStrategy_KeyPool>) end;

  JSizeConfigStrategyClass = interface(JObjectClass)
  ['{C5EA9960-A9CD-480F-ACA4-3A71EADBB1BE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSizeConfigStrategy; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy')]
  JSizeConfigStrategy = interface(JObject)
  ['{ABA3B0A6-1AA5-4438-B017-D33A907E7E8F}']
    { Property Methods }

    { methods }
    procedure put(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    function removeLast: JBitmap; cdecl; //()Landroid/graphics/Bitmap;
    function logBitmap(bitmap: JBitmap): JString; cdecl; overload; //(Landroid/graphics/Bitmap;)Ljava/lang/String;
    function logBitmap(width: Integer; height: Integer; config: JBitmap_Config): JString; cdecl; overload; //(IILandroid/graphics/Bitmap$Config;)Ljava/lang/String;
    function getSize(bitmap: JBitmap): Integer; cdecl; //(Landroid/graphics/Bitmap;)I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJSizeConfigStrategy = class(TJavaGenericImport<JSizeConfigStrategyClass, JSizeConfigStrategy>) end;

  JSizeStrategy_KeyClass = interface(JObjectClass)
  ['{921F260D-EABA-4D60-8CAD-2B8FB1DA4B87}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key')]
  JSizeStrategy_Key = interface(JObject)
  ['{6CFF2CBB-9371-4566-A10F-AE5F99D3A691}']
    { Property Methods }

    { methods }
    procedure init(size: Integer); cdecl; //(I)V
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;
    procedure offer; cdecl; //()V

    { Property }
  end;

  TJSizeStrategy_Key = class(TJavaGenericImport<JSizeStrategy_KeyClass, JSizeStrategy_Key>) end;

  JSizeStrategy_KeyPoolClass = interface(JBaseKeyPoolClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool
  ['{5EABEA7D-24C2-459F-9ADE-70D9D3E4490B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool')]
  JSizeStrategy_KeyPool = interface(JBaseKeyPool) // or JObject // SuperSignature: com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool
  ['{DB787D71-93C8-42AB-BE86-D38644B2BCC6}']
    { Property Methods }

    { methods }
    function get(size: Integer): JSizeStrategy_Key; cdecl; //(I)Lcom/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key;

    { Property }
  end;

  TJSizeStrategy_KeyPool = class(TJavaGenericImport<JSizeStrategy_KeyPoolClass, JSizeStrategy_KeyPool>) end;

  JSizeStrategyClass = interface(JObjectClass)
  ['{CE2AF983-AF1C-4C6B-8093-D40BB63A3809}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy')]
  JSizeStrategy = interface(JObject)
  ['{B0525391-662B-4A96-B194-FDEEC34F7130}']
    { Property Methods }

    { methods }
    procedure put(bitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;)V
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    function removeLast: JBitmap; cdecl; //()Landroid/graphics/Bitmap;
    function logBitmap(bitmap: JBitmap): JString; cdecl; overload; //(Landroid/graphics/Bitmap;)Ljava/lang/String;
    function logBitmap(width: Integer; height: Integer; config: JBitmap_Config): JString; cdecl; overload; //(IILandroid/graphics/Bitmap$Config;)Ljava/lang/String;
    function getSize(bitmap: JBitmap): Integer; cdecl; //(Landroid/graphics/Bitmap;)I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJSizeStrategy = class(TJavaGenericImport<JSizeStrategyClass, JSizeStrategy>) end;

  JDiskCache_FactoryClass = interface(JObjectClass)
  ['{B47AE643-6F99-472F-AE3E-C53E124CBDCE}']
    { static Property Methods }
    {class} function _GetDEFAULT_DISK_CACHE_SIZE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetDEFAULT_DISK_CACHE_DIR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }

    { static Property }
    {class} property DEFAULT_DISK_CACHE_SIZE: Integer read _GetDEFAULT_DISK_CACHE_SIZE;
    {class} property DEFAULT_DISK_CACHE_DIR: JString read _GetDEFAULT_DISK_CACHE_DIR;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCache$Factory')]
  JDiskCache_Factory = interface(IJavaInstance)
  ['{5683A6D6-2EF9-42FF-8B08-7A52ED078292}']
    { Property Methods }

    { methods }
    function build: JDiskCache; cdecl; //()Lcom/bumptech/glide/load/engine/cache/DiskCache;

    { Property }
  end;

  TJDiskCache_Factory = class(TJavaGenericImport<JDiskCache_FactoryClass, JDiskCache_Factory>) end;

  JDiskCache_WriterClass = interface(JObjectClass)
  ['{5A2D6C95-8334-45D8-B2CA-85100E1C1D5D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCache$Writer')]
  JDiskCache_Writer = interface(IJavaInstance)
  ['{7A92AB62-6568-4958-B921-EBA24033CCBE}']
    { Property Methods }

    { methods }
    function write(P1: JFile): Boolean; cdecl; //(Ljava/io/File;)Z

    { Property }
  end;

  TJDiskCache_Writer = class(TJavaGenericImport<JDiskCache_WriterClass, JDiskCache_Writer>) end;

  JDiskCacheClass = interface(JObjectClass)
  ['{A1141797-D40E-46D5-9426-189957FB06FD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCache')]
  JDiskCache = interface(IJavaInstance)
  ['{F20E7732-034A-492C-984F-CAE3DD7B4F17}']
    { Property Methods }

    { methods }
    function get(P1: JKey): JFile; cdecl; //(Lcom/bumptech/glide/load/Key;)Ljava/io/File;
    procedure put(P1: JKey; P2: JDiskCache_Writer); cdecl; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;)V
    procedure delete(P1: JKey); cdecl; //(Lcom/bumptech/glide/load/Key;)V
    procedure clear; cdecl; //()V

    { Property }
  end;

  TJDiskCache = class(TJavaGenericImport<JDiskCacheClass, JDiskCache>) end;

  JDiskCacheAdapter_FactoryClass = interface(JObjectClass)
  ['{C986C4D5-C85B-4419-B53D-A5B8A55DB90F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDiskCacheAdapter_Factory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheAdapter$Factory')]
  JDiskCacheAdapter_Factory = interface(JObject)
  ['{5E512126-B0C9-4051-885B-18B64D53DCDA}']
    { Property Methods }

    { methods }
    function build: JDiskCache; cdecl; //()Lcom/bumptech/glide/load/engine/cache/DiskCache;

    { Property }
  end;

  TJDiskCacheAdapter_Factory = class(TJavaGenericImport<JDiskCacheAdapter_FactoryClass, JDiskCacheAdapter_Factory>) end;

  JDiskCacheAdapterClass = interface(JObjectClass)
  ['{C5B2775B-083D-4607-B6AB-AAB0199C4E11}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDiskCacheAdapter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheAdapter')]
  JDiskCacheAdapter = interface(JObject)
  ['{02126463-284B-4E04-9581-CC42E6BF63A3}']
    { Property Methods }

    { methods }
    function get(key: JKey): JFile; cdecl; //(Lcom/bumptech/glide/load/Key;)Ljava/io/File;
    procedure put(key: JKey; writer: JDiskCache_Writer); cdecl; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;)V
    procedure delete(key: JKey); cdecl; //(Lcom/bumptech/glide/load/Key;)V
    procedure clear; cdecl; //()V

    { Property }
  end;

  TJDiskCacheAdapter = class(TJavaGenericImport<JDiskCacheAdapterClass, JDiskCacheAdapter>) end;

  JDiskCacheWriteLocker_WriteLockClass = interface(JObjectClass)
  ['{2C56A8A4-B26E-45B3-A1A9-B0BDFBA2A0E8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheWriteLocker$WriteLock')]
  JDiskCacheWriteLocker_WriteLock = interface(JObject)
  ['{F8C7A6AD-3208-417A-8B8C-2F5B2C5AF3D5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDiskCacheWriteLocker_WriteLock = class(TJavaGenericImport<JDiskCacheWriteLocker_WriteLockClass, JDiskCacheWriteLocker_WriteLock>) end;

  JDiskCacheWriteLocker_WriteLockPoolClass = interface(JObjectClass)
  ['{8F7ECF31-F2F9-4912-B698-F6ECF874CF4F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheWriteLocker$WriteLockPool')]
  JDiskCacheWriteLocker_WriteLockPool = interface(JObject)
  ['{EAB65431-39CF-413D-841A-4BE08E5E6D61}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDiskCacheWriteLocker_WriteLockPool = class(TJavaGenericImport<JDiskCacheWriteLocker_WriteLockPoolClass, JDiskCacheWriteLocker_WriteLockPool>) end;

  JDiskCacheWriteLockerClass = interface(JObjectClass)
  ['{104C34CB-E366-47DD-8D46-C04C07089E4E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheWriteLocker')]
  JDiskCacheWriteLocker = interface(JObject)
  ['{211F7445-2A9A-4814-ABDE-B79B6671046A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDiskCacheWriteLocker = class(TJavaGenericImport<JDiskCacheWriteLockerClass, JDiskCacheWriteLocker>) end;

  JDiskLruCacheFactory_CacheDirectoryGetterClass = interface(JObjectClass)
  ['{4B1B4D73-335F-43ED-9A96-6135C316D050}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskLruCacheFactory$CacheDirectoryGetter')]
  JDiskLruCacheFactory_CacheDirectoryGetter = interface(IJavaInstance)
  ['{CB5C38FB-FB19-4701-9BCA-345F6E9719DD}']
    { Property Methods }

    { methods }
    function getCacheDirectory: JFile; cdecl; //()Ljava/io/File;

    { Property }
  end;

  TJDiskLruCacheFactory_CacheDirectoryGetter = class(TJavaGenericImport<JDiskLruCacheFactory_CacheDirectoryGetterClass, JDiskLruCacheFactory_CacheDirectoryGetter>) end;

  JDiskLruCacheFactoryClass = interface(JObjectClass)
  ['{3ED908F8-941D-4417-A548-CA6D77D8BEEA}']
    { static Property Methods }

    { static Methods }
    {class} function init(diskCacheFolder: JString; diskCacheSize: Int64): JDiskLruCacheFactory; cdecl; overload; //(Ljava/lang/String;J)V
    {class} function init(diskCacheFolder: JString; diskCacheName: JString; diskCacheSize: Int64): JDiskLruCacheFactory; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;J)V
    {class} function init(cacheDirectoryGetter: JDiskLruCacheFactory_CacheDirectoryGetter; diskCacheSize: Int64): JDiskLruCacheFactory; cdecl; overload; //(Lcom/bumptech/glide/load/engine/cache/DiskLruCacheFactory$CacheDirectoryGetter;J)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskLruCacheFactory')]
  JDiskLruCacheFactory = interface(JObject)
  ['{D1407E40-3049-4A67-AD3A-44848470862D}']
    { Property Methods }

    { methods }
    function build: JDiskCache; cdecl; //()Lcom/bumptech/glide/load/engine/cache/DiskCache;

    { Property }
  end;

  TJDiskLruCacheFactory = class(TJavaGenericImport<JDiskLruCacheFactoryClass, JDiskLruCacheFactory>) end;

  JDiskLruCacheWrapperClass = interface(JObjectClass)
  ['{4CF13682-2777-43CF-A6E8-5207B53E9E6F}']
    { static Property Methods }

    { static Methods }
    {class} function get(directory: JFile; maxSize: Int64): JDiskCache; cdecl; overload; //Deprecated //(Ljava/io/File;J)Lcom/bumptech/glide/load/engine/cache/DiskCache;
    {class} function create(directory: JFile; maxSize: Int64): JDiskCache; cdecl; //(Ljava/io/File;J)Lcom/bumptech/glide/load/engine/cache/DiskCache;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskLruCacheWrapper')]
  JDiskLruCacheWrapper = interface(JObject)
  ['{559D2305-53F5-4B50-9A13-A442B5AAA343}']
    { Property Methods }

    { methods }
    function get(key: JKey): JFile; cdecl; overload; //(Lcom/bumptech/glide/load/Key;)Ljava/io/File;
    procedure put(key: JKey; writer: JDiskCache_Writer); cdecl; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/cache/DiskCache$Writer;)V
    procedure delete(key: JKey); cdecl; //(Lcom/bumptech/glide/load/Key;)V
    procedure clear; cdecl; //()V

    { Property }
  end;

  TJDiskLruCacheWrapper = class(TJavaGenericImport<JDiskLruCacheWrapperClass, JDiskLruCacheWrapper>) end;

  JExternalCacheDiskCacheFactoryClass = interface(JDiskLruCacheFactoryClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/engine/cache/DiskLruCacheFactory
  ['{3F9B29B7-C0A4-4B7E-8BA8-4C2C059C7C3C}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JExternalCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; diskCacheSize: Integer): JExternalCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;I)V
    {class} function init(context: JContext; diskCacheName: JString; diskCacheSize: Integer): JExternalCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;Ljava/lang/String;I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/ExternalCacheDiskCacheFactory')]
  JExternalCacheDiskCacheFactory = interface(JDiskLruCacheFactory) // or JObject // SuperSignature: com/bumptech/glide/load/engine/cache/DiskLruCacheFactory
  ['{24ECC9B0-C714-409B-81FF-058E643C69BD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExternalCacheDiskCacheFactory = class(TJavaGenericImport<JExternalCacheDiskCacheFactoryClass, JExternalCacheDiskCacheFactory>) end;

  JExternalPreferredCacheDiskCacheFactoryClass = interface(JDiskLruCacheFactoryClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/engine/cache/DiskLruCacheFactory
  ['{185DDCAD-FD23-43E9-88F5-F55A4DFE149A}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JExternalPreferredCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; diskCacheSize: Int64): JExternalPreferredCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;J)V
    {class} function init(context: JContext; diskCacheName: JString; diskCacheSize: Int64): JExternalPreferredCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;Ljava/lang/String;J)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/ExternalPreferredCacheDiskCacheFactory')]
  JExternalPreferredCacheDiskCacheFactory = interface(JDiskLruCacheFactory) // or JObject // SuperSignature: com/bumptech/glide/load/engine/cache/DiskLruCacheFactory
  ['{C18C371F-385C-45A9-86A8-A717763FE644}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExternalPreferredCacheDiskCacheFactory = class(TJavaGenericImport<JExternalPreferredCacheDiskCacheFactoryClass, JExternalPreferredCacheDiskCacheFactory>) end;

  JInternalCacheDiskCacheFactoryClass = interface(JDiskLruCacheFactoryClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/engine/cache/DiskLruCacheFactory
  ['{22A6903D-4C56-4858-9696-47B0B40747D5}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JInternalCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; diskCacheSize: Int64): JInternalCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;J)V
    {class} function init(context: JContext; diskCacheName: JString; diskCacheSize: Int64): JInternalCacheDiskCacheFactory; cdecl; overload; //(Landroid/content/Context;Ljava/lang/String;J)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory')]
  JInternalCacheDiskCacheFactory = interface(JDiskLruCacheFactory) // or JObject // SuperSignature: com/bumptech/glide/load/engine/cache/DiskLruCacheFactory
  ['{C515ACEC-9995-46A6-9EDB-7886C17CBE77}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInternalCacheDiskCacheFactory = class(TJavaGenericImport<JInternalCacheDiskCacheFactoryClass, JInternalCacheDiskCacheFactory>) end;

  JLruCacheClass = interface(JObjectClass)
  ['{5527C871-3414-4969-BE46-0F7DC7D2329A}']
    { static Property Methods }

    { static Methods }
    {class} function init(size: Int64): JLruCache; cdecl; //(J)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/LruCache')]
  JLruCache = interface(JObject)
  ['{84AC6233-70F9-410F-B6EC-25F3F3DC06AB}']
    { Property Methods }

    { methods }
    procedure setSizeMultiplier(multiplier: Single); cdecl; //(F)V
    function getMaxSize: Int64; cdecl; //()J
    function getCurrentSize: Int64; cdecl; //()J
    function contains(key: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function get(key: JObject): JObject; cdecl; //(Ljava/lang/Object;)Ljava/lang/Object;
    function put(key: JObject; item: JObject): JObject; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    function remove(key: JObject): JObject; cdecl; //(Ljava/lang/Object;)Ljava/lang/Object;
    procedure clearMemory; cdecl; //()V

    { Property }
  end;

  TJLruCache = class(TJavaGenericImport<JLruCacheClass, JLruCache>) end;

  JLruResourceCacheClass = interface(JLruCacheClass) // or JObjectClass // SuperSignature: com/bumptech/glide/util/LruCache
  ['{6E61CE2E-F45C-41F0-A610-724A3D08C360}']
    { static Property Methods }

    { static Methods }
    {class} function init(size: Int64): JLruResourceCache; cdecl; //(J)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/LruResourceCache')]
  JLruResourceCache = interface(JLruCache) // or JObject // SuperSignature: com/bumptech/glide/util/LruCache
  ['{4DC358C6-357F-4A9A-87FE-3C3129C5B211}']
    { Property Methods }

    { methods }
    procedure setResourceRemovedListener(listener: JMemoryCache_ResourceRemovedListener); cdecl; //(Lcom/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener;)V
    procedure trimMemory(level: Integer); cdecl; //(I)V
    function put(this: JKey; P2: JResource): JResource; cdecl; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/Resource;
    function remove(this: JKey): JResource; cdecl; //(Lcom/bumptech/glide/load/Key;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJLruResourceCache = class(TJavaGenericImport<JLruResourceCacheClass, JLruResourceCache>) end;

  JMemoryCache_ResourceRemovedListenerClass = interface(JObjectClass)
  ['{5EE4616F-D1D5-47D9-82B6-930AB2B865DE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener')]
  JMemoryCache_ResourceRemovedListener = interface(IJavaInstance)
  ['{DB070755-EC2F-4CD1-8D76-900D2C39B656}']
    { Property Methods }

    { methods }
    procedure onResourceRemoved(P1: JResource); cdecl; //(Lcom/bumptech/glide/load/engine/Resource;)V

    { Property }
  end;

  TJMemoryCache_ResourceRemovedListener = class(TJavaGenericImport<JMemoryCache_ResourceRemovedListenerClass, JMemoryCache_ResourceRemovedListener>) end;

  JMemoryCacheClass = interface(JObjectClass)
  ['{36FADE46-4F04-4872-9D1F-BF4EBD57E7F4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemoryCache')]
  JMemoryCache = interface(IJavaInstance)
  ['{620A5CF3-616F-49A1-8F21-81526A718A5F}']
    { Property Methods }

    { methods }
    function getCurrentSize: Int64; cdecl; //()J
    function getMaxSize: Int64; cdecl; //()J
    procedure setSizeMultiplier(P1: Single); cdecl; //(F)V
    function remove(P1: JKey): JResource; cdecl; //(Lcom/bumptech/glide/load/Key;)Lcom/bumptech/glide/load/engine/Resource;
    function put(P1: JKey; P2: JResource): JResource; cdecl; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/Resource;
    procedure setResourceRemovedListener(P1: JMemoryCache_ResourceRemovedListener); cdecl; //(Lcom/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener;)V
    procedure clearMemory; cdecl; //()V
    procedure trimMemory(P1: Integer); cdecl; //(I)V

    { Property }
  end;

  TJMemoryCache = class(TJavaGenericImport<JMemoryCacheClass, JMemoryCache>) end;

  JMemoryCacheAdapterClass = interface(JObjectClass)
  ['{2DA95189-02E1-497D-844E-8A5C308C9819}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMemoryCacheAdapter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemoryCacheAdapter')]
  JMemoryCacheAdapter = interface(JObject)
  ['{9717C406-AA00-42B8-B59E-447C77A6EBCD}']
    { Property Methods }

    { methods }
    function getCurrentSize: Int64; cdecl; //()J
    function getMaxSize: Int64; cdecl; //()J
    procedure setSizeMultiplier(multiplier: Single); cdecl; //(F)V
    function remove(key: JKey): JResource; cdecl; //(Lcom/bumptech/glide/load/Key;)Lcom/bumptech/glide/load/engine/Resource;
    function put(key: JKey; resource: JResource): JResource; cdecl; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/Resource;
    procedure setResourceRemovedListener(listener: JMemoryCache_ResourceRemovedListener); cdecl; //(Lcom/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener;)V
    procedure clearMemory; cdecl; //()V
    procedure trimMemory(level: Integer); cdecl; //(I)V

    { Property }
  end;

  TJMemoryCacheAdapter = class(TJavaGenericImport<JMemoryCacheAdapterClass, JMemoryCacheAdapter>) end;

  JMemorySizeCalculator_BuilderClass = interface(JObjectClass)
  ['{8ADF6B63-9959-4B08-9725-0673E7169EB1}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMemorySizeCalculator_Builder; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder')]
  JMemorySizeCalculator_Builder = interface(JObject)
  ['{241A30C5-C484-42F7-83C0-2E5C2773ED7E}']
    { Property Methods }

    { methods }
    function setMemoryCacheScreens(memoryCacheScreens: Single): JMemorySizeCalculator_Builder; cdecl; //(F)Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;
    function setBitmapPoolScreens(bitmapPoolScreens: Single): JMemorySizeCalculator_Builder; cdecl; //(F)Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;
    function setMaxSizeMultiplier(maxSizeMultiplier: Single): JMemorySizeCalculator_Builder; cdecl; //(F)Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;
    function setLowMemoryMaxSizeMultiplier(lowMemoryMaxSizeMultiplier: Single): JMemorySizeCalculator_Builder; cdecl; //(F)Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;
    function setArrayPoolSize(arrayPoolSizeBytes: Integer): JMemorySizeCalculator_Builder; cdecl; //(I)Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder;
    function build: JMemorySizeCalculator; cdecl; //()Lcom/bumptech/glide/load/engine/cache/MemorySizeCalculator;

    { Property }
  end;

  TJMemorySizeCalculator_Builder = class(TJavaGenericImport<JMemorySizeCalculator_BuilderClass, JMemorySizeCalculator_Builder>) end;

  JMemorySizeCalculator_DisplayMetricsScreenDimensionsClass = interface(JObjectClass)
  ['{6644D896-574E-4D8A-941C-BF9CB50747BB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions')]
  JMemorySizeCalculator_DisplayMetricsScreenDimensions = interface(JObject)
  ['{6C77465A-089B-4D7D-A608-CCBD6CC5F74B}']
    { Property Methods }

    { methods }
    function getWidthPixels: Integer; cdecl; //()I
    function getHeightPixels: Integer; cdecl; //()I

    { Property }
  end;

  TJMemorySizeCalculator_DisplayMetricsScreenDimensions = class(TJavaGenericImport<JMemorySizeCalculator_DisplayMetricsScreenDimensionsClass, JMemorySizeCalculator_DisplayMetricsScreenDimensions>) end;

  JMemorySizeCalculator_ScreenDimensionsClass = interface(JObjectClass)
  ['{FE20F66A-4770-4B98-BC93-8C98C5B90CA6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions')]
  JMemorySizeCalculator_ScreenDimensions = interface(IJavaInstance)
  ['{3CB655D7-D847-4042-B2AD-F3DD63E6E7FE}']
    { Property Methods }

    { methods }
    function getWidthPixels: Integer; cdecl; //()I
    function getHeightPixels: Integer; cdecl; //()I

    { Property }
  end;

  TJMemorySizeCalculator_ScreenDimensions = class(TJavaGenericImport<JMemorySizeCalculator_ScreenDimensionsClass, JMemorySizeCalculator_ScreenDimensions>) end;

  JMemorySizeCalculatorClass = interface(JObjectClass)
  ['{4B67660C-4B65-4853-B683-BA4DA4F29B6F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemorySizeCalculator')]
  JMemorySizeCalculator = interface(JObject)
  ['{1A1AEEAB-EE09-4D6A-82D9-4A10123493CA}']
    { Property Methods }

    { methods }
    function getMemoryCacheSize: Integer; cdecl; //()I
    function getBitmapPoolSize: Integer; cdecl; //()I
    function getArrayPoolSizeInBytes: Integer; cdecl; //()I

    { Property }
  end;

  TJMemorySizeCalculator = class(TJavaGenericImport<JMemorySizeCalculatorClass, JMemorySizeCalculator>) end;

  JSafeKeyGenerator_PoolableDigestContainerClass = interface(JObjectClass)
  ['{9927750F-CD38-4256-B577-4BDC3F54C12F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/SafeKeyGenerator$PoolableDigestContainer')]
  JSafeKeyGenerator_PoolableDigestContainer = interface(JObject)
  ['{09BBD7FD-C1B3-4CA0-88A9-3D203F4A29EE}']
    { Property Methods }

    { methods }
    function getVerifier: JStateVerifier; cdecl; //()Lcom/bumptech/glide/util/pool/StateVerifier;

    { Property }
  end;

  TJSafeKeyGenerator_PoolableDigestContainer = class(TJavaGenericImport<JSafeKeyGenerator_PoolableDigestContainerClass, JSafeKeyGenerator_PoolableDigestContainer>) end;

  JSafeKeyGeneratorClass = interface(JObjectClass)
  ['{DE25CA52-91F4-4E1C-BAB2-7E6146D09CE6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSafeKeyGenerator; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/SafeKeyGenerator')]
  JSafeKeyGenerator = interface(JObject)
  ['{0F318A1E-8B6F-4330-9901-797C28E19DE9}']
    { Property Methods }

    { methods }
    function getSafeKey(key: JKey): JString; cdecl; //(Lcom/bumptech/glide/load/Key;)Ljava/lang/String;

    { Property }
  end;

  TJSafeKeyGenerator = class(TJavaGenericImport<JSafeKeyGeneratorClass, JSafeKeyGenerator>) end;

  JDataCacheGeneratorClass = interface(JObjectClass)
  ['{1BD7C39D-88E4-4FC7-B63C-EAE6FAF6186F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataCacheGenerator')]
  JDataCacheGenerator = interface(JObject)
  ['{E856487D-5989-4556-AA02-00CADFB75C67}']
    { Property Methods }

    { methods }
    function startNext: Boolean; cdecl; //()Z
    procedure cancel; cdecl; //()V
    procedure onDataReady(data: JObject); cdecl; //(Ljava/lang/Object;)V
    procedure onLoadFailed(e: JException); cdecl; //(Ljava/lang/Exception;)V

    { Property }
  end;

  TJDataCacheGenerator = class(TJavaGenericImport<JDataCacheGeneratorClass, JDataCacheGenerator>) end;

  JDataCacheKeyClass = interface(JObjectClass)
  ['{26CC89E7-08D8-42B9-99B3-075530431BB7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataCacheKey')]
  JDataCacheKey = interface(JObject)
  ['{E7DB8F5D-F050-4BB6-88C8-9F0A5007D24F}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJDataCacheKey = class(TJavaGenericImport<JDataCacheKeyClass, JDataCacheKey>) end;

  JDataCacheWriterClass = interface(JObjectClass)
  ['{C2C034A1-011B-4256-8272-66B4B29E6499}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataCacheWriter')]
  JDataCacheWriter = interface(JObject)
  ['{CC191B50-F363-475F-892D-75E59536516B}']
    { Property Methods }

    { methods }
    function write(afile: JFile): Boolean; cdecl; //(Ljava/io/File;)Z

    { Property }
  end;

  TJDataCacheWriter = class(TJavaGenericImport<JDataCacheWriterClass, JDataCacheWriter>) end;

  JDataFetcherGenerator_FetcherReadyCallbackClass = interface(JObjectClass)
  ['{2A903C11-BDC5-415E-88AC-2EE8B69ED6D1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataFetcherGenerator$FetcherReadyCallback')]
  JDataFetcherGenerator_FetcherReadyCallback = interface(IJavaInstance)
  ['{B70BBB2E-75E4-43C2-B41E-B2443D61A847}']
    { Property Methods }

    { methods }
    procedure reschedule; cdecl; //()V
    procedure onDataFetcherReady(P1: JKey; P2: JObject; P3: JDataFetcher; P4: JDataSource; P5: JKey); cdecl; //(Lcom/bumptech/glide/load/Key;Ljava/lang/Object;Lcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/Key;)V
    procedure onDataFetcherFailed(P1: JKey; P2: JException; P3: JDataFetcher; P4: JDataSource); cdecl; //(Lcom/bumptech/glide/load/Key;Ljava/lang/Exception;Lcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/load/DataSource;)V

    { Property }
  end;

  TJDataFetcherGenerator_FetcherReadyCallback = class(TJavaGenericImport<JDataFetcherGenerator_FetcherReadyCallbackClass, JDataFetcherGenerator_FetcherReadyCallback>) end;

  JDataFetcherGeneratorClass = interface(JObjectClass)
  ['{C137AC22-65D6-4A23-A4CB-ABEDFDB5DD5C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataFetcherGenerator')]
  JDataFetcherGenerator = interface(IJavaInstance)
  ['{6D2150C0-B6F6-4FD0-8694-80F0D2A01404}']
    { Property Methods }

    { methods }
    function startNext: Boolean; cdecl; //()Z
    procedure cancel; cdecl; //()V

    { Property }
  end;

  TJDataFetcherGenerator = class(TJavaGenericImport<JDataFetcherGeneratorClass, JDataFetcherGenerator>) end;

  JDecodeHelperClass = interface(JObjectClass)
  ['{675A257B-F872-4950-B5B3-65907979C0B3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeHelper')]
  JDecodeHelper = interface(JObject)
  ['{ADC3FF64-B3DD-4088-8631-000BDBDF7A46}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeHelper = class(TJavaGenericImport<JDecodeHelperClass, JDecodeHelper>) end;

  JDecodeJob_CallbackClass = interface(JObjectClass)
  ['{70C9A164-55E0-45AF-80B0-173E30172804}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$Callback')]
  JDecodeJob_Callback = interface(IJavaInstance)
  ['{FE66C9D1-EB66-48AD-9B6B-437942DBFB1E}']
    { Property Methods }

    { methods }
    procedure onResourceReady(P1: JResource; P2: JDataSource); cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V
    procedure onLoadFailed(P1: JGlideException); cdecl; //(Lcom/bumptech/glide/load/engine/GlideException;)V
    procedure reschedule(P1: JDecodeJob); cdecl; //(Lcom/bumptech/glide/load/engine/DecodeJob;)V

    { Property }
  end;

  TJDecodeJob_Callback = class(TJavaGenericImport<JDecodeJob_CallbackClass, JDecodeJob_Callback>) end;

  JDecodeJob_DecodeCallbackClass = interface(JObjectClass)
  ['{5DC0F5D4-9CFB-42AD-8016-C5A964A516EB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$DecodeCallback')]
  JDecodeJob_DecodeCallback = interface(JObject)
  ['{AEECA455-53C0-44F0-8EB1-2FF5818FEF82}']
    { Property Methods }

    { methods }
    function onResourceDecoded(decoded: JResource): JResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJDecodeJob_DecodeCallback = class(TJavaGenericImport<JDecodeJob_DecodeCallbackClass, JDecodeJob_DecodeCallback>) end;

  JDecodeJob_DeferredEncodeManagerClass = interface(JObjectClass)
  ['{BC10B429-999E-4C1D-9797-04359B342226}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager')]
  JDecodeJob_DeferredEncodeManager = interface(JObject)
  ['{9872625C-5016-47DD-8204-ADC7876F37E2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeJob_DeferredEncodeManager = class(TJavaGenericImport<JDecodeJob_DeferredEncodeManagerClass, JDecodeJob_DeferredEncodeManager>) end;

  JDecodeJob_DiskCacheProviderClass = interface(JObjectClass)
  ['{0526B7C1-EB68-47A7-8320-894DFD0C582D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider')]
  JDecodeJob_DiskCacheProvider = interface(IJavaInstance)
  ['{7B898785-3264-4FF9-9F75-3E3C4C4BCC6D}']
    { Property Methods }

    { methods }
    function getDiskCache: JDiskCache; cdecl; //()Lcom/bumptech/glide/load/engine/cache/DiskCache;

    { Property }
  end;

  TJDecodeJob_DiskCacheProvider = class(TJavaGenericImport<JDecodeJob_DiskCacheProviderClass, JDecodeJob_DiskCacheProvider>) end;

  JDecodeJob_ReleaseManagerClass = interface(JObjectClass)
  ['{A839A931-576B-4D07-BB2E-140FEC30B9D2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$ReleaseManager')]
  JDecodeJob_ReleaseManager = interface(JObject)
  ['{8A5A5BCF-978F-44BE-B913-C2399811FE26}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeJob_ReleaseManager = class(TJavaGenericImport<JDecodeJob_ReleaseManagerClass, JDecodeJob_ReleaseManager>) end;

  JDecodeJob_RunReasonClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{9362304A-0F3B-4A1B-99FF-D0486C82BC9B}']
    { static Property Methods }
    {class} function _GetINITIALIZE: JDecodeJob_RunReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;
    {class} function _GetSWITCH_TO_SOURCE_SERVICE: JDecodeJob_RunReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;
    {class} function _GetDECODE_DATA: JDecodeJob_RunReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodeJob_RunReason>; cdecl; //()[Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;
    {class} function valueOf(name: JString): JDecodeJob_RunReason; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/load/engine/DecodeJob$RunReason;

    { static Property }
    {class} property INITIALIZE: JDecodeJob_RunReason read _GetINITIALIZE;
    {class} property SWITCH_TO_SOURCE_SERVICE: JDecodeJob_RunReason read _GetSWITCH_TO_SOURCE_SERVICE;
    {class} property DECODE_DATA: JDecodeJob_RunReason read _GetDECODE_DATA;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$RunReason')]
  JDecodeJob_RunReason = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{1FCE0210-9A1D-409C-817C-463190B2DFAA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeJob_RunReason = class(TJavaGenericImport<JDecodeJob_RunReasonClass, JDecodeJob_RunReason>) end;

  JDecodeJob_StageClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{757C5FA0-8215-4D78-A0FD-29B913B6BCED}']
    { static Property Methods }
    {class} function _GetINITIALIZE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$Stage;
    {class} function _GetRESOURCE_CACHE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$Stage;
    {class} function _GetDATA_CACHE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$Stage;
    {class} function _GetSOURCE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$Stage;
    {class} function _GetENCODE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$Stage;
    {class} function _GetFINISHED: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodeJob_Stage>; cdecl; //()[Lcom/bumptech/glide/load/engine/DecodeJob$Stage;
    {class} function valueOf(name: JString): JDecodeJob_Stage; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/load/engine/DecodeJob$Stage;

    { static Property }
    {class} property INITIALIZE: JDecodeJob_Stage read _GetINITIALIZE;
    {class} property RESOURCE_CACHE: JDecodeJob_Stage read _GetRESOURCE_CACHE;
    {class} property DATA_CACHE: JDecodeJob_Stage read _GetDATA_CACHE;
    {class} property SOURCE: JDecodeJob_Stage read _GetSOURCE;
    {class} property ENCODE: JDecodeJob_Stage read _GetENCODE;
    {class} property FINISHED: JDecodeJob_Stage read _GetFINISHED;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$Stage')]
  JDecodeJob_Stage = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{F19C4847-45D5-48A1-BD19-56BAE97FBF98}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeJob_Stage = class(TJavaGenericImport<JDecodeJob_StageClass, JDecodeJob_Stage>) end;

  JDecodeJobClass = interface(JObjectClass)
  ['{8690EF8C-F89D-4B51-88FA-5ED4A42F4FE3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob')]
  JDecodeJob = interface(JObject)
  ['{F51DCA09-7A47-4ED1-8879-AA40FFE68870}']
    { Property Methods }

    { methods }
    function compareTo(other: JDecodeJob): Integer; cdecl; overload; //(Lcom/bumptech/glide/load/engine/DecodeJob;)I
    procedure cancel; cdecl; //()V
    procedure run; cdecl; //()V
    procedure reschedule; cdecl; //()V
    procedure onDataFetcherReady(sourceKey: JKey; data: JObject; fetcher: JDataFetcher; dataSource: JDataSource; attemptedKey: JKey); cdecl; //(Lcom/bumptech/glide/load/Key;Ljava/lang/Object;Lcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/Key;)V
    procedure onDataFetcherFailed(attemptedKey: JKey; e: JException; fetcher: JDataFetcher; dataSource: JDataSource); cdecl; //(Lcom/bumptech/glide/load/Key;Ljava/lang/Exception;Lcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/load/DataSource;)V
    function getVerifier: JStateVerifier; cdecl; //()Lcom/bumptech/glide/util/pool/StateVerifier;
    function compareTo(this: JObject): Integer; cdecl; overload; //(Ljava/lang/Object;)I

    { Property }
  end;

  TJDecodeJob = class(TJavaGenericImport<JDecodeJobClass, JDecodeJob>) end;

  JDecodePath_DecodeCallbackClass = interface(JObjectClass)
  ['{A5183660-5CCF-48F3-8FD6-A91F7FD4368F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodePath$DecodeCallback')]
  JDecodePath_DecodeCallback = interface(IJavaInstance)
  ['{7BFA98CD-8EA6-4013-BE3D-EBCC7E34D140}']
    { Property Methods }

    { methods }
    function onResourceDecoded(P1: JResource): JResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJDecodePath_DecodeCallback = class(TJavaGenericImport<JDecodePath_DecodeCallbackClass, JDecodePath_DecodeCallback>) end;

  JDecodePathClass = interface(JObjectClass)
  ['{864F393E-ADB4-4C6E-AA38-1A54DAF9BDC0}']
    { static Property Methods }

    { static Methods }
//    {class} function init(dataClass: Jlang_Class; resourceClass: Jlang_Class; transcodeClass: Jlang_Class; decoders: JList; transcoder: JResourceTranscoder; listPool: JPools_Pool): JDecodePath; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljava/util/List;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;Landroid/support/v4/util/Pools$Pool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodePath')]
  JDecodePath = interface(JObject)
  ['{5F2760F3-85DD-4AFA-9221-3448A3B38630}']
    { Property Methods }

    { methods }
    function decode(rewinder: JDataRewinder; width: Integer; height: Integer; options: JOptions; callback: JDecodePath_DecodeCallback): JResource; cdecl; //(Lcom/bumptech/glide/load/data/DataRewinder;IILcom/bumptech/glide/load/Options;Lcom/bumptech/glide/load/engine/DecodePath$DecodeCallback;)Lcom/bumptech/glide/load/engine/Resource;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJDecodePath = class(TJavaGenericImport<JDecodePathClass, JDecodePath>) end;

  JDiskCacheStrategyClass = interface(JObjectClass)
  ['{39B7989D-E6CF-4977-90EB-A730998359D5}']
    { static Property Methods }
    {class} function _GetALL: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DiskCacheStrategy;
    {class} function _GetNONE: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DiskCacheStrategy;
    {class} function _GetDATA: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DiskCacheStrategy;
    {class} function _GetRESOURCE: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DiskCacheStrategy;
    {class} function _GetAUTOMATIC: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/DiskCacheStrategy;

    { static Methods }
    {class} function init: JDiskCacheStrategy; cdecl; //()V

    { static Property }
    {class} property ALL: JDiskCacheStrategy read _GetALL;
    {class} property NONE: JDiskCacheStrategy read _GetNONE;
    {class} property DATA: JDiskCacheStrategy read _GetDATA;
    {class} property RESOURCE: JDiskCacheStrategy read _GetRESOURCE;
    {class} property AUTOMATIC: JDiskCacheStrategy read _GetAUTOMATIC;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DiskCacheStrategy')]
  JDiskCacheStrategy = interface(JObject)
  ['{82F01456-F318-444A-92C2-CEA2C7D8972D}']
    { Property Methods }

    { methods }
    function isDataCacheable(P1: JDataSource): Boolean; cdecl; //(Lcom/bumptech/glide/load/DataSource;)Z
    function isResourceCacheable(P1: Boolean; P2: JDataSource; P3: JEncodeStrategy): Boolean; cdecl; //(ZLcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/EncodeStrategy;)Z
    function decodeCachedResource: Boolean; cdecl; //()Z
    function decodeCachedData: Boolean; cdecl; //()Z

    { Property }
  end;

  TJDiskCacheStrategy = class(TJavaGenericImport<JDiskCacheStrategyClass, JDiskCacheStrategy>) end;

  JEngine_DecodeJobFactoryClass = interface(JObjectClass)
  ['{AA216252-C493-42D9-88E1-69E4DB6A8681}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$DecodeJobFactory')]
  JEngine_DecodeJobFactory = interface(JObject)
  ['{1202AB84-7701-42E1-9B0A-BE96D6B76C55}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEngine_DecodeJobFactory = class(TJavaGenericImport<JEngine_DecodeJobFactoryClass, JEngine_DecodeJobFactory>) end;

  JEngine_EngineJobFactoryClass = interface(JObjectClass)
  ['{071AEBC4-7F96-4C67-A11F-DFFEA96C7795}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$EngineJobFactory')]
  JEngine_EngineJobFactory = interface(JObject)
  ['{C80361E1-FB36-426F-94BB-EEC4E5DF77CD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEngine_EngineJobFactory = class(TJavaGenericImport<JEngine_EngineJobFactoryClass, JEngine_EngineJobFactory>) end;

  JEngine_LazyDiskCacheProviderClass = interface(JObjectClass)
  ['{2C63C93C-ADE8-4BCE-A26E-0D5CC4B487B2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider')]
  JEngine_LazyDiskCacheProvider = interface(JObject)
  ['{7ACBF5A7-FD24-481D-8318-CA89286DC9C2}']
    { Property Methods }

    { methods }
    function getDiskCache: JDiskCache; cdecl; //()Lcom/bumptech/glide/load/engine/cache/DiskCache;

    { Property }
  end;

  TJEngine_LazyDiskCacheProvider = class(TJavaGenericImport<JEngine_LazyDiskCacheProviderClass, JEngine_LazyDiskCacheProvider>) end;

  JEngine_LoadStatusClass = interface(JObjectClass)
  ['{1F5BBA10-2FEB-42D2-B50A-7FD6A881431E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$LoadStatus')]
  JEngine_LoadStatus = interface(JObject)
  ['{BEFF7184-4D51-4C55-B5B9-A9112012B7E5}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl; //()V

    { Property }
  end;

  TJEngine_LoadStatus = class(TJavaGenericImport<JEngine_LoadStatusClass, JEngine_LoadStatus>) end;

  JEngineClass = interface(JObjectClass)
  ['{EB2C0EDD-367D-44B6-A88C-9F8549B39F54}']
    { static Property Methods }

    { static Methods }
    {class} function init(memoryCache: JMemoryCache; diskCacheFactory: JDiskCache_Factory; diskCacheExecutor: JGlideExecutor; sourceExecutor: JGlideExecutor; sourceUnlimitedExecutor: JGlideExecutor; animationExecutor: JGlideExecutor; isActiveResourceRetentionAllowed: Boolean): JEngine; cdecl; //(Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/cache/DiskCache$Factory;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Lcom/bumptech/glide/load/engine/executor/GlideExecutor;Z)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine')]
  JEngine = interface(JObject)
  ['{F1CF3ABD-895E-49CE-ACFB-55354713C49E}']
    { Property Methods }

    { methods }
    function load(glideContext: JGlideContext; model: JObject; signature: JKey; width: Integer; height: Integer; resourceClass: Jlang_Class; P7: Jlang_Class; transcodeClass: JPriority; diskCacheStrategy: JDiskCacheStrategy; transformations: JMap; P11: Boolean; isScaleOnlyOrNoTransform: Boolean; options: JOptions; isMemoryCacheable: Boolean; useUnlimitedSourceExecutorPool: Boolean; useAnimationPool: Boolean; onlyRetrieveFromCache: Boolean; cb: JResourceCallback): JEngine_LoadStatus; cdecl; //(Lcom/bumptech/glide/GlideContext;Ljava/lang/Object;Lcom/bumptech/glide/load/Key;IILjava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/engine/DiskCacheStrategy;Ljava/util/Map;ZZLcom/bumptech/glide/load/Options;ZZZZLcom/bumptech/glide/request/ResourceCallback;)Lcom/bumptech/glide/load/engine/Engine$LoadStatus;
    procedure release(resource: JResource); cdecl; //(Lcom/bumptech/glide/load/engine/Resource;)V
    procedure onEngineJobComplete(engineJob: JEngineJob; P2: JKey; resource: JEngineResource); cdecl; //(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V
    procedure onEngineJobCancelled(engineJob: JEngineJob; P2: JKey); cdecl; //(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;)V
    procedure onResourceRemoved(resource: JResource); cdecl; //(Lcom/bumptech/glide/load/engine/Resource;)V
    procedure onResourceReleased(cacheKey: JKey; resource: JEngineResource); cdecl; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V
    procedure clearDiskCache; cdecl; //()V
    procedure shutdown; cdecl; //()V

    { Property }
  end;

  TJEngine = class(TJavaGenericImport<JEngineClass, JEngine>) end;

  JEngineJob_EngineResourceFactoryClass = interface(JObjectClass)
  ['{FB0CA7A3-EC79-4E91-A25E-19B0FF2E6917}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineJob$EngineResourceFactory')]
  JEngineJob_EngineResourceFactory = interface(JObject)
  ['{9016D14A-F8DE-429A-B705-C9DBB7AF16FE}']
    { Property Methods }

    { methods }
    function build(resource: JResource; P2: Boolean): JEngineResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Z)Lcom/bumptech/glide/load/engine/EngineResource;

    { Property }
  end;

  TJEngineJob_EngineResourceFactory = class(TJavaGenericImport<JEngineJob_EngineResourceFactoryClass, JEngineJob_EngineResourceFactory>) end;

  JEngineJob_MainThreadCallbackClass = interface(JObjectClass)
  ['{DA906291-1B2E-4097-BE9F-61337F460E3B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineJob$MainThreadCallback')]
  JEngineJob_MainThreadCallback = interface(JObject)
  ['{FDB8A443-EE22-4D84-9713-C21C59BDCF87}']
    { Property Methods }

    { methods }
    function handleMessage(amessage: JMessage): Boolean; cdecl; //(Landroid/os/Message;)Z

    { Property }
  end;

  TJEngineJob_MainThreadCallback = class(TJavaGenericImport<JEngineJob_MainThreadCallbackClass, JEngineJob_MainThreadCallback>) end;

  JEngineJobClass = interface(JObjectClass)
  ['{1E88AC95-344C-4938-9942-A73A58871A34}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineJob')]
  JEngineJob = interface(JObject)
  ['{C53D144B-E414-4372-AC1A-FE079649A99F}']
    { Property Methods }

    { methods }
    procedure start(decodeJob: JDecodeJob); cdecl; //(Lcom/bumptech/glide/load/engine/DecodeJob;)V
    procedure onResourceReady(resource: JResource; dataSource: JDataSource); cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V
    procedure onLoadFailed(e: JGlideException); cdecl; //(Lcom/bumptech/glide/load/engine/GlideException;)V
    procedure reschedule(job: JDecodeJob); cdecl; //(Lcom/bumptech/glide/load/engine/DecodeJob;)V
    function getVerifier: JStateVerifier; cdecl; //()Lcom/bumptech/glide/util/pool/StateVerifier;

    { Property }
  end;

  TJEngineJob = class(TJavaGenericImport<JEngineJobClass, JEngineJob>) end;

  JEngineJobListenerClass = interface(JObjectClass)
  ['{F5535FDF-CB7C-4E59-8EC7-6C11D82A496D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineJobListener')]
  JEngineJobListener = interface(IJavaInstance)
  ['{AA60589F-66CA-43EE-B78F-81F3C84CC5FC}']
    { Property Methods }

    { methods }
    procedure onEngineJobComplete(P1: JEngineJob; P2: JKey; P3: JEngineResource); cdecl; //(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V
    procedure onEngineJobCancelled(P1: JEngineJob; P2: JKey); cdecl; //(Lcom/bumptech/glide/load/engine/EngineJob;Lcom/bumptech/glide/load/Key;)V

    { Property }
  end;

  TJEngineJobListener = class(TJavaGenericImport<JEngineJobListenerClass, JEngineJobListener>) end;

  JEngineKeyClass = interface(JObjectClass)
  ['{39BD62D1-C1D0-47FB-AD91-77551E6D7D8A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineKey')]
  JEngineKey = interface(JObject)
  ['{8BB268F6-D9AE-4331-93AE-162D1DDCAF66}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJEngineKey = class(TJavaGenericImport<JEngineKeyClass, JEngineKey>) end;

  JEngineKeyFactoryClass = interface(JObjectClass)
  ['{3BB82412-3361-49F7-9E05-45C48262D859}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineKeyFactory')]
  JEngineKeyFactory = interface(JObject)
  ['{2C1A9B53-3DDF-4BAA-8401-3461839CBC2B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEngineKeyFactory = class(TJavaGenericImport<JEngineKeyFactoryClass, JEngineKeyFactory>) end;

  JEngineResource_ResourceListenerClass = interface(JObjectClass)
  ['{F726A182-819E-4B7E-B69B-98CE2A5D44AE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineResource$ResourceListener')]
  JEngineResource_ResourceListener = interface(IJavaInstance)
  ['{5739408B-5D3C-4390-AFD2-BBFA6E1CF703}']
    { Property Methods }

    { methods }
    procedure onResourceReleased(P1: JKey; P2: JEngineResource); cdecl; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/engine/EngineResource;)V

    { Property }
  end;

  TJEngineResource_ResourceListener = class(TJavaGenericImport<JEngineResource_ResourceListenerClass, JEngineResource_ResourceListener>) end;

  JEngineResourceClass = interface(JObjectClass)
  ['{8C02513B-D4FF-49B0-A092-92AAA5D42927}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineResource')]
  JEngineResource = interface(JObject)
  ['{B961D43A-1F8E-4E97-B1F5-6036BEC568C5}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function get: JObject; cdecl; //()Ljava/lang/Object;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJEngineResource = class(TJavaGenericImport<JEngineResourceClass, JEngineResource>) end;

  JGlideExecutor_DefaultThreadFactoryClass = interface(JObjectClass)
  ['{448C017E-0F3D-4022-9319-4B3029CF3428}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory')]
  JGlideExecutor_DefaultThreadFactory = interface(JObject)
  ['{B1A99E4E-6488-45EE-B4E1-2F94CD1259E2}']
    { Property Methods }

    { methods }
    function newThread(runnable: JRunnable): JThread; cdecl; //(Ljava/lang/Runnable;)Ljava/lang/Thread;

    { Property }
  end;

  TJGlideExecutor_DefaultThreadFactory = class(TJavaGenericImport<JGlideExecutor_DefaultThreadFactoryClass, JGlideExecutor_DefaultThreadFactory>) end;

  JGlideExecutor_UncaughtThrowableStrategyClass = interface(JObjectClass)
  ['{2C44CA78-0078-43E5-9CF0-9C0CA5D4A02E}']
    { static Property Methods }
    {class} function _GetIGNORE: JGlideExecutor_UncaughtThrowableStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;
    {class} function _GetLOG: JGlideExecutor_UncaughtThrowableStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;
    {class} function _GetTHROW: JGlideExecutor_UncaughtThrowableStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;
    {class} function _GetDEFAULT: JGlideExecutor_UncaughtThrowableStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;

    { static Methods }

    { static Property }
    {class} property IGNORE: JGlideExecutor_UncaughtThrowableStrategy read _GetIGNORE;
    {class} property LOG: JGlideExecutor_UncaughtThrowableStrategy read _GetLOG;
    {class} property THROW: JGlideExecutor_UncaughtThrowableStrategy read _GetTHROW;
    {class} property DEFAULT: JGlideExecutor_UncaughtThrowableStrategy read _GetDEFAULT;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy')]
  JGlideExecutor_UncaughtThrowableStrategy = interface(IJavaInstance)
  ['{F8DDE2BC-E410-460E-98E2-545BB5C5F8EA}']
    { Property Methods }

    { methods }
    procedure handle(P1: JThrowable); cdecl; //(Ljava/lang/Throwable;)V

    { Property }
  end;

  TJGlideExecutor_UncaughtThrowableStrategy = class(TJavaGenericImport<JGlideExecutor_UncaughtThrowableStrategyClass, JGlideExecutor_UncaughtThrowableStrategy>) end;

  JGlideExecutorClass = interface(JObjectClass)
  ['{32F19DBB-CAFB-4F66-A57A-977F8B795BB4}']
    { static Property Methods }

    { static Methods }
    {class} function newDiskCacheExecutor: JGlideExecutor; cdecl; overload; //()Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function newDiskCacheExecutor(uncaughtThrowableStrategy: JGlideExecutor_UncaughtThrowableStrategy): JGlideExecutor; cdecl; overload; //(Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;)Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function newDiskCacheExecutor(threadCount: Integer; name: JString; uncaughtThrowableStrategy: JGlideExecutor_UncaughtThrowableStrategy): JGlideExecutor; cdecl; overload; //(ILjava/lang/String;Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;)Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function newSourceExecutor: JGlideExecutor; cdecl; overload; //()Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function newSourceExecutor(uncaughtThrowableStrategy: JGlideExecutor_UncaughtThrowableStrategy): JGlideExecutor; cdecl; overload; //(Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;)Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function newSourceExecutor(threadCount: Integer; name: JString; uncaughtThrowableStrategy: JGlideExecutor_UncaughtThrowableStrategy): JGlideExecutor; cdecl; overload; //(ILjava/lang/String;Lcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;)Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function newUnlimitedSourceExecutor: JGlideExecutor; cdecl; //()Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function newAnimationExecutor: JGlideExecutor; cdecl; overload; //()Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function newAnimationExecutor(threadCount: Integer; uncaughtThrowableStrategy: JGlideExecutor_UncaughtThrowableStrategy): JGlideExecutor; cdecl; overload; //(ILcom/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy;)Lcom/bumptech/glide/load/engine/executor/GlideExecutor;
    {class} function calculateBestThreadCount: Integer; cdecl; //()I

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor')]
  JGlideExecutor = interface(JObject)
  ['{7605128D-6523-4CE8-B3FD-0AE767FD6F24}']
    { Property Methods }

    { methods }
    procedure execute(command: JRunnable); cdecl; //(Ljava/lang/Runnable;)V
    function submit(task: JRunnable): JFuture; cdecl; overload; //(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;
    function invokeAll(tasks: JCollection): JList; cdecl; overload; //(Ljava/util/Collection;)Ljava/util/List;
    function invokeAll(tasks: JCollection; P2: Int64; timeout: JTimeUnit): JList; cdecl; overload; //(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/util/List;
    function invokeAny(tasks: JCollection): JObject; cdecl; overload; //(Ljava/util/Collection;)Ljava/lang/Object;
    function invokeAny(tasks: JCollection; P2: Int64; timeout: JTimeUnit): JObject; cdecl; overload; //(Ljava/util/Collection;JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    function submit(task: JRunnable; result: JObject): JFuture; cdecl; overload; //(Ljava/lang/Runnable;Ljava/lang/Object;)Ljava/util/concurrent/Future;
    function submit(task: JCallable): JFuture; cdecl; overload; //(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;
    procedure shutdown; cdecl; //()V
    function shutdownNow: JList; cdecl; //()Ljava/util/List;
    function isShutdown: Boolean; cdecl; //()Z
    function isTerminated: Boolean; cdecl; //()Z
    function awaitTermination(timeout: Int64; P2: JTimeUnit): Boolean; cdecl; //(JLjava/util/concurrent/TimeUnit;)Z
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJGlideExecutor = class(TJavaGenericImport<JGlideExecutorClass, JGlideExecutor>) end;

  JRuntimeCompatClass = interface(JObjectClass)
  ['{FA3AD110-B3A9-483F-AE4F-ACCAB9DB1316}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/executor/RuntimeCompat')]
  JRuntimeCompat = interface(JObject)
  ['{E26EACB8-5143-4A87-9B31-8962A34920BB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRuntimeCompat = class(TJavaGenericImport<JRuntimeCompatClass, JRuntimeCompat>) end;

  JGlideException_IndentedAppendableClass = interface(JObjectClass)
  ['{1EBCB9A5-4810-443E-9643-725C29F7DBF6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/GlideException$IndentedAppendable')]
  JGlideException_IndentedAppendable = interface(JObject)
  ['{9150E5E2-81DB-4D2F-89C2-0EF0E814370C}']
    { Property Methods }

    { methods }
    function append(c: Char): JAppendable; cdecl; overload; //(C)Ljava/lang/Appendable;
    function append(charSequence: JCharSequence): JAppendable; cdecl; overload; //(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    function append(charSequence: JCharSequence; start: Integer; aend: Integer): JAppendable; cdecl; overload; //(Ljava/lang/CharSequence;II)Ljava/lang/Appendable;

    { Property }
  end;

  TJGlideException_IndentedAppendable = class(TJavaGenericImport<JGlideException_IndentedAppendableClass, JGlideException_IndentedAppendable>) end;

  JGlideExceptionClass = interface(JExceptionClass) // or JObjectClass // SuperSignature: java/lang/Exception
  ['{F4C8AA93-9CB9-4DF7-B44D-C18A7608348F}']
    { static Property Methods }

    { static Methods }
    {class} function init(amessage: JString): JGlideException; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(detailMessage: JString; cause: JThrowable): JGlideException; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Throwable;)V
    {class} function init(detailMessage: JString; causes: JList): JGlideException; cdecl; overload; //(Ljava/lang/String;Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/GlideException')]
  JGlideException = interface(JException) // or JObject // SuperSignature: java/lang/Exception
  ['{6A3D16EB-F9D2-4331-B5EE-4D6616D4E3C6}']
    { Property Methods }

    { methods }
    function fillInStackTrace: JThrowable; cdecl; //()Ljava/lang/Throwable;
    function getCauses: JList; cdecl; //()Ljava/util/List;
    function getRootCauses: JList; cdecl; //()Ljava/util/List;
    procedure logRootCauses(tag: JString); cdecl; //(Ljava/lang/String;)V
    procedure printStackTrace; cdecl; overload; //()V
    procedure printStackTrace(err: JPrintStream); cdecl; overload; //(Ljava/io/PrintStream;)V
    procedure printStackTrace(err: JPrintWriter); cdecl; overload; //(Ljava/io/PrintWriter;)V
    function getMessage: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJGlideException = class(TJavaGenericImport<JGlideExceptionClass, JGlideException>) end;

  JInitializableClass = interface(JObjectClass)
  ['{1488BA59-5AC7-4E36-8A49-A86BC4F9F06F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Initializable')]
  JInitializable = interface(IJavaInstance)
  ['{F8169BE8-CBD9-466B-ACEC-178295A0F2DA}']
    { Property Methods }

    { methods }
    procedure initialize; cdecl; //()V

    { Property }
  end;

  TJInitializable = class(TJavaGenericImport<JInitializableClass, JInitializable>) end;

  JJobsClass = interface(JObjectClass)
  ['{0B666394-064F-4538-AE7B-AD0138D07D0F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Jobs')]
  JJobs = interface(JObject)
  ['{B1937853-2927-458D-B768-7334B6B60C00}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJJobs = class(TJavaGenericImport<JJobsClass, JJobs>) end;

  JLoadPathClass = interface(JObjectClass)
  ['{C97327C4-C1E2-454B-A98A-ECC8A51B289F}']
    { static Property Methods }

    { static Methods }
//    {class} function init(dataClass: Jlang_Class; resourceClass: Jlang_Class; transcodeClass: Jlang_Class; decodePaths: JList; listPool: JPools_Pool): JLoadPath; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Ljava/util/List;Landroid/support/v4/util/Pools$Pool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/LoadPath')]
  JLoadPath = interface(JObject)
  ['{63F522DC-42A4-4A2E-B6F5-0E75C0D13F5A}']
    { Property Methods }

    { methods }
    function load(rewinder: JDataRewinder; options: JOptions; width: Integer; height: Integer; decodeCallback: JDecodePath_DecodeCallback): JResource; cdecl; //(Lcom/bumptech/glide/load/data/DataRewinder;Lcom/bumptech/glide/load/Options;IILcom/bumptech/glide/load/engine/DecodePath$DecodeCallback;)Lcom/bumptech/glide/load/engine/Resource;
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLoadPath = class(TJavaGenericImport<JLoadPathClass, JLoadPath>) end;

  JLockedResourceClass = interface(JObjectClass)
  ['{3D6CF88F-F16D-4786-93BC-86802DC424BB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/LockedResource')]
  JLockedResource = interface(JObject)
  ['{670EFFC9-6689-4CFD-9398-3254FF6C8079}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function get: JObject; cdecl; //()Ljava/lang/Object;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V
    function getVerifier: JStateVerifier; cdecl; //()Lcom/bumptech/glide/util/pool/StateVerifier;

    { Property }
  end;

  TJLockedResource = class(TJavaGenericImport<JLockedResourceClass, JLockedResource>) end;

  JBitmapPreFillerClass = interface(JObjectClass)
  ['{83E66C61-164E-44E3-A4DC-AC0F766436A5}']
    { static Property Methods }

    { static Methods }
    {class} function init(memoryCache: JMemoryCache; bitmapPool: JBitmapPool; defaultFormat: JDecodeFormat): JBitmapPreFiller; cdecl; //(Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/DecodeFormat;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/BitmapPreFiller')]
  JBitmapPreFiller = interface(JObject)
  ['{75AF1AA3-904B-4766-B221-1CA73E48C105}']
    { Property Methods }

    { methods }
    procedure preFill(bitmapAttributeBuilders: TJavaObjectArray<JPreFillType_Builder>); cdecl; //([Lcom/bumptech/glide/load/engine/prefill/PreFillType$Builder;)V

    { Property }
  end;

  TJBitmapPreFiller = class(TJavaGenericImport<JBitmapPreFillerClass, JBitmapPreFiller>) end;

  JBitmapPreFillRunner_ClockClass = interface(JObjectClass)
  ['{157A5E8C-EEC1-4FB2-BA80-2224C06E60B1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/BitmapPreFillRunner$Clock')]
  JBitmapPreFillRunner_Clock = interface(JObject)
  ['{ED77EAC2-1E6A-4069-9557-B74C458048FE}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapPreFillRunner_Clock = class(TJavaGenericImport<JBitmapPreFillRunner_ClockClass, JBitmapPreFillRunner_Clock>) end;

  JBitmapPreFillRunner_UniqueKeyClass = interface(JObjectClass)
  ['{E5EFE60F-1C81-4F1F-8260-62B9C1E35B5A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/BitmapPreFillRunner$UniqueKey')]
  JBitmapPreFillRunner_UniqueKey = interface(JObject)
  ['{57E4205E-0AF0-422E-9275-39E2F6D90E46}']
    { Property Methods }

    { methods }
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJBitmapPreFillRunner_UniqueKey = class(TJavaGenericImport<JBitmapPreFillRunner_UniqueKeyClass, JBitmapPreFillRunner_UniqueKey>) end;

  JBitmapPreFillRunnerClass = interface(JObjectClass)
  ['{74C8CBA9-EA47-41FD-99A8-B67510110AB5}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool; memoryCache: JMemoryCache; allocationOrder: JPreFillQueue): JBitmapPreFillRunner; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/cache/MemoryCache;Lcom/bumptech/glide/load/engine/prefill/PreFillQueue;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/BitmapPreFillRunner')]
  JBitmapPreFillRunner = interface(JObject)
  ['{BD37C148-CEEE-4EE1-BE46-EBD828EE5E96}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl; //()V
    procedure run; cdecl; //()V

    { Property }
  end;

  TJBitmapPreFillRunner = class(TJavaGenericImport<JBitmapPreFillRunnerClass, JBitmapPreFillRunner>) end;

  JPreFillQueueClass = interface(JObjectClass)
  ['{F7338991-B702-4CAD-A916-08F66DAB32F8}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapsPerType: JMap): JPreFillQueue; cdecl; //(Ljava/util/Map;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/PreFillQueue')]
  JPreFillQueue = interface(JObject)
  ['{38652799-E1B3-45B0-A78A-0FB2B4AD6AE0}']
    { Property Methods }

    { methods }
    function remove: JPreFillType; cdecl; //()Lcom/bumptech/glide/load/engine/prefill/PreFillType;
    function getSize: Integer; cdecl; //()I
    function isEmpty: Boolean; cdecl; //()Z

    { Property }
  end;

  TJPreFillQueue = class(TJavaGenericImport<JPreFillQueueClass, JPreFillQueue>) end;

  JPreFillType_BuilderClass = interface(JObjectClass)
  ['{1198598F-D119-457C-9DD5-D1A452B0846C}']
    { static Property Methods }

    { static Methods }
    {class} function init(size: Integer): JPreFillType_Builder; cdecl; overload; //(I)V
    {class} function init(width: Integer; height: Integer): JPreFillType_Builder; cdecl; overload; //(II)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/PreFillType$Builder')]
  JPreFillType_Builder = interface(JObject)
  ['{08FC019E-558B-4CEA-B9DF-6B240D4EE54E}']
    { Property Methods }

    { methods }
    function setConfig(config: JBitmap_Config): JPreFillType_Builder; cdecl; //(Landroid/graphics/Bitmap$Config;)Lcom/bumptech/glide/load/engine/prefill/PreFillType$Builder;
    function setWeight(weight: Integer): JPreFillType_Builder; cdecl; //(I)Lcom/bumptech/glide/load/engine/prefill/PreFillType$Builder;

    { Property }
  end;

  TJPreFillType_Builder = class(TJavaGenericImport<JPreFillType_BuilderClass, JPreFillType_Builder>) end;

  JPreFillTypeClass = interface(JObjectClass)
  ['{7A04869E-6681-4500-8A5B-1F4354102C61}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/PreFillType')]
  JPreFillType = interface(JObject)
  ['{E96ABB35-3339-4378-94CB-AC533256BFC4}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJPreFillType = class(TJavaGenericImport<JPreFillTypeClass, JPreFillType>) end;

  JResourceClass = interface(JObjectClass)
  ['{BDF5EEC7-814D-4E4E-AF8C-26F50C545DB6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Resource')]
  JResource = interface(IJavaInstance)
  ['{F3E2D7CC-0205-463B-8954-FA8924EE9DA2}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function get: JObject; cdecl; //()Ljava/lang/Object;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V

    { Property }
  end;

  TJResource = class(TJavaGenericImport<JResourceClass, JResource>) end;

  JResourceCacheGeneratorClass = interface(JObjectClass)
  ['{C101FF9F-6E3C-4551-8976-865754BF8DAC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ResourceCacheGenerator')]
  JResourceCacheGenerator = interface(JObject)
  ['{0F882308-9592-4D6E-A6B3-380C9F89BE70}']
    { Property Methods }

    { methods }
    function startNext: Boolean; cdecl; //()Z
    procedure cancel; cdecl; //()V
    procedure onDataReady(data: JObject); cdecl; //(Ljava/lang/Object;)V
    procedure onLoadFailed(e: JException); cdecl; //(Ljava/lang/Exception;)V

    { Property }
  end;

  TJResourceCacheGenerator = class(TJavaGenericImport<JResourceCacheGeneratorClass, JResourceCacheGenerator>) end;

  JResourceCacheKeyClass = interface(JObjectClass)
  ['{764C0499-C6BD-4977-8389-343C17A5B225}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ResourceCacheKey')]
  JResourceCacheKey = interface(JObject)
  ['{1C11E15C-B5D5-43E9-B277-6AB206FB6A53}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJResourceCacheKey = class(TJavaGenericImport<JResourceCacheKeyClass, JResourceCacheKey>) end;

  JResourceRecycler_ResourceRecyclerCallbackClass = interface(JObjectClass)
  ['{D5B9972A-7B07-4D50-BDFE-C49058AECA31}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ResourceRecycler$ResourceRecyclerCallback')]
  JResourceRecycler_ResourceRecyclerCallback = interface(JObject)
  ['{CA892277-5B38-4E24-B988-CB94BAE00BD6}']
    { Property Methods }

    { methods }
    function handleMessage(amessage: JMessage): Boolean; cdecl; //(Landroid/os/Message;)Z

    { Property }
  end;

  TJResourceRecycler_ResourceRecyclerCallback = class(TJavaGenericImport<JResourceRecycler_ResourceRecyclerCallbackClass, JResourceRecycler_ResourceRecyclerCallback>) end;

  JResourceRecyclerClass = interface(JObjectClass)
  ['{CA0441BE-0135-463D-BE13-95B4E4880674}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ResourceRecycler')]
  JResourceRecycler = interface(JObject)
  ['{89CC9808-1CEE-4CD9-ACC5-4492F012EE74}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJResourceRecycler = class(TJavaGenericImport<JResourceRecyclerClass, JResourceRecycler>) end;

  JSourceGeneratorClass = interface(JObjectClass)
  ['{AC3257DE-981D-4B6D-95D4-8DEE6F5F7934}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/SourceGenerator')]
  JSourceGenerator = interface(JObject)
  ['{569EC883-121B-480A-8325-1F6E7B730AF6}']
    { Property Methods }

    { methods }
    function startNext: Boolean; cdecl; //()Z
    procedure cancel; cdecl; //()V
    procedure onDataReady(data: JObject); cdecl; //(Ljava/lang/Object;)V
    procedure onLoadFailed(e: JException); cdecl; //(Ljava/lang/Exception;)V
    procedure reschedule; cdecl; //()V
    procedure onDataFetcherReady(sourceKey: JKey; data: JObject; fetcher: JDataFetcher; P4: JDataSource; attemptedKey: JKey); cdecl; //(Lcom/bumptech/glide/load/Key;Ljava/lang/Object;Lcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/load/DataSource;Lcom/bumptech/glide/load/Key;)V
    procedure onDataFetcherFailed(sourceKey: JKey; e: JException; fetcher: JDataFetcher; P4: JDataSource); cdecl; //(Lcom/bumptech/glide/load/Key;Ljava/lang/Exception;Lcom/bumptech/glide/load/data/DataFetcher;Lcom/bumptech/glide/load/DataSource;)V

    { Property }
  end;

  TJSourceGenerator = class(TJavaGenericImport<JSourceGeneratorClass, JSourceGenerator>) end;

  JHttpExceptionClass = interface(JIOExceptionClass) // or JObjectClass // SuperSignature: java/io/IOException
  ['{8070261F-B319-4A09-A1C3-B13C73A9E52B}']
    { static Property Methods }
    {class} function _GetUNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
    {class} function init(statusCode: Integer): JHttpException; cdecl; overload; //(I)V
    {class} function init(amessage: JString): JHttpException; cdecl; overload; //(Ljava/lang/String;)V
    {class} function init(amessage: JString; statusCode: Integer): JHttpException; cdecl; overload; //(Ljava/lang/String;I)V
    {class} function init(amessage: JString; statusCode: Integer; cause: JThrowable): JHttpException; cdecl; overload; //(Ljava/lang/String;ILjava/lang/Throwable;)V

    { static Property }
    {class} property UNKNOWN: Integer read _GetUNKNOWN;
  end;

  [JavaSignature('com/bumptech/glide/load/HttpException')]
  JHttpException = interface(JIOException) // or JObject // SuperSignature: java/io/IOException
  ['{14320F0D-5502-46EB-BB52-922A08587C0A}']
    { Property Methods }

    { methods }
    function getStatusCode: Integer; cdecl; //()I

    { Property }
  end;

  TJHttpException = class(TJavaGenericImport<JHttpExceptionClass, JHttpException>) end;

  JImageHeaderParser_ImageTypeClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{1169C61B-84AE-4BE8-89AB-DA56DDE88BFB}']
    { static Property Methods }
    {class} function _GetGIF: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function _GetJPEG: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function _GetRAW: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function _GetPNG_A: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function _GetPNG: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function _GetWEBP_A: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function _GetWEBP: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function _GetUNKNOWN: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    { static Methods }
    {class} function values: TJavaObjectArray<JImageHeaderParser_ImageType>; cdecl; //()[Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function valueOf(name: JString): JImageHeaderParser_ImageType; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;

    { static Property }
    {class} property GIF: JImageHeaderParser_ImageType read _GetGIF;
    {class} property JPEG: JImageHeaderParser_ImageType read _GetJPEG;
    {class} property RAW: JImageHeaderParser_ImageType read _GetRAW;
    {class} property PNG_A: JImageHeaderParser_ImageType read _GetPNG_A;
    {class} property PNG: JImageHeaderParser_ImageType read _GetPNG;
    {class} property WEBP_A: JImageHeaderParser_ImageType read _GetWEBP_A;
    {class} property WEBP: JImageHeaderParser_ImageType read _GetWEBP;
    {class} property UNKNOWN: JImageHeaderParser_ImageType read _GetUNKNOWN;
  end;

  [JavaSignature('com/bumptech/glide/load/ImageHeaderParser$ImageType')]
  JImageHeaderParser_ImageType = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{AEF9A4D0-38D4-45CB-8685-22F0CEF74900}']
    { Property Methods }

    { methods }
    function hasAlpha: Boolean; cdecl; //()Z

    { Property }
  end;

  TJImageHeaderParser_ImageType = class(TJavaGenericImport<JImageHeaderParser_ImageTypeClass, JImageHeaderParser_ImageType>) end;

  JImageHeaderParserClass = interface(JObjectClass)
  ['{4A1D7439-2EC5-407E-A882-C686B8FF84B9}']
    { static Property Methods }
    {class} function _GetUNKNOWN_ORIENTATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }

    { static Property }
    {class} property UNKNOWN_ORIENTATION: Integer read _GetUNKNOWN_ORIENTATION;
  end;

  [JavaSignature('com/bumptech/glide/load/ImageHeaderParser')]
  JImageHeaderParser = interface(IJavaInstance)
  ['{85E7A37B-56E3-4E91-B799-B86764A92FB2}']
    { Property Methods }

    { methods }
    function getType(P1: JInputStream): JImageHeaderParser_ImageType; cdecl; overload; //(Ljava/io/InputStream;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    function getType(P1: JByteBuffer): JImageHeaderParser_ImageType; cdecl; overload; //(Ljava/nio/ByteBuffer;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    function getOrientation(P1: JInputStream; P2: JArrayPool): Integer; cdecl; overload; //(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)I
    function getOrientation(P1: JByteBuffer; P2: JArrayPool): Integer; cdecl; overload; //(Ljava/nio/ByteBuffer;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)I

    { Property }
  end;

  TJImageHeaderParser = class(TJavaGenericImport<JImageHeaderParserClass, JImageHeaderParser>) end;

  JImageHeaderParserUtilsClass = interface(JObjectClass)
  ['{B1C2DCCE-A90A-42CF-B89A-B40460EF1CBD}']
    { static Property Methods }

    { static Methods }
    {class} function getType(parsers: JList; ais: JInputStream; byteArrayPool: JArrayPool): JImageHeaderParser_ImageType; cdecl; overload; //(Ljava/util/List;Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function getType(parsers: JList; buffer: JByteBuffer): JImageHeaderParser_ImageType; cdecl; overload; //(Ljava/util/List;Ljava/nio/ByteBuffer;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    {class} function getOrientation(parsers: JList; ais: JInputStream; byteArrayPool: JArrayPool): Integer; cdecl; //(Ljava/util/List;Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)I

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/ImageHeaderParserUtils')]
  JImageHeaderParserUtils = interface(JObject)
  ['{0729FD10-1045-40B0-91C1-4FAB29A6AAEA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJImageHeaderParserUtils = class(TJavaGenericImport<JImageHeaderParserUtilsClass, JImageHeaderParserUtils>) end;

  JKeyClass = interface(JObjectClass)
  ['{F6D5E433-BD3C-4A81-9E2D-6F8F2776449A}']
    { static Property Methods }
    {class} function _GetSTRING_CHARSET_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetCHARSET: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/nio/charset/Charset;

    { static Methods }

    { static Property }
    {class} property STRING_CHARSET_NAME: JString read _GetSTRING_CHARSET_NAME;
    {class} property CHARSET: JCharset read _GetCHARSET;
  end;

  [JavaSignature('com/bumptech/glide/load/Key')]
  JKey = interface(IJavaInstance)
  ['{946F2961-45AD-4377-B220-136211FBCAA1}']
    { Property Methods }

    { methods }
//    procedure updateDiskCacheKey(P1: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V
    function equals(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJKey = class(TJavaGenericImport<JKeyClass, JKey>) end;

  JAssetUriLoader_AssetFetcherFactoryClass = interface(JObjectClass)
  ['{6FA30BB3-5F5E-4ED9-9316-14570157D9C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory')]
  JAssetUriLoader_AssetFetcherFactory = interface(IJavaInstance)
  ['{46B36264-F7BB-43E1-8B7D-7D409C046A44}']
    { Property Methods }

    { methods }
    function buildFetcher(P1: JAssetManager; P2: JString): JDataFetcher; cdecl; //(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/bumptech/glide/load/data/DataFetcher;

    { Property }
  end;

  TJAssetUriLoader_AssetFetcherFactory = class(TJavaGenericImport<JAssetUriLoader_AssetFetcherFactoryClass, JAssetUriLoader_AssetFetcherFactory>) end;

  JAssetUriLoader_FileDescriptorFactoryClass = interface(JObjectClass)
  ['{478F2F84-9C4C-48B4-BB76-C34236A83D83}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager): JAssetUriLoader_FileDescriptorFactory; cdecl; //(Landroid/content/res/AssetManager;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/AssetUriLoader$FileDescriptorFactory')]
  JAssetUriLoader_FileDescriptorFactory = interface(JObject)
  ['{06D43092-0614-4ECF-8E00-CD66CF00B2D5}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V
    function buildFetcher(assetManager: JAssetManager; assetPath: JString): JDataFetcher; cdecl; //(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/bumptech/glide/load/data/DataFetcher;

    { Property }
  end;

  TJAssetUriLoader_FileDescriptorFactory = class(TJavaGenericImport<JAssetUriLoader_FileDescriptorFactoryClass, JAssetUriLoader_FileDescriptorFactory>) end;

  JAssetUriLoader_StreamFactoryClass = interface(JObjectClass)
  ['{33C5E24C-2198-43A7-AF2A-702B69754C4D}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager): JAssetUriLoader_StreamFactory; cdecl; //(Landroid/content/res/AssetManager;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/AssetUriLoader$StreamFactory')]
  JAssetUriLoader_StreamFactory = interface(JObject)
  ['{FC3D9CDA-59CD-4720-B32B-07467785458D}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V
    function buildFetcher(assetManager: JAssetManager; assetPath: JString): JDataFetcher; cdecl; //(Landroid/content/res/AssetManager;Ljava/lang/String;)Lcom/bumptech/glide/load/data/DataFetcher;

    { Property }
  end;

  TJAssetUriLoader_StreamFactory = class(TJavaGenericImport<JAssetUriLoader_StreamFactoryClass, JAssetUriLoader_StreamFactory>) end;

  JAssetUriLoaderClass = interface(JObjectClass)
  ['{2226E6A7-21EA-4DF4-944A-B7F2F30ED793}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager; factory: JAssetUriLoader_AssetFetcherFactory): JAssetUriLoader; cdecl; //(Landroid/content/res/AssetManager;Lcom/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/AssetUriLoader')]
  JAssetUriLoader = interface(JObject)
  ['{9411FC69-8C38-4982-B66F-31F5433A303D}']
    { Property Methods }

    { methods }
    function buildLoadData(model: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: Jnet_Uri): Boolean; cdecl; overload; //(Landroid/net/Uri;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJAssetUriLoader = class(TJavaGenericImport<JAssetUriLoaderClass, JAssetUriLoader>) end;

  JByteArrayLoader_ByteBufferFactoryClass = interface(JObjectClass)
  ['{FED54795-1990-428D-8454-A7EDA3402DD1}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteArrayLoader_ByteBufferFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$ByteBufferFactory')]
  JByteArrayLoader_ByteBufferFactory = interface(JObject)
  ['{4CEF9DFA-3F4B-494B-A706-21F5EB649178}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJByteArrayLoader_ByteBufferFactory = class(TJavaGenericImport<JByteArrayLoader_ByteBufferFactoryClass, JByteArrayLoader_ByteBufferFactory>) end;

  JByteArrayLoader_ConverterClass = interface(JObjectClass)
  ['{3F508114-CFE6-4548-811A-0A7B41C5E15C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$Converter')]
  JByteArrayLoader_Converter = interface(IJavaInstance)
  ['{FCB4A978-BC23-40FD-B0ED-9E89DC17B75B}']
    { Property Methods }

    { methods }
    function convert(P1: TJavaArray<Byte>): JObject; cdecl; //([B)Ljava/lang/Object;
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJByteArrayLoader_Converter = class(TJavaGenericImport<JByteArrayLoader_ConverterClass, JByteArrayLoader_Converter>) end;

  JByteArrayLoader_FetcherClass = interface(JObjectClass)
  ['{880ED5F6-E076-4E31-A3DD-6D6DD1923D65}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$Fetcher')]
  JByteArrayLoader_Fetcher = interface(JObject)
  ['{A0FE8018-196F-4604-81FB-CC46A12F8700}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJByteArrayLoader_Fetcher = class(TJavaGenericImport<JByteArrayLoader_FetcherClass, JByteArrayLoader_Fetcher>) end;

  JByteArrayLoader_StreamFactoryClass = interface(JObjectClass)
  ['{EED29E21-8F94-4F44-9396-D52D15B03821}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteArrayLoader_StreamFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$StreamFactory')]
  JByteArrayLoader_StreamFactory = interface(JObject)
  ['{65AFB166-0FB2-4C09-9477-D0403BADAFBC}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJByteArrayLoader_StreamFactory = class(TJavaGenericImport<JByteArrayLoader_StreamFactoryClass, JByteArrayLoader_StreamFactory>) end;

  JByteArrayLoaderClass = interface(JObjectClass)
  ['{C1F03BDF-BFF8-4179-96ED-AC06D15BA23C}']
    { static Property Methods }

    { static Methods }
    {class} function init(converter: JByteArrayLoader_Converter): JByteArrayLoader; cdecl; //(Lcom/bumptech/glide/load/model/ByteArrayLoader$Converter;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader')]
  JByteArrayLoader = interface(JObject)
  ['{CCEE6844-6365-4026-B5F4-3B0F67E531F7}']
    { Property Methods }

    { methods }
    function buildLoadData(model: TJavaArray<Byte>; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //([BIILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: TJavaArray<Byte>): Boolean; cdecl; overload; //([B)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJByteArrayLoader = class(TJavaGenericImport<JByteArrayLoaderClass, JByteArrayLoader>) end;

  JByteBufferEncoderClass = interface(JObjectClass)
  ['{A6611703-5002-453F-84AD-D7754F5A7C79}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteBufferEncoder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteBufferEncoder')]
  JByteBufferEncoder = interface(JObject)
  ['{3B31F1A7-4F4C-4B43-8312-4757992B4842}']
    { Property Methods }

    { methods }
    function encode(data: JByteBuffer; afile: JFile; options: JOptions): Boolean; cdecl; overload; //(Ljava/nio/ByteBuffer;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJByteBufferEncoder = class(TJavaGenericImport<JByteBufferEncoderClass, JByteBufferEncoder>) end;

  JByteBufferFileLoader_ByteBufferFetcherClass = interface(JObjectClass)
  ['{3E45194C-E101-432B-ACC0-F1D1C73D7B5F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteBufferFileLoader$ByteBufferFetcher')]
  JByteBufferFileLoader_ByteBufferFetcher = interface(JObject)
  ['{CA15782C-8451-467B-A10B-1590C1F17EC6}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJByteBufferFileLoader_ByteBufferFetcher = class(TJavaGenericImport<JByteBufferFileLoader_ByteBufferFetcherClass, JByteBufferFileLoader_ByteBufferFetcher>) end;

  JByteBufferFileLoader_FactoryClass = interface(JObjectClass)
  ['{6B8B9AFE-C099-4F1B-B668-9F24E6D2EC27}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteBufferFileLoader_Factory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteBufferFileLoader$Factory')]
  JByteBufferFileLoader_Factory = interface(JObject)
  ['{7B973216-77C6-48CD-8318-D4B32CC772B8}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJByteBufferFileLoader_Factory = class(TJavaGenericImport<JByteBufferFileLoader_FactoryClass, JByteBufferFileLoader_Factory>) end;

  JByteBufferFileLoaderClass = interface(JObjectClass)
  ['{9C3B1035-35D3-4355-A52D-B508EDA5CBE7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteBufferFileLoader; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteBufferFileLoader')]
  JByteBufferFileLoader = interface(JObject)
  ['{BA88DFDA-CA5E-46FD-8E8C-85F90461F67C}']
    { Property Methods }

    { methods }
    function buildLoadData(afile: JFile; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/io/File;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(afile: JFile): Boolean; cdecl; overload; //(Ljava/io/File;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJByteBufferFileLoader = class(TJavaGenericImport<JByteBufferFileLoaderClass, JByteBufferFileLoader>) end;

  JDataUrlLoader_DataDecoderClass = interface(JObjectClass)
  ['{4DFE0D30-BEFD-488E-AEB3-3FC844989D5A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader$DataDecoder')]
  JDataUrlLoader_DataDecoder = interface(IJavaInstance)
  ['{BAF9D9BA-C886-4707-A5B0-2F978CDCEBB9}']
    { Property Methods }

    { methods }
    function decode(P1: JString): JObject; cdecl; //(Ljava/lang/String;)Ljava/lang/Object;
    procedure close(P1: JObject); cdecl; //(Ljava/lang/Object;)V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJDataUrlLoader_DataDecoder = class(TJavaGenericImport<JDataUrlLoader_DataDecoderClass, JDataUrlLoader_DataDecoder>) end;

  JDataUrlLoader_DataUriFetcherClass = interface(JObjectClass)
  ['{162EB8BA-5775-45DB-9587-A132FE8A5AB9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher')]
  JDataUrlLoader_DataUriFetcher = interface(JObject)
  ['{77F11E6F-7C29-42BD-9FF6-F7F904A0C6CC}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJDataUrlLoader_DataUriFetcher = class(TJavaGenericImport<JDataUrlLoader_DataUriFetcherClass, JDataUrlLoader_DataUriFetcher>) end;

  JDataUrlLoader_StreamFactoryClass = interface(JObjectClass)
  ['{540C1A9A-8E03-4B5C-9EFB-CFE66DB793A4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataUrlLoader_StreamFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader$StreamFactory')]
  JDataUrlLoader_StreamFactory = interface(JObject)
  ['{5B320EDE-85BC-42D7-8294-B2C3174E6DE3}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJDataUrlLoader_StreamFactory = class(TJavaGenericImport<JDataUrlLoader_StreamFactoryClass, JDataUrlLoader_StreamFactory>) end;

  JDataUrlLoaderClass = interface(JObjectClass)
  ['{160DE04F-481E-4F32-9CF9-530DA143BB25}']
    { static Property Methods }

    { static Methods }
    {class} function init(dataDecoder: JDataUrlLoader_DataDecoder): JDataUrlLoader; cdecl; //(Lcom/bumptech/glide/load/model/DataUrlLoader$DataDecoder;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader')]
  JDataUrlLoader = interface(JObject)
  ['{DEDDCED6-5EBA-4F23-B3F1-3C252634DE07}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJDataUrlLoader = class(TJavaGenericImport<JDataUrlLoaderClass, JDataUrlLoader>) end;

  JFileLoader_FactoryClass = interface(JObjectClass)
  ['{2A348B27-D9DD-4FCF-8C28-1D3B479978F5}']
    { static Property Methods }

    { static Methods }
    {class} function init(opener: JFileLoader_FileOpener): JFileLoader_Factory; cdecl; //(Lcom/bumptech/glide/load/model/FileLoader$FileOpener;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$Factory')]
  JFileLoader_Factory = interface(JObject)
  ['{37CC0408-BF0A-4915-BC83-DFC4B897F6FF}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJFileLoader_Factory = class(TJavaGenericImport<JFileLoader_FactoryClass, JFileLoader_Factory>) end;

  JFileLoader_FileDescriptorFactoryClass = interface(JFileLoader_FactoryClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/model/FileLoader$Factory
  ['{7B5B9295-12A1-417E-8113-0AFBA2E3F9EA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileLoader_FileDescriptorFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$FileDescriptorFactory')]
  JFileLoader_FileDescriptorFactory = interface(JFileLoader_Factory) // or JObject // SuperSignature: com/bumptech/glide/load/model/FileLoader$Factory
  ['{2A40EE4F-87F8-4A2D-8B37-6D3B72B51D7C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileLoader_FileDescriptorFactory = class(TJavaGenericImport<JFileLoader_FileDescriptorFactoryClass, JFileLoader_FileDescriptorFactory>) end;

  JFileLoader_FileFetcherClass = interface(JObjectClass)
  ['{EA87DDE8-AF26-4A75-B785-5A7D6FAC576E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$FileFetcher')]
  JFileLoader_FileFetcher = interface(JObject)
  ['{75638AEB-8D3C-44CA-A120-454DA2884488}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJFileLoader_FileFetcher = class(TJavaGenericImport<JFileLoader_FileFetcherClass, JFileLoader_FileFetcher>) end;

  JFileLoader_FileOpenerClass = interface(JObjectClass)
  ['{6365FC7A-B0E5-4705-8645-EC9319023683}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$FileOpener')]
  JFileLoader_FileOpener = interface(IJavaInstance)
  ['{D11BF978-EFE1-4DD6-9F47-6E4A6249A517}']
    { Property Methods }

    { methods }
    function open(P1: JFile): JObject; cdecl; //(Ljava/io/File;)Ljava/lang/Object;
    procedure close(P1: JObject); cdecl; //(Ljava/lang/Object;)V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;

    { Property }
  end;

  TJFileLoader_FileOpener = class(TJavaGenericImport<JFileLoader_FileOpenerClass, JFileLoader_FileOpener>) end;

  JFileLoader_StreamFactoryClass = interface(JFileLoader_FactoryClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/model/FileLoader$Factory
  ['{67095691-9AA6-48A2-BC04-DFE6F67569C4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileLoader_StreamFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$StreamFactory')]
  JFileLoader_StreamFactory = interface(JFileLoader_Factory) // or JObject // SuperSignature: com/bumptech/glide/load/model/FileLoader$Factory
  ['{C8CD3E49-D80C-4E9E-8865-436E943AA840}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileLoader_StreamFactory = class(TJavaGenericImport<JFileLoader_StreamFactoryClass, JFileLoader_StreamFactory>) end;

  JFileLoaderClass = interface(JObjectClass)
  ['{F5E06D84-E214-40DB-8D3E-AF8C40DB4DEB}']
    { static Property Methods }

    { static Methods }
    {class} function init(fileOpener: JFileLoader_FileOpener): JFileLoader; cdecl; //(Lcom/bumptech/glide/load/model/FileLoader$FileOpener;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader')]
  JFileLoader = interface(JObject)
  ['{BBFE15DA-1554-4F09-AC6A-291EBB68896B}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JFile; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/io/File;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: JFile): Boolean; cdecl; overload; //(Ljava/io/File;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJFileLoader = class(TJavaGenericImport<JFileLoaderClass, JFileLoader>) end;

  JGlideUrlClass = interface(JObjectClass)
  ['{590DF3D2-5533-4389-8964-AD486ABDB3F6}']
    { static Property Methods }

    { static Methods }
//    {class} function init(url: JURL): JGlideUrl; cdecl; overload; //(Ljava/net/URL;)V
    {class} function init(url: JString): JGlideUrl; cdecl; overload; //(Ljava/lang/String;)V
//    {class} function init(url: JURL; headers: JHeaders): JGlideUrl; cdecl; overload; //(Ljava/net/URL;Lcom/bumptech/glide/load/model/Headers;)V
    {class} function init(url: JString; headers: JHeaders): JGlideUrl; cdecl; overload; //(Ljava/lang/String;Lcom/bumptech/glide/load/model/Headers;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/GlideUrl')]
  JGlideUrl = interface(JObject)
  ['{16BC1A32-821A-4681-B56F-91522BA44C12}']
    { Property Methods }

    { methods }
//    function toURL: JURL; cdecl; //()Ljava/net/URL;
    function toStringUrl: JString; cdecl; //()Ljava/lang/String;
    function getHeaders: JMap; cdecl; //()Ljava/util/Map;
    function getCacheKey: JString; cdecl; //()Ljava/lang/String;
    function toString: JString; cdecl; //()Ljava/lang/String;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJGlideUrl = class(TJavaGenericImport<JGlideUrlClass, JGlideUrl>) end;

  JHeadersClass = interface(JObjectClass)
  ['{326F8FEF-CAEA-4D39-91BF-062D16FF2978}']
    { static Property Methods }
    {class} function _GetNONE: JHeaders;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/model/Headers;
    {class} function _GetDEFAULT: JHeaders;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/model/Headers;

    { static Methods }

    { static Property }
    {class} property NONE: JHeaders read _GetNONE;
    {class} property DEFAULT: JHeaders read _GetDEFAULT;
  end;

  [JavaSignature('com/bumptech/glide/load/model/Headers')]
  JHeaders = interface(IJavaInstance)
  ['{16B6FE05-6F39-4B52-80DE-8C1CB6D08BDA}']
    { Property Methods }

    { methods }
    function getHeaders: JMap; cdecl; //()Ljava/util/Map;

    { Property }
  end;

  TJHeaders = class(TJavaGenericImport<JHeadersClass, JHeaders>) end;

  JLazyHeaderFactoryClass = interface(JObjectClass)
  ['{6491847D-617A-404C-AD1D-5BFDBAEAC7B3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/LazyHeaderFactory')]
  JLazyHeaderFactory = interface(IJavaInstance)
  ['{ADA7465E-B975-46D8-BB1D-B02246B51056}']
    { Property Methods }

    { methods }
    function buildHeader: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJLazyHeaderFactory = class(TJavaGenericImport<JLazyHeaderFactoryClass, JLazyHeaderFactory>) end;

  JLazyHeaders_BuilderClass = interface(JObjectClass)
  ['{AD2B4686-0045-460B-BC55-97B9988DE4AA}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLazyHeaders_Builder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/LazyHeaders$Builder')]
  JLazyHeaders_Builder = interface(JObject)
  ['{FCA3DB21-4BBE-4BCF-9AD2-20D7B22FAF7D}']
    { Property Methods }

    { methods }
    function addHeader(key: JString; value: JString): JLazyHeaders_Builder; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)Lcom/bumptech/glide/load/model/LazyHeaders$Builder;
    function addHeader(key: JString; factory: JLazyHeaderFactory): JLazyHeaders_Builder; cdecl; overload; //(Ljava/lang/String;Lcom/bumptech/glide/load/model/LazyHeaderFactory;)Lcom/bumptech/glide/load/model/LazyHeaders$Builder;
    function setHeader(key: JString; value: JString): JLazyHeaders_Builder; cdecl; overload; //(Ljava/lang/String;Ljava/lang/String;)Lcom/bumptech/glide/load/model/LazyHeaders$Builder;
    function setHeader(key: JString; factory: JLazyHeaderFactory): JLazyHeaders_Builder; cdecl; overload; //(Ljava/lang/String;Lcom/bumptech/glide/load/model/LazyHeaderFactory;)Lcom/bumptech/glide/load/model/LazyHeaders$Builder;
    function build: JLazyHeaders; cdecl; //()Lcom/bumptech/glide/load/model/LazyHeaders;

    { Property }
  end;

  TJLazyHeaders_Builder = class(TJavaGenericImport<JLazyHeaders_BuilderClass, JLazyHeaders_Builder>) end;

  JLazyHeaders_StringHeaderFactoryClass = interface(JObjectClass)
  ['{98677E42-14E3-40DD-B818-8F1E8CBBD624}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/LazyHeaders$StringHeaderFactory')]
  JLazyHeaders_StringHeaderFactory = interface(JObject)
  ['{5B5DCC6B-5E97-4246-BB1E-0067B262ECB5}']
    { Property Methods }

    { methods }
    function buildHeader: JString; cdecl; //()Ljava/lang/String;
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJLazyHeaders_StringHeaderFactory = class(TJavaGenericImport<JLazyHeaders_StringHeaderFactoryClass, JLazyHeaders_StringHeaderFactory>) end;

  JLazyHeadersClass = interface(JObjectClass)
  ['{B052398F-C468-4F76-9F07-9AF5061D32A6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/LazyHeaders')]
  JLazyHeaders = interface(JObject)
  ['{CECF6327-32A9-4024-B4B8-033A054D4CFF}']
    { Property Methods }

    { methods }
    function getHeaders: JMap; cdecl; //()Ljava/util/Map;
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJLazyHeaders = class(TJavaGenericImport<JLazyHeadersClass, JLazyHeaders>) end;

  JMediaStoreFileLoader_FactoryClass = interface(JObjectClass)
  ['{7FE6EADB-7B79-4E20-8153-5F671E655AC1}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreFileLoader_Factory; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MediaStoreFileLoader$Factory')]
  JMediaStoreFileLoader_Factory = interface(JObject)
  ['{3E112D24-9491-4430-9CC9-A12122AE22B0}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJMediaStoreFileLoader_Factory = class(TJavaGenericImport<JMediaStoreFileLoader_FactoryClass, JMediaStoreFileLoader_Factory>) end;

  JMediaStoreFileLoader_FilePathFetcherClass = interface(JObjectClass)
  ['{27D47E98-4FFA-4427-B496-6E4966049A7F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MediaStoreFileLoader$FilePathFetcher')]
  JMediaStoreFileLoader_FilePathFetcher = interface(JObject)
  ['{ADFD5CEA-9E54-48CD-BFB4-308C54E04F8D}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJMediaStoreFileLoader_FilePathFetcher = class(TJavaGenericImport<JMediaStoreFileLoader_FilePathFetcherClass, JMediaStoreFileLoader_FilePathFetcher>) end;

  JMediaStoreFileLoaderClass = interface(JObjectClass)
  ['{1C078787-F0F8-4DF3-AA72-A7C689C72314}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreFileLoader; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MediaStoreFileLoader')]
  JMediaStoreFileLoader = interface(JObject)
  ['{6809B869-62A3-4E3F-B3C2-27BE5A8137D7}']
    { Property Methods }

    { methods }
    function buildLoadData(uri: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(uri: Jnet_Uri): Boolean; cdecl; overload; //(Landroid/net/Uri;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJMediaStoreFileLoader = class(TJavaGenericImport<JMediaStoreFileLoaderClass, JMediaStoreFileLoader>) end;

  JModelClass = interface(JObjectClass)
  ['{9E07D0EC-B9CE-417E-A50F-4445602457A1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/Model')]
  JModel = interface(IJavaInstance)
  ['{F41F2B4B-43A9-4454-A23C-9CAA1C35D548}']
    { Property Methods }

    { methods }
    function isEquivalentTo(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJModel = class(TJavaGenericImport<JModelClass, JModel>) end;

  JModelCache_ModelKeyClass = interface(JObjectClass)
  ['{7C50C68E-5D4F-4614-99D3-4BC7EE61FC34}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelCache$ModelKey')]
  JModelCache_ModelKey = interface(JObject)
  ['{D8571DD3-67CE-409C-A8AB-C09353A196FC}']
    { Property Methods }

    { methods }
    procedure release; cdecl; //()V
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJModelCache_ModelKey = class(TJavaGenericImport<JModelCache_ModelKeyClass, JModelCache_ModelKey>) end;

  JModelCacheClass = interface(JObjectClass)
  ['{CCE065B1-84B6-47AF-8DBA-14D7F0AD77A8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JModelCache; cdecl; overload; //()V
    {class} function init(size: Int64): JModelCache; cdecl; overload; //(J)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelCache')]
  JModelCache = interface(JObject)
  ['{37B12FEF-6E35-408D-9197-8DFD12269352}']
    { Property Methods }

    { methods }
    function get(model: JObject; width: Integer; height: Integer): JObject; cdecl; //(Ljava/lang/Object;II)Ljava/lang/Object;
    procedure put(model: JObject; width: Integer; height: Integer; value: JObject); cdecl; //(Ljava/lang/Object;IILjava/lang/Object;)V
    procedure clear; cdecl; //()V

    { Property }
  end;

  TJModelCache = class(TJavaGenericImport<JModelCacheClass, JModelCache>) end;

  JModelLoader_LoadDataClass = interface(JObjectClass)
  ['{9D15030A-1D07-4AB8-B2F1-4234C8B36443}']
    { static Property Methods }

    { static Methods }
    {class} function init(sourceKey: JKey; fetcher: JDataFetcher): JModelLoader_LoadData; cdecl; overload; //(Lcom/bumptech/glide/load/Key;Lcom/bumptech/glide/load/data/DataFetcher;)V
    {class} function init(sourceKey: JKey; alternateKeys: JList; fetcher: JDataFetcher): JModelLoader_LoadData; cdecl; overload; //(Lcom/bumptech/glide/load/Key;Ljava/util/List;Lcom/bumptech/glide/load/data/DataFetcher;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoader$LoadData')]
  JModelLoader_LoadData = interface(JObject)
  ['{879770D6-4C03-4719-BE60-15EB7829C5E4}']
    { Property Methods }
    function _GetsourceKey: JKey;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Key;
    procedure _SetsourceKey(asourceKey: JKey);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/bumptech/glide/load/Key;)V
    function _GetalternateKeys: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/util/List;
    procedure _SetalternateKeys(aalternateKeys: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Ljava/util/List;)V
    function _Getfetcher: JDataFetcher;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/data/DataFetcher;
    procedure _Setfetcher(afetcher: JDataFetcher);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //(Lcom/bumptech/glide/load/data/DataFetcher;)V

    { methods }

    { Property }
    property sourceKey: JKey read _GetsourceKey write _SetsourceKey;
    property alternateKeys: JList read _GetalternateKeys write _SetalternateKeys;
    property fetcher: JDataFetcher read _Getfetcher write _Setfetcher;
  end;

  TJModelLoader_LoadData = class(TJavaGenericImport<JModelLoader_LoadDataClass, JModelLoader_LoadData>) end;

  JModelLoaderClass = interface(JObjectClass)
  ['{EA244437-8C51-44B2-86DC-E90DC4B0F2E7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoader')]
  JModelLoader = interface(IJavaInstance)
  ['{429445F3-EC67-4271-A85B-2863FC8317A2}']
    { Property Methods }

    { methods }
    function buildLoadData(P1: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(P1: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJModelLoader = class(TJavaGenericImport<JModelLoaderClass, JModelLoader>) end;

  JModelLoaderFactoryClass = interface(JObjectClass)
  ['{5F2113EF-BDBA-4B8E-A34B-C4764DA413DD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoaderFactory')]
  JModelLoaderFactory = interface(IJavaInstance)
  ['{E70856D4-6E30-404F-AE0D-817F56A6A88D}']
    { Property Methods }

    { methods }
    function build(P1: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJModelLoaderFactory = class(TJavaGenericImport<JModelLoaderFactoryClass, JModelLoaderFactory>) end;

  JModelLoaderRegistry_ModelLoaderCache_EntryClass = interface(JObjectClass)
  ['{D9927620-B4CB-45DB-845B-673FE7A96A15}']
    { static Property Methods }

    { static Methods }
    {class} function init(loaders: JList): JModelLoaderRegistry_ModelLoaderCache_Entry; cdecl; //(Ljava/util/List;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache$Entry')]
  JModelLoaderRegistry_ModelLoaderCache_Entry = interface(JObject)
  ['{70BC9A9E-ECAA-426C-88B7-37AB27B2A498}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJModelLoaderRegistry_ModelLoaderCache_Entry = class(TJavaGenericImport<JModelLoaderRegistry_ModelLoaderCache_EntryClass, JModelLoaderRegistry_ModelLoaderCache_Entry>) end;

  JModelLoaderRegistry_ModelLoaderCacheClass = interface(JObjectClass)
  ['{EB9DA6D5-78B9-493A-AAFF-CC98A45C491C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache')]
  JModelLoaderRegistry_ModelLoaderCache = interface(JObject)
  ['{86C9222C-CE0D-4A32-9C9C-FF8954567405}']
    { Property Methods }

    { methods }
    procedure clear; cdecl; //()V
    procedure put(modelClass: Jlang_Class; P2: JList); cdecl; //(Ljava/lang/Class;Ljava/util/List;)V
    function get(modelClass: Jlang_Class): JList; cdecl; //(Ljava/lang/Class;)Ljava/util/List;

    { Property }
  end;

  TJModelLoaderRegistry_ModelLoaderCache = class(TJavaGenericImport<JModelLoaderRegistry_ModelLoaderCacheClass, JModelLoaderRegistry_ModelLoaderCache>) end;

  JModelLoaderRegistryClass = interface(JObjectClass)
  ['{D1472861-6EF4-4F7E-A17D-F6959FE729FE}']
    { static Property Methods }

    { static Methods }
//    {class} function init(throwableListPool: JPools_Pool): JModelLoaderRegistry; cdecl; //(Landroid/support/v4/util/Pools$Pool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoaderRegistry')]
  JModelLoaderRegistry = interface(JObject)
  ['{D9EE4B49-5E10-477E-868C-5ABE716EB369}']
    { Property Methods }

    { methods }
    procedure append(modelClass: Jlang_Class; P2: Jlang_Class; dataClass: JModelLoaderFactory); cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V
    procedure prepend(modelClass: Jlang_Class; P2: Jlang_Class; dataClass: JModelLoaderFactory); cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V
    procedure remove(modelClass: Jlang_Class; P2: Jlang_Class); cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)V
    procedure replace(modelClass: Jlang_Class; P2: Jlang_Class; dataClass: JModelLoaderFactory); cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V
    function getModelLoaders(model: JObject): JList; cdecl; //(Ljava/lang/Object;)Ljava/util/List;
    function build(modelClass: Jlang_Class; P2: Jlang_Class): JModelLoader; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/model/ModelLoader;
    function getDataClasses(modelClass: Jlang_Class): JList; cdecl; //(Ljava/lang/Class;)Ljava/util/List;

    { Property }
  end;

  TJModelLoaderRegistry = class(TJavaGenericImport<JModelLoaderRegistryClass, JModelLoaderRegistry>) end;

  JMultiModelLoader_MultiFetcherClass = interface(JObjectClass)
  ['{9A7E919D-FCCC-4153-930B-1476394AD310}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoader$MultiFetcher')]
  JMultiModelLoader_MultiFetcher = interface(JObject)
  ['{69484D52-6567-41BD-8CA5-CB438701A291}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;
    procedure onDataReady(data: JObject); cdecl; //(Ljava/lang/Object;)V
    procedure onLoadFailed(e: JException); cdecl; //(Ljava/lang/Exception;)V

    { Property }
  end;

  TJMultiModelLoader_MultiFetcher = class(TJavaGenericImport<JMultiModelLoader_MultiFetcherClass, JMultiModelLoader_MultiFetcher>) end;

  JMultiModelLoaderClass = interface(JObjectClass)
  ['{A7FF398F-C26E-4D6D-85B4-E6B7C52A07D1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoader')]
  JMultiModelLoader = interface(JObject)
  ['{393A2440-C94C-42DF-91A8-974F180EA7FB}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJMultiModelLoader = class(TJavaGenericImport<JMultiModelLoaderClass, JMultiModelLoader>) end;

  JMultiModelLoaderFactory_EmptyModelLoaderClass = interface(JObjectClass)
  ['{EFC70248-F06A-4389-8168-8127AB9C82DE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoaderFactory$EmptyModelLoader')]
  JMultiModelLoaderFactory_EmptyModelLoader = interface(JObject)
  ['{2E2AD689-D810-419A-8FF4-CFB527024471}']
    { Property Methods }

    { methods }
    function buildLoadData(o: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJMultiModelLoaderFactory_EmptyModelLoader = class(TJavaGenericImport<JMultiModelLoaderFactory_EmptyModelLoaderClass, JMultiModelLoaderFactory_EmptyModelLoader>) end;

  JMultiModelLoaderFactory_EntryClass = interface(JObjectClass)
  ['{F151C531-A0CA-4BD6-B32C-15146A95FBBD}']
    { static Property Methods }

    { static Methods }
    {class} function init(modelClass: Jlang_Class; dataClass: Jlang_Class; factory: JModelLoaderFactory): JMultiModelLoaderFactory_Entry; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoaderFactory$Entry')]
  JMultiModelLoaderFactory_Entry = interface(JObject)
  ['{6DA68117-7EC5-4B24-9D45-B5C6BFF5DBB1}']
    { Property Methods }

    { methods }
    function handles(modelClass: Jlang_Class; dataClass: Jlang_Class): Boolean; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;)Z
    function handles(modelClass: Jlang_Class): Boolean; cdecl; overload; //(Ljava/lang/Class;)Z

    { Property }
  end;

  TJMultiModelLoaderFactory_Entry = class(TJavaGenericImport<JMultiModelLoaderFactory_EntryClass, JMultiModelLoaderFactory_Entry>) end;

  JMultiModelLoaderFactory_FactoryClass = interface(JObjectClass)
  ['{540F348A-90E4-4E50-8B4A-E787FAF7558A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoaderFactory$Factory')]
  JMultiModelLoaderFactory_Factory = interface(JObject)
  ['{865FDBFF-24E5-43BF-87D5-9F5E0F30E4F5}']
    { Property Methods }

    { methods }
//    function build(modelLoaders: JList; P2: JPools_Pool): JMultiModelLoader; cdecl; //(Ljava/util/List;Landroid/support/v4/util/Pools$Pool;)Lcom/bumptech/glide/load/model/MultiModelLoader;

    { Property }
  end;

  TJMultiModelLoaderFactory_Factory = class(TJavaGenericImport<JMultiModelLoaderFactory_FactoryClass, JMultiModelLoaderFactory_Factory>) end;

  JMultiModelLoaderFactoryClass = interface(JObjectClass)
  ['{5AAEC568-7ED6-409E-BA17-AA756F895083}']
    { static Property Methods }

    { static Methods }
//    {class} function init(throwableListPool: JPools_Pool): JMultiModelLoaderFactory; cdecl; //(Landroid/support/v4/util/Pools$Pool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoaderFactory')]
  JMultiModelLoaderFactory = interface(JObject)
  ['{D257EC1E-801C-4442-A5F5-E6BA42836939}']
    { Property Methods }

    { methods }
    function build(modelClass: Jlang_Class; P2: Jlang_Class): JModelLoader; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/model/ModelLoader;

    { Property }
  end;

  TJMultiModelLoaderFactory = class(TJavaGenericImport<JMultiModelLoaderFactoryClass, JMultiModelLoaderFactory>) end;

  JResourceLoader_AssetFileDescriptorFactoryClass = interface(JObjectClass)
  ['{82689690-709B-4BEE-90B0-BE1A492E05E5}']
    { static Property Methods }

    { static Methods }
    {class} function init(resources: JResources): JResourceLoader_AssetFileDescriptorFactory; cdecl; //(Landroid/content/res/Resources;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ResourceLoader$AssetFileDescriptorFactory')]
  JResourceLoader_AssetFileDescriptorFactory = interface(JObject)
  ['{9A5CD827-DEC8-4619-9388-BA3CD92E523D}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJResourceLoader_AssetFileDescriptorFactory = class(TJavaGenericImport<JResourceLoader_AssetFileDescriptorFactoryClass, JResourceLoader_AssetFileDescriptorFactory>) end;

  JResourceLoader_FileDescriptorFactoryClass = interface(JObjectClass)
  ['{EEA65042-4BAF-4A50-9860-29D0C6147920}']
    { static Property Methods }

    { static Methods }
    {class} function init(resources: JResources): JResourceLoader_FileDescriptorFactory; cdecl; //(Landroid/content/res/Resources;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ResourceLoader$FileDescriptorFactory')]
  JResourceLoader_FileDescriptorFactory = interface(JObject)
  ['{7079145D-EB1C-471E-8609-48F00590B0FC}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJResourceLoader_FileDescriptorFactory = class(TJavaGenericImport<JResourceLoader_FileDescriptorFactoryClass, JResourceLoader_FileDescriptorFactory>) end;

  JResourceLoader_StreamFactoryClass = interface(JObjectClass)
  ['{E374D68D-D291-4A35-B665-CB91807192AA}']
    { static Property Methods }

    { static Methods }
    {class} function init(resources: JResources): JResourceLoader_StreamFactory; cdecl; //(Landroid/content/res/Resources;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ResourceLoader$StreamFactory')]
  JResourceLoader_StreamFactory = interface(JObject)
  ['{D606946E-F6D6-4038-9C18-112051EAD84A}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJResourceLoader_StreamFactory = class(TJavaGenericImport<JResourceLoader_StreamFactoryClass, JResourceLoader_StreamFactory>) end;

  JResourceLoader_UriFactoryClass = interface(JObjectClass)
  ['{EB6B4114-7EC4-4981-A9A7-0260BB129DDE}']
    { static Property Methods }

    { static Methods }
    {class} function init(resources: JResources): JResourceLoader_UriFactory; cdecl; //(Landroid/content/res/Resources;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ResourceLoader$UriFactory')]
  JResourceLoader_UriFactory = interface(JObject)
  ['{00C2F820-D9CF-4C1B-BCE5-B4B4B0155D88}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJResourceLoader_UriFactory = class(TJavaGenericImport<JResourceLoader_UriFactoryClass, JResourceLoader_UriFactory>) end;

  JResourceLoaderClass = interface(JObjectClass)
  ['{20433E56-24CE-4C32-8174-B2400C388CAB}']
    { static Property Methods }

    { static Methods }
    {class} function init(resources: JResources; uriLoader: JModelLoader): JResourceLoader; cdecl; //(Landroid/content/res/Resources;Lcom/bumptech/glide/load/model/ModelLoader;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ResourceLoader')]
  JResourceLoader = interface(JObject)
  ['{B620078A-36DD-4A29-A7F7-88D690CF2689}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JInteger; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Integer;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: JInteger): Boolean; cdecl; overload; //(Ljava/lang/Integer;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJResourceLoader = class(TJavaGenericImport<JResourceLoaderClass, JResourceLoader>) end;

  JBaseGlideUrlLoaderClass = interface(JObjectClass)
  ['{1B733A26-4D9C-4A68-9E9C-E9C216E4DF30}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/BaseGlideUrlLoader')]
  JBaseGlideUrlLoader = interface(JObject)
  ['{E1716D6D-02D2-49C1-89A8-10084E3F6ED8}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJBaseGlideUrlLoader = class(TJavaGenericImport<JBaseGlideUrlLoaderClass, JBaseGlideUrlLoader>) end;

  JHttpGlideUrlLoader_FactoryClass = interface(JObjectClass)
  ['{9E8AE8A4-0905-4E15-9DCA-7C2E5D7098E4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHttpGlideUrlLoader_Factory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/HttpGlideUrlLoader$Factory')]
  JHttpGlideUrlLoader_Factory = interface(JObject)
  ['{3FE6136C-C131-46E4-903F-C5C84916F736}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJHttpGlideUrlLoader_Factory = class(TJavaGenericImport<JHttpGlideUrlLoader_FactoryClass, JHttpGlideUrlLoader_Factory>) end;

  JHttpGlideUrlLoaderClass = interface(JObjectClass)
  ['{E631F784-D0FA-48BE-91FE-2352CBFD032C}']
    { static Property Methods }
    {class} function _GetTIMEOUT: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;

    { static Methods }
    {class} function init: JHttpGlideUrlLoader; cdecl; overload; //()V
    {class} function init(modelCache: JModelCache): JHttpGlideUrlLoader; cdecl; overload; //(Lcom/bumptech/glide/load/model/ModelCache;)V

    { static Property }
    {class} property TIMEOUT: JOption read _GetTIMEOUT;
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/HttpGlideUrlLoader')]
  JHttpGlideUrlLoader = interface(JObject)
  ['{B79F69F1-2C3B-4D45-99CE-E0FFA12B8B7B}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JGlideUrl; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Lcom/bumptech/glide/load/model/GlideUrl;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: JGlideUrl): Boolean; cdecl; overload; //(Lcom/bumptech/glide/load/model/GlideUrl;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJHttpGlideUrlLoader = class(TJavaGenericImport<JHttpGlideUrlLoaderClass, JHttpGlideUrlLoader>) end;

  JHttpUriLoader_FactoryClass = interface(JObjectClass)
  ['{C29B6E5D-D0D1-48F3-A687-A12AB776F150}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHttpUriLoader_Factory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/HttpUriLoader$Factory')]
  JHttpUriLoader_Factory = interface(JObject)
  ['{A239F7D6-E26C-442F-A02B-D72DB7673EEE}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJHttpUriLoader_Factory = class(TJavaGenericImport<JHttpUriLoader_FactoryClass, JHttpUriLoader_Factory>) end;

  JHttpUriLoaderClass = interface(JObjectClass)
  ['{E4066A14-273C-471D-A86E-7CFA6025DDA7}']
    { static Property Methods }

    { static Methods }
    {class} function init(urlLoader: JModelLoader): JHttpUriLoader; cdecl; //(Lcom/bumptech/glide/load/model/ModelLoader;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/HttpUriLoader')]
  JHttpUriLoader = interface(JObject)
  ['{666CC155-5D93-40C5-9018-57FFC13A7B04}']
    { Property Methods }

    { methods }
    function buildLoadData(model: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: Jnet_Uri): Boolean; cdecl; overload; //(Landroid/net/Uri;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJHttpUriLoader = class(TJavaGenericImport<JHttpUriLoaderClass, JHttpUriLoader>) end;

  JMediaStoreImageThumbLoader_FactoryClass = interface(JObjectClass)
  ['{85795516-8EB1-4C71-A003-EAFE20C5F5B8}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreImageThumbLoader_Factory; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/MediaStoreImageThumbLoader$Factory')]
  JMediaStoreImageThumbLoader_Factory = interface(JObject)
  ['{3492F697-8E3E-4B31-A48C-C1E6AAE74440}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJMediaStoreImageThumbLoader_Factory = class(TJavaGenericImport<JMediaStoreImageThumbLoader_FactoryClass, JMediaStoreImageThumbLoader_Factory>) end;

  JMediaStoreImageThumbLoaderClass = interface(JObjectClass)
  ['{6B7534D4-3D46-429C-A8E3-EC9E3CCBE4E3}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreImageThumbLoader; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/MediaStoreImageThumbLoader')]
  JMediaStoreImageThumbLoader = interface(JObject)
  ['{74688E59-8E9E-499D-AC63-80CA05CEFF13}']
    { Property Methods }

    { methods }
    function buildLoadData(model: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: Jnet_Uri): Boolean; cdecl; overload; //(Landroid/net/Uri;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJMediaStoreImageThumbLoader = class(TJavaGenericImport<JMediaStoreImageThumbLoaderClass, JMediaStoreImageThumbLoader>) end;

  JMediaStoreVideoThumbLoader_FactoryClass = interface(JObjectClass)
  ['{5A121518-5A6D-43C8-B1A5-DC49608A4072}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreVideoThumbLoader_Factory; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/MediaStoreVideoThumbLoader$Factory')]
  JMediaStoreVideoThumbLoader_Factory = interface(JObject)
  ['{FE9DA6EB-02BA-4569-995E-BA63911F09B7}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJMediaStoreVideoThumbLoader_Factory = class(TJavaGenericImport<JMediaStoreVideoThumbLoader_FactoryClass, JMediaStoreVideoThumbLoader_Factory>) end;

  JMediaStoreVideoThumbLoaderClass = interface(JObjectClass)
  ['{00EE101F-36E1-4911-81AE-F6B47F0A6FAA}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreVideoThumbLoader; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/MediaStoreVideoThumbLoader')]
  JMediaStoreVideoThumbLoader = interface(JObject)
  ['{5BA6BAD9-2F0F-4577-A092-A2ADF0F56B1C}']
    { Property Methods }

    { methods }
    function buildLoadData(model: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: Jnet_Uri): Boolean; cdecl; overload; //(Landroid/net/Uri;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJMediaStoreVideoThumbLoader = class(TJavaGenericImport<JMediaStoreVideoThumbLoaderClass, JMediaStoreVideoThumbLoader>) end;

  JUrlLoader_StreamFactoryClass = interface(JObjectClass)
  ['{799F6E20-9C72-4D43-946C-DE900D206DAB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUrlLoader_StreamFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/UrlLoader$StreamFactory')]
  JUrlLoader_StreamFactory = interface(JObject)
  ['{A5B406B6-0B20-494E-A736-1C5A2B56E4B7}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJUrlLoader_StreamFactory = class(TJavaGenericImport<JUrlLoader_StreamFactoryClass, JUrlLoader_StreamFactory>) end;

  JUrlLoaderClass = interface(JObjectClass)
  ['{91435893-7B9D-4475-8544-FB232AA43653}']
    { static Property Methods }

    { static Methods }
    {class} function init(glideUrlLoader: JModelLoader): JUrlLoader; cdecl; //(Lcom/bumptech/glide/load/model/ModelLoader;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/UrlLoader')]
  JUrlLoader = interface(JObject)
  ['{500AAF2A-7B2B-4CF4-B689-ED78956841A2}']
    { Property Methods }

    { methods }
//    function buildLoadData(model: JURL; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/net/URL;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
//    function handles(model: JURL): Boolean; cdecl; overload; //(Ljava/net/URL;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJUrlLoader = class(TJavaGenericImport<JUrlLoaderClass, JUrlLoader>) end;

  JStreamEncoderClass = interface(JObjectClass)
  ['{C579C358-EB3F-4A8A-A322-72056AA2835C}']
    { static Property Methods }

    { static Methods }
    {class} function init(byteArrayPool: JArrayPool): JStreamEncoder; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StreamEncoder')]
  JStreamEncoder = interface(JObject)
  ['{C888EAAB-E20E-4F03-BAF2-8935E3AE77DF}']
    { Property Methods }

    { methods }
    function encode(data: JInputStream; afile: JFile; options: JOptions): Boolean; cdecl; overload; //(Ljava/io/InputStream;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJStreamEncoder = class(TJavaGenericImport<JStreamEncoderClass, JStreamEncoder>) end;

  JStringLoader_AssetFileDescriptorFactoryClass = interface(JObjectClass)
  ['{E5A9F7B3-7976-4BEB-9C00-286061823DF5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JStringLoader_AssetFileDescriptorFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StringLoader$AssetFileDescriptorFactory')]
  JStringLoader_AssetFileDescriptorFactory = interface(JObject)
  ['{B9842274-0CEB-4008-908D-7BA40B0CC29F}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJStringLoader_AssetFileDescriptorFactory = class(TJavaGenericImport<JStringLoader_AssetFileDescriptorFactoryClass, JStringLoader_AssetFileDescriptorFactory>) end;

  JStringLoader_FileDescriptorFactoryClass = interface(JObjectClass)
  ['{D9FF9493-C629-4BE1-9959-FFB8CD8D9907}']
    { static Property Methods }

    { static Methods }
    {class} function init: JStringLoader_FileDescriptorFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StringLoader$FileDescriptorFactory')]
  JStringLoader_FileDescriptorFactory = interface(JObject)
  ['{81CC4A0F-E5AD-4332-8BA1-B22BC90294CB}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJStringLoader_FileDescriptorFactory = class(TJavaGenericImport<JStringLoader_FileDescriptorFactoryClass, JStringLoader_FileDescriptorFactory>) end;

  JStringLoader_StreamFactoryClass = interface(JObjectClass)
  ['{A6DB101A-4B77-4BD5-8190-91E4B93E5696}']
    { static Property Methods }

    { static Methods }
    {class} function init: JStringLoader_StreamFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StringLoader$StreamFactory')]
  JStringLoader_StreamFactory = interface(JObject)
  ['{D8816795-F1EC-4D43-BBA5-39BE63AE977E}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJStringLoader_StreamFactory = class(TJavaGenericImport<JStringLoader_StreamFactoryClass, JStringLoader_StreamFactory>) end;

  JStringLoaderClass = interface(JObjectClass)
  ['{D8EEBCA0-6E23-4206-A9C0-D28642CD9451}']
    { static Property Methods }

    { static Methods }
    {class} function init(uriLoader: JModelLoader): JStringLoader; cdecl; //(Lcom/bumptech/glide/load/model/ModelLoader;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StringLoader')]
  JStringLoader = interface(JObject)
  ['{6A2C6745-7E8B-46AC-9ED0-70C18F2E6F63}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JString; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/String;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: JString): Boolean; cdecl; overload; //(Ljava/lang/String;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJStringLoader = class(TJavaGenericImport<JStringLoaderClass, JStringLoader>) end;

  JUnitModelLoader_FactoryClass = interface(JObjectClass)
  ['{A3183FB3-78CB-4850-B142-174F1B5B280A}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JUnitModelLoader_Factory; cdecl; //()Lcom/bumptech/glide/load/model/UnitModelLoader$Factory;
    {class} function init: JUnitModelLoader_Factory; cdecl; //Deprecated //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UnitModelLoader$Factory')]
  JUnitModelLoader_Factory = interface(JObject)
  ['{375D30A5-245F-4654-89DA-4BC370367C50}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJUnitModelLoader_Factory = class(TJavaGenericImport<JUnitModelLoader_FactoryClass, JUnitModelLoader_Factory>) end;

  JUnitModelLoader_UnitFetcherClass = interface(JObjectClass)
  ['{93DBEFD5-9E86-4D79-B3D2-1FBCB5CE7131}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UnitModelLoader$UnitFetcher')]
  JUnitModelLoader_UnitFetcher = interface(JObject)
  ['{39E4A4A6-DA38-4230-9AF0-9D6B5ABCD97D}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl; //(Lcom/bumptech/glide/Priority;Lcom/bumptech/glide/load/data/DataFetcher$DataCallback;)V
    procedure cleanup; cdecl; //()V
    procedure cancel; cdecl; //()V
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDataSource: JDataSource; cdecl; //()Lcom/bumptech/glide/load/DataSource;

    { Property }
  end;

  TJUnitModelLoader_UnitFetcher = class(TJavaGenericImport<JUnitModelLoader_UnitFetcherClass, JUnitModelLoader_UnitFetcher>) end;

  JUnitModelLoaderClass = interface(JObjectClass)
  ['{F6D82BC2-1DFD-4878-BAD1-6B9F77A4C18C}']
    { static Property Methods }

    { static Methods }
    {class} function getInstance: JUnitModelLoader; cdecl; //()Lcom/bumptech/glide/load/model/UnitModelLoader;
    {class} function init: JUnitModelLoader; cdecl; //Deprecated //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UnitModelLoader')]
  JUnitModelLoader = interface(JObject)
  ['{DFBB1FB9-C006-4F2C-9B7C-10E75B914963}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJUnitModelLoader = class(TJavaGenericImport<JUnitModelLoaderClass, JUnitModelLoader>) end;

  JUriLoader_AssetFileDescriptorFactoryClass = interface(JObjectClass)
  ['{E70B6902-0BDA-4058-A022-01C856ABB34B}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver): JUriLoader_AssetFileDescriptorFactory; cdecl; //(Landroid/content/ContentResolver;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader$AssetFileDescriptorFactory')]
  JUriLoader_AssetFileDescriptorFactory = interface(JObject)
  ['{FA04C5CA-A0A7-41B0-8F8E-3C55136C1A3D}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; overload; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V
    function build(uri: Jnet_Uri): JDataFetcher; cdecl; overload; //(Landroid/net/Uri;)Lcom/bumptech/glide/load/data/DataFetcher;

    { Property }
  end;

  TJUriLoader_AssetFileDescriptorFactory = class(TJavaGenericImport<JUriLoader_AssetFileDescriptorFactoryClass, JUriLoader_AssetFileDescriptorFactory>) end;

  JUriLoader_FileDescriptorFactoryClass = interface(JObjectClass)
  ['{C7A4D4C6-11C4-47C1-BE6B-9FF043DDC0CA}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver): JUriLoader_FileDescriptorFactory; cdecl; //(Landroid/content/ContentResolver;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader$FileDescriptorFactory')]
  JUriLoader_FileDescriptorFactory = interface(JObject)
  ['{F9E3A069-77CC-49DE-8857-48BFEFAC0C86}']
    { Property Methods }

    { methods }
    function build(uri: Jnet_Uri): JDataFetcher; cdecl; overload; //(Landroid/net/Uri;)Lcom/bumptech/glide/load/data/DataFetcher;
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; overload; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJUriLoader_FileDescriptorFactory = class(TJavaGenericImport<JUriLoader_FileDescriptorFactoryClass, JUriLoader_FileDescriptorFactory>) end;

  JUriLoader_LocalUriFetcherFactoryClass = interface(JObjectClass)
  ['{6A69BB62-A7F8-406E-8207-89BA159F2227}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader$LocalUriFetcherFactory')]
  JUriLoader_LocalUriFetcherFactory = interface(IJavaInstance)
  ['{3F2D4BD9-D09F-4AE7-9B69-D0F70209E0AE}']
    { Property Methods }

    { methods }
    function build(P1: Jnet_Uri): JDataFetcher; cdecl; //(Landroid/net/Uri;)Lcom/bumptech/glide/load/data/DataFetcher;

    { Property }
  end;

  TJUriLoader_LocalUriFetcherFactory = class(TJavaGenericImport<JUriLoader_LocalUriFetcherFactoryClass, JUriLoader_LocalUriFetcherFactory>) end;

  JUriLoader_StreamFactoryClass = interface(JObjectClass)
  ['{5B475014-02A5-4A08-84B5-55AA4C4EC38A}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver): JUriLoader_StreamFactory; cdecl; //(Landroid/content/ContentResolver;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader$StreamFactory')]
  JUriLoader_StreamFactory = interface(JObject)
  ['{C0A5D371-CBB9-4DCE-B3DD-9E7C8A1C8C49}']
    { Property Methods }

    { methods }
    function build(uri: Jnet_Uri): JDataFetcher; cdecl; overload; //(Landroid/net/Uri;)Lcom/bumptech/glide/load/data/DataFetcher;
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; overload; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJUriLoader_StreamFactory = class(TJavaGenericImport<JUriLoader_StreamFactoryClass, JUriLoader_StreamFactory>) end;

  JUriLoaderClass = interface(JObjectClass)
  ['{63C4C004-0A8E-468B-A98E-5FF64BD39C4B}']
    { static Property Methods }

    { static Methods }
    {class} function init(factory: JUriLoader_LocalUriFetcherFactory): JUriLoader; cdecl; //(Lcom/bumptech/glide/load/model/UriLoader$LocalUriFetcherFactory;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader')]
  JUriLoader = interface(JObject)
  ['{1C784E01-C14C-4542-A9CA-22F6A9FE2081}']
    { Property Methods }

    { methods }
    function buildLoadData(model: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(model: Jnet_Uri): Boolean; cdecl; overload; //(Landroid/net/Uri;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJUriLoader = class(TJavaGenericImport<JUriLoaderClass, JUriLoader>) end;

  JUrlUriLoader_StreamFactoryClass = interface(JObjectClass)
  ['{C55EC0D4-F3F5-48D8-9868-703A3BEC59A9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUrlUriLoader_StreamFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UrlUriLoader$StreamFactory')]
  JUrlUriLoader_StreamFactory = interface(JObject)
  ['{975DC7F2-A112-49F1-8D9A-5F730BF158CF}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; //(Lcom/bumptech/glide/load/model/MultiModelLoaderFactory;)Lcom/bumptech/glide/load/model/ModelLoader;
    procedure teardown; cdecl; //()V

    { Property }
  end;

  TJUrlUriLoader_StreamFactory = class(TJavaGenericImport<JUrlUriLoader_StreamFactoryClass, JUrlUriLoader_StreamFactory>) end;

  JUrlUriLoaderClass = interface(JObjectClass)
  ['{91DDAF00-F6BE-4299-B21E-A6A48A207639}']
    { static Property Methods }

    { static Methods }
    {class} function init(urlLoader: JModelLoader): JUrlUriLoader; cdecl; //(Lcom/bumptech/glide/load/model/ModelLoader;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UrlUriLoader')]
  JUrlUriLoader = interface(JObject)
  ['{CA473038-4891-4834-ACC7-1640F2A55E1E}']
    { Property Methods }

    { methods }
    function buildLoadData(uri: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;
    function handles(uri: Jnet_Uri): Boolean; cdecl; overload; //(Landroid/net/Uri;)Z
    function handles(this: JObject): Boolean; cdecl; overload; //(Ljava/lang/Object;)Z
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/model/ModelLoader$LoadData;

    { Property }
  end;

  TJUrlUriLoader = class(TJavaGenericImport<JUrlUriLoaderClass, JUrlUriLoader>) end;

  JMultiTransformationClass = interface(JObjectClass)
  ['{BD74B77A-7C90-4DA6-8250-BD884C115C9B}']
    { static Property Methods }

    { static Methods }
    {class} function init(transformations: TJavaObjectArray<JTransformation>): JMultiTransformation; cdecl; overload; //([Lcom/bumptech/glide/load/Transformation;)V
    {class} function init(transformationList: JCollection): JMultiTransformation; cdecl; overload; //(Ljava/util/Collection;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/MultiTransformation')]
  JMultiTransformation = interface(JObject)
  ['{1229A80E-0433-4AEC-A7D8-AF25C4071DFA}']
    { Property Methods }

    { methods }
    function transform(context: JContext; resource: JResource; outWidth: Integer; outHeight: Integer): JResource; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJMultiTransformation = class(TJavaGenericImport<JMultiTransformationClass, JMultiTransformation>) end;

  JOption_CacheKeyUpdaterClass = interface(JObjectClass)
  ['{B8C64C29-EACB-4E60-BDA3-05CA65B5D416}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Option$CacheKeyUpdater')]
  JOption_CacheKeyUpdater = interface(IJavaInstance)
  ['{EB473AD7-0183-4043-8E23-B9EB690DBF90}']
    { Property Methods }

    { methods }
//    procedure update(P1: TJavaArray<Byte>; P2: JObject; P3: JMessageDigest); cdecl; //([BLjava/lang/Object;Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJOption_CacheKeyUpdater = class(TJavaGenericImport<JOption_CacheKeyUpdaterClass, JOption_CacheKeyUpdater>) end;

  JOptionClass = interface(JObjectClass)
  ['{D73C5768-241C-42E7-916A-149A2C1FFA86}']
    { static Property Methods }

    { static Methods }
    {class} function memory(key: JString): JOption; cdecl; overload; //(Ljava/lang/String;)Lcom/bumptech/glide/load/Option;
    {class} function memory(key: JString; defaultValue: JObject): JOption; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;)Lcom/bumptech/glide/load/Option;
    {class} function disk(key: JString; cacheKeyUpdater: JOption_CacheKeyUpdater): JOption; cdecl; overload; //(Ljava/lang/String;Lcom/bumptech/glide/load/Option$CacheKeyUpdater;)Lcom/bumptech/glide/load/Option;
    {class} function disk(key: JString; defaultValue: JObject; cacheKeyUpdater: JOption_CacheKeyUpdater): JOption; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;Lcom/bumptech/glide/load/Option$CacheKeyUpdater;)Lcom/bumptech/glide/load/Option;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Option')]
  JOption = interface(JObject)
  ['{E23E69E6-2CCF-407E-8E90-4B7851D81708}']
    { Property Methods }

    { methods }
    function getDefaultValue: JObject; cdecl; //()Ljava/lang/Object;
//    procedure update(value: JObject; messageDigest: JMessageDigest); cdecl; //(Ljava/lang/Object;Ljava/security/MessageDigest;)V
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJOption = class(TJavaGenericImport<JOptionClass, JOption>) end;

  JOptionsClass = interface(JObjectClass)
  ['{ECFD8B2C-AB4D-4180-B2C3-5B83BA91F820}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOptions; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Options')]
  JOptions = interface(JObject)
  ['{82990BE4-3D1D-4B6F-8954-C32CD9F887CD}']
    { Property Methods }

    { methods }
    procedure putAll(other: JOptions); cdecl; //(Lcom/bumptech/glide/load/Options;)V
    function &set(option: JOption; P2: JObject): JOptions; cdecl; //(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/load/Options;
    function get(option: JOption): JObject; cdecl; //(Lcom/bumptech/glide/load/Option;)Ljava/lang/Object;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJOptions = class(TJavaGenericImport<JOptionsClass, JOptions>) end;

  JBitmapDrawableDecoderClass = interface(JObjectClass)
  ['{1536543A-BB44-4F9A-98CA-4C452DCA0F58}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; decoder: JResourceDecoder): JBitmapDrawableDecoder; cdecl; overload; //(Landroid/content/Context;Lcom/bumptech/glide/load/ResourceDecoder;)V
    {class} function init(resources: JResources; bitmapPool: JBitmapPool; decoder: JResourceDecoder): JBitmapDrawableDecoder; cdecl; overload; //Deprecated //(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/ResourceDecoder;)V
    {class} function init(resources: JResources; decoder: JResourceDecoder): JBitmapDrawableDecoder; cdecl; overload; //(Landroid/content/res/Resources;Lcom/bumptech/glide/load/ResourceDecoder;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapDrawableDecoder')]
  JBitmapDrawableDecoder = interface(JObject)
  ['{36BDD948-A550-4238-8B30-D3F31C58E2CE}']
    { Property Methods }

    { methods }
    function handles(source: JObject; options: JOptions): Boolean; cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: JObject; width: Integer; height: Integer; options: JOptions): JResource; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJBitmapDrawableDecoder = class(TJavaGenericImport<JBitmapDrawableDecoderClass, JBitmapDrawableDecoder>) end;

  JBitmapDrawableEncoderClass = interface(JObjectClass)
  ['{3B22CF97-1EF3-414C-B283-E51643735289}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool; encoder: JResourceEncoder): JBitmapDrawableEncoder; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/ResourceEncoder;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapDrawableEncoder')]
  JBitmapDrawableEncoder = interface(JObject)
  ['{10FA0AC7-141A-434A-9CC1-1EDDC45C8675}']
    { Property Methods }

    { methods }
    function encode(data: JResource; P2: JFile; options: JOptions): Boolean; cdecl; overload; //(Lcom/bumptech/glide/load/engine/Resource;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z
    function getEncodeStrategy(options: JOptions): JEncodeStrategy; cdecl; //(Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/EncodeStrategy;
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJBitmapDrawableEncoder = class(TJavaGenericImport<JBitmapDrawableEncoderClass, JBitmapDrawableEncoder>) end;

  JDrawableResourceClass = interface(JObjectClass)
  ['{F498EDC9-CD2E-4C64-B18C-DCE0D39FF23A}']
    { static Property Methods }

    { static Methods }
    {class} function init(drawable: JDrawable): JDrawableResource; cdecl; //(Landroid/graphics/drawable/Drawable;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/drawable/DrawableResource')]
  JDrawableResource = interface(JObject)
  ['{DB783005-F111-4499-B5F6-CD0E8945F4B9}']
    { Property Methods }

    { methods }
    function get: JDrawable; cdecl; overload; //()Landroid/graphics/drawable/Drawable;
    procedure initialize; cdecl; //()V
//    function get: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJDrawableResource = class(TJavaGenericImport<JDrawableResourceClass, JDrawableResource>) end;

  JBitmapDrawableResourceClass = interface(JDrawableResourceClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/drawable/DrawableResource
  ['{CCE0F950-10FD-439D-A21B-ADD65851B8C9}']
    { static Property Methods }

    { static Methods }
    {class} function init(drawable: JBitmapDrawable; bitmapPool: JBitmapPool): JBitmapDrawableResource; cdecl; //(Landroid/graphics/drawable/BitmapDrawable;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapDrawableResource')]
  JBitmapDrawableResource = interface(JDrawableResource) // or JObject // SuperSignature: com/bumptech/glide/load/resource/drawable/DrawableResource
  ['{13DAC80C-3425-4FDA-92FC-B36CBF9126E2}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V
    procedure initialize; cdecl; //()V

    { Property }
  end;

  TJBitmapDrawableResource = class(TJavaGenericImport<JBitmapDrawableResourceClass, JBitmapDrawableResource>) end;

  JBitmapDrawableTransformationClass = interface(JObjectClass)
  ['{C0F65463-A221-4790-9440-A1456458973F}']
    { static Property Methods }

    { static Methods }
    {class} function init(wrapped: JTransformation): JBitmapDrawableTransformation; cdecl; //(Lcom/bumptech/glide/load/Transformation;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapDrawableTransformation')]
  JBitmapDrawableTransformation = interface(JObject)
  ['{1DA83B21-2D1C-47B8-9EA7-08F249816C3B}']
    { Property Methods }

    { methods }
    function transform(context: JContext; drawableResourceToTransform: JResource; P3: Integer; outHeight: Integer): JResource; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJBitmapDrawableTransformation = class(TJavaGenericImport<JBitmapDrawableTransformationClass, JBitmapDrawableTransformation>) end;

  JBitmapEncoderClass = interface(JObjectClass)
  ['{8026647A-9829-4F45-A1EA-787D1ECFAD64}']
    { static Property Methods }
    {class} function _GetCOMPRESSION_QUALITY: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;
    {class} function _GetCOMPRESSION_FORMAT: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;

    { static Methods }
    {class} function init(arrayPool: JArrayPool): JBitmapEncoder; cdecl; overload; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V
    {class} function init: JBitmapEncoder; cdecl; overload; //Deprecated //()V

    { static Property }
    {class} property COMPRESSION_QUALITY: JOption read _GetCOMPRESSION_QUALITY;
    {class} property COMPRESSION_FORMAT: JOption read _GetCOMPRESSION_FORMAT;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapEncoder')]
  JBitmapEncoder = interface(JObject)
  ['{955C13DC-CE69-46E4-8DDC-C85AE2189634}']
    { Property Methods }

    { methods }
    function encode(resource: JResource; P2: JFile; options: JOptions): Boolean; cdecl; overload; //(Lcom/bumptech/glide/load/engine/Resource;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z
    function getEncodeStrategy(options: JOptions): JEncodeStrategy; cdecl; //(Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/EncodeStrategy;
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJBitmapEncoder = class(TJavaGenericImport<JBitmapEncoderClass, JBitmapEncoder>) end;

  JBitmapResourceClass = interface(JObjectClass)
  ['{005D1951-2796-444C-A6FD-8EB0C9C8EFDC}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(bitmap: JBitmap; bitmapPool: JBitmapPool): JBitmapResource; cdecl; //(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Lcom/bumptech/glide/load/resource/bitmap/BitmapResource;
    {class} function init(bitmap: JBitmap; bitmapPool: JBitmapPool): JBitmapResource; cdecl; //(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapResource')]
  JBitmapResource = interface(JObject)
  ['{1DC255E4-2D0C-4BCE-A21C-401B02E56E99}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function get: JBitmap; cdecl; overload; //()Landroid/graphics/Bitmap;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V
    procedure initialize; cdecl; //()V
//    function get: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJBitmapResource = class(TJavaGenericImport<JBitmapResourceClass, JBitmapResource>) end;

  JBitmapTransformationClass = interface(JObjectClass)
  ['{54CCF294-5B75-41C9-B113-792814C1231C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapTransformation; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapTransformation')]
  JBitmapTransformation = interface(JObject)
  ['{33D6E210-4719-48BE-8182-84D96FEA2497}']
    { Property Methods }

    { methods }
    function transform(context: JContext; resource: JResource; P3: Integer; outHeight: Integer): JResource; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJBitmapTransformation = class(TJavaGenericImport<JBitmapTransformationClass, JBitmapTransformation>) end;

  JBitmapTransitionOptionsClass = interface(JTransitionOptionsClass) // or JObjectClass // SuperSignature: com/bumptech/glide/TransitionOptions
  ['{9589E82D-F3DA-428F-BFD8-32CC7DD68610}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapTransitionOptions; cdecl; //()V
    {class} function withCrossFade: JBitmapTransitionOptions; cdecl; overload; //()Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    {class} function withCrossFade(duration: Integer): JBitmapTransitionOptions; cdecl; overload; //(I)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    {class} function withCrossFade(drawableCrossFadeFactory: JDrawableCrossFadeFactory): JBitmapTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    {class} function withCrossFade(builder: JDrawableCrossFadeFactory_Builder): JBitmapTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory$Builder;)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    {class} function withWrapped(drawableCrossFadeFactory: JTransitionFactory): JBitmapTransitionOptions; cdecl; //(Lcom/bumptech/glide/request/transition/TransitionFactory;)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    {class} function &with(transitionFactory: JTransitionFactory): JBitmapTransitionOptions; cdecl; //(Lcom/bumptech/glide/request/transition/TransitionFactory;)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions')]
  JBitmapTransitionOptions = interface(JTransitionOptions) // or JObject // SuperSignature: com/bumptech/glide/TransitionOptions
  ['{BD4F5260-DEC6-4C35-9613-DF3D77A2BE42}']
    { Property Methods }

    { methods }
    function crossFade: JBitmapTransitionOptions; cdecl; overload; //()Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    function crossFade(duration: Integer): JBitmapTransitionOptions; cdecl; overload; //(I)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    function crossFade(drawableCrossFadeFactory: JDrawableCrossFadeFactory): JBitmapTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    function transitionUsing(drawableCrossFadeFactory: JTransitionFactory): JBitmapTransitionOptions; cdecl; //(Lcom/bumptech/glide/request/transition/TransitionFactory;)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;
    function crossFade(builder: JDrawableCrossFadeFactory_Builder): JBitmapTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory$Builder;)Lcom/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions;

    { Property }
  end;

  TJBitmapTransitionOptions = class(TJavaGenericImport<JBitmapTransitionOptionsClass, JBitmapTransitionOptions>) end;

  JByteBufferBitmapDecoderClass = interface(JObjectClass)
  ['{7ADFBF42-D7B9-4675-A5E9-C3E8AB286343}']
    { static Property Methods }

    { static Methods }
    {class} function init(downsampler: JDownsampler): JByteBufferBitmapDecoder; cdecl; //(Lcom/bumptech/glide/load/resource/bitmap/Downsampler;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/ByteBufferBitmapDecoder')]
  JByteBufferBitmapDecoder = interface(JObject)
  ['{4D21DC94-95AF-4883-A6D3-10D3935B5F43}']
    { Property Methods }

    { methods }
    function handles(source: JByteBuffer; options: JOptions): Boolean; cdecl; overload; //(Ljava/nio/ByteBuffer;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: JByteBuffer; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Ljava/nio/ByteBuffer;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJByteBufferBitmapDecoder = class(TJavaGenericImport<JByteBufferBitmapDecoderClass, JByteBufferBitmapDecoder>) end;

  JCenterCropClass = interface(JBitmapTransformationClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{98C142D1-D9AF-4039-B5A6-84271F5C5C29}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCenterCrop; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/CenterCrop')]
  JCenterCrop = interface(JBitmapTransformation) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{1D932481-FF5B-426B-8E94-586E395709D0}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJCenterCrop = class(TJavaGenericImport<JCenterCropClass, JCenterCrop>) end;

  JCenterInsideClass = interface(JBitmapTransformationClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{C0D90104-F384-45D1-A17D-9296E577AB5B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCenterInside; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/CenterInside')]
  JCenterInside = interface(JBitmapTransformation) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{A5D71F70-4DF2-4EA0-9EE9-320B72132D5C}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJCenterInside = class(TJavaGenericImport<JCenterInsideClass, JCenterInside>) end;

  JCircleCropClass = interface(JBitmapTransformationClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{841C9D56-8364-4649-AA27-824EA6550753}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCircleCrop; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/CircleCrop')]
  JCircleCrop = interface(JBitmapTransformation) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{ABE58377-A0C1-4AF4-9216-54F210D243F9}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJCircleCrop = class(TJavaGenericImport<JCircleCropClass, JCircleCrop>) end;

  JDefaultImageHeaderParser_ByteBufferReaderClass = interface(JObjectClass)
  ['{B98976D8-5D56-420C-AD44-7D16630DCC58}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$ByteBufferReader')]
  JDefaultImageHeaderParser_ByteBufferReader = interface(JObject)
  ['{B9746967-849D-44A0-A8C4-D2F18E890027}']
    { Property Methods }

    { methods }
    function getUInt16: Integer; cdecl; //()I
    function getUInt8: Word; cdecl; //()S
    function skip(total: Int64): Int64; cdecl; //(J)J
    function read(buffer: TJavaArray<Byte>; byteCount: Integer): Integer; cdecl; //([BI)I
    function getByte: Integer; cdecl; //()I

    { Property }
  end;

  TJDefaultImageHeaderParser_ByteBufferReader = class(TJavaGenericImport<JDefaultImageHeaderParser_ByteBufferReaderClass, JDefaultImageHeaderParser_ByteBufferReader>) end;

  JDefaultImageHeaderParser_RandomAccessReaderClass = interface(JObjectClass)
  ['{66FB2644-EE95-43E1-8594-C6AFB6EC7D05}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader')]
  JDefaultImageHeaderParser_RandomAccessReader = interface(JObject)
  ['{E85D67E8-3BE4-4E29-850B-7A55A7E53D26}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDefaultImageHeaderParser_RandomAccessReader = class(TJavaGenericImport<JDefaultImageHeaderParser_RandomAccessReaderClass, JDefaultImageHeaderParser_RandomAccessReader>) end;

  JDefaultImageHeaderParser_ReaderClass = interface(JObjectClass)
  ['{EE4B2243-73C0-4603-89FF-DD1DC936EB80}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader')]
  JDefaultImageHeaderParser_Reader = interface(IJavaInstance)
  ['{33282F31-302A-47FC-B512-F7B40B83ED23}']
    { Property Methods }

    { methods }
    function getUInt16: Integer; cdecl; //()I
    function getUInt8: Word; cdecl; //()S
    function skip(P1: Int64): Int64; cdecl; //(J)J
    function read(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl; //([BI)I
    function getByte: Integer; cdecl; //()I

    { Property }
  end;

  TJDefaultImageHeaderParser_Reader = class(TJavaGenericImport<JDefaultImageHeaderParser_ReaderClass, JDefaultImageHeaderParser_Reader>) end;

  JDefaultImageHeaderParser_StreamReaderClass = interface(JObjectClass)
  ['{A0CCB697-96C5-404B-9AD2-529124E90929}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader')]
  JDefaultImageHeaderParser_StreamReader = interface(JObject)
  ['{E05BC97D-4772-480B-A970-C0B2E6796ED3}']
    { Property Methods }

    { methods }
    function getUInt16: Integer; cdecl; //()I
    function getUInt8: Word; cdecl; //()S
    function skip(total: Int64): Int64; cdecl; //(J)J
    function read(buffer: TJavaArray<Byte>; byteCount: Integer): Integer; cdecl; //([BI)I
    function getByte: Integer; cdecl; //()I

    { Property }
  end;

  TJDefaultImageHeaderParser_StreamReader = class(TJavaGenericImport<JDefaultImageHeaderParser_StreamReaderClass, JDefaultImageHeaderParser_StreamReader>) end;

  JDefaultImageHeaderParserClass = interface(JObjectClass)
  ['{21E02921-5EF0-43F6-87DF-48E72229EEEB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDefaultImageHeaderParser; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser')]
  JDefaultImageHeaderParser = interface(JObject)
  ['{6970BB9E-62E3-4212-83C7-6C161DEB759B}']
    { Property Methods }

    { methods }
    function getType(ais: JInputStream): JImageHeaderParser_ImageType; cdecl; overload; //(Ljava/io/InputStream;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    function getType(byteBuffer: JByteBuffer): JImageHeaderParser_ImageType; cdecl; overload; //(Ljava/nio/ByteBuffer;)Lcom/bumptech/glide/load/ImageHeaderParser$ImageType;
    function getOrientation(ais: JInputStream; byteArrayPool: JArrayPool): Integer; cdecl; overload; //(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)I
    function getOrientation(byteBuffer: JByteBuffer; byteArrayPool: JArrayPool): Integer; cdecl; overload; //(Ljava/nio/ByteBuffer;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)I

    { Property }
  end;

  TJDefaultImageHeaderParser = class(TJavaGenericImport<JDefaultImageHeaderParserClass, JDefaultImageHeaderParser>) end;

  JDownsampler_DecodeCallbacksClass = interface(JObjectClass)
  ['{BCA0B01F-6F5D-4395-BCBB-4F1C91650141}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks')]
  JDownsampler_DecodeCallbacks = interface(IJavaInstance)
  ['{55092276-96B7-4B61-82EC-62EB18D30AE2}']
    { Property Methods }

    { methods }
    procedure onObtainBounds; cdecl; //()V
    procedure onDecodeComplete(P1: JBitmapPool; P2: JBitmap); cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJDownsampler_DecodeCallbacks = class(TJavaGenericImport<JDownsampler_DecodeCallbacksClass, JDownsampler_DecodeCallbacks>) end;

  JDownsamplerClass = interface(JObjectClass)
  ['{E48BD489-E319-44CF-AD67-57F2D8AA4144}']
    { static Property Methods }
    {class} function _GetDECODE_FORMAT: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;
    {class} function _GetDOWNSAMPLE_STRATEGY: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;
    {class} function _GetFIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;
    {class} function _GetALLOW_HARDWARE_CONFIG: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;

    { static Methods }
    {class} function init(parsers: JList; P2: JDisplayMetrics; bitmapPool: JBitmapPool; byteArrayPool: JArrayPool): JDownsampler; cdecl; //(Ljava/util/List;Landroid/util/DisplayMetrics;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    { static Property }
    {class} property DECODE_FORMAT: JOption read _GetDECODE_FORMAT;
    {class} property DOWNSAMPLE_STRATEGY: JOption read _GetDOWNSAMPLE_STRATEGY;
    {class} property FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS: JOption read _GetFIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS;
    {class} property ALLOW_HARDWARE_CONFIG: JOption read _GetALLOW_HARDWARE_CONFIG;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/Downsampler')]
  JDownsampler = interface(JObject)
  ['{5ABC71D8-46E5-4AE2-BD33-7637C11F29BE}']
    { Property Methods }

    { methods }
    function handles(ais: JInputStream): Boolean; cdecl; overload; //(Ljava/io/InputStream;)Z
    function handles(byteBuffer: JByteBuffer): Boolean; cdecl; overload; //(Ljava/nio/ByteBuffer;)Z
    function decode(ais: JInputStream; outWidth: Integer; outHeight: Integer; options: JOptions): JResource; cdecl; overload; //(Ljava/io/InputStream;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(ais: JInputStream; requestedWidth: Integer; requestedHeight: Integer; options: JOptions; callbacks: JDownsampler_DecodeCallbacks): JResource; cdecl; overload; //(Ljava/io/InputStream;IILcom/bumptech/glide/load/Options;Lcom/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJDownsampler = class(TJavaGenericImport<JDownsamplerClass, JDownsampler>) end;

  JDownsampleStrategyClass = interface(JObjectClass)
  ['{7E827285-2F48-4E1A-8421-0C59B49E8B86}']
    { static Property Methods }
    {class} function _GetFIT_CENTER: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
    {class} function _GetCENTER_OUTSIDE: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
    {class} function _GetAT_LEAST: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
    {class} function _GetAT_MOST: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
    {class} function _GetCENTER_INSIDE: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
    {class} function _GetNONE: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
    {class} function _GetDEFAULT: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;
    {class} function _GetOPTION: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;

    { static Methods }
    {class} function init: JDownsampleStrategy; cdecl; //()V

    { static Property }
    {class} property FIT_CENTER: JDownsampleStrategy read _GetFIT_CENTER;
    {class} property CENTER_OUTSIDE: JDownsampleStrategy read _GetCENTER_OUTSIDE;
    {class} property AT_LEAST: JDownsampleStrategy read _GetAT_LEAST;
    {class} property AT_MOST: JDownsampleStrategy read _GetAT_MOST;
    {class} property CENTER_INSIDE: JDownsampleStrategy read _GetCENTER_INSIDE;
    {class} property NONE: JDownsampleStrategy read _GetNONE;
    {class} property DEFAULT: JDownsampleStrategy read _GetDEFAULT;
    {class} property OPTION: JOption read _GetOPTION;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy')]
  JDownsampleStrategy = interface(JObject)
  ['{3ED5E717-A7D9-4261-BC17-27B125BF589D}']
    { Property Methods }

    { methods }
    function getScaleFactor(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Single; cdecl; //(IIII)F
    function getSampleSizeRounding(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl; //(IIII)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { Property }
  end;

  TJDownsampleStrategy = class(TJavaGenericImport<JDownsampleStrategyClass, JDownsampleStrategy>) end;

  JDownsampleStrategy_AtLeastClass = interface(JDownsampleStrategyClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{A3127664-6598-44AF-A62E-F0593AB235BF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$AtLeast')]
  JDownsampleStrategy_AtLeast = interface(JDownsampleStrategy) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{AFA6C604-FA4D-4ABD-B755-E253212C2E81}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl; //(IIII)F
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl; //(IIII)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { Property }
  end;

  TJDownsampleStrategy_AtLeast = class(TJavaGenericImport<JDownsampleStrategy_AtLeastClass, JDownsampleStrategy_AtLeast>) end;

  JDownsampleStrategy_AtMostClass = interface(JDownsampleStrategyClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{B0E5BAC8-6DB6-43EF-9762-3F355273F5C0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$AtMost')]
  JDownsampleStrategy_AtMost = interface(JDownsampleStrategy) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{A313BA39-F1CB-4A6C-ADB1-DF534FE30121}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl; //(IIII)F
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl; //(IIII)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { Property }
  end;

  TJDownsampleStrategy_AtMost = class(TJavaGenericImport<JDownsampleStrategy_AtMostClass, JDownsampleStrategy_AtMost>) end;

  JDownsampleStrategy_CenterInsideClass = interface(JDownsampleStrategyClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{3B716493-A38D-4C9B-990D-16E313FB9AC5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$CenterInside')]
  JDownsampleStrategy_CenterInside = interface(JDownsampleStrategy) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{6A295288-15D5-40A9-84CB-DA63695C17BD}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl; //(IIII)F
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl; //(IIII)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { Property }
  end;

  TJDownsampleStrategy_CenterInside = class(TJavaGenericImport<JDownsampleStrategy_CenterInsideClass, JDownsampleStrategy_CenterInside>) end;

  JDownsampleStrategy_CenterOutsideClass = interface(JDownsampleStrategyClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{AF3025A2-DA35-4FE3-9604-CED6FCB282BE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$CenterOutside')]
  JDownsampleStrategy_CenterOutside = interface(JDownsampleStrategy) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{6B548CEE-05CC-4EDF-8BE4-4781C285F0BB}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl; //(IIII)F
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl; //(IIII)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { Property }
  end;

  TJDownsampleStrategy_CenterOutside = class(TJavaGenericImport<JDownsampleStrategy_CenterOutsideClass, JDownsampleStrategy_CenterOutside>) end;

  JDownsampleStrategy_FitCenterClass = interface(JDownsampleStrategyClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{71B026B0-059C-4B49-AACB-F8E64E7D6E3D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$FitCenter')]
  JDownsampleStrategy_FitCenter = interface(JDownsampleStrategy) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{97A092F3-311D-46F7-A9CE-797921084DFB}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl; //(IIII)F
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl; //(IIII)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { Property }
  end;

  TJDownsampleStrategy_FitCenter = class(TJavaGenericImport<JDownsampleStrategy_FitCenterClass, JDownsampleStrategy_FitCenter>) end;

  JDownsampleStrategy_NoneClass = interface(JDownsampleStrategyClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{556F9A61-3EDF-47DF-BA7A-9021AE3A4DD7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$None')]
  JDownsampleStrategy_None = interface(JDownsampleStrategy) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/DownsampleStrategy
  ['{EEF57305-DBE1-4266-83B7-15771BBB332C}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl; //(IIII)F
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl; //(IIII)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { Property }
  end;

  TJDownsampleStrategy_None = class(TJavaGenericImport<JDownsampleStrategy_NoneClass, JDownsampleStrategy_None>) end;

  JDownsampleStrategy_SampleSizeRoundingClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{8431F797-E3C2-4550-872B-0943F2EE6F4B}']
    { static Property Methods }
    {class} function _GetMEMORY: JDownsampleStrategy_SampleSizeRounding;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;
    {class} function _GetQUALITY: JDownsampleStrategy_SampleSizeRounding;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { static Methods }
    {class} function values: TJavaObjectArray<JDownsampleStrategy_SampleSizeRounding>; cdecl; //()[Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;
    {class} function valueOf(name: JString): JDownsampleStrategy_SampleSizeRounding; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding;

    { static Property }
    {class} property MEMORY: JDownsampleStrategy_SampleSizeRounding read _GetMEMORY;
    {class} property QUALITY: JDownsampleStrategy_SampleSizeRounding read _GetQUALITY;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding')]
  JDownsampleStrategy_SampleSizeRounding = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{3FE9E493-473D-4F53-99AA-3FBFC1D48D67}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDownsampleStrategy_SampleSizeRounding = class(TJavaGenericImport<JDownsampleStrategy_SampleSizeRoundingClass, JDownsampleStrategy_SampleSizeRounding>) end;

  JDrawableToBitmapConverterClass = interface(JObjectClass)
  ['{26E3F210-C8F7-4C6B-BD24-E11C14D12A1E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DrawableToBitmapConverter')]
  JDrawableToBitmapConverter = interface(JObject)
  ['{76688F21-232A-4D79-BE7F-285FEA0E11C1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDrawableToBitmapConverter = class(TJavaGenericImport<JDrawableToBitmapConverterClass, JDrawableToBitmapConverter>) end;

  JDrawableTransformationClass = interface(JObjectClass)
  ['{9D735F71-028E-4BB1-A9D3-D6E7D0C0092E}']
    { static Property Methods }

    { static Methods }
    {class} function init(wrapped: JTransformation; P2: Boolean): JDrawableTransformation; cdecl; //(Lcom/bumptech/glide/load/Transformation;Z)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DrawableTransformation')]
  JDrawableTransformation = interface(JObject)
  ['{AC2DB13D-DA23-40F8-967A-5047213EA7B8}']
    { Property Methods }

    { methods }
    function asBitmapDrawable: JTransformation; cdecl; //()Lcom/bumptech/glide/load/Transformation;
    function transform(context: JContext; resource: JResource; P3: Integer; outHeight: Integer): JResource; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJDrawableTransformation = class(TJavaGenericImport<JDrawableTransformationClass, JDrawableTransformation>) end;

  JFitCenterClass = interface(JBitmapTransformationClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{DABD5667-4CE9-4138-B44D-14656C961CAF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFitCenter; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/FitCenter')]
  JFitCenter = interface(JBitmapTransformation) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{F8B4CA18-99E5-4D5A-AB2E-191D9AABFFA3}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJFitCenter = class(TJavaGenericImport<JFitCenterClass, JFitCenter>) end;

  JHardwareConfigStateClass = interface(JObjectClass)
  ['{7E0515E8-86AD-48B1-A6B8-10B1BD72BBE5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/HardwareConfigState')]
  JHardwareConfigState = interface(JObject)
  ['{2338A581-75E5-489E-B164-8F12E3A7A87B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJHardwareConfigState = class(TJavaGenericImport<JHardwareConfigStateClass, JHardwareConfigState>) end;

  JLazyBitmapDrawableResourceClass = interface(JObjectClass)
  ['{1EF9096D-A1D1-4BD1-A280-48735ADFAD9A}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(context: JContext; bitmap: JBitmap): JLazyBitmapDrawableResource; cdecl; overload; //Deprecated //(Landroid/content/Context;Landroid/graphics/Bitmap;)Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;
    {class} function obtain(resources: JResources; bitmapPool: JBitmapPool; bitmap: JBitmap): JLazyBitmapDrawableResource; cdecl; overload; //Deprecated //(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;)Lcom/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource;
    {class} function obtain(resources: JResources; bitmapResource: JResource): JResource; cdecl; overload; //(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/engine/Resource;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource')]
  JLazyBitmapDrawableResource = interface(JObject)
  ['{ADAC7987-EC7C-495E-A8AC-C8350AE88364}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function get: JBitmapDrawable; cdecl; overload; //()Landroid/graphics/drawable/BitmapDrawable;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V
    procedure initialize; cdecl; //()V
//    function get: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJLazyBitmapDrawableResource = class(TJavaGenericImport<JLazyBitmapDrawableResourceClass, JLazyBitmapDrawableResource>) end;

  JRecyclableBufferedInputStream_InvalidMarkExceptionClass = interface(JIOExceptionClass) // or JObjectClass // SuperSignature: java/io/IOException
  ['{002BA542-340A-408C-BF7A-19403AFAE8B5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream$InvalidMarkException')]
  JRecyclableBufferedInputStream_InvalidMarkException = interface(JIOException) // or JObject // SuperSignature: java/io/IOException
  ['{DF623634-8B68-4B67-BABB-221B549DC830}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRecyclableBufferedInputStream_InvalidMarkException = class(TJavaGenericImport<JRecyclableBufferedInputStream_InvalidMarkExceptionClass, JRecyclableBufferedInputStream_InvalidMarkException>) end;

//  JRecyclableBufferedInputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterInputStream
//  ['{BFFB99BF-2CA7-442F-83ED-2649B0E7701A}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream; byteArrayPool: JArrayPool): JRecyclableBufferedInputStream; cdecl; //(Ljava/io/InputStream;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream')]
//  JRecyclableBufferedInputStream = interface(JFilterInputStream) // or JObject // SuperSignature: java/io/FilterInputStream
//  ['{AD8C19B3-BC4E-4F15-8630-E21D38EBFBF8}']
//    { Property Methods }
//
//    { methods }
//    function available: Integer; cdecl; //()I
//    procedure fixMarkLimit; cdecl; //()V
//    procedure release; cdecl; //()V
//    procedure close; cdecl; //()V
//    procedure mark(readlimit: Integer); cdecl; //(I)V
//    function markSupported: Boolean; cdecl; //()Z
//    function read: Integer; cdecl; overload; //()I
//    function read(buffer: TJavaArray<Byte>; offset: Integer; byteCount: Integer): Integer; cdecl; overload; //([BII)I
//    procedure reset; cdecl; //()V
//    function skip(byteCount: Int64): Int64; cdecl; //(J)J
//
//    { Property }
//  end;
//
//  TJRecyclableBufferedInputStream = class(TJavaGenericImport<JRecyclableBufferedInputStreamClass, JRecyclableBufferedInputStream>) end;

  JResourceBitmapDecoderClass = interface(JObjectClass)
  ['{6D0752FD-F688-4627-8CDA-DA3A1777413B}']
    { static Property Methods }

    { static Methods }
    {class} function init(drawableDecoder: JResourceDrawableDecoder; bitmapPool: JBitmapPool): JResourceBitmapDecoder; cdecl; //(Lcom/bumptech/glide/load/resource/drawable/ResourceDrawableDecoder;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/ResourceBitmapDecoder')]
  JResourceBitmapDecoder = interface(JObject)
  ['{A7BB6671-81FB-45CB-94F3-9E4D1D7C5D6F}']
    { Property Methods }

    { methods }
    function handles(source: Jnet_Uri; options: JOptions): Boolean; cdecl; overload; //(Landroid/net/Uri;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJResourceBitmapDecoder = class(TJavaGenericImport<JResourceBitmapDecoderClass, JResourceBitmapDecoder>) end;

  JRoundedCornersClass = interface(JBitmapTransformationClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{7E1924DD-E669-4C05-BA43-2087F7C67AFC}']
    { static Property Methods }

    { static Methods }
    {class} function init(roundingRadius: Integer): JRoundedCorners; cdecl; //(I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/RoundedCorners')]
  JRoundedCorners = interface(JBitmapTransformation) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/BitmapTransformation
  ['{7DEDD9E2-CF17-4547-944A-152CAA3EE8C7}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJRoundedCorners = class(TJavaGenericImport<JRoundedCornersClass, JRoundedCorners>) end;

  JStreamBitmapDecoder_UntrustedCallbacksClass = interface(JObjectClass)
  ['{277A3E08-4616-4401-8154-6899AE4B5B42}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/StreamBitmapDecoder$UntrustedCallbacks')]
  JStreamBitmapDecoder_UntrustedCallbacks = interface(JObject)
  ['{50F37D92-4A28-4F3E-AE00-4B58D7DB1239}']
    { Property Methods }

    { methods }
    procedure onObtainBounds; cdecl; //()V
    procedure onDecodeComplete(bitmapPool: JBitmapPool; downsampled: JBitmap); cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;)V

    { Property }
  end;

  TJStreamBitmapDecoder_UntrustedCallbacks = class(TJavaGenericImport<JStreamBitmapDecoder_UntrustedCallbacksClass, JStreamBitmapDecoder_UntrustedCallbacks>) end;

  JStreamBitmapDecoderClass = interface(JObjectClass)
  ['{3DAF7D67-4FE1-45AB-82C1-5CD27DB35D80}']
    { static Property Methods }

    { static Methods }
    {class} function init(downsampler: JDownsampler; byteArrayPool: JArrayPool): JStreamBitmapDecoder; cdecl; //(Lcom/bumptech/glide/load/resource/bitmap/Downsampler;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/StreamBitmapDecoder')]
  JStreamBitmapDecoder = interface(JObject)
  ['{91D224C0-1DF8-4785-9114-E776CE161B06}']
    { Property Methods }

    { methods }
    function handles(source: JInputStream; options: JOptions): Boolean; cdecl; overload; //(Ljava/io/InputStream;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: JInputStream; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Ljava/io/InputStream;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJStreamBitmapDecoder = class(TJavaGenericImport<JStreamBitmapDecoderClass, JStreamBitmapDecoder>) end;

  JTransformationUtils_NoLockClass = interface(JObjectClass)
  ['{75739852-2810-423C-93F9-D02AA93F0B32}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/TransformationUtils$NoLock')]
  JTransformationUtils_NoLock = interface(JObject)
  ['{89B94796-008E-4A16-B8D2-669169CA5735}']
    { Property Methods }

    { methods }
    procedure lock; cdecl; //()V
    procedure lockInterruptibly; cdecl; //()V
    function tryLock: Boolean; cdecl; overload; //()Z
    function tryLock(time: Int64; P2: JTimeUnit): Boolean; cdecl; overload; //(JLjava/util/concurrent/TimeUnit;)Z
    procedure unlock; cdecl; //()V
//    function newCondition: JCondition; cdecl; //()Ljava/util/concurrent/locks/Condition;

    { Property }
  end;

  TJTransformationUtils_NoLock = class(TJavaGenericImport<JTransformationUtils_NoLockClass, JTransformationUtils_NoLock>) end;

  JTransformationUtilsClass = interface(JObjectClass)
  ['{5DED8563-1471-4EEC-B584-15F8142AF823}']
    { static Property Methods }
    {class} function _GetPAINT_FLAGS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
//    {class} function getBitmapDrawableLock: JLock; cdecl; //()Ljava/util/concurrent/locks/Lock;
    {class} function centerCrop(pool: JBitmapPool; inBitmap: JBitmap; width: Integer; height: Integer): JBitmap; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function fitCenter(pool: JBitmapPool; inBitmap: JBitmap; width: Integer; height: Integer): JBitmap; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function centerInside(pool: JBitmapPool; inBitmap: JBitmap; width: Integer; height: Integer): JBitmap; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} procedure setAlpha(inBitmap: JBitmap; outBitmap: JBitmap); cdecl; //(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;)V
    {class} function rotateImage(imageToOrient: JBitmap; degreesToRotate: Integer): JBitmap; cdecl; //(Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function getExifOrientationDegrees(exifOrientation: Integer): Integer; cdecl; //(I)I
    {class} function rotateImageExif(pool: JBitmapPool; inBitmap: JBitmap; exifOrientation: Integer): JBitmap; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;
    {class} function isExifOrientationRequired(exifOrientation: Integer): Boolean; cdecl; //(I)Z
    {class} function circleCrop(pool: JBitmapPool; inBitmap: JBitmap; destWidth: Integer; destHeight: Integer): JBitmap; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;II)Landroid/graphics/Bitmap;
    {class} function roundedCorners(pool: JBitmapPool; inBitmap: JBitmap; width: Integer; height: Integer; roundingRadius: Integer): JBitmap; cdecl; overload; //Deprecated //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;III)Landroid/graphics/Bitmap;
    {class} function roundedCorners(pool: JBitmapPool; inBitmap: JBitmap; roundingRadius: Integer): JBitmap; cdecl; overload; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Landroid/graphics/Bitmap;I)Landroid/graphics/Bitmap;

    { static Property }
    {class} property PAINT_FLAGS: Integer read _GetPAINT_FLAGS;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/TransformationUtils')]
  JTransformationUtils = interface(JObject)
  ['{77D0F405-379F-478A-BAC0-1645559DD3F4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTransformationUtils = class(TJavaGenericImport<JTransformationUtilsClass, JTransformationUtils>) end;

  JUnitBitmapDecoder_NonOwnedBitmapResourceClass = interface(JObjectClass)
  ['{134BA581-1CC7-49E0-80A4-B530136873F5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/UnitBitmapDecoder$NonOwnedBitmapResource')]
  JUnitBitmapDecoder_NonOwnedBitmapResource = interface(JObject)
  ['{8ED98F50-F99C-4CFA-9752-EDF8356E5658}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function get: JBitmap; cdecl; overload; //()Landroid/graphics/Bitmap;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V
//    function get: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJUnitBitmapDecoder_NonOwnedBitmapResource = class(TJavaGenericImport<JUnitBitmapDecoder_NonOwnedBitmapResourceClass, JUnitBitmapDecoder_NonOwnedBitmapResource>) end;

  JUnitBitmapDecoderClass = interface(JObjectClass)
  ['{7247F5AA-4EFE-4155-91F4-3B933C5B2CC2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnitBitmapDecoder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/UnitBitmapDecoder')]
  JUnitBitmapDecoder = interface(JObject)
  ['{93D8BA12-600F-42D8-9B16-03B2E76DCBE8}']
    { Property Methods }

    { methods }
    function handles(source: JBitmap; options: JOptions): Boolean; cdecl; overload; //(Landroid/graphics/Bitmap;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: JBitmap; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Landroid/graphics/Bitmap;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJUnitBitmapDecoder = class(TJavaGenericImport<JUnitBitmapDecoderClass, JUnitBitmapDecoder>) end;

  JVideoDecoderClass = interface(JObjectClass)
  ['{2AA36FAD-8455-4DA5-8673-BABC1B8ABEA3}']
    { static Property Methods }
    {class} function _GetDEFAULT_FRAME: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //J
    {class} function _GetTARGET_FRAME: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;
    {class} function _GetFRAME_OPTION: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;

    { static Methods }
    {class} function asset(bitmapPool: JBitmapPool): JResourceDecoder; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Lcom/bumptech/glide/load/ResourceDecoder;
    {class} function parcel(bitmapPool: JBitmapPool): JResourceDecoder; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)Lcom/bumptech/glide/load/ResourceDecoder;

    { static Property }
    {class} property DEFAULT_FRAME: Int64 read _GetDEFAULT_FRAME;
    {class} property TARGET_FRAME: JOption read _GetTARGET_FRAME;
    {class} property FRAME_OPTION: JOption read _GetFRAME_OPTION;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoDecoder')]
  JVideoDecoder = interface(JObject)
  ['{AAC417D0-F06B-40B7-BE4B-650EA6EDE667}']
    { Property Methods }

    { methods }
    function handles(data: JObject; options: JOptions): Boolean; cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z
    function decode(resource: JObject; outWidth: Integer; outHeight: Integer; options: JOptions): JResource; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJVideoDecoder = class(TJavaGenericImport<JVideoDecoderClass, JVideoDecoder>) end;

  JVideoBitmapDecoderClass = interface(JVideoDecoderClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/bitmap/VideoDecoder
  ['{29E2B1F1-4396-4522-950C-54439F8BF3EE}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JVideoBitmapDecoder; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(bitmapPool: JBitmapPool): JVideoBitmapDecoder; cdecl; overload; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoBitmapDecoder')]
  JVideoBitmapDecoder = interface(JVideoDecoder) // or JObject // SuperSignature: com/bumptech/glide/load/resource/bitmap/VideoDecoder
  ['{CBAD289E-098F-46D6-9319-F550D25BF7D6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJVideoBitmapDecoder = class(TJavaGenericImport<JVideoBitmapDecoderClass, JVideoBitmapDecoder>) end;

  JVideoDecoder_AssetFileDescriptorInitializerClass = interface(JObjectClass)
  ['{115D3DCA-95E0-451A-A6A8-BBE9BBB08760}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoDecoder$AssetFileDescriptorInitializer')]
  JVideoDecoder_AssetFileDescriptorInitializer = interface(JObject)
  ['{5B28C17E-4521-420C-BC21-B8DAE44CF9B3}']
    { Property Methods }

    { methods }
    procedure initialize(retriever: JMediaMetadataRetriever; data: JAssetFileDescriptor); cdecl; overload; //(Landroid/media/MediaMetadataRetriever;Landroid/content/res/AssetFileDescriptor;)V
    procedure initialize(this: JMediaMetadataRetriever; P2: JObject); cdecl; overload; //(Landroid/media/MediaMetadataRetriever;Ljava/lang/Object;)V

    { Property }
  end;

  TJVideoDecoder_AssetFileDescriptorInitializer = class(TJavaGenericImport<JVideoDecoder_AssetFileDescriptorInitializerClass, JVideoDecoder_AssetFileDescriptorInitializer>) end;

  JVideoDecoder_MediaMetadataRetrieverFactoryClass = interface(JObjectClass)
  ['{53D1C6B2-DB1B-4CF4-BD75-BDC9560CC375}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoDecoder$MediaMetadataRetrieverFactory')]
  JVideoDecoder_MediaMetadataRetrieverFactory = interface(JObject)
  ['{655982C9-C071-4B36-B808-1CC02341F144}']
    { Property Methods }

    { methods }
    function build: JMediaMetadataRetriever; cdecl; //()Landroid/media/MediaMetadataRetriever;

    { Property }
  end;

  TJVideoDecoder_MediaMetadataRetrieverFactory = class(TJavaGenericImport<JVideoDecoder_MediaMetadataRetrieverFactoryClass, JVideoDecoder_MediaMetadataRetrieverFactory>) end;

  JVideoDecoder_MediaMetadataRetrieverInitializerClass = interface(JObjectClass)
  ['{99CD8DD5-F6FD-41F2-AB6B-F70D46E72CBD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoDecoder$MediaMetadataRetrieverInitializer')]
  JVideoDecoder_MediaMetadataRetrieverInitializer = interface(IJavaInstance)
  ['{C04F9CDB-6C02-4942-8B7D-60F22567F6B0}']
    { Property Methods }

    { methods }
    procedure initialize(P1: JMediaMetadataRetriever; P2: JObject); cdecl; //(Landroid/media/MediaMetadataRetriever;Ljava/lang/Object;)V

    { Property }
  end;

  TJVideoDecoder_MediaMetadataRetrieverInitializer = class(TJavaGenericImport<JVideoDecoder_MediaMetadataRetrieverInitializerClass, JVideoDecoder_MediaMetadataRetrieverInitializer>) end;

  JVideoDecoder_ParcelFileDescriptorInitializerClass = interface(JObjectClass)
  ['{7203472B-7ED1-4C80-8F59-D51077CA5A0A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoDecoder$ParcelFileDescriptorInitializer')]
  JVideoDecoder_ParcelFileDescriptorInitializer = interface(JObject)
  ['{F46CB03C-6D2F-4404-B955-9716090F1B9F}']
    { Property Methods }

    { methods }
    procedure initialize(retriever: JMediaMetadataRetriever; data: JParcelFileDescriptor); cdecl; overload; //(Landroid/media/MediaMetadataRetriever;Landroid/os/ParcelFileDescriptor;)V
    procedure initialize(this: JMediaMetadataRetriever; P2: JObject); cdecl; overload; //(Landroid/media/MediaMetadataRetriever;Ljava/lang/Object;)V

    { Property }
  end;

  TJVideoDecoder_ParcelFileDescriptorInitializer = class(TJavaGenericImport<JVideoDecoder_ParcelFileDescriptorInitializerClass, JVideoDecoder_ParcelFileDescriptorInitializer>) end;

  JByteBufferRewinder_FactoryClass = interface(JObjectClass)
  ['{6FC1F2A0-53CC-455C-8784-D01749245FFC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteBufferRewinder_Factory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bytes/ByteBufferRewinder$Factory')]
  JByteBufferRewinder_Factory = interface(JObject)
  ['{0F06A9C6-98A8-44D8-9BE8-AD6113E0C5F7}']
    { Property Methods }

    { methods }
    function build(data: JByteBuffer): JDataRewinder; cdecl; overload; //(Ljava/nio/ByteBuffer;)Lcom/bumptech/glide/load/data/DataRewinder;
    function getDataClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function build(this: JObject): JDataRewinder; cdecl; overload; //(Ljava/lang/Object;)Lcom/bumptech/glide/load/data/DataRewinder;

    { Property }
  end;

  TJByteBufferRewinder_Factory = class(TJavaGenericImport<JByteBufferRewinder_FactoryClass, JByteBufferRewinder_Factory>) end;

  JByteBufferRewinderClass = interface(JObjectClass)
  ['{1B055AEC-5BA9-4081-A584-A48F3D7DF26C}']
    { static Property Methods }

    { static Methods }
    {class} function init(buffer: JByteBuffer): JByteBufferRewinder; cdecl; //(Ljava/nio/ByteBuffer;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bytes/ByteBufferRewinder')]
  JByteBufferRewinder = interface(JObject)
  ['{DC8B99BE-E0E9-431D-A441-D7677D87C8ED}']
    { Property Methods }

    { methods }
    function rewindAndGet: JByteBuffer; cdecl; overload; //()Ljava/nio/ByteBuffer;
    procedure cleanup; cdecl; //()V
//    function rewindAndGet: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJByteBufferRewinder = class(TJavaGenericImport<JByteBufferRewinderClass, JByteBufferRewinder>) end;

  JBytesResourceClass = interface(JObjectClass)
  ['{29BE44E7-E4E7-41ED-A07E-92A2CE3D3F76}']
    { static Property Methods }

    { static Methods }
    {class} function init(bytes: TJavaArray<Byte>): JBytesResource; cdecl; //([B)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bytes/BytesResource')]
  JBytesResource = interface(JObject)
  ['{BFC19E45-20EE-4833-A7C5-34C452F1C717}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function get: TJavaArray<Byte>; cdecl; overload; //()[B
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V
//    function get: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJBytesResource = class(TJavaGenericImport<JBytesResourceClass, JBytesResource>) end;

  JDrawableDecoderCompatClass = interface(JObjectClass)
  ['{8DF76F88-9EB6-44D3-B92D-E3AAFFA18211}']
    { static Property Methods }

    { static Methods }
    {class} function getDrawable(ourContext: JContext; targetContext: JContext; id: Integer): JDrawable; cdecl; overload; //(Landroid/content/Context;Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    {class} function getDrawable(ourContext: JContext; id: Integer; theme: JResources_Theme): JDrawable; cdecl; overload; //(Landroid/content/Context;ILandroid/content/res/Resources$Theme;)Landroid/graphics/drawable/Drawable;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/drawable/DrawableDecoderCompat')]
  JDrawableDecoderCompat = interface(JObject)
  ['{6DB2A50D-3450-4DDE-B9C8-E854B4EF1891}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDrawableDecoderCompat = class(TJavaGenericImport<JDrawableDecoderCompatClass, JDrawableDecoderCompat>) end;

  JDrawableTransitionOptionsClass = interface(JTransitionOptionsClass) // or JObjectClass // SuperSignature: com/bumptech/glide/TransitionOptions
  ['{70183152-36DF-4E31-90B1-F625F47D9AC7}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDrawableTransitionOptions; cdecl; //()V
    {class} function withCrossFade: JDrawableTransitionOptions; cdecl; overload; //()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
    {class} function withCrossFade(duration: Integer): JDrawableTransitionOptions; cdecl; overload; //(I)Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
    {class} function withCrossFade(drawableCrossFadeFactory: JDrawableCrossFadeFactory): JDrawableTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;)Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
    {class} function withCrossFade(builder: JDrawableCrossFadeFactory_Builder): JDrawableTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory$Builder;)Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
    {class} function &with(transitionFactory: JTransitionFactory): JDrawableTransitionOptions; cdecl; //(Lcom/bumptech/glide/request/transition/TransitionFactory;)Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/drawable/DrawableTransitionOptions')]
  JDrawableTransitionOptions = interface(JTransitionOptions) // or JObject // SuperSignature: com/bumptech/glide/TransitionOptions
  ['{A38808BD-91FD-4AC2-8E61-D52F699A2075}']
    { Property Methods }

    { methods }
    function crossFade: JDrawableTransitionOptions; cdecl; overload; //()Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
    function crossFade(duration: Integer): JDrawableTransitionOptions; cdecl; overload; //(I)Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
    function crossFade(drawableCrossFadeFactory: JDrawableCrossFadeFactory): JDrawableTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;)Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;
    function crossFade(builder: JDrawableCrossFadeFactory_Builder): JDrawableTransitionOptions; cdecl; overload; //(Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory$Builder;)Lcom/bumptech/glide/load/resource/drawable/DrawableTransitionOptions;

    { Property }
  end;

  TJDrawableTransitionOptions = class(TJavaGenericImport<JDrawableTransitionOptionsClass, JDrawableTransitionOptions>) end;

  JNonOwnedDrawableResourceClass = interface(JDrawableResourceClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/drawable/DrawableResource
  ['{076DAEE5-7303-4EF6-82AD-43EB47B35F6D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/drawable/NonOwnedDrawableResource')]
  JNonOwnedDrawableResource = interface(JDrawableResource) // or JObject // SuperSignature: com/bumptech/glide/load/resource/drawable/DrawableResource
  ['{68744638-EDC7-485B-9E4D-BCC39387ED32}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V

    { Property }
  end;

  TJNonOwnedDrawableResource = class(TJavaGenericImport<JNonOwnedDrawableResourceClass, JNonOwnedDrawableResource>) end;

  JResourceDrawableDecoderClass = interface(JObjectClass)
  ['{92F5364C-621A-4B22-B129-7610B19C239C}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JResourceDrawableDecoder; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/drawable/ResourceDrawableDecoder')]
  JResourceDrawableDecoder = interface(JObject)
  ['{5F128708-ABE5-4ACE-BEDF-4A9E10CB7413}']
    { Property Methods }

    { methods }
    function handles(source: Jnet_Uri; options: JOptions): Boolean; cdecl; overload; //(Landroid/net/Uri;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: Jnet_Uri; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Landroid/net/Uri;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJResourceDrawableDecoder = class(TJavaGenericImport<JResourceDrawableDecoderClass, JResourceDrawableDecoder>) end;

  JUnitDrawableDecoderClass = interface(JObjectClass)
  ['{E217DEC4-1E6B-4F9F-8F62-15969F233F82}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnitDrawableDecoder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/drawable/UnitDrawableDecoder')]
  JUnitDrawableDecoder = interface(JObject)
  ['{CC37CBFE-A9F9-42EF-AC7F-6E002A5158AA}']
    { Property Methods }

    { methods }
    function handles(source: JDrawable; options: JOptions): Boolean; cdecl; overload; //(Landroid/graphics/drawable/Drawable;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: JDrawable; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Landroid/graphics/drawable/Drawable;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJUnitDrawableDecoder = class(TJavaGenericImport<JUnitDrawableDecoderClass, JUnitDrawableDecoder>) end;

  JFileDecoderClass = interface(JObjectClass)
  ['{404EF45F-6FCF-4885-852A-880F5D1640E8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileDecoder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/file/FileDecoder')]
  JFileDecoder = interface(JObject)
  ['{B7CBE064-BE11-4390-BF67-2B1057505B77}']
    { Property Methods }

    { methods }
    function handles(source: JFile; options: JOptions): Boolean; cdecl; overload; //(Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: JFile; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Ljava/io/File;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJFileDecoder = class(TJavaGenericImport<JFileDecoderClass, JFileDecoder>) end;

  JSimpleResourceClass = interface(JObjectClass)
  ['{208C6073-F597-4105-93F7-95D8543A4936}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: JObject): JSimpleResource; cdecl; //(Ljava/lang/Object;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/SimpleResource')]
  JSimpleResource = interface(JObject)
  ['{7D4CFF52-6098-4278-B200-5B792C88277A}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function get: JObject; cdecl; //()Ljava/lang/Object;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V

    { Property }
  end;

  TJSimpleResource = class(TJavaGenericImport<JSimpleResourceClass, JSimpleResource>) end;

  JFileResourceClass = interface(JSimpleResourceClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/SimpleResource
  ['{4DE5FC93-6C3E-433A-88AC-4F033FCCF52D}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile): JFileResource; cdecl; //(Ljava/io/File;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/file/FileResource')]
  JFileResource = interface(JSimpleResource) // or JObject // SuperSignature: com/bumptech/glide/load/resource/SimpleResource
  ['{E214D248-64E3-4B22-874F-021EB02466B7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileResource = class(TJavaGenericImport<JFileResourceClass, JFileResource>) end;

  JByteBufferGifDecoder_GifDecoderFactoryClass = interface(JObjectClass)
  ['{BE63927D-DF3E-4287-9BC3-3D1E5123A7AD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory')]
  JByteBufferGifDecoder_GifDecoderFactory = interface(JObject)
  ['{85C23DF1-67DC-4282-8210-E9D243861ED0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteBufferGifDecoder_GifDecoderFactory = class(TJavaGenericImport<JByteBufferGifDecoder_GifDecoderFactoryClass, JByteBufferGifDecoder_GifDecoderFactory>) end;

  JByteBufferGifDecoder_GifHeaderParserPoolClass = interface(JObjectClass)
  ['{C35C5E30-E508-4A0B-9ABE-4B298CD21BC6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool')]
  JByteBufferGifDecoder_GifHeaderParserPool = interface(JObject)
  ['{E7EC6787-5193-4DE7-A089-F1D9BE5DB203}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteBufferGifDecoder_GifHeaderParserPool = class(TJavaGenericImport<JByteBufferGifDecoder_GifHeaderParserPoolClass, JByteBufferGifDecoder_GifHeaderParserPool>) end;

  JByteBufferGifDecoderClass = interface(JObjectClass)
  ['{B7D1C891-46A7-4B83-A21D-640869844932}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JByteBufferGifDecoder; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(context: JContext; parsers: JList; P3: JBitmapPool; arrayPool: JArrayPool): JByteBufferGifDecoder; cdecl; overload; //(Landroid/content/Context;Ljava/util/List;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/ByteBufferGifDecoder')]
  JByteBufferGifDecoder = interface(JObject)
  ['{81DE5103-08EE-4E47-9B69-350CC9BC8507}']
    { Property Methods }

    { methods }
    function handles(source: JByteBuffer; options: JOptions): Boolean; cdecl; overload; //(Ljava/nio/ByteBuffer;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: JByteBuffer; width: Integer; height: Integer; options: JOptions): JGifDrawableResource; cdecl; overload; //(Ljava/nio/ByteBuffer;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/resource/gif/GifDrawableResource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJByteBufferGifDecoder = class(TJavaGenericImport<JByteBufferGifDecoderClass, JByteBufferGifDecoder>) end;

  JGifBitmapProviderClass = interface(JObjectClass)
  ['{00770938-27BF-4F3F-B923-8FBA590E715F}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool): JGifBitmapProvider; cdecl; overload; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V
    {class} function init(bitmapPool: JBitmapPool; arrayPool: JArrayPool): JGifBitmapProvider; cdecl; overload; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifBitmapProvider')]
  JGifBitmapProvider = interface(JObject)
  ['{3475A1F2-5C2C-43FF-862A-16F626E1223E}']
    { Property Methods }

    { methods }
    function obtain(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl; //(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;
    procedure release(bitmap: JBitmap); cdecl; overload; //(Landroid/graphics/Bitmap;)V
    function obtainByteArray(size: Integer): TJavaArray<Byte>; cdecl; //(I)[B
    procedure release(bytes: TJavaArray<Byte>); cdecl; overload; //([B)V
    function obtainIntArray(size: Integer): TJavaArray<Integer>; cdecl; //(I)[I
    procedure release(aarray: TJavaArray<Integer>); cdecl; overload; //([I)V

    { Property }
  end;

  TJGifBitmapProvider = class(TJavaGenericImport<JGifBitmapProviderClass, JGifBitmapProvider>) end;

  JGifDrawable_GifStateClass = interface(JDrawable_ConstantStateClass) // or JObjectClass // SuperSignature: android/graphics/drawable/Drawable$ConstantState
  ['{1EED6DB8-E766-48ED-81C8-A20815AEAC1D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawable$GifState')]
  JGifDrawable_GifState = interface(JDrawable_ConstantState) // or JObject // SuperSignature: android/graphics/drawable/Drawable$ConstantState
  ['{D9FF0A67-C8A7-4965-94AD-7830C9DFE029}']
    { Property Methods }

    { methods }
    function newDrawable(res: JResources): JDrawable; cdecl; overload; //(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    function newDrawable: JDrawable; cdecl; overload; //()Landroid/graphics/drawable/Drawable;
    function getChangingConfigurations: Integer; cdecl; //()I

    { Property }
  end;

  TJGifDrawable_GifState = class(TJavaGenericImport<JGifDrawable_GifStateClass, JGifDrawable_GifState>) end;

  JGifDrawableClass = interface(JDrawableClass) // or JObjectClass // SuperSignature: android/graphics/drawable/Drawable
  ['{1F5535FF-FEF7-4DF7-82EC-B97A3BB29262}']
    { static Property Methods }
    {class} function _GetLOOP_FOREVER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I
    {class} function _GetLOOP_INTRINSIC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }
//    {class} function init(context: JContext; gifDecoder: JGifDecoder; bitmapPool: JBitmapPool; frameTransformation: JTransformation; P5: Integer; targetFrameHeight: Integer; firstFrame: JBitmap): JGifDrawable; cdecl; overload; //Deprecated //(Landroid/content/Context;Lcom/bumptech/glide/gifdecoder/GifDecoder;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/Transformation;IILandroid/graphics/Bitmap;)V
//    {class} function init(context: JContext; gifDecoder: JGifDecoder; frameTransformation: JTransformation; P4: Integer; targetFrameHeight: Integer; firstFrame: JBitmap): JGifDrawable; cdecl; overload; //(Landroid/content/Context;Lcom/bumptech/glide/gifdecoder/GifDecoder;Lcom/bumptech/glide/load/Transformation;IILandroid/graphics/Bitmap;)V

    { static Property }
    {class} property LOOP_FOREVER: Integer read _GetLOOP_FOREVER;
    {class} property LOOP_INTRINSIC: Integer read _GetLOOP_INTRINSIC;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawable')]
  JGifDrawable = interface(JDrawable) // or JObject // SuperSignature: android/graphics/drawable/Drawable
  ['{2EDE565B-2A1D-4B98-8D1B-DDD20C556965}']
    { Property Methods }

    { methods }
    function getSize: Integer; cdecl; //()I
    function getFirstFrame: JBitmap; cdecl; //()Landroid/graphics/Bitmap;
    procedure setFrameTransformation(frameTransformation: JTransformation; P2: JBitmap); cdecl; //(Lcom/bumptech/glide/load/Transformation;Landroid/graphics/Bitmap;)V
    function getFrameTransformation: JTransformation; cdecl; //()Lcom/bumptech/glide/load/Transformation;
    function getBuffer: JByteBuffer; cdecl; //()Ljava/nio/ByteBuffer;
    function getFrameCount: Integer; cdecl; //()I
    function getFrameIndex: Integer; cdecl; //()I
    procedure startFromFirstFrame; cdecl; //()V
    procedure start; cdecl; //()V
    procedure stop; cdecl; //()V
    function setVisible(visible: Boolean; restart: Boolean): Boolean; cdecl; //(ZZ)Z
    function getIntrinsicWidth: Integer; cdecl; //()I
    function getIntrinsicHeight: Integer; cdecl; //()I
    function isRunning: Boolean; cdecl; //()Z
    procedure draw(canvas: JCanvas); cdecl; //(Landroid/graphics/Canvas;)V
    procedure setAlpha(i: Integer); cdecl; //(I)V
    procedure setColorFilter(colorFilter: JColorFilter); cdecl; //(Landroid/graphics/ColorFilter;)V
    function getOpacity: Integer; cdecl; //()I
    procedure onFrameReady; cdecl; //()V
    function getConstantState: JDrawable_ConstantState; cdecl; //()Landroid/graphics/drawable/Drawable$ConstantState;
    procedure recycle; cdecl; //()V
    procedure setLoopCount(loopCount: Integer); cdecl; //(I)V

    { Property }
  end;

  TJGifDrawable = class(TJavaGenericImport<JGifDrawableClass, JGifDrawable>) end;

  JGifDrawableEncoderClass = interface(JObjectClass)
  ['{1BFD0429-5249-424F-9E54-60AF6DB0DD2A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGifDrawableEncoder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawableEncoder')]
  JGifDrawableEncoder = interface(JObject)
  ['{33111A0D-912F-467B-BD7C-AD8F7F758C1E}']
    { Property Methods }

    { methods }
    function getEncodeStrategy(options: JOptions): JEncodeStrategy; cdecl; //(Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/EncodeStrategy;
    function encode(data: JResource; P2: JFile; options: JOptions): Boolean; cdecl; overload; //(Lcom/bumptech/glide/load/engine/Resource;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Ljava/io/File;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJGifDrawableEncoder = class(TJavaGenericImport<JGifDrawableEncoderClass, JGifDrawableEncoder>) end;

  JGifDrawableResourceClass = interface(JDrawableResourceClass) // or JObjectClass // SuperSignature: com/bumptech/glide/load/resource/drawable/DrawableResource
  ['{D81E1C40-6F24-4469-AED4-EB1F1CF57AF1}']
    { static Property Methods }

    { static Methods }
    {class} function init(drawable: JGifDrawable): JGifDrawableResource; cdecl; //(Lcom/bumptech/glide/load/resource/gif/GifDrawable;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawableResource')]
  JGifDrawableResource = interface(JDrawableResource) // or JObject // SuperSignature: com/bumptech/glide/load/resource/drawable/DrawableResource
  ['{381CCEDF-6DE8-4B1C-9269-B689769FFDC6}']
    { Property Methods }

    { methods }
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getSize: Integer; cdecl; //()I
    procedure recycle; cdecl; //()V
    procedure initialize; cdecl; //()V

    { Property }
  end;

  TJGifDrawableResource = class(TJavaGenericImport<JGifDrawableResourceClass, JGifDrawableResource>) end;

  JGifDrawableTransformationClass = interface(JObjectClass)
  ['{A7758D33-6366-4BA8-8BD8-5F6C1FBF95FF}']
    { static Property Methods }

    { static Methods }
    {class} function init(wrapped: JTransformation): JGifDrawableTransformation; cdecl; //(Lcom/bumptech/glide/load/Transformation;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawableTransformation')]
  JGifDrawableTransformation = interface(JObject)
  ['{1C901492-F8AE-43BD-B05F-771E8EDC0D29}']
    { Property Methods }

    { methods }
    function transform(context: JContext; resource: JResource; P3: Integer; outHeight: Integer): JResource; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJGifDrawableTransformation = class(TJavaGenericImport<JGifDrawableTransformationClass, JGifDrawableTransformation>) end;

  JSimpleTargetClass = interface(JBaseTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/BaseTarget
  ['{BC044AB7-374A-4B8B-8E89-8B49A6BFB966}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSimpleTarget; cdecl; overload; //()V
    {class} function init(width: Integer; height: Integer): JSimpleTarget; cdecl; overload; //(II)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/SimpleTarget')]
  JSimpleTarget = interface(JBaseTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/BaseTarget
  ['{D0F02E8D-CECE-4857-8788-762BE5FE4F68}']
    { Property Methods }

    { methods }
    procedure getSize(cb: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    procedure removeCallback(cb: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V

    { Property }
  end;

  TJSimpleTarget = class(TJavaGenericImport<JSimpleTargetClass, JSimpleTarget>) end;

  JGifFrameLoader_DelayTargetClass = interface(JSimpleTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
  ['{FB2F1FA7-1F89-4B43-87E4-4F896710C972}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget')]
  JGifFrameLoader_DelayTarget = interface(JSimpleTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
  ['{CF9E9A0D-DBC7-470F-AEFC-80DA615E6DC2}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JBitmap; transition: JTransition); cdecl; overload; //(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/transition/Transition;)V
    procedure onResourceReady(this: JObject; P2: JTransition); cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V

    { Property }
  end;

  TJGifFrameLoader_DelayTarget = class(TJavaGenericImport<JGifFrameLoader_DelayTargetClass, JGifFrameLoader_DelayTarget>) end;

  JGifFrameLoader_FrameCallbackClass = interface(JObjectClass)
  ['{308E05BD-A1CD-40BC-BAC5-7438E3C8B145}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader$FrameCallback')]
  JGifFrameLoader_FrameCallback = interface(IJavaInstance)
  ['{172DFB06-5D91-43D2-8565-E40867CB1124}']
    { Property Methods }

    { methods }
    procedure onFrameReady; cdecl; //()V

    { Property }
  end;

  TJGifFrameLoader_FrameCallback = class(TJavaGenericImport<JGifFrameLoader_FrameCallbackClass, JGifFrameLoader_FrameCallback>) end;

  JGifFrameLoader_FrameLoaderCallbackClass = interface(JObjectClass)
  ['{DBA33D12-34C8-4E9D-AB4A-E04217DE2463}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader$FrameLoaderCallback')]
  JGifFrameLoader_FrameLoaderCallback = interface(JObject)
  ['{515A3300-D841-4C35-BC10-FF4D7950B690}']
    { Property Methods }

    { methods }
    function handleMessage(msg: JMessage): Boolean; cdecl; //(Landroid/os/Message;)Z

    { Property }
  end;

  TJGifFrameLoader_FrameLoaderCallback = class(TJavaGenericImport<JGifFrameLoader_FrameLoaderCallbackClass, JGifFrameLoader_FrameLoaderCallback>) end;

  JGifFrameLoader_OnEveryFrameListenerClass = interface(JObjectClass)
  ['{7E2C7460-DFE3-488E-AD69-EA40AE2331C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader$OnEveryFrameListener')]
  JGifFrameLoader_OnEveryFrameListener = interface(IJavaInstance)
  ['{7564C402-8604-419E-B3CC-416E00BB8E20}']
    { Property Methods }

    { methods }
    procedure onFrameReady; cdecl; //()V

    { Property }
  end;

  TJGifFrameLoader_OnEveryFrameListener = class(TJavaGenericImport<JGifFrameLoader_OnEveryFrameListenerClass, JGifFrameLoader_OnEveryFrameListener>) end;

  JGifFrameLoaderClass = interface(JObjectClass)
  ['{1AAC3F0B-8B72-470B-AA10-F4455631349B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader')]
  JGifFrameLoader = interface(JObject)
  ['{2CCC5A97-AE8A-4E95-833C-63D0BDC29D38}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGifFrameLoader = class(TJavaGenericImport<JGifFrameLoaderClass, JGifFrameLoader>) end;

  JGifFrameResourceDecoderClass = interface(JObjectClass)
  ['{F02652F9-F577-4F8F-9174-313F847A0EAA}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool): JGifFrameResourceDecoder; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameResourceDecoder')]
  JGifFrameResourceDecoder = interface(JObject)
  ['{EBB72605-3B4D-44B8-95F3-B8547DAB6CCD}']
    { Property Methods }

    { methods }
//    function handles(source: JGifDecoder; options: JOptions): Boolean; cdecl; overload; //(Lcom/bumptech/glide/gifdecoder/GifDecoder;Lcom/bumptech/glide/load/Options;)Z
//    function decode(source: JGifDecoder; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Lcom/bumptech/glide/gifdecoder/GifDecoder;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJGifFrameResourceDecoder = class(TJavaGenericImport<JGifFrameResourceDecoderClass, JGifFrameResourceDecoder>) end;

  JGifOptionsClass = interface(JObjectClass)
  ['{715DB057-592F-4082-90AC-E7B364A953F5}']
    { static Property Methods }
    {class} function _GetDECODE_FORMAT: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;
    {class} function _GetDISABLE_ANIMATION: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/load/Option;

    { static Methods }

    { static Property }
    {class} property DECODE_FORMAT: JOption read _GetDECODE_FORMAT;
    {class} property DISABLE_ANIMATION: JOption read _GetDISABLE_ANIMATION;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifOptions')]
  JGifOptions = interface(JObject)
  ['{F4BCF7EC-9117-4DD6-87B2-DA499167DA0C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGifOptions = class(TJavaGenericImport<JGifOptionsClass, JGifOptions>) end;

  JStreamGifDecoderClass = interface(JObjectClass)
  ['{8E56831A-A264-4CCE-A379-5393D2B15042}']
    { static Property Methods }

    { static Methods }
    {class} function init(parsers: JList; P2: JResourceDecoder; byteBufferDecoder: JArrayPool): JStreamGifDecoder; cdecl; //(Ljava/util/List;Lcom/bumptech/glide/load/ResourceDecoder;Lcom/bumptech/glide/load/engine/bitmap_recycle/ArrayPool;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/StreamGifDecoder')]
  JStreamGifDecoder = interface(JObject)
  ['{993C7515-6510-4092-A4C9-CE659DEA10D5}']
    { Property Methods }

    { methods }
    function handles(source: JInputStream; options: JOptions): Boolean; cdecl; overload; //(Ljava/io/InputStream;Lcom/bumptech/glide/load/Options;)Z
    function decode(source: JInputStream; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload; //(Ljava/io/InputStream;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z

    { Property }
  end;

  TJStreamGifDecoder = class(TJavaGenericImport<JStreamGifDecoderClass, JStreamGifDecoder>) end;

  JBitmapBytesTranscoderClass = interface(JObjectClass)
  ['{44FEB424-EB09-473E-ADE6-90B75D23F218}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapBytesTranscoder; cdecl; overload; //()V
    {class} function init(compressFormat: JBitmap_CompressFormat; quality: Integer): JBitmapBytesTranscoder; cdecl; overload; //(Landroid/graphics/Bitmap$CompressFormat;I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/BitmapBytesTranscoder')]
  JBitmapBytesTranscoder = interface(JObject)
  ['{3E67286F-ED46-4C8C-BA83-BD52F611F36A}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource; P2: JOptions): JResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJBitmapBytesTranscoder = class(TJavaGenericImport<JBitmapBytesTranscoderClass, JBitmapBytesTranscoder>) end;

  JBitmapDrawableTranscoderClass = interface(JObjectClass)
  ['{6BB3E579-42BA-4309-AAA0-9EE3EE8988BF}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JBitmapDrawableTranscoder; cdecl; overload; //(Landroid/content/Context;)V
    {class} function init(resources: JResources; bitmapPool: JBitmapPool): JBitmapDrawableTranscoder; cdecl; overload; //Deprecated //(Landroid/content/res/Resources;Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;)V
    {class} function init(resources: JResources): JBitmapDrawableTranscoder; cdecl; overload; //(Landroid/content/res/Resources;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/BitmapDrawableTranscoder')]
  JBitmapDrawableTranscoder = interface(JObject)
  ['{499877BF-A84D-46E2-8924-53610B2E9A44}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource; P2: JOptions): JResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJBitmapDrawableTranscoder = class(TJavaGenericImport<JBitmapDrawableTranscoderClass, JBitmapDrawableTranscoder>) end;

  JDrawableBytesTranscoderClass = interface(JObjectClass)
  ['{B88BCD3F-1094-43DC-BEEE-46734C901CDD}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool; bitmapBytesTranscoder: JResourceTranscoder; P3: JResourceTranscoder): JDrawableBytesTranscoder; cdecl; //(Lcom/bumptech/glide/load/engine/bitmap_recycle/BitmapPool;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/DrawableBytesTranscoder')]
  JDrawableBytesTranscoder = interface(JObject)
  ['{3711EFA2-0FA7-4C7A-9CA8-30309A5DAA1B}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource; P2: JOptions): JResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJDrawableBytesTranscoder = class(TJavaGenericImport<JDrawableBytesTranscoderClass, JDrawableBytesTranscoder>) end;

  JGifDrawableBytesTranscoderClass = interface(JObjectClass)
  ['{42479F75-F6D0-49A1-9E35-D3FE3A2FC87B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGifDrawableBytesTranscoder; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/GifDrawableBytesTranscoder')]
  JGifDrawableBytesTranscoder = interface(JObject)
  ['{1AC14795-79ED-4837-89E4-9EC0788A69EF}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource; P2: JOptions): JResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJGifDrawableBytesTranscoder = class(TJavaGenericImport<JGifDrawableBytesTranscoderClass, JGifDrawableBytesTranscoder>) end;

  JResourceTranscoderClass = interface(JObjectClass)
  ['{1B831ED3-7A0B-456D-B81E-96C17481FB17}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/ResourceTranscoder')]
  JResourceTranscoder = interface(IJavaInstance)
  ['{628144D0-AD80-4413-9B06-A5FE619C8C53}']
    { Property Methods }

    { methods }
    function transcode(P1: JResource; P2: JOptions): JResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJResourceTranscoder = class(TJavaGenericImport<JResourceTranscoderClass, JResourceTranscoder>) end;

  JTranscoderRegistry_EntryClass = interface(JObjectClass)
  ['{7A2102C5-9F1C-4C6A-B32F-4FE40CE50415}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/TranscoderRegistry$Entry')]
  JTranscoderRegistry_Entry = interface(JObject)
  ['{3E966FE0-3733-46E1-AD2C-5017AB52CA20}']
    { Property Methods }

    { methods }
    function handles(fromClass: Jlang_Class; toClass: Jlang_Class): Boolean; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Z

    { Property }
  end;

  TJTranscoderRegistry_Entry = class(TJavaGenericImport<JTranscoderRegistry_EntryClass, JTranscoderRegistry_Entry>) end;

  JTranscoderRegistryClass = interface(JObjectClass)
  ['{90763ED3-3087-4D1A-94DD-199E2631725A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTranscoderRegistry; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/TranscoderRegistry')]
  JTranscoderRegistry = interface(JObject)
  ['{93565578-EC35-490A-B9AE-E6926AAB4915}']
    { Property Methods }

    { methods }
    procedure &register(decodedClass: Jlang_Class; P2: Jlang_Class; transcodedClass: JResourceTranscoder); cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)V
    function get(resourceClass: Jlang_Class; P2: Jlang_Class): JResourceTranscoder; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;
    function getTranscodeClasses(resourceClass: Jlang_Class; P2: Jlang_Class): JList; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;

    { Property }
  end;

  TJTranscoderRegistry = class(TJavaGenericImport<JTranscoderRegistryClass, JTranscoderRegistry>) end;

  JUnitTranscoderClass = interface(JObjectClass)
  ['{E437663D-736E-4AA5-87B1-256648F9304A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnitTranscoder; cdecl; //()V
    {class} function get: JResourceTranscoder; cdecl; //()Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/UnitTranscoder')]
  JUnitTranscoder = interface(JObject)
  ['{833533C1-4333-4F58-8A43-49FA5DBCBD20}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource; options: JOptions): JResource; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJUnitTranscoder = class(TJavaGenericImport<JUnitTranscoderClass, JUnitTranscoder>) end;

  JUnitTransformationClass = interface(JObjectClass)
  ['{FE18CADB-1975-4755-BFB8-E137840DA500}']
    { static Property Methods }

    { static Methods }
    {class} function get: JUnitTransformation; cdecl; //()Lcom/bumptech/glide/load/resource/UnitTransformation;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/UnitTransformation')]
  JUnitTransformation = interface(JObject)
  ['{04D0A703-8E63-4B46-8955-97F19B1FA86B}']
    { Property Methods }

    { methods }
    function transform(context: JContext; resource: JResource; outWidth: Integer; outHeight: Integer): JResource; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJUnitTransformation = class(TJavaGenericImport<JUnitTransformationClass, JUnitTransformation>) end;

  JResourceDecoderClass = interface(JObjectClass)
  ['{FEC85848-E2BA-48C3-84F8-6FF9CC163038}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/ResourceDecoder')]
  JResourceDecoder = interface(IJavaInstance)
  ['{265E6FFD-30BD-411D-B2FC-9BC035CDC898}']
    { Property Methods }

    { methods }
    function handles(P1: JObject; P2: JOptions): Boolean; cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/load/Options;)Z
    function decode(P1: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; //(Ljava/lang/Object;IILcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJResourceDecoder = class(TJavaGenericImport<JResourceDecoderClass, JResourceDecoder>) end;

  JResourceEncoderClass = interface(JObjectClass)
  ['{3021DFDB-738B-43B7-A3F1-7DC30A43D264}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/ResourceEncoder')]
  JResourceEncoder = interface(IJavaInstance)
  ['{3412DE24-D73F-480C-B0BD-F2843539A121}']
    { Property Methods }

    { methods }
    function getEncodeStrategy(P1: JOptions): JEncodeStrategy; cdecl; //(Lcom/bumptech/glide/load/Options;)Lcom/bumptech/glide/load/EncodeStrategy;

    { Property }
  end;

  TJResourceEncoder = class(TJavaGenericImport<JResourceEncoderClass, JResourceEncoder>) end;

  JTransformationClass = interface(JObjectClass)
  ['{57EAA402-9947-4265-98EC-385CF8B2E6B1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Transformation')]
  JTransformation = interface(IJavaInstance)
  ['{DDACD6A9-967E-43FC-A9E6-2804D3576A85}']
    { Property Methods }

    { methods }
    function transform(P1: JContext; P2: JResource; P3: Integer; P4: Integer): JResource; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/load/engine/Resource;II)Lcom/bumptech/glide/load/engine/Resource;

    { Property }
  end;

  TJTransformation = class(TJavaGenericImport<JTransformationClass, JTransformation>) end;

  JActivityFragmentLifecycleClass = interface(JObjectClass)
  ['{31CE7E47-59F2-4AFE-AB5E-2279DDF05DE8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ActivityFragmentLifecycle')]
  JActivityFragmentLifecycle = interface(JObject)
  ['{2CEAA811-DFE4-47FE-B4F6-0BD4A29EA3D7}']
    { Property Methods }

    { methods }
    procedure addListener(listener: JLifecycleListener); cdecl; //(Lcom/bumptech/glide/manager/LifecycleListener;)V
    procedure removeListener(listener: JLifecycleListener); cdecl; //(Lcom/bumptech/glide/manager/LifecycleListener;)V

    { Property }
  end;

  TJActivityFragmentLifecycle = class(TJavaGenericImport<JActivityFragmentLifecycleClass, JActivityFragmentLifecycle>) end;

  JApplicationLifecycleClass = interface(JObjectClass)
  ['{5D73F927-AB5F-46CD-95FE-FD9ED0F05A15}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ApplicationLifecycle')]
  JApplicationLifecycle = interface(JObject)
  ['{C97D4DCD-C016-4A0F-9312-2200EB955171}']
    { Property Methods }

    { methods }
    procedure addListener(listener: JLifecycleListener); cdecl; //(Lcom/bumptech/glide/manager/LifecycleListener;)V
    procedure removeListener(listener: JLifecycleListener); cdecl; //(Lcom/bumptech/glide/manager/LifecycleListener;)V

    { Property }
  end;

  TJApplicationLifecycle = class(TJavaGenericImport<JApplicationLifecycleClass, JApplicationLifecycle>) end;

  JConnectivityMonitor_ConnectivityListenerClass = interface(JObjectClass)
  ['{5405378E-FA17-4E3E-A513-6BFB31E965E8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener')]
  JConnectivityMonitor_ConnectivityListener = interface(IJavaInstance)
  ['{C75B30A2-0F22-4542-9BAD-EB5D2107A002}']
    { Property Methods }

    { methods }
    procedure onConnectivityChanged(P1: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJConnectivityMonitor_ConnectivityListener = class(TJavaGenericImport<JConnectivityMonitor_ConnectivityListenerClass, JConnectivityMonitor_ConnectivityListener>) end;

  JConnectivityMonitorClass = interface(JObjectClass)
  ['{12C1C28D-3E09-4D71-9BCD-E7680A4A51A7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ConnectivityMonitor')]
  JConnectivityMonitor = interface(IJavaInstance)
  ['{1B42C91D-74E7-4AE0-AE59-403DBF4B73E4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConnectivityMonitor = class(TJavaGenericImport<JConnectivityMonitorClass, JConnectivityMonitor>) end;

  JConnectivityMonitorFactoryClass = interface(JObjectClass)
  ['{50CAFAE6-A911-4AF5-8454-4A7207EA0032}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ConnectivityMonitorFactory')]
  JConnectivityMonitorFactory = interface(IJavaInstance)
  ['{BB1E2B04-1A02-42F7-8E3B-67F3FCE4543B}']
    { Property Methods }

    { methods }
    function build(P1: JContext; P2: JConnectivityMonitor_ConnectivityListener): JConnectivityMonitor; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener;)Lcom/bumptech/glide/manager/ConnectivityMonitor;

    { Property }
  end;

  TJConnectivityMonitorFactory = class(TJavaGenericImport<JConnectivityMonitorFactoryClass, JConnectivityMonitorFactory>) end;

  JDefaultConnectivityMonitorClass = interface(JObjectClass)
  ['{675FB09A-8E31-4CCC-B746-63F80C61C04D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/DefaultConnectivityMonitor')]
  JDefaultConnectivityMonitor = interface(JObject)
  ['{2687F785-2893-4F4C-A2D8-7F5E21A43B4B}']
    { Property Methods }

    { methods }
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V

    { Property }
  end;

  TJDefaultConnectivityMonitor = class(TJavaGenericImport<JDefaultConnectivityMonitorClass, JDefaultConnectivityMonitor>) end;

  JDefaultConnectivityMonitorFactoryClass = interface(JObjectClass)
  ['{FB47F5F4-0EB3-408B-9CA0-0D46EF49DD69}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDefaultConnectivityMonitorFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/DefaultConnectivityMonitorFactory')]
  JDefaultConnectivityMonitorFactory = interface(JObject)
  ['{47EEADFD-B203-4266-B509-7C66B96B2B2D}']
    { Property Methods }

    { methods }
    function build(context: JContext; listener: JConnectivityMonitor_ConnectivityListener): JConnectivityMonitor; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener;)Lcom/bumptech/glide/manager/ConnectivityMonitor;

    { Property }
  end;

  TJDefaultConnectivityMonitorFactory = class(TJavaGenericImport<JDefaultConnectivityMonitorFactoryClass, JDefaultConnectivityMonitorFactory>) end;

  JEmptyRequestManagerTreeNodeClass = interface(JObjectClass)
  ['{F9C0A15A-27E3-462B-8725-EDFDED677ABF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/EmptyRequestManagerTreeNode')]
  JEmptyRequestManagerTreeNode = interface(JObject)
  ['{B2F6EB29-6A37-401E-98A1-0F42742F181B}']
    { Property Methods }

    { methods }
    function getDescendants: JSet; cdecl; //()Ljava/util/Set;

    { Property }
  end;

  TJEmptyRequestManagerTreeNode = class(TJavaGenericImport<JEmptyRequestManagerTreeNodeClass, JEmptyRequestManagerTreeNode>) end;

  JLifecycleClass = interface(JObjectClass)
  ['{4C1D4A24-2665-462E-A480-58CA2A2A48AA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/Lifecycle')]
  JLifecycle = interface(IJavaInstance)
  ['{E39AEE83-4DF2-48E8-BF87-FDE57611B319}']
    { Property Methods }

    { methods }
    procedure addListener(P1: JLifecycleListener); cdecl; //(Lcom/bumptech/glide/manager/LifecycleListener;)V
    procedure removeListener(P1: JLifecycleListener); cdecl; //(Lcom/bumptech/glide/manager/LifecycleListener;)V

    { Property }
  end;

  TJLifecycle = class(TJavaGenericImport<JLifecycleClass, JLifecycle>) end;

  JLifecycleListenerClass = interface(JObjectClass)
  ['{A048CA5B-645E-437E-B712-21C66416BE56}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/LifecycleListener')]
  JLifecycleListener = interface(IJavaInstance)
  ['{1DCAC094-8772-443E-988A-37A69EA2DE6E}']
    { Property Methods }

    { methods }
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V

    { Property }
  end;

  TJLifecycleListener = class(TJavaGenericImport<JLifecycleListenerClass, JLifecycleListener>) end;

  JNullConnectivityMonitorClass = interface(JObjectClass)
  ['{514C8592-F7BA-43E1-8D07-DB5F45AC68D3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/NullConnectivityMonitor')]
  JNullConnectivityMonitor = interface(JObject)
  ['{CC47E391-08A6-44F3-A87A-3111C8799951}']
    { Property Methods }

    { methods }
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V

    { Property }
  end;

  TJNullConnectivityMonitor = class(TJavaGenericImport<JNullConnectivityMonitorClass, JNullConnectivityMonitor>) end;

  JRequestManagerFragment_FragmentRequestManagerTreeNodeClass = interface(JObjectClass)
  ['{32D1E743-E8B9-4816-99D9-22913480F1B0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerFragment$FragmentRequestManagerTreeNode')]
  JRequestManagerFragment_FragmentRequestManagerTreeNode = interface(JObject)
  ['{F037AF42-A199-49E1-8D53-3322C71010E9}']
    { Property Methods }

    { methods }
    function getDescendants: JSet; cdecl; //()Ljava/util/Set;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJRequestManagerFragment_FragmentRequestManagerTreeNode = class(TJavaGenericImport<JRequestManagerFragment_FragmentRequestManagerTreeNodeClass, JRequestManagerFragment_FragmentRequestManagerTreeNode>) end;

  JRequestManagerFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: android/app/Fragment
  ['{42F4A75A-3E04-4D56-AE2F-2EB105095E07}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRequestManagerFragment; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerFragment')]
  JRequestManagerFragment = interface(JFragment) // or JObject // SuperSignature: android/app/Fragment
  ['{D6AB0829-50F1-4296-BB49-22098933615E}']
    { Property Methods }

    { methods }
    procedure setRequestManager(requestManager: JRequestManager); cdecl; //(Lcom/bumptech/glide/RequestManager;)V
    function getRequestManager: JRequestManager; cdecl; //()Lcom/bumptech/glide/RequestManager;
    function getRequestManagerTreeNode: JRequestManagerTreeNode; cdecl; //()Lcom/bumptech/glide/manager/RequestManagerTreeNode;
    procedure onAttach(activity: JActivity); cdecl; //(Landroid/app/Activity;)V
    procedure onDetach; cdecl; //()V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJRequestManagerFragment = class(TJavaGenericImport<JRequestManagerFragmentClass, JRequestManagerFragment>) end;

  JRequestManagerRetriever_RequestManagerFactoryClass = interface(JObjectClass)
  ['{33655B87-EF3B-42A4-882F-EA60ED539A54}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerRetriever$RequestManagerFactory')]
  JRequestManagerRetriever_RequestManagerFactory = interface(IJavaInstance)
  ['{E523C643-E4B3-4AB3-B680-F6FC23EF1FC3}']
    { Property Methods }

    { methods }
    function build(P1: JGlide; P2: JLifecycle; P3: JRequestManagerTreeNode; P4: JContext): JRequestManager; cdecl; //(Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/manager/Lifecycle;Lcom/bumptech/glide/manager/RequestManagerTreeNode;Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;

    { Property }
  end;

  TJRequestManagerRetriever_RequestManagerFactory = class(TJavaGenericImport<JRequestManagerRetriever_RequestManagerFactoryClass, JRequestManagerRetriever_RequestManagerFactory>) end;

  JRequestManagerRetrieverClass = interface(JObjectClass)
  ['{450C9689-5D2D-4759-984F-448458BA260E}']
    { static Property Methods }

    { static Methods }
    {class} function init(factory: JRequestManagerRetriever_RequestManagerFactory): JRequestManagerRetriever; cdecl; //(Lcom/bumptech/glide/manager/RequestManagerRetriever$RequestManagerFactory;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerRetriever')]
  JRequestManagerRetriever = interface(JObject)
  ['{489C2CF0-D6F4-416F-9FC7-47F15491F28B}']
    { Property Methods }

    { methods }
    function get(context: JContext): JRequestManager; cdecl; overload; //(Landroid/content/Context;)Lcom/bumptech/glide/RequestManager;
//    function get(activity: JFragmentActivity): JRequestManager; cdecl; overload; //(Landroid/support/v4/app/FragmentActivity;)Lcom/bumptech/glide/RequestManager;
    function get(fragment: JFragment): JRequestManager; cdecl; overload; //(Landroid/support/v4/app/Fragment;)Lcom/bumptech/glide/RequestManager;
    function get(activity: JActivity): JRequestManager; cdecl; overload; //(Landroid/app/Activity;)Lcom/bumptech/glide/RequestManager;
    function get(view: JView): JRequestManager; cdecl; overload; //(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;
//    function get(fragment: JFragment): JRequestManager; cdecl; overload; //Deprecated //(Landroid/app/Fragment;)Lcom/bumptech/glide/RequestManager;
    function handleMessage(amessage: JMessage): Boolean; cdecl; //(Landroid/os/Message;)Z

    { Property }
  end;

  TJRequestManagerRetriever = class(TJavaGenericImport<JRequestManagerRetrieverClass, JRequestManagerRetriever>) end;

  JRequestManagerTreeNodeClass = interface(JObjectClass)
  ['{821F3887-8905-4A5B-B492-9B946BEF5BCA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerTreeNode')]
  JRequestManagerTreeNode = interface(IJavaInstance)
  ['{23874C60-A01E-451F-AA29-FD6B5C26C028}']
    { Property Methods }

    { methods }
    function getDescendants: JSet; cdecl; //()Ljava/util/Set;

    { Property }
  end;

  TJRequestManagerTreeNode = class(TJavaGenericImport<JRequestManagerTreeNodeClass, JRequestManagerTreeNode>) end;

  JRequestTrackerClass = interface(JObjectClass)
  ['{52794F6C-39C9-4D69-A752-7AD1DE43891F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRequestTracker; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestTracker')]
  JRequestTracker = interface(JObject)
  ['{BD515C60-C5A6-4A82-BBE1-72876CA5395B}']
    { Property Methods }

    { methods }
    procedure runRequest(request: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    function clearRemoveAndRecycle(request: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function isPaused: Boolean; cdecl; //()Z
    procedure pauseRequests; cdecl; //()V
    procedure pauseAllRequests; cdecl; //()V
    procedure resumeRequests; cdecl; //()V
    procedure clearRequests; cdecl; //()V
    procedure restartRequests; cdecl; //()V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJRequestTracker = class(TJavaGenericImport<JRequestTrackerClass, JRequestTracker>) end;

  JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNodeClass = interface(JObjectClass)
  ['{98F6175A-E907-4ECB-9268-E62CEF4C3048}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/SupportRequestManagerFragment$SupportFragmentRequestManagerTreeNode')]
  JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNode = interface(JObject)
  ['{718183C1-B785-4D91-B3F9-7BAB266F4969}']
    { Property Methods }

    { methods }
    function getDescendants: JSet; cdecl; //()Ljava/util/Set;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNode = class(TJavaGenericImport<JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNodeClass, JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNode>) end;

  JSupportRequestManagerFragmentClass = interface(JFragmentClass) // or JObjectClass // SuperSignature: android/support/v4/app/Fragment
  ['{D590C94E-5757-4801-B801-7B3B8E01965A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSupportRequestManagerFragment; cdecl; overload; //()V
    {class} function init(lifecycle: JActivityFragmentLifecycle): JSupportRequestManagerFragment; cdecl; overload; //(Lcom/bumptech/glide/manager/ActivityFragmentLifecycle;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/SupportRequestManagerFragment')]
  JSupportRequestManagerFragment = interface(JFragment) // or JObject // SuperSignature: android/support/v4/app/Fragment
  ['{910BCC15-5B7C-42AF-BB0C-491702F50474}']
    { Property Methods }

    { methods }
    procedure setRequestManager(requestManager: JRequestManager); cdecl; //(Lcom/bumptech/glide/RequestManager;)V
    function getRequestManager: JRequestManager; cdecl; //()Lcom/bumptech/glide/RequestManager;
    function getRequestManagerTreeNode: JRequestManagerTreeNode; cdecl; //()Lcom/bumptech/glide/manager/RequestManagerTreeNode;
    procedure onAttach(context: JContext); cdecl; //(Landroid/content/Context;)V
    procedure onDetach; cdecl; //()V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJSupportRequestManagerFragment = class(TJavaGenericImport<JSupportRequestManagerFragmentClass, JSupportRequestManagerFragment>) end;

  JTargetTrackerClass = interface(JObjectClass)
  ['{AC15D649-BB03-438B-8A4C-1BF81027F99C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTargetTracker; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/TargetTracker')]
  JTargetTracker = interface(JObject)
  ['{8B95433E-8D7D-472D-965B-1CD366D7CDFC}']
    { Property Methods }

    { methods }
    procedure track(target: JTarget); cdecl; //(Lcom/bumptech/glide/request/target/Target;)V
    procedure untrack(target: JTarget); cdecl; //(Lcom/bumptech/glide/request/target/Target;)V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V
    function getAll: JList; cdecl; //()Ljava/util/List;
    procedure clear; cdecl; //()V

    { Property }
  end;

  TJTargetTracker = class(TJavaGenericImport<JTargetTrackerClass, JTargetTracker>) end;

  JMemoryCategoryClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{2D57FE62-2E00-4C78-B8BD-C2E062C50D09}']
    { static Property Methods }
    {class} function _GetLOW: JMemoryCategory;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/MemoryCategory;
    {class} function _GetNORMAL: JMemoryCategory;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/MemoryCategory;
    {class} function _GetHIGH: JMemoryCategory;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/MemoryCategory;

    { static Methods }
    {class} function values: TJavaObjectArray<JMemoryCategory>; cdecl; //()[Lcom/bumptech/glide/MemoryCategory;
    {class} function valueOf(name: JString): JMemoryCategory; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/MemoryCategory;

    { static Property }
    {class} property LOW: JMemoryCategory read _GetLOW;
    {class} property NORMAL: JMemoryCategory read _GetNORMAL;
    {class} property HIGH: JMemoryCategory read _GetHIGH;
  end;

  [JavaSignature('com/bumptech/glide/MemoryCategory')]
  JMemoryCategory = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{4893BFB0-4E37-4CCF-AB7A-0FDDD7AA6608}']
    { Property Methods }

    { methods }
    function getMultiplier: Single; cdecl; //()F

    { Property }
  end;

  TJMemoryCategory = class(TJavaGenericImport<JMemoryCategoryClass, JMemoryCategory>) end;

  JModelTypesClass = interface(JObjectClass)
  ['{D7179884-E2DA-45A9-AE0E-ED2EEE0FE9E0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ModelTypes')]
  JModelTypes = interface(IJavaInstance)
  ['{804414E3-3C51-405A-ADFD-EF4DA56BCD0C}']
    { Property Methods }

    { methods }
    function load(P1: JBitmap): JObject; cdecl; overload; //(Landroid/graphics/Bitmap;)Ljava/lang/Object;
    function load(P1: JDrawable): JObject; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
    function load(P1: JString): JObject; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/Object;
    function load(P1: Jnet_Uri): JObject; cdecl; overload; //(Landroid/net/Uri;)Ljava/lang/Object;
    function load(P1: JFile): JObject; cdecl; overload; //(Ljava/io/File;)Ljava/lang/Object;
    function load(P1: JInteger): JObject; cdecl; overload; //(Ljava/lang/Integer;)Ljava/lang/Object;
//    function load(P1: JURL): JObject; cdecl; overload; //Deprecated //(Ljava/net/URL;)Ljava/lang/Object;
    function load(P1: TJavaArray<Byte>): JObject; cdecl; overload; //([B)Ljava/lang/Object;
    function load(P1: JObject): JObject; cdecl; overload; //(Ljava/lang/Object;)Ljava/lang/Object;

    { Property }
  end;

  TJModelTypes = class(TJavaGenericImport<JModelTypesClass, JModelTypes>) end;

  JAppliesOptionsClass = interface(JObjectClass)
  ['{D4259C67-1383-4B33-B121-325954D0D8E3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/AppliesOptions')]
  JAppliesOptions = interface(IJavaInstance)
  ['{9F5BE28C-6196-4A02-B106-D5011C4279DA}']
    { Property Methods }

    { methods }
    procedure applyOptions(P1: JContext; P2: JGlideBuilder); cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/GlideBuilder;)V

    { Property }
  end;

  TJAppliesOptions = class(TJavaGenericImport<JAppliesOptionsClass, JAppliesOptions>) end;

  JGlideModuleClass = interface(JObjectClass)
  ['{7B63078F-585A-4ECF-A7DD-1E92706B20F0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/GlideModule')]
  JGlideModule = interface(IJavaInstance)
  ['{0B219683-63C2-464E-998E-AC14B6BEDFD2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGlideModule = class(TJavaGenericImport<JGlideModuleClass, JGlideModule>) end;

  JManifestParserClass = interface(JObjectClass)
  ['{1D1079F7-D746-4944-B19D-88BD5B608995}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JManifestParser; cdecl; //(Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/ManifestParser')]
  JManifestParser = interface(JObject)
  ['{D7101D0D-55BC-41F5-8B77-93B211D3B789}']
    { Property Methods }

    { methods }
    function parse: JList; cdecl; //()Ljava/util/List;

    { Property }
  end;

  TJManifestParser = class(TJavaGenericImport<JManifestParserClass, JManifestParser>) end;

  JRegistersComponentsClass = interface(JObjectClass)
  ['{BB771D8E-AE9A-4ABF-80B3-83C0B543D121}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/RegistersComponents')]
  JRegistersComponents = interface(IJavaInstance)
  ['{B6F6F154-4723-4208-A9AA-F1663BA97C59}']
    { Property Methods }

    { methods }
    procedure registerComponents(P1: JContext; P2: JGlide; P3: JRegistry); cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/Registry;)V

    { Property }
  end;

  TJRegistersComponents = class(TJavaGenericImport<JRegistersComponentsClass, JRegistersComponents>) end;

  JPriorityClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{4D352744-A3E6-4F49-827C-73B44BDBDCB8}']
    { static Property Methods }
    {class} function _GetIMMEDIATE: JPriority;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/Priority;
    {class} function _GetHIGH: JPriority;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/Priority;
    {class} function _GetNORMAL: JPriority;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/Priority;
    {class} function _GetLOW: JPriority;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/Priority;

    { static Methods }
    {class} function values: TJavaObjectArray<JPriority>; cdecl; //()[Lcom/bumptech/glide/Priority;
    {class} function valueOf(name: JString): JPriority; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/Priority;

    { static Property }
    {class} property IMMEDIATE: JPriority read _GetIMMEDIATE;
    {class} property HIGH: JPriority read _GetHIGH;
    {class} property NORMAL: JPriority read _GetNORMAL;
    {class} property LOW: JPriority read _GetLOW;
  end;

  [JavaSignature('com/bumptech/glide/Priority')]
  JPriority = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{858A25FD-FFED-468F-A453-78B435B6F3AD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPriority = class(TJavaGenericImport<JPriorityClass, JPriority>) end;

  JEncoderRegistry_EntryClass = interface(JObjectClass)
  ['{F9B1B21E-A9F6-4666-BBC8-1356A752503C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/EncoderRegistry$Entry')]
  JEncoderRegistry_Entry = interface(JObject)
  ['{8B383CE6-CC9A-4447-A4EA-E091F1D0423B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncoderRegistry_Entry = class(TJavaGenericImport<JEncoderRegistry_EntryClass, JEncoderRegistry_Entry>) end;

  JEncoderRegistryClass = interface(JObjectClass)
  ['{D1000B74-0E19-4E76-9E7E-9257B0E0A377}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEncoderRegistry; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/EncoderRegistry')]
  JEncoderRegistry = interface(JObject)
  ['{60B86D20-4D27-4843-BBDE-B26C740A04A8}']
    { Property Methods }

    { methods }
    function getEncoder(dataClass: Jlang_Class): JEncoder; cdecl; //(Ljava/lang/Class;)Lcom/bumptech/glide/load/Encoder;
    procedure append(dataClass: Jlang_Class; P2: JEncoder); cdecl; //(Ljava/lang/Class;Lcom/bumptech/glide/load/Encoder;)V
    procedure prepend(dataClass: Jlang_Class; P2: JEncoder); cdecl; //(Ljava/lang/Class;Lcom/bumptech/glide/load/Encoder;)V

    { Property }
  end;

  TJEncoderRegistry = class(TJavaGenericImport<JEncoderRegistryClass, JEncoderRegistry>) end;

  JImageHeaderParserRegistryClass = interface(JObjectClass)
  ['{C06D961B-1038-4BAA-A305-9652EF1B62E6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JImageHeaderParserRegistry; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ImageHeaderParserRegistry')]
  JImageHeaderParserRegistry = interface(JObject)
  ['{456A6C2D-1441-4EEF-80F9-409BAFDF1172}']
    { Property Methods }

    { methods }
    function getParsers: JList; cdecl; //()Ljava/util/List;
    procedure add(parser: JImageHeaderParser); cdecl; //(Lcom/bumptech/glide/load/ImageHeaderParser;)V

    { Property }
  end;

  TJImageHeaderParserRegistry = class(TJavaGenericImport<JImageHeaderParserRegistryClass, JImageHeaderParserRegistry>) end;

  JLoadPathCacheClass = interface(JObjectClass)
  ['{18978A12-E9E8-456D-8602-D731BDFA6130}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLoadPathCache; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/LoadPathCache')]
  JLoadPathCache = interface(JObject)
  ['{CFE2021F-6D82-4D3D-8670-FFFA9A6258CC}']
    { Property Methods }

    { methods }
    function isEmptyLoadPath(path: JLoadPath): Boolean; cdecl; //(Lcom/bumptech/glide/load/engine/LoadPath;)Z
    function get(dataClass: Jlang_Class; P2: Jlang_Class; resourceClass: Jlang_Class): JLoadPath; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/LoadPath;
    procedure put(dataClass: Jlang_Class; P2: Jlang_Class; resourceClass: Jlang_Class; transcodeClass: JLoadPath); cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/engine/LoadPath;)V

    { Property }
  end;

  TJLoadPathCache = class(TJavaGenericImport<JLoadPathCacheClass, JLoadPathCache>) end;

  JModelToResourceClassCacheClass = interface(JObjectClass)
  ['{1F7B28C5-D468-4F58-975E-7F784725613A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JModelToResourceClassCache; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ModelToResourceClassCache')]
  JModelToResourceClassCache = interface(JObject)
  ['{71176E3D-88DF-451F-8EB1-869971DB0192}']
    { Property Methods }

    { methods }
    function get(modelClass: Jlang_Class; P2: Jlang_Class): JList; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;
    procedure put(modelClass: Jlang_Class; P2: Jlang_Class; resourceClass: JList); cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/util/List;)V
    procedure clear; cdecl; //()V

    { Property }
  end;

  TJModelToResourceClassCache = class(TJavaGenericImport<JModelToResourceClassCacheClass, JModelToResourceClassCache>) end;

  JResourceDecoderRegistry_EntryClass = interface(JObjectClass)
  ['{D5943577-1A75-4B88-9A2E-4AE90C1A63A9}']
    { static Property Methods }

    { static Methods }
    {class} function init(dataClass: Jlang_Class; resourceClass: Jlang_Class; decoder: JResourceDecoder): JResourceDecoderRegistry_Entry; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ResourceDecoderRegistry$Entry')]
  JResourceDecoderRegistry_Entry = interface(JObject)
  ['{1D9822D4-0D17-4969-B3A8-608BC7A86756}']
    { Property Methods }

    { methods }
    function handles(dataClass: Jlang_Class; resourceClass: Jlang_Class): Boolean; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Z

    { Property }
  end;

  TJResourceDecoderRegistry_Entry = class(TJavaGenericImport<JResourceDecoderRegistry_EntryClass, JResourceDecoderRegistry_Entry>) end;

  JResourceDecoderRegistryClass = interface(JObjectClass)
  ['{7A085708-AEBA-4B46-8B81-0960BBA0B294}']
    { static Property Methods }

    { static Methods }
    {class} function init: JResourceDecoderRegistry; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ResourceDecoderRegistry')]
  JResourceDecoderRegistry = interface(JObject)
  ['{AEAF491B-6366-4C2A-A894-AC78B7179F1F}']
    { Property Methods }

    { methods }
    procedure setBucketPriorityList(buckets: JList); cdecl; //(Ljava/util/List;)V
    function getDecoders(dataClass: Jlang_Class; P2: Jlang_Class): JList; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;
    function getResourceClasses(dataClass: Jlang_Class; P2: Jlang_Class): JList; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;
    procedure append(bucket: JString; decoder: JResourceDecoder; P3: Jlang_Class; dataClass: Jlang_Class); cdecl; //(Ljava/lang/String;Lcom/bumptech/glide/load/ResourceDecoder;Ljava/lang/Class;Ljava/lang/Class;)V
    procedure prepend(bucket: JString; decoder: JResourceDecoder; P3: Jlang_Class; dataClass: Jlang_Class); cdecl; //(Ljava/lang/String;Lcom/bumptech/glide/load/ResourceDecoder;Ljava/lang/Class;Ljava/lang/Class;)V

    { Property }
  end;

  TJResourceDecoderRegistry = class(TJavaGenericImport<JResourceDecoderRegistryClass, JResourceDecoderRegistry>) end;

  JResourceEncoderRegistry_EntryClass = interface(JObjectClass)
  ['{14D72BE1-E4E8-448F-A7ED-E469B899737C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ResourceEncoderRegistry$Entry')]
  JResourceEncoderRegistry_Entry = interface(JObject)
  ['{E49BC27A-DEE8-4C5D-97E3-17F886572A18}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJResourceEncoderRegistry_Entry = class(TJavaGenericImport<JResourceEncoderRegistry_EntryClass, JResourceEncoderRegistry_Entry>) end;

  JResourceEncoderRegistryClass = interface(JObjectClass)
  ['{711ED7E7-8415-41CE-9237-6EBDD9BDD54D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JResourceEncoderRegistry; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ResourceEncoderRegistry')]
  JResourceEncoderRegistry = interface(JObject)
  ['{A8C988A8-D4CB-4CFF-8F92-3766FAF10CC2}']
    { Property Methods }

    { methods }
    procedure append(resourceClass: Jlang_Class; P2: JResourceEncoder); cdecl; //(Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceEncoder;)V
    procedure prepend(resourceClass: Jlang_Class; P2: JResourceEncoder); cdecl; //(Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceEncoder;)V
    function get(resourceClass: Jlang_Class): JResourceEncoder; cdecl; //(Ljava/lang/Class;)Lcom/bumptech/glide/load/ResourceEncoder;

    { Property }
  end;

  TJResourceEncoderRegistry = class(TJavaGenericImport<JResourceEncoderRegistryClass, JResourceEncoderRegistry>) end;

  JRegistry_MissingComponentExceptionClass = interface(JRuntimeExceptionClass) // or JObjectClass // SuperSignature: java/lang/RuntimeException
  ['{DF019852-2554-4CB1-BC92-A49E3FC0402D}']
    { static Property Methods }

    { static Methods }
    {class} function init(amessage: JString): JRegistry_MissingComponentException; cdecl; //(Ljava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$MissingComponentException')]
  JRegistry_MissingComponentException = interface(JRuntimeException) // or JObject // SuperSignature: java/lang/RuntimeException
  ['{3CFBDF18-5115-4BF1-8997-E9416F971885}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_MissingComponentException = class(TJavaGenericImport<JRegistry_MissingComponentExceptionClass, JRegistry_MissingComponentException>) end;

  JRegistry_NoImageHeaderParserExceptionClass = interface(JRegistry_MissingComponentExceptionClass) // or JObjectClass // SuperSignature: com/bumptech/glide/Registry$MissingComponentException
  ['{7859416E-817B-4A12-8E46-9D01B5DD90C4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRegistry_NoImageHeaderParserException; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$NoImageHeaderParserException')]
  JRegistry_NoImageHeaderParserException = interface(JRegistry_MissingComponentException) // or JObject // SuperSignature: com/bumptech/glide/Registry$MissingComponentException
  ['{98C60020-AE37-4340-8E39-0633B6904956}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_NoImageHeaderParserException = class(TJavaGenericImport<JRegistry_NoImageHeaderParserExceptionClass, JRegistry_NoImageHeaderParserException>) end;

  JRegistry_NoModelLoaderAvailableExceptionClass = interface(JRegistry_MissingComponentExceptionClass) // or JObjectClass // SuperSignature: com/bumptech/glide/Registry$MissingComponentException
  ['{8FED657D-76ED-4BC3-96E8-DF4278AAD7EC}']
    { static Property Methods }

    { static Methods }
    {class} function init(model: JObject): JRegistry_NoModelLoaderAvailableException; cdecl; overload; //(Ljava/lang/Object;)V
    {class} function init(modelClass: Jlang_Class; P2: Jlang_Class): JRegistry_NoModelLoaderAvailableException; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$NoModelLoaderAvailableException')]
  JRegistry_NoModelLoaderAvailableException = interface(JRegistry_MissingComponentException) // or JObject // SuperSignature: com/bumptech/glide/Registry$MissingComponentException
  ['{05AAF41C-35CF-472E-8DC1-FE23764AE2AF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_NoModelLoaderAvailableException = class(TJavaGenericImport<JRegistry_NoModelLoaderAvailableExceptionClass, JRegistry_NoModelLoaderAvailableException>) end;

  JRegistry_NoResultEncoderAvailableExceptionClass = interface(JRegistry_MissingComponentExceptionClass) // or JObjectClass // SuperSignature: com/bumptech/glide/Registry$MissingComponentException
  ['{A919F1F9-2FE7-40FE-8619-F1338BC18653}']
    { static Property Methods }

    { static Methods }
    {class} function init(resourceClass: Jlang_Class): JRegistry_NoResultEncoderAvailableException; cdecl; //(Ljava/lang/Class;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$NoResultEncoderAvailableException')]
  JRegistry_NoResultEncoderAvailableException = interface(JRegistry_MissingComponentException) // or JObject // SuperSignature: com/bumptech/glide/Registry$MissingComponentException
  ['{20FB903B-6B11-4E89-90DE-9799CE2FC14D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_NoResultEncoderAvailableException = class(TJavaGenericImport<JRegistry_NoResultEncoderAvailableExceptionClass, JRegistry_NoResultEncoderAvailableException>) end;

  JRegistry_NoSourceEncoderAvailableExceptionClass = interface(JRegistry_MissingComponentExceptionClass) // or JObjectClass // SuperSignature: com/bumptech/glide/Registry$MissingComponentException
  ['{8AF947DC-DA50-46C9-9F36-B81EBCC485F6}']
    { static Property Methods }

    { static Methods }
    {class} function init(dataClass: Jlang_Class): JRegistry_NoSourceEncoderAvailableException; cdecl; //(Ljava/lang/Class;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$NoSourceEncoderAvailableException')]
  JRegistry_NoSourceEncoderAvailableException = interface(JRegistry_MissingComponentException) // or JObject // SuperSignature: com/bumptech/glide/Registry$MissingComponentException
  ['{BEDA88A1-8676-4438-A4A1-A1372127FA5F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_NoSourceEncoderAvailableException = class(TJavaGenericImport<JRegistry_NoSourceEncoderAvailableExceptionClass, JRegistry_NoSourceEncoderAvailableException>) end;

  JRegistryClass = interface(JObjectClass)
  ['{FCB0AE05-F224-44E5-A5F3-032DDA6D6632}']
    { static Property Methods }
    {class} function _GetBUCKET_GIF: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUCKET_BITMAP: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;
    {class} function _GetBUCKET_BITMAP_DRAWABLE: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Ljava/lang/String;

    { static Methods }
    {class} function init: JRegistry; cdecl; //()V

    { static Property }
    {class} property BUCKET_GIF: JString read _GetBUCKET_GIF;
    {class} property BUCKET_BITMAP: JString read _GetBUCKET_BITMAP;
    {class} property BUCKET_BITMAP_DRAWABLE: JString read _GetBUCKET_BITMAP_DRAWABLE;
  end;

  [JavaSignature('com/bumptech/glide/Registry')]
  JRegistry = interface(JObject)
  ['{B7A334FB-B7DC-48E6-8A05-0FC5238794F6}']
    { Property Methods }

    { methods }
    function &register(dataClass: Jlang_Class; P2: JEncoder): JRegistry; cdecl; overload; //Deprecated //(Ljava/lang/Class;Lcom/bumptech/glide/load/Encoder;)Lcom/bumptech/glide/Registry;
    function append(dataClass: Jlang_Class; P2: JEncoder): JRegistry; cdecl; overload; //(Ljava/lang/Class;Lcom/bumptech/glide/load/Encoder;)Lcom/bumptech/glide/Registry;
    function prepend(dataClass: Jlang_Class; P2: JEncoder): JRegistry; cdecl; overload; //(Ljava/lang/Class;Lcom/bumptech/glide/load/Encoder;)Lcom/bumptech/glide/Registry;
    function append(dataClass: Jlang_Class; P2: Jlang_Class; resourceClass: JResourceDecoder): JRegistry; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;
    function append(bucket: JString; dataClass: Jlang_Class; P3: Jlang_Class; resourceClass: JResourceDecoder): JRegistry; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;
    function prepend(dataClass: Jlang_Class; P2: Jlang_Class; resourceClass: JResourceDecoder): JRegistry; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;
    function prepend(bucket: JString; dataClass: Jlang_Class; P3: Jlang_Class; resourceClass: JResourceDecoder): JRegistry; cdecl; overload; //(Ljava/lang/String;Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceDecoder;)Lcom/bumptech/glide/Registry;
    function setResourceDecoderBucketPriorityList(buckets: JList): JRegistry; cdecl; //(Ljava/util/List;)Lcom/bumptech/glide/Registry;
    function &register(resourceClass: Jlang_Class; P2: JResourceEncoder): JRegistry; cdecl; overload; //Deprecated //(Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceEncoder;)Lcom/bumptech/glide/Registry;
    function append(resourceClass: Jlang_Class; P2: JResourceEncoder): JRegistry; cdecl; overload; //(Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceEncoder;)Lcom/bumptech/glide/Registry;
    function prepend(resourceClass: Jlang_Class; P2: JResourceEncoder): JRegistry; cdecl; overload; //(Ljava/lang/Class;Lcom/bumptech/glide/load/ResourceEncoder;)Lcom/bumptech/glide/Registry;
    function &register(factory: JDataRewinder_Factory): JRegistry; cdecl; overload; //(Lcom/bumptech/glide/load/data/DataRewinder$Factory;)Lcom/bumptech/glide/Registry;
    function &register(resourceClass: Jlang_Class; P2: Jlang_Class; transcodeClass: JResourceTranscoder): JRegistry; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/resource/transcode/ResourceTranscoder;)Lcom/bumptech/glide/Registry;
    function &register(parser: JImageHeaderParser): JRegistry; cdecl; overload; //(Lcom/bumptech/glide/load/ImageHeaderParser;)Lcom/bumptech/glide/Registry;
    function append(modelClass: Jlang_Class; P2: Jlang_Class; dataClass: JModelLoaderFactory): JRegistry; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;
    function prepend(modelClass: Jlang_Class; P2: Jlang_Class; dataClass: JModelLoaderFactory): JRegistry; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;
    function replace(modelClass: Jlang_Class; P2: Jlang_Class; dataClass: JModelLoaderFactory): JRegistry; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Lcom/bumptech/glide/load/model/ModelLoaderFactory;)Lcom/bumptech/glide/Registry;
    function getLoadPath(dataClass: Jlang_Class; P2: Jlang_Class; resourceClass: Jlang_Class): JLoadPath; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Lcom/bumptech/glide/load/engine/LoadPath;
    function getRegisteredResourceClasses(modelClass: Jlang_Class; P2: Jlang_Class; resourceClass: Jlang_Class): JList; cdecl; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)Ljava/util/List;
    function isResourceEncoderAvailable(resource: JResource): Boolean; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;)Z
    function getResultEncoder(resource: JResource): JResourceEncoder; cdecl; //(Lcom/bumptech/glide/load/engine/Resource;)Lcom/bumptech/glide/load/ResourceEncoder;
    function getSourceEncoder(data: JObject): JEncoder; cdecl; //(Ljava/lang/Object;)Lcom/bumptech/glide/load/Encoder;
    function getRewinder(data: JObject): JDataRewinder; cdecl; //(Ljava/lang/Object;)Lcom/bumptech/glide/load/data/DataRewinder;
    function getModelLoaders(model: JObject): JList; cdecl; //(Ljava/lang/Object;)Ljava/util/List;
    function getImageHeaderParsers: JList; cdecl; //()Ljava/util/List;

    { Property }
  end;

  TJRegistry = class(TJavaGenericImport<JRegistryClass, JRegistry>) end;

  JErrorRequestCoordinatorClass = interface(JObjectClass)
  ['{783AFDB6-F3E3-4ADE-9F82-118631AAFE55}']
    { static Property Methods }

    { static Methods }
    {class} function init(parent: JRequestCoordinator): JErrorRequestCoordinator; cdecl; //(Lcom/bumptech/glide/request/RequestCoordinator;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/ErrorRequestCoordinator')]
  JErrorRequestCoordinator = interface(JObject)
  ['{B67010FE-6F2D-4C6A-8D76-80A2920DB9B6}']
    { Property Methods }

    { methods }
    procedure setRequests(primary: JRequest; error: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;Lcom/bumptech/glide/request/Request;)V
    procedure &begin; cdecl; //()V
    procedure pause; cdecl; //()V
    procedure clear; cdecl; //()V
    function isPaused: Boolean; cdecl; //()Z
    function isRunning: Boolean; cdecl; //()Z
    function isComplete: Boolean; cdecl; //()Z
    function isResourceSet: Boolean; cdecl; //()Z
    function isCancelled: Boolean; cdecl; //()Z
    function isFailed: Boolean; cdecl; //()Z
    procedure recycle; cdecl; //()V
    function isEquivalentTo(o: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function canSetImage(request: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function canNotifyStatusChanged(request: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function canNotifyCleared(request: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function isAnyResourceSet: Boolean; cdecl; //()Z
    procedure onRequestSuccess(request: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    procedure onRequestFailed(request: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V

    { Property }
  end;

  TJErrorRequestCoordinator = class(TJavaGenericImport<JErrorRequestCoordinatorClass, JErrorRequestCoordinator>) end;

  JFutureTargetClass = interface(JObjectClass)
  ['{5BD4AD62-7456-4781-90A3-C53B567280F7}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/FutureTarget')]
  JFutureTarget = interface(IJavaInstance)
  ['{1CDF912C-2C56-4083-9EEB-45DBC9F5E175}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFutureTarget = class(TJavaGenericImport<JFutureTargetClass, JFutureTarget>) end;

  JRequestClass = interface(JObjectClass)
  ['{3CBC59AD-3089-456D-BCD5-70855D360921}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/Request')]
  JRequest = interface(IJavaInstance)
  ['{DFD5890E-17FA-4500-A825-75E7A3CED028}']
    { Property Methods }

    { methods }
    procedure &begin; cdecl; //()V
    procedure pause; cdecl; //()V
    procedure clear; cdecl; //()V
    function isPaused: Boolean; cdecl; //()Z
    function isRunning: Boolean; cdecl; //()Z
    function isComplete: Boolean; cdecl; //()Z
    function isResourceSet: Boolean; cdecl; //()Z
    function isCancelled: Boolean; cdecl; //()Z
    function isFailed: Boolean; cdecl; //()Z
    procedure recycle; cdecl; //()V
    function isEquivalentTo(P1: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z

    { Property }
  end;

  TJRequest = class(TJavaGenericImport<JRequestClass, JRequest>) end;

  JRequestCoordinatorClass = interface(JObjectClass)
  ['{AD5833E7-82C2-4C5F-ACB2-E5C17DE5CBD4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestCoordinator')]
  JRequestCoordinator = interface(IJavaInstance)
  ['{2A7AA3D8-58D5-4CAE-BAED-09A19E09C7D1}']
    { Property Methods }

    { methods }
    function canSetImage(P1: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function canNotifyStatusChanged(P1: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function canNotifyCleared(P1: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function isAnyResourceSet: Boolean; cdecl; //()Z
    procedure onRequestSuccess(P1: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    procedure onRequestFailed(P1: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V

    { Property }
  end;

  TJRequestCoordinator = class(TJavaGenericImport<JRequestCoordinatorClass, JRequestCoordinator>) end;

  JRequestFutureTarget_WaiterClass = interface(JObjectClass)
  ['{2016D4D6-BE24-4E3E-AB46-49456FB9504F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestFutureTarget$Waiter')]
  JRequestFutureTarget_Waiter = interface(JObject)
  ['{0AD2055D-CF79-4DBA-9B95-46E4B9D114DA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRequestFutureTarget_Waiter = class(TJavaGenericImport<JRequestFutureTarget_WaiterClass, JRequestFutureTarget_Waiter>) end;

  JRequestFutureTargetClass = interface(JObjectClass)
  ['{DA75218B-7D8E-4ACB-B9A9-F0B009ADEB21}']
    { static Property Methods }

    { static Methods }
    {class} function init(mainHandler: JHandler; width: Integer; height: Integer): JRequestFutureTarget; cdecl; //(Landroid/os/Handler;II)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestFutureTarget')]
  JRequestFutureTarget = interface(JObject)
  ['{7E6BCBA7-10D7-473C-A6E5-F7F3DF7B9119}']
    { Property Methods }

    { methods }
    function cancel(mayInterruptIfRunning: Boolean): Boolean; cdecl; //(Z)Z
    function isCancelled: Boolean; cdecl; //()Z
    function isDone: Boolean; cdecl; //()Z
    function get: JObject; cdecl; overload; //()Ljava/lang/Object;
    function get(time: Int64; P2: JTimeUnit): JObject; cdecl; overload; //(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    procedure getSize(cb: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    procedure removeCallback(cb: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    procedure setRequest(request: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    function getRequest: JRequest; cdecl; //()Lcom/bumptech/glide/request/Request;
    procedure onLoadCleared(placeholder: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onLoadStarted(placeholder: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onLoadFailed(errorDrawable: JDrawable); cdecl; overload; //(Landroid/graphics/drawable/Drawable;)V
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    procedure run; cdecl; //()V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V
    function onLoadFailed(e: JGlideException; model: JObject; target: JTarget; isFirstResource: Boolean): Boolean; cdecl; overload; //(Lcom/bumptech/glide/load/engine/GlideException;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Z)Z
    function onResourceReady(resource: JObject; model: JObject; target: JTarget; dataSource: JDataSource; isFirstResource: Boolean): Boolean; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/load/DataSource;Z)Z

    { Property }
  end;

  TJRequestFutureTarget = class(TJavaGenericImport<JRequestFutureTargetClass, JRequestFutureTarget>) end;

  JRequestListenerClass = interface(JObjectClass)
  ['{A4047A7F-4194-4A17-8B2A-F9067F9CE7CE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestListener')]
  JRequestListener = interface(IJavaInstance)
  ['{598D45F0-E2BE-4CED-BFE7-97D9563E34A9}']
    { Property Methods }

    { methods }
    function onLoadFailed(P1: JGlideException; P2: JObject; P3: JTarget; P4: Boolean): Boolean; cdecl; //(Lcom/bumptech/glide/load/engine/GlideException;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Z)Z
    function onResourceReady(P1: JObject; P2: JObject; P3: JTarget; P4: JDataSource; P5: Boolean): Boolean; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/load/DataSource;Z)Z

    { Property }
  end;

  TJRequestListener = class(TJavaGenericImport<JRequestListenerClass, JRequestListener>) end;

  JRequestOptionsClass = interface(JObjectClass)
  ['{DFFEFC32-4182-4D69-9824-876EF095848D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRequestOptions; cdecl; //()V
    {class} function sizeMultiplierOf(sizeMultiplier: Single): JRequestOptions; cdecl; //(F)Lcom/bumptech/glide/request/RequestOptions;
    {class} function diskCacheStrategyOf(diskCacheStrategy: JDiskCacheStrategy): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/engine/DiskCacheStrategy;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function priorityOf(priority: JPriority): JRequestOptions; cdecl; //(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function placeholderOf(placeholder: JDrawable): JRequestOptions; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function placeholderOf(placeholderId: Integer): JRequestOptions; cdecl; overload; //(I)Lcom/bumptech/glide/request/RequestOptions;
    {class} function errorOf(errorDrawable: JDrawable): JRequestOptions; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function errorOf(errorId: Integer): JRequestOptions; cdecl; overload; //(I)Lcom/bumptech/glide/request/RequestOptions;
    {class} function skipMemoryCacheOf(skipMemoryCache: Boolean): JRequestOptions; cdecl; //(Z)Lcom/bumptech/glide/request/RequestOptions;
    {class} function overrideOf(width: Integer; height: Integer): JRequestOptions; cdecl; overload; //(II)Lcom/bumptech/glide/request/RequestOptions;
    {class} function overrideOf(size: Integer): JRequestOptions; cdecl; overload; //(I)Lcom/bumptech/glide/request/RequestOptions;
    {class} function signatureOf(signature: JKey): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/Key;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function fitCenterTransform: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    {class} function centerInsideTransform: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    {class} function centerCropTransform: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    {class} function circleCropTransform: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    {class} function bitmapTransform(transformation: JTransformation): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function noTransformation: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    {class} function option(option: JOption; value: JObject): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function decodeTypeOf(resourceClass: Jlang_Class): JRequestOptions; cdecl; //(Ljava/lang/Class;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function formatOf(format: JDecodeFormat): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function frameOf(frameTimeMicros: Int64): JRequestOptions; cdecl; //(J)Lcom/bumptech/glide/request/RequestOptions;
    {class} function downsampleOf(strategy: JDownsampleStrategy): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function timeoutOf(timeout: Integer): JRequestOptions; cdecl; //(I)Lcom/bumptech/glide/request/RequestOptions;
    {class} function encodeQualityOf(quality: Integer): JRequestOptions; cdecl; //(I)Lcom/bumptech/glide/request/RequestOptions;
    {class} function encodeFormatOf(format: JBitmap_CompressFormat): JRequestOptions; cdecl; //(Landroid/graphics/Bitmap$CompressFormat;)Lcom/bumptech/glide/request/RequestOptions;
    {class} function noAnimation: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestOptions')]
  JRequestOptions = interface(JObject)
  ['{5B2B2644-7038-4B4C-8480-156FD94FD0A0}']
    { Property Methods }

    { methods }
    function sizeMultiplier(sizeMultiplier: Single): JRequestOptions; cdecl; //(F)Lcom/bumptech/glide/request/RequestOptions;
    function useUnlimitedSourceGeneratorsPool(flag: Boolean): JRequestOptions; cdecl; //(Z)Lcom/bumptech/glide/request/RequestOptions;
    function useAnimationPool(flag: Boolean): JRequestOptions; cdecl; //(Z)Lcom/bumptech/glide/request/RequestOptions;
    function onlyRetrieveFromCache(flag: Boolean): JRequestOptions; cdecl; //(Z)Lcom/bumptech/glide/request/RequestOptions;
    function diskCacheStrategy(strategy: JDiskCacheStrategy): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/engine/DiskCacheStrategy;)Lcom/bumptech/glide/request/RequestOptions;
    function priority(priority: JPriority): JRequestOptions; cdecl; //(Lcom/bumptech/glide/Priority;)Lcom/bumptech/glide/request/RequestOptions;
    function placeholder(drawable: JDrawable): JRequestOptions; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/RequestOptions;
    function placeholder(resourceId: Integer): JRequestOptions; cdecl; overload; //(I)Lcom/bumptech/glide/request/RequestOptions;
    function fallback(drawable: JDrawable): JRequestOptions; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/RequestOptions;
    function fallback(resourceId: Integer): JRequestOptions; cdecl; overload; //(I)Lcom/bumptech/glide/request/RequestOptions;
    function error(drawable: JDrawable): JRequestOptions; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/request/RequestOptions;
    function error(resourceId: Integer): JRequestOptions; cdecl; overload; //(I)Lcom/bumptech/glide/request/RequestOptions;
    function theme(theme: JResources_Theme): JRequestOptions; cdecl; //(Landroid/content/res/Resources$Theme;)Lcom/bumptech/glide/request/RequestOptions;
    function skipMemoryCache(skip: Boolean): JRequestOptions; cdecl; //(Z)Lcom/bumptech/glide/request/RequestOptions;
    function &override(width: Integer; height: Integer): JRequestOptions; cdecl; overload; //(II)Lcom/bumptech/glide/request/RequestOptions;
    function &override(size: Integer): JRequestOptions; cdecl; overload; //(I)Lcom/bumptech/glide/request/RequestOptions;
    function signature(signature: JKey): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/Key;)Lcom/bumptech/glide/request/RequestOptions;
    function clone: JRequestOptions; cdecl; overload; //()Lcom/bumptech/glide/request/RequestOptions;
    function &set(option: JOption; P2: JObject): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/Option;Ljava/lang/Object;)Lcom/bumptech/glide/request/RequestOptions;
    function decode(resourceClass: Jlang_Class): JRequestOptions; cdecl; //(Ljava/lang/Class;)Lcom/bumptech/glide/request/RequestOptions;
    function isTransformationAllowed: Boolean; cdecl; //()Z
    function isTransformationSet: Boolean; cdecl; //()Z
    function isLocked: Boolean; cdecl; //()Z
    function encodeFormat(format: JBitmap_CompressFormat): JRequestOptions; cdecl; //(Landroid/graphics/Bitmap$CompressFormat;)Lcom/bumptech/glide/request/RequestOptions;
    function encodeQuality(quality: Integer): JRequestOptions; cdecl; //(I)Lcom/bumptech/glide/request/RequestOptions;
    function frame(frameTimeMicros: Int64): JRequestOptions; cdecl; //(J)Lcom/bumptech/glide/request/RequestOptions;
    function format(format: JDecodeFormat): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/RequestOptions;
    function disallowHardwareConfig: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function downsample(strategy: JDownsampleStrategy): JRequestOptions; cdecl; //(Lcom/bumptech/glide/load/resource/bitmap/DownsampleStrategy;)Lcom/bumptech/glide/request/RequestOptions;
    function timeout(timeoutMs: Integer): JRequestOptions; cdecl; //(I)Lcom/bumptech/glide/request/RequestOptions;
    function optionalCenterCrop: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function centerCrop: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function optionalFitCenter: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function fitCenter: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function optionalCenterInside: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function centerInside: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function optionalCircleCrop: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function circleCrop: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function transform(transformation: JTransformation): JRequestOptions; cdecl; overload; //(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;
    function transforms(transformations: TJavaObjectArray<JTransformation>): JRequestOptions; cdecl; //([Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;
    function optionalTransform(transformation: JTransformation): JRequestOptions; cdecl; overload; //(Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;
    function optionalTransform(resourceClass: Jlang_Class; P2: JTransformation): JRequestOptions; cdecl; overload; //(Ljava/lang/Class;Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;
    function transform(resourceClass: Jlang_Class; P2: JTransformation): JRequestOptions; cdecl; overload; //(Ljava/lang/Class;Lcom/bumptech/glide/load/Transformation;)Lcom/bumptech/glide/request/RequestOptions;
    function dontTransform: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function dontAnimate: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function apply(other: JRequestOptions): JRequestOptions; cdecl; //(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/request/RequestOptions;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
    function lock: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function autoClone: JRequestOptions; cdecl; //()Lcom/bumptech/glide/request/RequestOptions;
    function isDiskCacheStrategySet: Boolean; cdecl; //()Z
    function isSkipMemoryCacheSet: Boolean; cdecl; //()Z
    function getTransformations: JMap; cdecl; //()Ljava/util/Map;
    function isTransformationRequired: Boolean; cdecl; //()Z
    function getOptions: JOptions; cdecl; //()Lcom/bumptech/glide/load/Options;
    function getResourceClass: Jlang_Class; cdecl; //()Ljava/lang/Class;
    function getDiskCacheStrategy: JDiskCacheStrategy; cdecl; //()Lcom/bumptech/glide/load/engine/DiskCacheStrategy;
    function getErrorPlaceholder: JDrawable; cdecl; //()Landroid/graphics/drawable/Drawable;
    function getErrorId: Integer; cdecl; //()I
    function getPlaceholderId: Integer; cdecl; //()I
    function getPlaceholderDrawable: JDrawable; cdecl; //()Landroid/graphics/drawable/Drawable;
    function getFallbackId: Integer; cdecl; //()I
    function getFallbackDrawable: JDrawable; cdecl; //()Landroid/graphics/drawable/Drawable;
    function getTheme: JResources_Theme; cdecl; //()Landroid/content/res/Resources$Theme;
    function isMemoryCacheable: Boolean; cdecl; //()Z
    function getSignature: JKey; cdecl; //()Lcom/bumptech/glide/load/Key;
    function isPrioritySet: Boolean; cdecl; //()Z
    function getPriority: JPriority; cdecl; //()Lcom/bumptech/glide/Priority;
    function getOverrideWidth: Integer; cdecl; //()I
    function isValidOverride: Boolean; cdecl; //()Z
    function getOverrideHeight: Integer; cdecl; //()I
    function getSizeMultiplier: Single; cdecl; //()F
    function getUseUnlimitedSourceGeneratorsPool: Boolean; cdecl; //()Z
    function getUseAnimationPool: Boolean; cdecl; //()Z
    function getOnlyRetrieveFromCache: Boolean; cdecl; //()Z
//    function clone: JObject; cdecl; overload; //()Ljava/lang/Object;

    { Property }
  end;

  TJRequestOptions = class(TJavaGenericImport<JRequestOptionsClass, JRequestOptions>) end;

  JResourceCallbackClass = interface(JObjectClass)
  ['{9A831B58-8613-47E6-A1C3-C9CD3E7D6446}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/ResourceCallback')]
  JResourceCallback = interface(IJavaInstance)
  ['{05A4427C-2DCD-4750-97A3-EFA3F6CF2925}']
    { Property Methods }

    { methods }
    procedure onResourceReady(P1: JResource; P2: JDataSource); cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V
    procedure onLoadFailed(P1: JGlideException); cdecl; //(Lcom/bumptech/glide/load/engine/GlideException;)V

    { Property }
  end;

  TJResourceCallback = class(TJavaGenericImport<JResourceCallbackClass, JResourceCallback>) end;

  JSingleRequest_StatusClass = interface(JEnumClass) // or JObjectClass // SuperSignature: java/lang/Enum
  ['{E58CD631-DBBF-4D51-AB9D-8000810C3CCF}']
    { static Property Methods }
    {class} function _GetPENDING: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/request/SingleRequest$Status;
    {class} function _GetRUNNING: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/request/SingleRequest$Status;
    {class} function _GetWAITING_FOR_SIZE: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/request/SingleRequest$Status;
    {class} function _GetCOMPLETE: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/request/SingleRequest$Status;
    {class} function _GetFAILED: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/request/SingleRequest$Status;
    {class} function _GetCANCELLED: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/request/SingleRequest$Status;
    {class} function _GetCLEARED: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/request/SingleRequest$Status;
    {class} function _GetPAUSED: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //Lcom/bumptech/glide/request/SingleRequest$Status;

    { static Methods }
    {class} function values: TJavaObjectArray<JSingleRequest_Status>; cdecl; //()[Lcom/bumptech/glide/request/SingleRequest$Status;
    {class} function valueOf(name: JString): JSingleRequest_Status; cdecl; //(Ljava/lang/String;)Lcom/bumptech/glide/request/SingleRequest$Status;

    { static Property }
    {class} property PENDING: JSingleRequest_Status read _GetPENDING;
    {class} property RUNNING: JSingleRequest_Status read _GetRUNNING;
    {class} property WAITING_FOR_SIZE: JSingleRequest_Status read _GetWAITING_FOR_SIZE;
    {class} property COMPLETE: JSingleRequest_Status read _GetCOMPLETE;
    {class} property FAILED: JSingleRequest_Status read _GetFAILED;
    {class} property CANCELLED: JSingleRequest_Status read _GetCANCELLED;
    {class} property CLEARED: JSingleRequest_Status read _GetCLEARED;
    {class} property PAUSED: JSingleRequest_Status read _GetPAUSED;
  end;

  [JavaSignature('com/bumptech/glide/request/SingleRequest$Status')]
  JSingleRequest_Status = interface(JEnum) // or JObject // SuperSignature: java/lang/Enum
  ['{089A1C24-EC19-4EBC-B794-32DA95B6B751}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSingleRequest_Status = class(TJavaGenericImport<JSingleRequest_StatusClass, JSingleRequest_Status>) end;

  JSingleRequestClass = interface(JObjectClass)
  ['{1DBF8617-1A4B-478B-86CD-5AFAA195C0EC}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(context: JContext; glideContext: JGlideContext; model: JObject; transcodeClass: Jlang_Class; requestOptions: JRequestOptions; overrideWidth: Integer; overrideHeight: Integer; priority: JPriority; target: JTarget; targetListener: JRequestListener; requestListener: JRequestListener; requestCoordinator: JRequestCoordinator; engine: JEngine; animationFactory: JTransitionFactory): JSingleRequest; cdecl; //(Landroid/content/Context;Lcom/bumptech/glide/GlideContext;Ljava/lang/Object;Ljava/lang/Class;Lcom/bumptech/glide/request/RequestOptions;IILcom/bumptech/glide/Priority;Lcom/bumptech/glide/request/target/Target;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/RequestListener;Lcom/bumptech/glide/request/RequestCoordinator;Lcom/bumptech/glide/load/engine/Engine;Lcom/bumptech/glide/request/transition/TransitionFactory;)Lcom/bumptech/glide/request/SingleRequest;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/SingleRequest')]
  JSingleRequest = interface(JObject)
  ['{CDE218F8-CFE6-46E6-9941-BB36FA8E6CD8}']
    { Property Methods }

    { methods }
    function getVerifier: JStateVerifier; cdecl; //()Lcom/bumptech/glide/util/pool/StateVerifier;
    procedure recycle; cdecl; //()V
    procedure &begin; cdecl; //()V
    procedure clear; cdecl; //()V
    function isPaused: Boolean; cdecl; //()Z
    procedure pause; cdecl; //()V
    function isRunning: Boolean; cdecl; //()Z
    function isComplete: Boolean; cdecl; //()Z
    function isResourceSet: Boolean; cdecl; //()Z
    function isCancelled: Boolean; cdecl; //()Z
    function isFailed: Boolean; cdecl; //()Z
    procedure onSizeReady(width: Integer; height: Integer); cdecl; //(II)V
    procedure onResourceReady(resource: JResource; dataSource: JDataSource); cdecl; //(Lcom/bumptech/glide/load/engine/Resource;Lcom/bumptech/glide/load/DataSource;)V
    procedure onLoadFailed(e: JGlideException); cdecl; //(Lcom/bumptech/glide/load/engine/GlideException;)V
    function isEquivalentTo(o: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z

    { Property }
  end;

  TJSingleRequest = class(TJavaGenericImport<JSingleRequestClass, JSingleRequest>) end;

  JAppWidgetTargetClass = interface(JSimpleTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
  ['{82303211-3EBA-4B8D-BA5A-35CC99A83E03}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; width: Integer; height: Integer; viewId: Integer; remoteViews: JRemoteViews; widgetIds: TJavaArray<Integer>): JAppWidgetTarget; cdecl; overload; //(Landroid/content/Context;IIILandroid/widget/RemoteViews;[I)V
    {class} function init(context: JContext; viewId: Integer; remoteViews: JRemoteViews; widgetIds: TJavaArray<Integer>): JAppWidgetTarget; cdecl; overload; //(Landroid/content/Context;ILandroid/widget/RemoteViews;[I)V
    {class} function init(context: JContext; width: Integer; height: Integer; viewId: Integer; remoteViews: JRemoteViews; componentName: JComponentName): JAppWidgetTarget; cdecl; overload; //(Landroid/content/Context;IIILandroid/widget/RemoteViews;Landroid/content/ComponentName;)V
    {class} function init(context: JContext; viewId: Integer; remoteViews: JRemoteViews; componentName: JComponentName): JAppWidgetTarget; cdecl; overload; //(Landroid/content/Context;ILandroid/widget/RemoteViews;Landroid/content/ComponentName;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/AppWidgetTarget')]
  JAppWidgetTarget = interface(JSimpleTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
  ['{95C11760-0CC1-486E-80EF-BD7AC17BC853}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JBitmap; transition: JTransition); cdecl; overload; //(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/transition/Transition;)V
    procedure onResourceReady(this: JObject; P2: JTransition); cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V

    { Property }
  end;

  TJAppWidgetTarget = class(TJavaGenericImport<JAppWidgetTargetClass, JAppWidgetTarget>) end;

  JViewTargetClass = interface(JBaseTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/BaseTarget
  ['{7B38DD4C-F090-438D-A6B3-4EEB49D1085F}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JView): JViewTarget; cdecl; overload; //(Landroid/view/View;)V
    {class} function init(view: JView; waitForLayout: Boolean): JViewTarget; cdecl; overload; //Deprecated //(Landroid/view/View;Z)V
    {class} procedure setTagId(tagId: Integer); cdecl; //(I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ViewTarget')]
  JViewTarget = interface(JBaseTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/BaseTarget
  ['{E8EE9FAE-B8CD-4229-B7EC-49C3B78AB1DB}']
    { Property Methods }

    { methods }
    function clearOnDetach: JViewTarget; cdecl; //()Lcom/bumptech/glide/request/target/ViewTarget;
    function waitForLayout: JViewTarget; cdecl; //()Lcom/bumptech/glide/request/target/ViewTarget;
    procedure onLoadStarted(placeholder: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    function getView: JView; cdecl; //()Landroid/view/View;
    procedure getSize(cb: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    procedure removeCallback(cb: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    procedure onLoadCleared(placeholder: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure setRequest(request: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    function getRequest: JRequest; cdecl; //()Lcom/bumptech/glide/request/Request;
    function toString: JString; cdecl; //()Ljava/lang/String;

    { Property }
  end;

  TJViewTarget = class(TJavaGenericImport<JViewTargetClass, JViewTarget>) end;

  JImageViewTargetClass = interface(JViewTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/ViewTarget
  ['{707F22D9-F0AE-430D-8213-3856D0EDF209}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JImageViewTarget; cdecl; overload; //(Landroid/widget/ImageView;)V
    {class} function init(view: JImageView; waitForLayout: Boolean): JImageViewTarget; cdecl; overload; //Deprecated //(Landroid/widget/ImageView;Z)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ImageViewTarget')]
  JImageViewTarget = interface(JViewTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/ViewTarget
  ['{5070E998-8177-4154-9299-B47A8813EE10}']
    { Property Methods }

    { methods }
    function getCurrentDrawable: JDrawable; cdecl; //()Landroid/graphics/drawable/Drawable;
    procedure setDrawable(drawable: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onLoadStarted(placeholder: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onLoadFailed(errorDrawable: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onLoadCleared(placeholder: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V

    { Property }
  end;

  TJImageViewTarget = class(TJavaGenericImport<JImageViewTargetClass, JImageViewTarget>) end;

  JBitmapImageViewTargetClass = interface(JImageViewTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/ImageViewTarget
  ['{BCD37558-09C4-4977-81EF-A722CE5B1478}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JBitmapImageViewTarget; cdecl; overload; //(Landroid/widget/ImageView;)V
    {class} function init(view: JImageView; waitForLayout: Boolean): JBitmapImageViewTarget; cdecl; overload; //Deprecated //(Landroid/widget/ImageView;Z)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/BitmapImageViewTarget')]
  JBitmapImageViewTarget = interface(JImageViewTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/ImageViewTarget
  ['{9EA5CBC1-E38E-4AD0-855A-E3A137C7C8B9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapImageViewTarget = class(TJavaGenericImport<JBitmapImageViewTargetClass, JBitmapImageViewTarget>) end;

  JThumbnailImageViewTargetClass = interface(JImageViewTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/ImageViewTarget
  ['{A3C9F685-E276-428E-989F-5401B98C8737}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JThumbnailImageViewTarget; cdecl; overload; //(Landroid/widget/ImageView;)V
    {class} function init(view: JImageView; waitForLayout: Boolean): JThumbnailImageViewTarget; cdecl; overload; //Deprecated //(Landroid/widget/ImageView;Z)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ThumbnailImageViewTarget')]
  JThumbnailImageViewTarget = interface(JImageViewTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/ImageViewTarget
  ['{707BADB8-AF19-4176-8DA2-A84B040B05A1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJThumbnailImageViewTarget = class(TJavaGenericImport<JThumbnailImageViewTargetClass, JThumbnailImageViewTarget>) end;

  JBitmapThumbnailImageViewTargetClass = interface(JThumbnailImageViewTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/ThumbnailImageViewTarget
  ['{3C9B94FC-FC94-4838-AEF9-1C6CEE08AA84}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JBitmapThumbnailImageViewTarget; cdecl; overload; //(Landroid/widget/ImageView;)V
    {class} function init(view: JImageView; waitForLayout: Boolean): JBitmapThumbnailImageViewTarget; cdecl; overload; //Deprecated //(Landroid/widget/ImageView;Z)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/BitmapThumbnailImageViewTarget')]
  JBitmapThumbnailImageViewTarget = interface(JThumbnailImageViewTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/ThumbnailImageViewTarget
  ['{369086FB-7FE4-4203-91E9-F670C472FF46}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapThumbnailImageViewTarget = class(TJavaGenericImport<JBitmapThumbnailImageViewTargetClass, JBitmapThumbnailImageViewTarget>) end;

  JDrawableImageViewTargetClass = interface(JImageViewTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/ImageViewTarget
  ['{EB2EBC4B-5121-481E-B455-DD4A302C71FB}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JDrawableImageViewTarget; cdecl; overload; //(Landroid/widget/ImageView;)V
    {class} function init(view: JImageView; waitForLayout: Boolean): JDrawableImageViewTarget; cdecl; overload; //Deprecated //(Landroid/widget/ImageView;Z)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/DrawableImageViewTarget')]
  JDrawableImageViewTarget = interface(JImageViewTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/ImageViewTarget
  ['{972867D2-3CD5-4F0D-9F2A-A4E8FDF0C397}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDrawableImageViewTarget = class(TJavaGenericImport<JDrawableImageViewTargetClass, JDrawableImageViewTarget>) end;

  JDrawableThumbnailImageViewTargetClass = interface(JThumbnailImageViewTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/ThumbnailImageViewTarget
  ['{76E72E5C-2292-4ADE-9877-93F690B09D16}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JDrawableThumbnailImageViewTarget; cdecl; overload; //(Landroid/widget/ImageView;)V
    {class} function init(view: JImageView; waitForLayout: Boolean): JDrawableThumbnailImageViewTarget; cdecl; overload; //Deprecated //(Landroid/widget/ImageView;Z)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/DrawableThumbnailImageViewTarget')]
  JDrawableThumbnailImageViewTarget = interface(JThumbnailImageViewTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/ThumbnailImageViewTarget
  ['{C08D7D0B-85A0-4985-BF0C-9403D45C9B2C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDrawableThumbnailImageViewTarget = class(TJavaGenericImport<JDrawableThumbnailImageViewTargetClass, JDrawableThumbnailImageViewTarget>) end;

  JFixedSizeDrawable_StateClass = interface(JDrawable_ConstantStateClass) // or JObjectClass // SuperSignature: android/graphics/drawable/Drawable$ConstantState
  ['{1878432F-0752-4567-8AC9-FB5E2C977822}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/FixedSizeDrawable$State')]
  JFixedSizeDrawable_State = interface(JDrawable_ConstantState) // or JObject // SuperSignature: android/graphics/drawable/Drawable$ConstantState
  ['{25C57F2E-77C0-4499-B624-983C4A285098}']
    { Property Methods }

    { methods }
    function newDrawable: JDrawable; cdecl; overload; //()Landroid/graphics/drawable/Drawable;
    function newDrawable(res: JResources): JDrawable; cdecl; overload; //(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;
    function getChangingConfigurations: Integer; cdecl; //()I

    { Property }
  end;

  TJFixedSizeDrawable_State = class(TJavaGenericImport<JFixedSizeDrawable_StateClass, JFixedSizeDrawable_State>) end;

  JFixedSizeDrawableClass = interface(JDrawableClass) // or JObjectClass // SuperSignature: android/graphics/drawable/Drawable
  ['{6D5DAD77-F540-434E-8B13-9D0C0E01FC4F}']
    { static Property Methods }

    { static Methods }
    {class} function init(wrapped: JDrawable; width: Integer; height: Integer): JFixedSizeDrawable; cdecl; //(Landroid/graphics/drawable/Drawable;II)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/FixedSizeDrawable')]
  JFixedSizeDrawable = interface(JDrawable) // or JObject // SuperSignature: android/graphics/drawable/Drawable
  ['{6166854B-F313-4359-9EBB-1FE2489F4788}']
    { Property Methods }

    { methods }
    procedure setBounds(left: Integer; top: Integer; right: Integer; bottom: Integer); cdecl; overload; //(IIII)V
    procedure setBounds(bounds: JRect); cdecl; overload; //(Landroid/graphics/Rect;)V
    procedure setChangingConfigurations(configs: Integer); cdecl; //(I)V
    function getChangingConfigurations: Integer; cdecl; //()I
    procedure setDither(dither: Boolean); cdecl; //Deprecated //(Z)V
    procedure setFilterBitmap(filter: Boolean); cdecl; //(Z)V
    function getCallback: JDrawable_Callback; cdecl; //()Landroid/graphics/drawable/Drawable$Callback;
    function getAlpha: Integer; cdecl; //()I
    procedure setColorFilter(color: Integer; mode: JPorterDuff_Mode); cdecl; overload; //(ILandroid/graphics/PorterDuff$Mode;)V
    procedure clearColorFilter; cdecl; //()V
    function getCurrent: JDrawable; cdecl; //()Landroid/graphics/drawable/Drawable;
    function setVisible(visible: Boolean; restart: Boolean): Boolean; cdecl; //(ZZ)Z
    function getIntrinsicWidth: Integer; cdecl; //()I
    function getIntrinsicHeight: Integer; cdecl; //()I
    function getMinimumWidth: Integer; cdecl; //()I
    function getMinimumHeight: Integer; cdecl; //()I
    function getPadding(padding: JRect): Boolean; cdecl; //(Landroid/graphics/Rect;)Z
    procedure invalidateSelf; cdecl; //()V
    procedure unscheduleSelf(what: JRunnable); cdecl; //(Ljava/lang/Runnable;)V
    procedure scheduleSelf(what: JRunnable; when: Int64); cdecl; //(Ljava/lang/Runnable;J)V
    procedure draw(canvas: JCanvas); cdecl; //(Landroid/graphics/Canvas;)V
    procedure setAlpha(i: Integer); cdecl; //(I)V
    procedure setColorFilter(colorFilter: JColorFilter); cdecl; overload; //(Landroid/graphics/ColorFilter;)V
    function getOpacity: Integer; cdecl; //()I
    function mutate: JDrawable; cdecl; //()Landroid/graphics/drawable/Drawable;
    function getConstantState: JDrawable_ConstantState; cdecl; //()Landroid/graphics/drawable/Drawable$ConstantState;

    { Property }
  end;

  TJFixedSizeDrawable = class(TJavaGenericImport<JFixedSizeDrawableClass, JFixedSizeDrawable>) end;

  JImageViewTargetFactoryClass = interface(JObjectClass)
  ['{4C818EEA-7B5D-464C-801F-C222BA319C89}']
    { static Property Methods }

    { static Methods }
    {class} function init: JImageViewTargetFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ImageViewTargetFactory')]
  JImageViewTargetFactory = interface(JObject)
  ['{9B5FBD20-E14C-4EC7-ABD6-504B17DC68B8}']
    { Property Methods }

    { methods }
    function buildTarget(view: JImageView; clazz: Jlang_Class): JViewTarget; cdecl; //(Landroid/widget/ImageView;Ljava/lang/Class;)Lcom/bumptech/glide/request/target/ViewTarget;

    { Property }
  end;

  TJImageViewTargetFactory = class(TJavaGenericImport<JImageViewTargetFactoryClass, JImageViewTargetFactory>) end;

  JNotificationTargetClass = interface(JSimpleTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
  ['{2763DB11-CCBA-4887-9D71-8E73773910B6}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; viewId: Integer; remoteViews: JRemoteViews; notification: JNotification; notificationId: Integer): JNotificationTarget; cdecl; overload; //(Landroid/content/Context;ILandroid/widget/RemoteViews;Landroid/app/Notification;I)V
    {class} function init(context: JContext; viewId: Integer; remoteViews: JRemoteViews; notification: JNotification; notificationId: Integer; notificationTag: JString): JNotificationTarget; cdecl; overload; //(Landroid/content/Context;ILandroid/widget/RemoteViews;Landroid/app/Notification;ILjava/lang/String;)V
    {class} function init(context: JContext; width: Integer; height: Integer; viewId: Integer; remoteViews: JRemoteViews; notification: JNotification; notificationId: Integer; notificationTag: JString): JNotificationTarget; cdecl; overload; //(Landroid/content/Context;IIILandroid/widget/RemoteViews;Landroid/app/Notification;ILjava/lang/String;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/NotificationTarget')]
  JNotificationTarget = interface(JSimpleTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
  ['{AA9A45EC-5D1B-4DC9-AFDE-0F2A7E6CCB52}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JBitmap; transition: JTransition); cdecl; overload; //(Landroid/graphics/Bitmap;Lcom/bumptech/glide/request/transition/Transition;)V
    procedure onResourceReady(this: JObject; P2: JTransition); cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V

    { Property }
  end;

  TJNotificationTarget = class(TJavaGenericImport<JNotificationTargetClass, JNotificationTarget>) end;

  JPreloadTargetClass = interface(JSimpleTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
  ['{B08B23B3-D011-46A3-8BA6-E56084BED74E}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(requestManager: JRequestManager; width: Integer; height: Integer): JPreloadTarget; cdecl; //(Lcom/bumptech/glide/RequestManager;II)Lcom/bumptech/glide/request/target/PreloadTarget;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/PreloadTarget')]
  JPreloadTarget = interface(JSimpleTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/SimpleTarget
  ['{B403FDED-5123-446F-8C98-F796B635D425}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V

    { Property }
  end;

  TJPreloadTarget = class(TJavaGenericImport<JPreloadTargetClass, JPreloadTarget>) end;

  JSizeReadyCallbackClass = interface(JObjectClass)
  ['{EA8201DE-16BF-4443-9453-411FD079D8BB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/SizeReadyCallback')]
  JSizeReadyCallback = interface(IJavaInstance)
  ['{83432EBD-A2AF-451B-9CEE-198AE232BACC}']
    { Property Methods }

    { methods }
    procedure onSizeReady(P1: Integer; P2: Integer); cdecl; //(II)V

    { Property }
  end;

  TJSizeReadyCallback = class(TJavaGenericImport<JSizeReadyCallbackClass, JSizeReadyCallback>) end;

  JTargetClass = interface(JObjectClass)
  ['{03F1ADF7-137F-4442-81BD-7D40580325B7}']
    { static Property Methods }
    {class} function _GetSIZE_ORIGINAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND} //I

    { static Methods }

    { static Property }
    {class} property SIZE_ORIGINAL: Integer read _GetSIZE_ORIGINAL;
  end;

  [JavaSignature('com/bumptech/glide/request/target/Target')]
  JTarget = interface(IJavaInstance)
  ['{2E4346B8-4A50-4970-953C-F49F3F168337}']
    { Property Methods }

    { methods }
    procedure onLoadStarted(P1: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onLoadFailed(P1: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure onResourceReady(P1: JObject; P2: JTransition); cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V
    procedure onLoadCleared(P1: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V
    procedure getSize(P1: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    procedure removeCallback(P1: JSizeReadyCallback); cdecl; //(Lcom/bumptech/glide/request/target/SizeReadyCallback;)V
    procedure setRequest(P1: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    function getRequest: JRequest; cdecl; //()Lcom/bumptech/glide/request/Request;

    { Property }
  end;

  TJTarget = class(TJavaGenericImport<JTargetClass, JTarget>) end;

  JViewTarget_SizeDeterminer_SizeDeterminerLayoutListenerClass = interface(JObjectClass)
  ['{D5F41B37-AC6F-4A6F-8537-CD9390FE9A14}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ViewTarget$SizeDeterminer$SizeDeterminerLayoutListener')]
  JViewTarget_SizeDeterminer_SizeDeterminerLayoutListener = interface(JObject)
  ['{B1BB78E2-2CB2-4882-AB4D-FE2E2E3681EA}']
    { Property Methods }

    { methods }
    function onPreDraw: Boolean; cdecl; //()Z

    { Property }
  end;

  TJViewTarget_SizeDeterminer_SizeDeterminerLayoutListener = class(TJavaGenericImport<JViewTarget_SizeDeterminer_SizeDeterminerLayoutListenerClass, JViewTarget_SizeDeterminer_SizeDeterminerLayoutListener>) end;

  JViewTarget_SizeDeterminerClass = interface(JObjectClass)
  ['{2834B0EE-6C6A-4D76-950F-5E6DC92C870D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ViewTarget$SizeDeterminer')]
  JViewTarget_SizeDeterminer = interface(JObject)
  ['{B8DD6148-A258-4C47-A704-17F1915D2F6E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJViewTarget_SizeDeterminer = class(TJavaGenericImport<JViewTarget_SizeDeterminerClass, JViewTarget_SizeDeterminer>) end;

  JThumbnailRequestCoordinatorClass = interface(JObjectClass)
  ['{0D6DBD63-9DEE-4483-AAEB-B7B9AFFD5DB5}']
    { static Property Methods }

    { static Methods }
    {class} function init(parent: JRequestCoordinator): JThumbnailRequestCoordinator; cdecl; //(Lcom/bumptech/glide/request/RequestCoordinator;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/ThumbnailRequestCoordinator')]
  JThumbnailRequestCoordinator = interface(JObject)
  ['{CC648AE5-16CA-43BA-A2B9-28B077950545}']
    { Property Methods }

    { methods }
    procedure setRequests(full: JRequest; thumb: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;Lcom/bumptech/glide/request/Request;)V
    function canSetImage(request: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function canNotifyStatusChanged(request: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function canNotifyCleared(request: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z
    function isAnyResourceSet: Boolean; cdecl; //()Z
    procedure onRequestSuccess(request: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    procedure onRequestFailed(request: JRequest); cdecl; //(Lcom/bumptech/glide/request/Request;)V
    procedure &begin; cdecl; //()V
    procedure pause; cdecl; //()V
    procedure clear; cdecl; //()V
    function isPaused: Boolean; cdecl; //()Z
    function isRunning: Boolean; cdecl; //()Z
    function isComplete: Boolean; cdecl; //()Z
    function isResourceSet: Boolean; cdecl; //()Z
    function isCancelled: Boolean; cdecl; //()Z
    function isFailed: Boolean; cdecl; //()Z
    procedure recycle; cdecl; //()V
    function isEquivalentTo(o: JRequest): Boolean; cdecl; //(Lcom/bumptech/glide/request/Request;)Z

    { Property }
  end;

  TJThumbnailRequestCoordinator = class(TJavaGenericImport<JThumbnailRequestCoordinatorClass, JThumbnailRequestCoordinator>) end;

  JBitmapContainerTransitionFactory_BitmapGlideAnimationClass = interface(JObjectClass)
  ['{940CE1D7-F824-4DC8-8635-15DC32FEFCA9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/BitmapContainerTransitionFactory$BitmapGlideAnimation')]
  JBitmapContainerTransitionFactory_BitmapGlideAnimation = interface(JObject)
  ['{A9D8AAF6-8097-468C-9F88-3D0D0B9A7078}']
    { Property Methods }

    { methods }
    function transition(current: JObject; adapter: JTransition_ViewAdapter): Boolean; cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z

    { Property }
  end;

  TJBitmapContainerTransitionFactory_BitmapGlideAnimation = class(TJavaGenericImport<JBitmapContainerTransitionFactory_BitmapGlideAnimationClass, JBitmapContainerTransitionFactory_BitmapGlideAnimation>) end;

  JBitmapContainerTransitionFactoryClass = interface(JObjectClass)
  ['{D1321A3B-FABC-448D-B3A0-56FD4ACE5815}']
    { static Property Methods }

    { static Methods }
    {class} function init(realFactory: JTransitionFactory): JBitmapContainerTransitionFactory; cdecl; //(Lcom/bumptech/glide/request/transition/TransitionFactory;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/BitmapContainerTransitionFactory')]
  JBitmapContainerTransitionFactory = interface(JObject)
  ['{C78D4994-3FEA-4D03-ABC5-F99A637053E3}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl; //(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/transition/Transition;

    { Property }
  end;

  TJBitmapContainerTransitionFactory = class(TJavaGenericImport<JBitmapContainerTransitionFactoryClass, JBitmapContainerTransitionFactory>) end;

  JBitmapTransitionFactoryClass = interface(JBitmapContainerTransitionFactoryClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/transition/BitmapContainerTransitionFactory
  ['{5BA5A197-6787-4C65-90C1-7134CFCB0241}']
    { static Property Methods }

    { static Methods }
    {class} function init(realFactory: JTransitionFactory): JBitmapTransitionFactory; cdecl; //(Lcom/bumptech/glide/request/transition/TransitionFactory;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/BitmapTransitionFactory')]
  JBitmapTransitionFactory = interface(JBitmapContainerTransitionFactory) // or JObject // SuperSignature: com/bumptech/glide/request/transition/BitmapContainerTransitionFactory
  ['{23B05A5B-D630-4B01-9483-BEDD240D0468}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapTransitionFactory = class(TJavaGenericImport<JBitmapTransitionFactoryClass, JBitmapTransitionFactory>) end;

  JDrawableCrossFadeFactory_BuilderClass = interface(JObjectClass)
  ['{305E09A3-0E37-4ABA-B058-FF5CD3593218}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDrawableCrossFadeFactory_Builder; cdecl; overload; //()V
    {class} function init(durationMillis: Integer): JDrawableCrossFadeFactory_Builder; cdecl; overload; //(I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/DrawableCrossFadeFactory$Builder')]
  JDrawableCrossFadeFactory_Builder = interface(JObject)
  ['{B52B4F15-27EE-4628-9B6C-E0B56F2BC7D8}']
    { Property Methods }

    { methods }
    function setCrossFadeEnabled(isCrossFadeEnabled: Boolean): JDrawableCrossFadeFactory_Builder; cdecl; //(Z)Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory$Builder;
    function build: JDrawableCrossFadeFactory; cdecl; //()Lcom/bumptech/glide/request/transition/DrawableCrossFadeFactory;

    { Property }
  end;

  TJDrawableCrossFadeFactory_Builder = class(TJavaGenericImport<JDrawableCrossFadeFactory_BuilderClass, JDrawableCrossFadeFactory_Builder>) end;

  JDrawableCrossFadeFactoryClass = interface(JObjectClass)
  ['{7D08ED33-6FED-4E2B-9014-0235941CF70B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/DrawableCrossFadeFactory')]
  JDrawableCrossFadeFactory = interface(JObject)
  ['{990D08D6-5674-441C-9000-9E8A114D0F35}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl; //(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/transition/Transition;

    { Property }
  end;

  TJDrawableCrossFadeFactory = class(TJavaGenericImport<JDrawableCrossFadeFactoryClass, JDrawableCrossFadeFactory>) end;

  JDrawableCrossFadeTransitionClass = interface(JObjectClass)
  ['{096125E9-6FD0-49D8-B61C-EDD28FA96345}']
    { static Property Methods }

    { static Methods }
    {class} function init(duration: Integer; isCrossFadeEnabled: Boolean): JDrawableCrossFadeTransition; cdecl; //(IZ)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/DrawableCrossFadeTransition')]
  JDrawableCrossFadeTransition = interface(JObject)
  ['{3CB91BF1-D459-4BCF-AE73-C46D1F935AD3}']
    { Property Methods }

    { methods }
    function transition(current: JDrawable; adapter: JTransition_ViewAdapter): Boolean; cdecl; overload; //(Landroid/graphics/drawable/Drawable;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z
    function transition(this: JObject; P2: JTransition_ViewAdapter): Boolean; cdecl; overload; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z

    { Property }
  end;

  TJDrawableCrossFadeTransition = class(TJavaGenericImport<JDrawableCrossFadeTransitionClass, JDrawableCrossFadeTransition>) end;

  JNoTransition_NoAnimationFactoryClass = interface(JObjectClass)
  ['{D8BF1C91-653C-4438-AA21-AD66977103C5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JNoTransition_NoAnimationFactory; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/NoTransition$NoAnimationFactory')]
  JNoTransition_NoAnimationFactory = interface(JObject)
  ['{62E69E55-BB6B-461A-9D8E-A453BA37DDD7}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl; //(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/transition/Transition;

    { Property }
  end;

  TJNoTransition_NoAnimationFactory = class(TJavaGenericImport<JNoTransition_NoAnimationFactoryClass, JNoTransition_NoAnimationFactory>) end;

  JNoTransitionClass = interface(JObjectClass)
  ['{489BE513-A549-4718-9643-BA639E69D012}']
    { static Property Methods }

    { static Methods }
    {class} function init: JNoTransition; cdecl; //()V
    {class} function getFactory: JTransitionFactory; cdecl; //()Lcom/bumptech/glide/request/transition/TransitionFactory;
    {class} function get: JTransition; cdecl; //()Lcom/bumptech/glide/request/transition/Transition;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/NoTransition')]
  JNoTransition = interface(JObject)
  ['{54E6A006-C27B-418A-AABC-0FCE3D9E0EE3}']
    { Property Methods }

    { methods }
    function transition(current: JObject; adapter: JTransition_ViewAdapter): Boolean; cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z

    { Property }
  end;

  TJNoTransition = class(TJavaGenericImport<JNoTransitionClass, JNoTransition>) end;

  JTransition_ViewAdapterClass = interface(JObjectClass)
  ['{A82D970D-F5AC-402A-9878-C915E3019509}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/Transition$ViewAdapter')]
  JTransition_ViewAdapter = interface(IJavaInstance)
  ['{1AC625B7-8C08-4976-A8A3-88C748175B45}']
    { Property Methods }

    { methods }
    function getView: JView; cdecl; //()Landroid/view/View;
    function getCurrentDrawable: JDrawable; cdecl; //()Landroid/graphics/drawable/Drawable;
    procedure setDrawable(P1: JDrawable); cdecl; //(Landroid/graphics/drawable/Drawable;)V

    { Property }
  end;

  TJTransition_ViewAdapter = class(TJavaGenericImport<JTransition_ViewAdapterClass, JTransition_ViewAdapter>) end;

  JTransitionClass = interface(JObjectClass)
  ['{9890D5CA-E712-4A05-AACC-C530F521C8B6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/Transition')]
  JTransition = interface(IJavaInstance)
  ['{D26B4D78-EF1C-4794-AAB5-3F7A752DA130}']
    { Property Methods }

    { methods }
    function transition(P1: JObject; P2: JTransition_ViewAdapter): Boolean; cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z

    { Property }
  end;

  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransitionFactoryClass = interface(JObjectClass)
  ['{BC1269C3-EA1D-4732-AD85-00B219C355EB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/TransitionFactory')]
  JTransitionFactory = interface(IJavaInstance)
  ['{38A04F23-2846-4792-BE7C-5644C9D8C735}']
    { Property Methods }

    { methods }
    function build(P1: JDataSource; P2: Boolean): JTransition; cdecl; //(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/transition/Transition;

    { Property }
  end;

  TJTransitionFactory = class(TJavaGenericImport<JTransitionFactoryClass, JTransitionFactory>) end;

  JViewAnimationFactory_ConcreteViewTransitionAnimationFactoryClass = interface(JObjectClass)
  ['{AE40AD48-755B-4861-AD5A-75F6EFE967BE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewAnimationFactory$ConcreteViewTransitionAnimationFactory')]
  JViewAnimationFactory_ConcreteViewTransitionAnimationFactory = interface(JObject)
  ['{0B9A3689-A722-48E7-A91E-EE3CB0CEC63A}']
    { Property Methods }

    { methods }
    function build(context: JContext): JAnimation; cdecl; //(Landroid/content/Context;)Landroid/view/animation/Animation;

    { Property }
  end;

  TJViewAnimationFactory_ConcreteViewTransitionAnimationFactory = class(TJavaGenericImport<JViewAnimationFactory_ConcreteViewTransitionAnimationFactoryClass, JViewAnimationFactory_ConcreteViewTransitionAnimationFactory>) end;

  JViewAnimationFactory_ResourceViewTransitionAnimationFactoryClass = interface(JObjectClass)
  ['{3457047A-6DAF-45B7-B89F-2EF232FEDC0F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewAnimationFactory$ResourceViewTransitionAnimationFactory')]
  JViewAnimationFactory_ResourceViewTransitionAnimationFactory = interface(JObject)
  ['{08D52994-3088-4D17-A5B6-831AAA61583B}']
    { Property Methods }

    { methods }
    function build(context: JContext): JAnimation; cdecl; //(Landroid/content/Context;)Landroid/view/animation/Animation;

    { Property }
  end;

  TJViewAnimationFactory_ResourceViewTransitionAnimationFactory = class(TJavaGenericImport<JViewAnimationFactory_ResourceViewTransitionAnimationFactoryClass, JViewAnimationFactory_ResourceViewTransitionAnimationFactory>) end;

  JViewAnimationFactoryClass = interface(JObjectClass)
  ['{2F6997DA-632B-4C20-BC8A-2F636931B1C0}']
    { static Property Methods }

    { static Methods }
    {class} function init(animation: JAnimation): JViewAnimationFactory; cdecl; overload; //(Landroid/view/animation/Animation;)V
    {class} function init(animationId: Integer): JViewAnimationFactory; cdecl; overload; //(I)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewAnimationFactory')]
  JViewAnimationFactory = interface(JObject)
  ['{8345F1F8-3FE8-41AB-846E-BE854CCB3784}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl; //(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/transition/Transition;

    { Property }
  end;

  TJViewAnimationFactory = class(TJavaGenericImport<JViewAnimationFactoryClass, JViewAnimationFactory>) end;

  JViewPropertyAnimationFactoryClass = interface(JObjectClass)
  ['{0142D388-7649-4B7C-AC35-883E4C4257A5}']
    { static Property Methods }

    { static Methods }
    {class} function init(animator: JViewPropertyTransition_Animator): JViewPropertyAnimationFactory; cdecl; //(Lcom/bumptech/glide/request/transition/ViewPropertyTransition$Animator;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewPropertyAnimationFactory')]
  JViewPropertyAnimationFactory = interface(JObject)
  ['{D58C54C9-56DA-45B6-A7E4-31BBC18BD907}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl; //(Lcom/bumptech/glide/load/DataSource;Z)Lcom/bumptech/glide/request/transition/Transition;

    { Property }
  end;

  TJViewPropertyAnimationFactory = class(TJavaGenericImport<JViewPropertyAnimationFactoryClass, JViewPropertyAnimationFactory>) end;

  JViewPropertyTransition_AnimatorClass = interface(JObjectClass)
  ['{100E3A3B-01BF-4A9B-8B27-8DE7BEEEBD6C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewPropertyTransition$Animator')]
  JViewPropertyTransition_Animator = interface(IJavaInstance)
  ['{1F9E9DAD-CBAB-45CE-A40B-9EA0D8FF0C63}']
    { Property Methods }

    { methods }
    procedure animate(P1: JView); cdecl; //(Landroid/view/View;)V

    { Property }
  end;

  TJViewPropertyTransition_Animator = class(TJavaGenericImport<JViewPropertyTransition_AnimatorClass, JViewPropertyTransition_Animator>) end;

  JViewPropertyTransitionClass = interface(JObjectClass)
  ['{07424E45-B140-4D90-86CD-B76BAC7844AF}']
    { static Property Methods }

    { static Methods }
    {class} function init(animator: JViewPropertyTransition_Animator): JViewPropertyTransition; cdecl; //(Lcom/bumptech/glide/request/transition/ViewPropertyTransition$Animator;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewPropertyTransition')]
  JViewPropertyTransition = interface(JObject)
  ['{49B26CA8-5CC3-4B74-92AC-B1033535BA8B}']
    { Property Methods }

    { methods }
    function transition(current: JObject; adapter: JTransition_ViewAdapter): Boolean; cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z

    { Property }
  end;

  TJViewPropertyTransition = class(TJavaGenericImport<JViewPropertyTransitionClass, JViewPropertyTransition>) end;

  JViewTransition_ViewTransitionAnimationFactoryClass = interface(JObjectClass)
  ['{09AF1E48-5E44-45DA-9B29-6C6C23B4653F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewTransition$ViewTransitionAnimationFactory')]
  JViewTransition_ViewTransitionAnimationFactory = interface(IJavaInstance)
  ['{822AB391-7DF3-4AE1-94ED-D0ECBD17E0FF}']
    { Property Methods }

    { methods }
    function build(P1: JContext): JAnimation; cdecl; //(Landroid/content/Context;)Landroid/view/animation/Animation;

    { Property }
  end;

  TJViewTransition_ViewTransitionAnimationFactory = class(TJavaGenericImport<JViewTransition_ViewTransitionAnimationFactoryClass, JViewTransition_ViewTransitionAnimationFactory>) end;

  JViewTransitionClass = interface(JObjectClass)
  ['{7718119D-C16B-4421-9CF5-B3569E78FF18}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewTransition')]
  JViewTransition = interface(JObject)
  ['{81038398-0CEA-4824-ACD9-848A7606A8A1}']
    { Property Methods }

    { methods }
    function transition(current: JObject; adapter: JTransition_ViewAdapter): Boolean; cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition$ViewAdapter;)Z

    { Property }
  end;

  TJViewTransition = class(TJavaGenericImport<JViewTransitionClass, JViewTransition>) end;

  JRequestBuilderClass = interface(JObjectClass)
  ['{6773A990-780A-4599-BD3E-A563E1D80C46}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/RequestBuilder')]
  JRequestBuilder = interface(JObject)
  ['{57546A31-3824-4CA7-8B7C-1FF5552796C7}']
    { Property Methods }

    { methods }
    function apply(requestOptions: JRequestOptions): JRequestBuilder; cdecl; //(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;
    function transition(transitionOptions: JTransitionOptions): JRequestBuilder; cdecl; //(Lcom/bumptech/glide/TransitionOptions;)Lcom/bumptech/glide/RequestBuilder;
    function listener(requestListener: JRequestListener): JRequestBuilder; cdecl; //(Lcom/bumptech/glide/request/RequestListener;)Lcom/bumptech/glide/RequestBuilder;
    function error(errorBuilder: JRequestBuilder): JRequestBuilder; cdecl; //(Lcom/bumptech/glide/RequestBuilder;)Lcom/bumptech/glide/RequestBuilder;
    function thumbnail(thumbnailRequest: JRequestBuilder): JRequestBuilder; cdecl; overload; //(Lcom/bumptech/glide/RequestBuilder;)Lcom/bumptech/glide/RequestBuilder;
    function thumbnail(thumbnails: TJavaObjectArray<JRequestBuilder>): JRequestBuilder; cdecl; overload; //([Lcom/bumptech/glide/RequestBuilder;)Lcom/bumptech/glide/RequestBuilder;
    function thumbnail(sizeMultiplier: Single): JRequestBuilder; cdecl; overload; //(F)Lcom/bumptech/glide/RequestBuilder;
    function load(model: JObject): JRequestBuilder; cdecl; overload; //(Ljava/lang/Object;)Lcom/bumptech/glide/RequestBuilder;
    function load(bitmap: JBitmap): JRequestBuilder; cdecl; overload; //(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/RequestBuilder;
    function load(drawable: JDrawable): JRequestBuilder; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/RequestBuilder;
    function load(astring: JString): JRequestBuilder; cdecl; overload; //(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
    function load(uri: Jnet_Uri): JRequestBuilder; cdecl; overload; //(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;
    function load(afile: JFile): JRequestBuilder; cdecl; overload; //(Ljava/io/File;)Lcom/bumptech/glide/RequestBuilder;
    function load(resourceId: JInteger): JRequestBuilder; cdecl; overload; //(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;
//    function load(url: JURL): JRequestBuilder; cdecl; overload; //Deprecated //(Ljava/net/URL;)Lcom/bumptech/glide/RequestBuilder;
    function load(model: TJavaArray<Byte>): JRequestBuilder; cdecl; overload; //([B)Lcom/bumptech/glide/RequestBuilder;
    function clone: JRequestBuilder; cdecl; overload; //()Lcom/bumptech/glide/RequestBuilder;
    function into(target: JTarget): JTarget; cdecl; overload; //(Lcom/bumptech/glide/request/target/Target;)Lcom/bumptech/glide/request/target/Target;
    function into(view: JImageView): JViewTarget; cdecl; overload; //(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;
    function into(width: Integer; height: Integer): JFutureTarget; cdecl; overload; //Deprecated //(II)Lcom/bumptech/glide/request/FutureTarget;
    function submit: JFutureTarget; cdecl; overload; //()Lcom/bumptech/glide/request/FutureTarget;
    function submit(width: Integer; height: Integer): JFutureTarget; cdecl; overload; //(II)Lcom/bumptech/glide/request/FutureTarget;
    function preload(width: Integer; height: Integer): JTarget; cdecl; overload; //(II)Lcom/bumptech/glide/request/target/Target;
    function preload: JTarget; cdecl; overload; //()Lcom/bumptech/glide/request/target/Target;
    function downloadOnly(target: JTarget): JTarget; cdecl; overload; //Deprecated //(Lcom/bumptech/glide/request/target/Target;)Lcom/bumptech/glide/request/target/Target;
    function downloadOnly(width: Integer; height: Integer): JFutureTarget; cdecl; overload; //Deprecated //(II)Lcom/bumptech/glide/request/FutureTarget;
//    function clone: JObject; cdecl; overload; //()Ljava/lang/Object;
//    function load(this: JObject): JObject; cdecl; overload; //(Ljava/lang/Object;)Ljava/lang/Object;
//    function load(this: TJavaArray<Byte>): JObject; cdecl; overload; //([B)Ljava/lang/Object;
//    function load(this: JURL): JObject; cdecl; overload; //(Ljava/net/URL;)Ljava/lang/Object;
//    function load(this: JInteger): JObject; cdecl; overload; //(Ljava/lang/Integer;)Ljava/lang/Object;
//    function load(this: JFile): JObject; cdecl; overload; //(Ljava/io/File;)Ljava/lang/Object;
//    function load(this: Jnet_Uri): JObject; cdecl; overload; //(Landroid/net/Uri;)Ljava/lang/Object;
//    function load(this: JString): JObject; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/Object;
//    function load(this: JDrawable): JObject; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
//    function load(this: JBitmap): JObject; cdecl; overload; //(Landroid/graphics/Bitmap;)Ljava/lang/Object;

    { Property }
  end;

  TJRequestBuilder = class(TJavaGenericImport<JRequestBuilderClass, JRequestBuilder>) end;

  JRequestManager_ClearTargetClass = interface(JViewTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/ViewTarget
  ['{293D5D36-8E4C-4AF0-A815-BF17D5315D40}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/RequestManager$ClearTarget')]
  JRequestManager_ClearTarget = interface(JViewTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/ViewTarget
  ['{2056F488-592D-45A3-BF51-FD9D621E9A6F}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V

    { Property }
  end;

  TJRequestManager_ClearTarget = class(TJavaGenericImport<JRequestManager_ClearTargetClass, JRequestManager_ClearTarget>) end;

  JRequestManager_RequestManagerConnectivityListenerClass = interface(JObjectClass)
  ['{93A65967-59B1-4A7C-A90B-613738F6493B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/RequestManager$RequestManagerConnectivityListener')]
  JRequestManager_RequestManagerConnectivityListener = interface(JObject)
  ['{8FBFBA40-D24B-454F-9238-9CFD4AD47A85}']
    { Property Methods }

    { methods }
    procedure onConnectivityChanged(isConnected: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJRequestManager_RequestManagerConnectivityListener = class(TJavaGenericImport<JRequestManager_RequestManagerConnectivityListenerClass, JRequestManager_RequestManagerConnectivityListener>) end;

  JRequestManagerClass = interface(JObjectClass)
  ['{1495F378-925E-4F2E-8B64-437422A4D87A}']
    { static Property Methods }

    { static Methods }
    {class} function init(glide: JGlide; lifecycle: JLifecycle; treeNode: JRequestManagerTreeNode; context: JContext): JRequestManager; cdecl; //(Lcom/bumptech/glide/Glide;Lcom/bumptech/glide/manager/Lifecycle;Lcom/bumptech/glide/manager/RequestManagerTreeNode;Landroid/content/Context;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/RequestManager')]
  JRequestManager = interface(JObject)
  ['{D7758A9F-C3F3-492B-A7EC-FA8E900980D0}']
    { Property Methods }

    { methods }
    function applyDefaultRequestOptions(requestOptions: JRequestOptions): JRequestManager; cdecl; //(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestManager;
    function setDefaultRequestOptions(requestOptions: JRequestOptions): JRequestManager; cdecl; //(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestManager;
    function isPaused: Boolean; cdecl; //()Z
    procedure pauseRequests; cdecl; //()V
    procedure pauseAllRequests; cdecl; //()V
    procedure pauseRequestsRecursive; cdecl; //()V
    procedure resumeRequests; cdecl; //()V
    procedure resumeRequestsRecursive; cdecl; //()V
    procedure onStart; cdecl; //()V
    procedure onStop; cdecl; //()V
    procedure onDestroy; cdecl; //()V
    function asBitmap: JRequestBuilder; cdecl; //()Lcom/bumptech/glide/RequestBuilder;
    function asGif: JRequestBuilder; cdecl; //()Lcom/bumptech/glide/RequestBuilder;
    function asDrawable: JRequestBuilder; cdecl; //()Lcom/bumptech/glide/RequestBuilder;
    function load(bitmap: JBitmap): JRequestBuilder; cdecl; overload; //(Landroid/graphics/Bitmap;)Lcom/bumptech/glide/RequestBuilder;
    function load(drawable: JDrawable): JRequestBuilder; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Lcom/bumptech/glide/RequestBuilder;
    function load(astring: JString): JRequestBuilder; cdecl; overload; //(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;
    function load(uri: Jnet_Uri): JRequestBuilder; cdecl; overload; //(Landroid/net/Uri;)Lcom/bumptech/glide/RequestBuilder;
    function load(afile: JFile): JRequestBuilder; cdecl; overload; //(Ljava/io/File;)Lcom/bumptech/glide/RequestBuilder;
    function load(resourceId: JInteger): JRequestBuilder; cdecl; overload; //(Ljava/lang/Integer;)Lcom/bumptech/glide/RequestBuilder;
//    function load(url: JURL): JRequestBuilder; cdecl; overload; //Deprecated //(Ljava/net/URL;)Lcom/bumptech/glide/RequestBuilder;
    function load(model: TJavaArray<Byte>): JRequestBuilder; cdecl; overload; //([B)Lcom/bumptech/glide/RequestBuilder;
    function load(model: JObject): JRequestBuilder; cdecl; overload; //(Ljava/lang/Object;)Lcom/bumptech/glide/RequestBuilder;
    function downloadOnly: JRequestBuilder; cdecl; //()Lcom/bumptech/glide/RequestBuilder;
    function download(model: JObject): JRequestBuilder; cdecl; //(Ljava/lang/Object;)Lcom/bumptech/glide/RequestBuilder;
    function asFile: JRequestBuilder; cdecl; //()Lcom/bumptech/glide/RequestBuilder;
    function &as(resourceClass: Jlang_Class): JRequestBuilder; cdecl; //(Ljava/lang/Class;)Lcom/bumptech/glide/RequestBuilder;
    procedure clear(view: JView); cdecl; overload; //(Landroid/view/View;)V
    procedure clear(target: JTarget); cdecl; overload; //(Lcom/bumptech/glide/request/target/Target;)V
    function toString: JString; cdecl; //()Ljava/lang/String;
//    function load(this: JObject): JObject; cdecl; overload; //(Ljava/lang/Object;)Ljava/lang/Object;
//    function load(this: TJavaArray<Byte>): JObject; cdecl; overload; //([B)Ljava/lang/Object;
//    function load(this: JURL): JObject; cdecl; overload; //(Ljava/net/URL;)Ljava/lang/Object;
//    function load(this: JInteger): JObject; cdecl; overload; //(Ljava/lang/Integer;)Ljava/lang/Object;
//    function load(this: JFile): JObject; cdecl; overload; //(Ljava/io/File;)Ljava/lang/Object;
//    function load(this: Jnet_Uri): JObject; cdecl; overload; //(Landroid/net/Uri;)Ljava/lang/Object;
//    function load(this: JString): JObject; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/Object;
//    function load(this: JDrawable): JObject; cdecl; overload; //(Landroid/graphics/drawable/Drawable;)Ljava/lang/Object;
//    function load(this: JBitmap): JObject; cdecl; overload; //(Landroid/graphics/Bitmap;)Ljava/lang/Object;

    { Property }
  end;

  TJRequestManager = class(TJavaGenericImport<JRequestManagerClass, JRequestManager>) end;

  JApplicationVersionSignatureClass = interface(JObjectClass)
  ['{F66954FE-F0F6-4D2E-B32B-BF035926E029}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(context: JContext): JKey; cdecl; //(Landroid/content/Context;)Lcom/bumptech/glide/load/Key;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/signature/ApplicationVersionSignature')]
  JApplicationVersionSignature = interface(JObject)
  ['{F462A98F-46A2-4E96-9A52-2EF10802B45A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJApplicationVersionSignature = class(TJavaGenericImport<JApplicationVersionSignatureClass, JApplicationVersionSignature>) end;

  JEmptySignatureClass = interface(JObjectClass)
  ['{84402F04-B5AC-47B8-BE13-7B3DF74B2777}']
    { static Property Methods }

    { static Methods }
    {class} function obtain: JEmptySignature; cdecl; //()Lcom/bumptech/glide/signature/EmptySignature;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/signature/EmptySignature')]
  JEmptySignature = interface(JObject)
  ['{07AC6AFF-62B3-4803-825F-82B698C5ED0F}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJEmptySignature = class(TJavaGenericImport<JEmptySignatureClass, JEmptySignature>) end;

  JMediaStoreSignatureClass = interface(JObjectClass)
  ['{1CE404C4-895F-4F1C-A856-CCC1A1569BA3}']
    { static Property Methods }

    { static Methods }
    {class} function init(mimeType: JString; dateModified: Int64; P3: Integer): JMediaStoreSignature; cdecl; //(Ljava/lang/String;JI)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/signature/MediaStoreSignature')]
  JMediaStoreSignature = interface(JObject)
  ['{6EF82E0E-1924-4A3A-A915-72102E0557A5}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJMediaStoreSignature = class(TJavaGenericImport<JMediaStoreSignatureClass, JMediaStoreSignature>) end;

  JObjectKeyClass = interface(JObjectClass)
  ['{11E72ECF-9160-40B2-8ADB-BFB2F4DB65A8}']
    { static Property Methods }

    { static Methods }
    {class} function init(aobject: JObject): JObjectKey; cdecl; //(Ljava/lang/Object;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/signature/ObjectKey')]
  JObjectKey = interface(JObject)
  ['{E4095784-8C32-44DA-B30A-82454A2DB4E7}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl; //(Ljava/security/MessageDigest;)V

    { Property }
  end;

  TJObjectKey = class(TJavaGenericImport<JObjectKeyClass, JObjectKey>) end;

  JByteBufferUtil_ByteBufferStreamClass = interface(JInputStreamClass) // or JObjectClass // SuperSignature: java/io/InputStream
  ['{C5D610B2-A3E9-444A-BFF4-40C24E97BE08}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ByteBufferUtil$ByteBufferStream')]
  JByteBufferUtil_ByteBufferStream = interface(JInputStream) // or JObject // SuperSignature: java/io/InputStream
  ['{BD9CEB31-DEE1-499A-B8B7-89726B89C819}']
    { Property Methods }

    { methods }
    function available: Integer; cdecl; //()I
    function read: Integer; cdecl; overload; //()I
    procedure mark(readLimit: Integer); cdecl; //(I)V
    function markSupported: Boolean; cdecl; //()Z
    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload; //([BII)I
    procedure reset; cdecl; //()V
    function skip(byteCount: Int64): Int64; cdecl; //(J)J

    { Property }
  end;

  TJByteBufferUtil_ByteBufferStream = class(TJavaGenericImport<JByteBufferUtil_ByteBufferStreamClass, JByteBufferUtil_ByteBufferStream>) end;

  JByteBufferUtil_SafeArrayClass = interface(JObjectClass)
  ['{B5E7003E-CC52-49D9-A92D-652B61134802}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ByteBufferUtil$SafeArray')]
  JByteBufferUtil_SafeArray = interface(JObject)
  ['{E68F5627-1A4D-4BBB-A0EA-A014EF319B82}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteBufferUtil_SafeArray = class(TJavaGenericImport<JByteBufferUtil_SafeArrayClass, JByteBufferUtil_SafeArray>) end;

  JByteBufferUtilClass = interface(JObjectClass)
  ['{E63202E1-C77B-4170-AFC0-99235F2D6B0C}']
    { static Property Methods }

    { static Methods }
    {class} function fromFile(afile: JFile): JByteBuffer; cdecl; //(Ljava/io/File;)Ljava/nio/ByteBuffer;
    {class} procedure toFile(buffer: JByteBuffer; afile: JFile); cdecl; //(Ljava/nio/ByteBuffer;Ljava/io/File;)V
    {class} procedure toStream(byteBuffer: JByteBuffer; os: JOutputStream); cdecl; overload; //(Ljava/nio/ByteBuffer;Ljava/io/OutputStream;)V
    {class} function toBytes(byteBuffer: JByteBuffer): TJavaArray<Byte>; cdecl; //(Ljava/nio/ByteBuffer;)[B
    {class} function toStream(buffer: JByteBuffer): JInputStream; cdecl; overload; //(Ljava/nio/ByteBuffer;)Ljava/io/InputStream;
    {class} function fromStream(stream: JInputStream): JByteBuffer; cdecl; //(Ljava/io/InputStream;)Ljava/nio/ByteBuffer;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ByteBufferUtil')]
  JByteBufferUtil = interface(JObject)
  ['{D578A8BB-838A-45EA-9235-47B325DCB551}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteBufferUtil = class(TJavaGenericImport<JByteBufferUtilClass, JByteBufferUtil>) end;

//  JCachedHashCodeArrayMapClass = interface(JArrayMapClass) // or JObjectClass // SuperSignature: android/support/v4/util/ArrayMap
//  ['{3F554078-C397-4C7C-A78F-7A175D9852A3}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init: JCachedHashCodeArrayMap; cdecl; //()V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/CachedHashCodeArrayMap')]
//  JCachedHashCodeArrayMap = interface(JArrayMap) // or JObject // SuperSignature: android/support/v4/util/ArrayMap
//  ['{217BE41C-812A-468F-8B6F-F7876A0C0B52}']
//    { Property Methods }
//
//    { methods }
//    procedure clear; cdecl; //()V
//    function setValueAt(index: Integer; value: JObject): JObject; cdecl; //(ILjava/lang/Object;)Ljava/lang/Object;
//    function put(key: JObject; value: JObject): JObject; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
//    procedure putAll(simpleArrayMap: JSimpleArrayMap); cdecl; //(Landroid/support/v4/util/SimpleArrayMap;)V
//    function removeAt(index: Integer): JObject; cdecl; //(I)Ljava/lang/Object;
//    function hashCode: Integer; cdecl; //()I
//
//    { Property }
//  end;
//
//  TJCachedHashCodeArrayMap = class(TJavaGenericImport<JCachedHashCodeArrayMapClass, JCachedHashCodeArrayMap>) end;
//
//  JContentLengthInputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterInputStream
//  ['{A6E9D794-330F-4FDD-8A05-DD7548A4AA97}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function obtain(other: JInputStream; contentLengthHeader: JString): JInputStream; cdecl; overload; //(Ljava/io/InputStream;Ljava/lang/String;)Ljava/io/InputStream;
//    {class} function obtain(other: JInputStream; contentLength: Int64): JInputStream; cdecl; overload; //(Ljava/io/InputStream;J)Ljava/io/InputStream;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/ContentLengthInputStream')]
//  JContentLengthInputStream = interface(JFilterInputStream) // or JObject // SuperSignature: java/io/FilterInputStream
//  ['{F3C8CA6C-9639-4330-8D2A-5CE2988C8B62}']
//    { Property Methods }
//
//    { methods }
//    function available: Integer; cdecl; //()I
//    function read: Integer; cdecl; overload; //()I
//    function read(buffer: TJavaArray<Byte>): Integer; cdecl; overload; //([B)I
//    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload; //([BII)I
//
//    { Property }
//  end;
//
//  TJContentLengthInputStream = class(TJavaGenericImport<JContentLengthInputStreamClass, JContentLengthInputStream>) end;

  JExceptionCatchingInputStreamClass = interface(JInputStreamClass) // or JObjectClass // SuperSignature: java/io/InputStream
  ['{D0A280D7-DD98-4D11-83AA-84064A4167AB}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(toWrap: JInputStream): JExceptionCatchingInputStream; cdecl; //(Ljava/io/InputStream;)Lcom/bumptech/glide/util/ExceptionCatchingInputStream;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ExceptionCatchingInputStream')]
  JExceptionCatchingInputStream = interface(JInputStream) // or JObject // SuperSignature: java/io/InputStream
  ['{AA91FCDD-B30C-47E1-B200-60D7009A88E1}']
    { Property Methods }

    { methods }
    function available: Integer; cdecl; //()I
    procedure close; cdecl; //()V
    procedure mark(readLimit: Integer); cdecl; //(I)V
    function markSupported: Boolean; cdecl; //()Z
    function read(buffer: TJavaArray<Byte>): Integer; cdecl; overload; //([B)I
    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload; //([BII)I
    procedure reset; cdecl; //()V
    function skip(byteCount: Int64): Int64; cdecl; //(J)J
    function read: Integer; cdecl; overload; //()I
    function getException: JIOException; cdecl; //()Ljava/io/IOException;
    procedure release; cdecl; //()V

    { Property }
  end;

  TJExceptionCatchingInputStream = class(TJavaGenericImport<JExceptionCatchingInputStreamClass, JExceptionCatchingInputStream>) end;

  JFixedPreloadSizeProviderClass = interface(JObjectClass)
  ['{FBF2EF54-63EB-48A4-9074-E575DEEF78B4}']
    { static Property Methods }

    { static Methods }
    {class} function init(width: Integer; height: Integer): JFixedPreloadSizeProvider; cdecl; //(II)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/FixedPreloadSizeProvider')]
  JFixedPreloadSizeProvider = interface(JObject)
  ['{76ABF5FA-F888-4BE0-9CEC-637766F7CE3D}']
    { Property Methods }

    { methods }
    function getPreloadSize(item: JObject; adapterPosition: Integer; itemPosition: Integer): TJavaArray<Integer>; cdecl; //(Ljava/lang/Object;II)[I

    { Property }
  end;

  TJFixedPreloadSizeProvider = class(TJavaGenericImport<JFixedPreloadSizeProviderClass, JFixedPreloadSizeProvider>) end;

  JLogTimeClass = interface(JObjectClass)
  ['{3B9FD6C0-CD7F-44EA-B1E7-C92FB6DBD7E6}']
    { static Property Methods }

    { static Methods }
    {class} function getLogTime: Int64; cdecl; //()J
    {class} function getElapsedMillis(logTime: Int64): Double; cdecl; //(J)D

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/LogTime')]
  JLogTime = interface(JObject)
  ['{E24992BD-75CA-4A02-BCF1-A15849A33ADB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLogTime = class(TJavaGenericImport<JLogTimeClass, JLogTime>) end;

//  JMarkEnforcingInputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass // SuperSignature: java/io/FilterInputStream
//  ['{592113BE-F499-4E6B-AEC7-4FB826A7E5FE}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream): JMarkEnforcingInputStream; cdecl; //(Ljava/io/InputStream;)V
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/MarkEnforcingInputStream')]
//  JMarkEnforcingInputStream = interface(JFilterInputStream) // or JObject // SuperSignature: java/io/FilterInputStream
//  ['{4815ACF4-E4D0-496F-B965-144D38354064}']
//    { Property Methods }
//
//    { methods }
//    procedure mark(readLimit: Integer); cdecl; //(I)V
//    function read: Integer; cdecl; overload; //()I
//    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload; //([BII)I
//    procedure reset; cdecl; //()V
//    function skip(byteCount: Int64): Int64; cdecl; //(J)J
//    function available: Integer; cdecl; //()I
//
//    { Property }
//  end;
//
//  TJMarkEnforcingInputStream = class(TJavaGenericImport<JMarkEnforcingInputStreamClass, JMarkEnforcingInputStream>) end;

  JMultiClassKeyClass = interface(JObjectClass)
  ['{B49B4C71-D05C-4147-A5BD-D79BBA8FC1AB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiClassKey; cdecl; overload; //()V
    {class} function init(first: Jlang_Class; P2: Jlang_Class): JMultiClassKey; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;)V
    {class} function init(first: Jlang_Class; P2: Jlang_Class; second: Jlang_Class): JMultiClassKey; cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/MultiClassKey')]
  JMultiClassKey = interface(JObject)
  ['{1C103D15-876D-413E-9780-9200DBDBAB4E}']
    { Property Methods }

    { methods }
    procedure &set(first: Jlang_Class; P2: Jlang_Class); cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;)V
    procedure &set(first: Jlang_Class; P2: Jlang_Class; second: Jlang_Class); cdecl; overload; //(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;)V
    function toString: JString; cdecl; //()Ljava/lang/String;
    function equals(o: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z
    function hashCode: Integer; cdecl; //()I

    { Property }
  end;

  TJMultiClassKey = class(TJavaGenericImport<JMultiClassKeyClass, JMultiClassKey>) end;

  JFactoryPools_FactoryClass = interface(JObjectClass)
  ['{76EE05A3-C27A-4414-AE98-A367D02C57E8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$Factory')]
  JFactoryPools_Factory = interface(IJavaInstance)
  ['{C52531FE-8AD4-4843-8072-3AC432EB8A70}']
    { Property Methods }

    { methods }
    function create: JObject; cdecl; //()Ljava/lang/Object;

    { Property }
  end;

  TJFactoryPools_Factory = class(TJavaGenericImport<JFactoryPools_FactoryClass, JFactoryPools_Factory>) end;

  JFactoryPools_FactoryPoolClass = interface(JObjectClass)
  ['{94FF7BEA-7D09-4C4B-8FAB-0EA59BA75ADA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$FactoryPool')]
  JFactoryPools_FactoryPool = interface(JObject)
  ['{6169F3E4-3A28-40A8-BFDD-3479BA31E689}']
    { Property Methods }

    { methods }
    function acquire: JObject; cdecl; //()Ljava/lang/Object;
    function release(instance: JObject): Boolean; cdecl; //(Ljava/lang/Object;)Z

    { Property }
  end;

  TJFactoryPools_FactoryPool = class(TJavaGenericImport<JFactoryPools_FactoryPoolClass, JFactoryPools_FactoryPool>) end;

  JFactoryPools_PoolableClass = interface(JObjectClass)
  ['{67FACC4B-B756-4BC3-812A-20D469172B3D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$Poolable')]
  JFactoryPools_Poolable = interface(IJavaInstance)
  ['{96ED7DE5-7CE0-4CAA-B3A8-A5F7D5CD816A}']
    { Property Methods }

    { methods }
    function getVerifier: JStateVerifier; cdecl; //()Lcom/bumptech/glide/util/pool/StateVerifier;

    { Property }
  end;

  TJFactoryPools_Poolable = class(TJavaGenericImport<JFactoryPools_PoolableClass, JFactoryPools_Poolable>) end;

  JFactoryPools_ResetterClass = interface(JObjectClass)
  ['{6AB703D0-B68F-44FC-9E27-EE5EDBE94C8B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$Resetter')]
  JFactoryPools_Resetter = interface(IJavaInstance)
  ['{39F4DF36-A8B8-449C-8A74-B51BA470460E}']
    { Property Methods }

    { methods }
    procedure reset(P1: JObject); cdecl; //(Ljava/lang/Object;)V

    { Property }
  end;

  TJFactoryPools_Resetter = class(TJavaGenericImport<JFactoryPools_ResetterClass, JFactoryPools_Resetter>) end;

  JFactoryPoolsClass = interface(JObjectClass)
  ['{62187CBF-40AD-4546-A8B7-6C9EB3D5630D}']
    { static Property Methods }

    { static Methods }
//    {class} function simple(size: Integer; factory: JFactoryPools_Factory): JPools_Pool; cdecl; //(ILcom/bumptech/glide/util/pool/FactoryPools$Factory;)Landroid/support/v4/util/Pools$Pool;
//    {class} function threadSafe(size: Integer; factory: JFactoryPools_Factory): JPools_Pool; cdecl; //(ILcom/bumptech/glide/util/pool/FactoryPools$Factory;)Landroid/support/v4/util/Pools$Pool;
//    {class} function threadSafeList: JPools_Pool; cdecl; overload; //()Landroid/support/v4/util/Pools$Pool;
//    {class} function threadSafeList(size: Integer): JPools_Pool; cdecl; overload; //(I)Landroid/support/v4/util/Pools$Pool;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools')]
  JFactoryPools = interface(JObject)
  ['{65DBAF5D-80B6-400A-AB2C-FD0113805531}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFactoryPools = class(TJavaGenericImport<JFactoryPoolsClass, JFactoryPools>) end;

  JGlideTraceClass = interface(JObjectClass)
  ['{7A841FF6-B77B-460F-9586-5BD8F869641E}']
    { static Property Methods }

    { static Methods }
    {class} procedure beginSection(tag: JString); cdecl; //(Ljava/lang/String;)V
    {class} procedure beginSectionFormat(format: JString; arg1: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;)V
    {class} procedure beginSectionFormat(format: JString; arg1: JObject; arg2: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    {class} procedure beginSectionFormat(format: JString; arg1: JObject; arg2: JObject; arg3: JObject); cdecl; overload; //(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    {class} procedure endSection; cdecl; //()V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/GlideTrace')]
  JGlideTrace = interface(JObject)
  ['{69449EC1-7241-4D74-A9B2-482DF56E754D}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGlideTrace = class(TJavaGenericImport<JGlideTraceClass, JGlideTrace>) end;

  JStateVerifierClass = interface(JObjectClass)
  ['{591FA693-7B46-4F67-B2A9-07F92E358309}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JStateVerifier; cdecl; //()Lcom/bumptech/glide/util/pool/StateVerifier;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/StateVerifier')]
  JStateVerifier = interface(JObject)
  ['{5D05CDF2-21A6-4FF4-A1D2-4AF55C872B17}']
    { Property Methods }

    { methods }
    procedure throwIfRecycled; cdecl; //()V

    { Property }
  end;

  TJStateVerifier = class(TJavaGenericImport<JStateVerifierClass, JStateVerifier>) end;

  JStateVerifier_DebugStateVerifierClass = interface(JStateVerifierClass) // or JObjectClass // SuperSignature: com/bumptech/glide/util/pool/StateVerifier
  ['{5E84F623-19AC-468D-B530-86BC735269D4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/StateVerifier$DebugStateVerifier')]
  JStateVerifier_DebugStateVerifier = interface(JStateVerifier) // or JObject // SuperSignature: com/bumptech/glide/util/pool/StateVerifier
  ['{E03B4470-2DFD-4DC4-8602-5E132FE0EB71}']
    { Property Methods }

    { methods }
    procedure throwIfRecycled; cdecl; //()V

    { Property }
  end;

  TJStateVerifier_DebugStateVerifier = class(TJavaGenericImport<JStateVerifier_DebugStateVerifierClass, JStateVerifier_DebugStateVerifier>) end;

  JStateVerifier_DefaultStateVerifierClass = interface(JStateVerifierClass) // or JObjectClass // SuperSignature: com/bumptech/glide/util/pool/StateVerifier
  ['{CF77CF68-AF58-4B0D-8254-D50204E94335}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier')]
  JStateVerifier_DefaultStateVerifier = interface(JStateVerifier) // or JObject // SuperSignature: com/bumptech/glide/util/pool/StateVerifier
  ['{46C2D9F7-A64F-46D4-AE9A-B43B079F1CD9}']
    { Property Methods }

    { methods }
    procedure throwIfRecycled; cdecl; //()V
    procedure setRecycled(isRecycled: Boolean); cdecl; //(Z)V

    { Property }
  end;

  TJStateVerifier_DefaultStateVerifier = class(TJavaGenericImport<JStateVerifier_DefaultStateVerifierClass, JStateVerifier_DefaultStateVerifier>) end;

  JPreconditionsClass = interface(JObjectClass)
  ['{8E19C0BA-70D2-42AC-B26F-8CAE1159DC49}']
    { static Property Methods }

    { static Methods }
    {class} procedure checkArgument(expression: Boolean; amessage: JString); cdecl; //(ZLjava/lang/String;)V
    {class} function checkNotNull(arg: JObject): JObject; cdecl; overload; //(Ljava/lang/Object;)Ljava/lang/Object;
    {class} function checkNotNull(arg: JObject; amessage: JString): JObject; cdecl; overload; //(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    {class} function checkNotEmpty(astring: JString): JString; cdecl; overload; //(Ljava/lang/String;)Ljava/lang/String;
    {class} function checkNotEmpty(collection: JCollection): JCollection; cdecl; overload; //(Ljava/util/Collection;)Ljava/util/Collection;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/Preconditions')]
  JPreconditions = interface(JObject)
  ['{5F00CFBD-F206-4FB5-8B39-D6007AD0247F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPreconditions = class(TJavaGenericImport<JPreconditionsClass, JPreconditions>) end;

  JSyntheticClass = interface(JObjectClass)
  ['{97002232-784D-453A-A8DB-6BA2F9549DF9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/Synthetic')]
  JSynthetic = interface(IJavaInstance)
  ['{CE7E4493-A882-493D-9746-E4CCA09537D9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSynthetic = class(TJavaGenericImport<JSyntheticClass, JSynthetic>) end;

  JUtilClass = interface(JObjectClass)
  ['{F23214F4-5278-448D-8822-F3E3E8C38159}']
    { static Property Methods }

    { static Methods }
    {class} function sha256BytesToHex(bytes: TJavaArray<Byte>): JString; cdecl; //([B)Ljava/lang/String;
    {class} function getSize(bitmap: JBitmap): Integer; cdecl; //Deprecated //(Landroid/graphics/Bitmap;)I
    {class} function getBitmapByteSize(bitmap: JBitmap): Integer; cdecl; overload; //(Landroid/graphics/Bitmap;)I
    {class} function getBitmapByteSize(width: Integer; height: Integer; config: JBitmap_Config): Integer; cdecl; overload; //(IILandroid/graphics/Bitmap$Config;)I
    {class} function isValidDimensions(width: Integer; height: Integer): Boolean; cdecl; //(II)Z
    {class} procedure assertMainThread; cdecl; //()V
    {class} procedure assertBackgroundThread; cdecl; //()V
    {class} function isOnMainThread: Boolean; cdecl; //()Z
    {class} function isOnBackgroundThread: Boolean; cdecl; //()Z
    {class} function createQueue(size: Integer): JQueue; cdecl; //(I)Ljava/util/Queue;
    {class} function getSnapshot(other: JCollection): JList; cdecl; //(Ljava/util/Collection;)Ljava/util/List;
    {class} function bothNullOrEqual(a: JObject; b: JObject): Boolean; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)Z
    {class} function bothModelsNullEquivalentOrEquals(a: JObject; b: JObject): Boolean; cdecl; //(Ljava/lang/Object;Ljava/lang/Object;)Z
    {class} function hashCode(value: Integer): Integer; cdecl; overload; //(I)I
    {class} function hashCode(value: Integer; accumulator: Integer): Integer; cdecl; overload; //(II)I
    {class} function hashCode(value: Single): Integer; cdecl; overload; //(F)I
    {class} function hashCode(value: Single; accumulator: Integer): Integer; cdecl; overload; //(FI)I
    {class} function hashCode(aobject: JObject; accumulator: Integer): Integer; cdecl; overload; //(Ljava/lang/Object;I)I
    {class} function hashCode(value: Boolean; accumulator: Integer): Integer; cdecl; overload; //(ZI)I
    {class} function hashCode(value: Boolean): Integer; cdecl; overload; //(Z)I

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/Util')]
  JUtil = interface(JObject)
  ['{628B23FF-494A-4C12-9978-E45D82CACA41}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUtil = class(TJavaGenericImport<JUtilClass, JUtil>) end;

  JViewPreloadSizeProvider_SizeViewTargetClass = interface(JViewTargetClass) // or JObjectClass // SuperSignature: com/bumptech/glide/request/target/ViewTarget
  ['{54C6D20F-74BA-4608-A49B-A1E1B5E7A99C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ViewPreloadSizeProvider$SizeViewTarget')]
  JViewPreloadSizeProvider_SizeViewTarget = interface(JViewTarget) // or JObject // SuperSignature: com/bumptech/glide/request/target/ViewTarget
  ['{60BBF25A-1378-40BB-ACCC-87AFD161823E}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl; //(Ljava/lang/Object;Lcom/bumptech/glide/request/transition/Transition;)V

    { Property }
  end;

  TJViewPreloadSizeProvider_SizeViewTarget = class(TJavaGenericImport<JViewPreloadSizeProvider_SizeViewTargetClass, JViewPreloadSizeProvider_SizeViewTarget>) end;

  JViewPreloadSizeProviderClass = interface(JObjectClass)
  ['{EF9D4C00-1066-48F5-9CE0-7F7802D3E726}']
    { static Property Methods }

    { static Methods }
    {class} function init: JViewPreloadSizeProvider; cdecl; overload; //()V
    {class} function init(view: JView): JViewPreloadSizeProvider; cdecl; overload; //(Landroid/view/View;)V

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ViewPreloadSizeProvider')]
  JViewPreloadSizeProvider = interface(JObject)
  ['{7E856788-DBDD-497B-AF2C-5E9143AE0BB6}']
    { Property Methods }

    { methods }
    function getPreloadSize(item: JObject; adapterPosition: Integer; itemPosition: Integer): TJavaArray<Integer>; cdecl; //(Ljava/lang/Object;II)[I
    procedure onSizeReady(width: Integer; height: Integer); cdecl; //(II)V
    procedure setView(view: JView); cdecl; //(Landroid/view/View;)V

    { Property }
  end;

  TJViewPreloadSizeProvider = class(TJavaGenericImport<JViewPreloadSizeProviderClass, JViewPreloadSizeProvider>) end;

{$ENDIF ANDROID}

implementation

end.

