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
//  生成时间：2020/12/21 14:24:04
//  工具版本：1.0.2018.2.26
//
//====================================================
unit Androidapi.JNI.glide_4_0_0;

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
  Androidapi.JNI.Java.Net,
//  Androidapi.JNI.Java.Security,
//  Androidapi.JNI.java.nio.ByteBuffer,
//  Androidapi.JNI.java.nio.charset.Charset,
//  Androidapi.JNI.Media,
//  Androidapi.JNI.com.bumptech.glide.gifdecoder.GifDecoder,
//  Androidapi.JNI.com.bumptech.glide.gifdecoder.GifDecoder_BitmapProvider,
//  Androidapi.JNI.com.bumptech.glide.gifdecoder.GifHeader,
//  Androidapi.JNI.com.bumptech.glide.gifdecoder.GifHeaderParser,
//  Androidapi.JNI.java.net.HttpURLConnection,
//  Androidapi.JNI.java.net.URL,
  Androidapi.JNI.Util;

type

  JMessageDigest = JObject;
  JGifDecoder = JObject;


// ===== Forward declarations =====

  JGeneratedAppGlideModule = interface; //com.bumptech.glide.GeneratedAppGlideModule
  JGenericTransitionOptions = interface; //com.bumptech.glide.GenericTransitionOptions
  JGlide = interface; //com.bumptech.glide.Glide
//  JGlideBuilder_1 = interface; //com.bumptech.glide.GlideBuilder$1
  JGlideBuilder = interface; //com.bumptech.glide.GlideBuilder
  JGlideContext = interface; //com.bumptech.glide.GlideContext
  JListPreloader_PreloadModelProvider = interface; //com.bumptech.glide.ListPreloader$PreloadModelProvider
  JListPreloader_PreloadSizeProvider = interface; //com.bumptech.glide.ListPreloader$PreloadSizeProvider
  JListPreloader_PreloadTarget = interface; //com.bumptech.glide.ListPreloader$PreloadTarget
  JListPreloader_PreloadTargetQueue = interface; //com.bumptech.glide.ListPreloader$PreloadTargetQueue
  JListPreloader = interface; //com.bumptech.glide.ListPreloader
  JAssetPathFetcher = interface; //com.bumptech.glide.load.data.AssetPathFetcher
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
  JEngine_RefQueueIdleHandler = interface; //com.bumptech.glide.load.engine.Engine$RefQueueIdleHandler
//  JEngine_ResourceWeakReference = interface; //com.bumptech.glide.load.engine.Engine$ResourceWeakReference
  JEngine = interface; //com.bumptech.glide.load.engine.Engine
  JEngineJob_EngineResourceFactory = interface; //com.bumptech.glide.load.engine.EngineJob$EngineResourceFactory
  JEngineJob_MainThreadCallback = interface; //com.bumptech.glide.load.engine.EngineJob$MainThreadCallback
  JEngineJob = interface; //com.bumptech.glide.load.engine.EngineJob
  JEngineJobListener = interface; //com.bumptech.glide.load.engine.EngineJobListener
  JEngineKey = interface; //com.bumptech.glide.load.engine.EngineKey
  JEngineKeyFactory = interface; //com.bumptech.glide.load.engine.EngineKeyFactory
  JEngineResource_ResourceListener = interface; //com.bumptech.glide.load.engine.EngineResource$ResourceListener
  JEngineResource = interface; //com.bumptech.glide.load.engine.EngineResource
//  JGlideExecutor_1 = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$1
//  JGlideExecutor_DefaultThreadFactory_1 = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$DefaultThreadFactory$1
  JGlideExecutor_DefaultThreadFactory = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$DefaultThreadFactory
//  JGlideExecutor_UncaughtThrowableStrategy_1 = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$UncaughtThrowableStrategy$1
//  JGlideExecutor_UncaughtThrowableStrategy_2 = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$UncaughtThrowableStrategy$2
  JGlideExecutor_UncaughtThrowableStrategy = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor$UncaughtThrowableStrategy
  JGlideExecutor = interface; //com.bumptech.glide.load.engine.executor.GlideExecutor
  JGlideException_IndentedAppendable = interface; //com.bumptech.glide.load.engine.GlideException$IndentedAppendable
  JGlideException = interface; //com.bumptech.glide.load.engine.GlideException
  JInitializable = interface; //com.bumptech.glide.load.engine.Initializable
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
  JResourceLoader_FileDescriptorFactory = interface; //com.bumptech.glide.load.model.ResourceLoader$FileDescriptorFactory
  JResourceLoader_StreamFactory = interface; //com.bumptech.glide.load.model.ResourceLoader$StreamFactory
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
  JStringLoader_FileDescriptorFactory = interface; //com.bumptech.glide.load.model.StringLoader$FileDescriptorFactory
  JStringLoader_StreamFactory = interface; //com.bumptech.glide.load.model.StringLoader$StreamFactory
  JStringLoader = interface; //com.bumptech.glide.load.model.StringLoader
  JUnitModelLoader_Factory = interface; //com.bumptech.glide.load.model.UnitModelLoader$Factory
  JUnitModelLoader_UnitFetcher = interface; //com.bumptech.glide.load.model.UnitModelLoader$UnitFetcher
  JUnitModelLoader = interface; //com.bumptech.glide.load.model.UnitModelLoader
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
  JFitCenter = interface; //com.bumptech.glide.load.resource.bitmap.FitCenter
  JLazyBitmapDrawableResource = interface; //com.bumptech.glide.load.resource.bitmap.LazyBitmapDrawableResource
  JRecyclableBufferedInputStream_InvalidMarkException = interface; //com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream$InvalidMarkException
//  JRecyclableBufferedInputStream = interface; //com.bumptech.glide.load.resource.bitmap.RecyclableBufferedInputStream
  JRoundedCorners = interface; //com.bumptech.glide.load.resource.bitmap.RoundedCorners
  JStreamBitmapDecoder_UntrustedCallbacks = interface; //com.bumptech.glide.load.resource.bitmap.StreamBitmapDecoder$UntrustedCallbacks
  JStreamBitmapDecoder = interface; //com.bumptech.glide.load.resource.bitmap.StreamBitmapDecoder
  JTransformationUtils_NoLock = interface; //com.bumptech.glide.load.resource.bitmap.TransformationUtils$NoLock
  JTransformationUtils = interface; //com.bumptech.glide.load.resource.bitmap.TransformationUtils
//  JVideoBitmapDecoder_1 = interface; //com.bumptech.glide.load.resource.bitmap.VideoBitmapDecoder$1
//  JVideoBitmapDecoder_2 = interface; //com.bumptech.glide.load.resource.bitmap.VideoBitmapDecoder$2
  JVideoBitmapDecoder_MediaMetadataRetrieverFactory = interface; //com.bumptech.glide.load.resource.bitmap.VideoBitmapDecoder$MediaMetadataRetrieverFactory
  JVideoBitmapDecoder = interface; //com.bumptech.glide.load.resource.bitmap.VideoBitmapDecoder
  JByteBufferRewinder_Factory = interface; //com.bumptech.glide.load.resource.bytes.ByteBufferRewinder$Factory
  JByteBufferRewinder = interface; //com.bumptech.glide.load.resource.bytes.ByteBufferRewinder
  JBytesResource = interface; //com.bumptech.glide.load.resource.bytes.BytesResource
  JDrawableResource = interface; //com.bumptech.glide.load.resource.drawable.DrawableResource
  JDrawableTransitionOptions = interface; //com.bumptech.glide.load.resource.drawable.DrawableTransitionOptions
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
  JGifFrameLoader_FrameSignature = interface; //com.bumptech.glide.load.resource.gif.GifFrameLoader$FrameSignature
  JGifFrameLoader = interface; //com.bumptech.glide.load.resource.gif.GifFrameLoader
  JGifFrameResourceDecoder = interface; //com.bumptech.glide.load.resource.gif.GifFrameResourceDecoder
  JStreamGifDecoder = interface; //com.bumptech.glide.load.resource.gif.StreamGifDecoder
  JSimpleResource = interface; //com.bumptech.glide.load.resource.SimpleResource
  JBitmapBytesTranscoder = interface; //com.bumptech.glide.load.resource.transcode.BitmapBytesTranscoder
  JBitmapDrawableTranscoder = interface; //com.bumptech.glide.load.resource.transcode.BitmapDrawableTranscoder
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
  JPreloadTarget = interface; //com.bumptech.glide.request.target.PreloadTarget
  JSimpleTarget = interface; //com.bumptech.glide.request.target.SimpleTarget
  JSizeReadyCallback = interface; //com.bumptech.glide.request.target.SizeReadyCallback
  JTarget = interface; //com.bumptech.glide.request.target.Target
  JThumbnailImageViewTarget = interface; //com.bumptech.glide.request.target.ThumbnailImageViewTarget
  JViewTarget_SizeDeterminer_SizeDeterminerLayoutListener = interface; //com.bumptech.glide.request.target.ViewTarget$SizeDeterminer$SizeDeterminerLayoutListener
  JViewTarget_SizeDeterminer = interface; //com.bumptech.glide.request.target.ViewTarget$SizeDeterminer
  JViewTarget = interface; //com.bumptech.glide.request.target.ViewTarget
  JThumbnailRequestCoordinator = interface; //com.bumptech.glide.request.ThumbnailRequestCoordinator
  JBitmapContainerTransitionFactory_BitmapGlideAnimation = interface; //com.bumptech.glide.request.transition.BitmapContainerTransitionFactory$BitmapGlideAnimation
  JBitmapContainerTransitionFactory = interface; //com.bumptech.glide.request.transition.BitmapContainerTransitionFactory
  JBitmapTransitionFactory = interface; //com.bumptech.glide.request.transition.BitmapTransitionFactory
  JDrawableCrossFadeFactory_Builder = interface; //com.bumptech.glide.request.transition.DrawableCrossFadeFactory$Builder
  JDrawableCrossFadeFactory_DefaultViewTransitionAnimationFactory = interface; //com.bumptech.glide.request.transition.DrawableCrossFadeFactory$DefaultViewTransitionAnimationFactory
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



  JLibraryGlideModuleClass = interface(JObjectClass)
  ['{CBD9A47D-0D6C-41B9-BECA-2865C2AEF0FF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLibraryGlideModule; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/LibraryGlideModule')]
  JLibraryGlideModule = interface(JObject)
  ['{EF10511D-1A16-4007-8CCF-8F75E7A470AB}']
    { Property Methods }

    { methods }
    procedure registerComponents(context: JContext; glide: JGlide; registry: JRegistry); cdecl;

    { Property }
  end;

  TJLibraryGlideModule = class(TJavaGenericImport<JLibraryGlideModuleClass, JLibraryGlideModule>) end;

  JAppGlideModuleClass = interface(JLibraryGlideModuleClass) // or JObjectClass
  ['{2F798090-D3F1-44EE-A75E-58B74246F7A8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JAppGlideModule; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/AppGlideModule')]
  JAppGlideModule = interface(JLibraryGlideModule) // or JObject
  ['{926FC41D-FADC-493F-A79F-E940EF4B24E1}']
    { Property Methods }

    { methods }
    function isManifestParsingEnabled: Boolean; cdecl;
    procedure applyOptions(context: JContext; builder: JGlideBuilder); cdecl;

    { Property }
  end;

  TJAppGlideModule = class(TJavaGenericImport<JAppGlideModuleClass, JAppGlideModule>) end;

  JGeneratedAppGlideModuleClass = interface(JAppGlideModuleClass) // or JObjectClass
  ['{A3E87C9F-E3D8-42C8-8BE4-3D74C055EB8B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GeneratedAppGlideModule')]
  JGeneratedAppGlideModule = interface(JAppGlideModule) // or JObject
  ['{AC77874B-4D96-4B52-90B9-B4D19E2FEADB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGeneratedAppGlideModule = class(TJavaGenericImport<JGeneratedAppGlideModuleClass, JGeneratedAppGlideModule>) end;

  JTransitionOptionsClass = interface(JObjectClass)
  ['{3D0C0A8C-E4B1-456F-8A35-8AB59C3FD5D6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTransitionOptions; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/TransitionOptions')]
  JTransitionOptions = interface(JObject)
  ['{82894D34-1058-4E28-987C-30760F86D934}']
    { Property Methods }

    { methods }
    function dontTransition: JTransitionOptions; cdecl;
    function transition(viewAnimationId: Integer): JTransitionOptions; cdecl; overload;
    function transition(animator: JViewPropertyTransition_Animator): JTransitionOptions; cdecl; overload;
    function transition(transitionFactory: JTransitionFactory): JTransitionOptions; cdecl; overload;

    { Property }
  end;

  TJTransitionOptions = class(TJavaGenericImport<JTransitionOptionsClass, JTransitionOptions>) end;

  JGenericTransitionOptionsClass = interface(JTransitionOptionsClass) // or JObjectClass
  ['{2C46ED8A-BC38-4B92-AD56-69E46C98C081}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGenericTransitionOptions; cdecl;
    {class} function withNoTransition: JGenericTransitionOptions; cdecl;
    {class} function &with(viewAnimationId: Integer): JGenericTransitionOptions; cdecl; overload;
    {class} function &with(animator: JViewPropertyTransition_Animator): JGenericTransitionOptions; cdecl; overload;
    {class} function &with(transitionFactory: JTransitionFactory): JGenericTransitionOptions; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GenericTransitionOptions')]
  JGenericTransitionOptions = interface(JTransitionOptions) // or JObject
  ['{ED42BE27-1EAC-4E4F-A067-58BA84F6D027}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGenericTransitionOptions = class(TJavaGenericImport<JGenericTransitionOptionsClass, JGenericTransitionOptions>) end;

  JGlideClass = interface(JObjectClass)
  ['{30E5CA98-4C17-43A6-9B94-DEF8A7B71B14}']
    { static Property Methods }

    { static Methods }
    {class} function getPhotoCacheDir(context: JContext): JFile; cdecl; overload;
    {class} function getPhotoCacheDir(context: JContext; cacheName: JString): JFile; cdecl; overload;
    {class} function get(context: JContext): JGlide; cdecl;
    {class} procedure init(glide: JGlide); cdecl;
    {class} procedure tearDown; cdecl;
    {class} function &with(context: JContext): JRequestManager; cdecl; overload;
    {class} function &with(activity: JActivity): JRequestManager; cdecl; overload;
//    {class} function &with(activity: JFragmentActivity): JRequestManager; cdecl; overload;
//    {class} function &with(fragment: JFragment): JRequestManager; cdecl; overload;
    {class} function &with(fragment: JFragment): JRequestManager; cdecl; overload;
    {class} function &with(view: JView): JRequestManager; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Glide')]
  JGlide = interface(JObject)
  ['{DE06EA5A-698C-4350-AFA6-DE71D5519017}']
    { Property Methods }

    { methods }
    function getBitmapPool: JBitmapPool; cdecl;
    function getArrayPool: JArrayPool; cdecl;
    function getContext: JContext; cdecl;
    procedure preFillBitmapPool(bitmapAttributeBuilders: TJavaObjectArray<JPreFillType_Builder>); cdecl;
    procedure clearMemory; cdecl;
    procedure trimMemory(level: Integer); cdecl;
    procedure clearDiskCache; cdecl;
    function getRequestManagerRetriever: JRequestManagerRetriever; cdecl;
    function setMemoryCategory(memoryCategory: JMemoryCategory): JMemoryCategory; cdecl;
    function getRegistry: JRegistry; cdecl;
    procedure onTrimMemory(level: Integer); cdecl;
    procedure onConfigurationChanged(newConfig: JConfiguration); cdecl;
    procedure onLowMemory; cdecl;

    { Property }
  end;

  TJGlide = class(TJavaGenericImport<JGlideClass, JGlide>) end;

//  JGlideBuilder_1Class = interface(JObjectClass)
//  ['{387EF474-026B-47D9-AF68-935D3E8E0495}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/GlideBuilder$1')]
//  JGlideBuilder_1 = interface(JObject)
//  ['{3A6534C6-4BED-4281-AA98-357423A63CB0}']
//    { Property Methods }
//
//    { methods }
//    function build: JDiskCache; cdecl;
//
//    { Property }
//  end;
//
//  TJGlideBuilder_1 = class(TJavaGenericImport<JGlideBuilder_1Class, JGlideBuilder_1>) end;

  JGlideBuilderClass = interface(JObjectClass)
  ['{41CB4B40-2E62-4F7A-BA32-E66F8BC9D4AF}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGlideBuilder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GlideBuilder')]
  JGlideBuilder = interface(JObject)
  ['{0099A0CA-5E26-4748-B8FD-39B3D877D47E}']
    { Property Methods }

    { methods }
    function setBitmapPool(bitmapPool: JBitmapPool): JGlideBuilder; cdecl;
    function setArrayPool(arrayPool: JArrayPool): JGlideBuilder; cdecl;
    function setMemoryCache(memoryCache: JMemoryCache): JGlideBuilder; cdecl;
    function setDiskCache(diskCache: JDiskCache): JGlideBuilder; cdecl; overload; //Deprecated
    function setDiskCache(diskCacheFactory: JDiskCache_Factory): JGlideBuilder; cdecl; overload;
    function setResizeExecutor(service: JGlideExecutor): JGlideBuilder; cdecl;
    function setDiskCacheExecutor(service: JGlideExecutor): JGlideBuilder; cdecl;
    function setDefaultRequestOptions(requestOptions: JRequestOptions): JGlideBuilder; cdecl;
    function setDecodeFormat(decodeFormat: JDecodeFormat): JGlideBuilder; cdecl; //Deprecated
    function setMemorySizeCalculator(builder: JMemorySizeCalculator_Builder): JGlideBuilder; cdecl; overload;
    function setMemorySizeCalculator(calculator: JMemorySizeCalculator): JGlideBuilder; cdecl; overload;
    function setConnectivityMonitorFactory(factory: JConnectivityMonitorFactory): JGlideBuilder; cdecl;
    function setLogLevel(logLevel: Integer): JGlideBuilder; cdecl;
    function build(context: JContext): JGlide; cdecl;

    { Property }
  end;

  TJGlideBuilder = class(TJavaGenericImport<JGlideBuilderClass, JGlideBuilder>) end;

  JGlideContextClass = interface(JContextWrapperClass) // or JObjectClass
  ['{79B53500-E86C-4796-A9B3-71E21E70B178}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; registry: JRegistry; imageViewTargetFactory: JImageViewTargetFactory; defaultRequestOptions: JRequestOptions; engine: JEngine; componentCallbacks: JComponentCallbacks2; logLevel: Integer): JGlideContext; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/GlideContext')]
  JGlideContext = interface(JContextWrapper) // or JObject
  ['{EC574E12-FACB-409B-A52A-DAAE97FFDE36}']
    { Property Methods }

    { methods }
    function getDefaultRequestOptions: JRequestOptions; cdecl;
//    function buildImageViewTarget(imageView: JImageView; transcodeClass: JClass): JTarget; cdecl;
    function getMainHandler: JHandler; cdecl;
    function getEngine: JEngine; cdecl;
    function getRegistry: JRegistry; cdecl;
    function getLogLevel: Integer; cdecl;
    procedure onTrimMemory(level: Integer); cdecl;
    procedure onConfigurationChanged(newConfig: JConfiguration); cdecl;
    procedure onLowMemory; cdecl;

    { Property }
  end;

  TJGlideContext = class(TJavaGenericImport<JGlideContextClass, JGlideContext>) end;

  JListPreloader_PreloadModelProviderClass = interface(JObjectClass)
  ['{654C684B-EAAE-462A-8431-4B7661ABF635}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader$PreloadModelProvider')]
  JListPreloader_PreloadModelProvider = interface(IJavaInstance)
  ['{5797FA07-7E75-410A-99EE-9E04E4F2585E}']
    { Property Methods }

    { methods }
    function getPreloadItems(P1: Integer): JList; cdecl;
    function getPreloadRequestBuilder(P1: JObject): JRequestBuilder; cdecl;

    { Property }
  end;

  TJListPreloader_PreloadModelProvider = class(TJavaGenericImport<JListPreloader_PreloadModelProviderClass, JListPreloader_PreloadModelProvider>) end;

  JListPreloader_PreloadSizeProviderClass = interface(JObjectClass)
  ['{807D2444-404E-42D1-A945-73757A071D75}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader$PreloadSizeProvider')]
  JListPreloader_PreloadSizeProvider = interface(IJavaInstance)
  ['{29086454-3FCF-4CD7-839B-42A318519D93}']
    { Property Methods }

    { methods }
    function getPreloadSize(P1: JObject; P2: Integer; P3: Integer): TJavaArray<Integer>; cdecl;

    { Property }
  end;

  TJListPreloader_PreloadSizeProvider = class(TJavaGenericImport<JListPreloader_PreloadSizeProviderClass, JListPreloader_PreloadSizeProvider>) end;

  JBaseTargetClass = interface(JObjectClass)
  ['{B2E0B21C-1FB0-423E-8DBD-A173920C0A48}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBaseTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/BaseTarget')]
  JBaseTarget = interface(JObject)
  ['{E6B70487-7B31-4BA3-8EB8-45F24775B91D}']
    { Property Methods }

    { methods }
    procedure setRequest(request: JRequest); cdecl;
    function getRequest: JRequest; cdecl;
    procedure onLoadCleared(placeholder: JDrawable); cdecl;
    procedure onLoadStarted(placeholder: JDrawable); cdecl;
    procedure onLoadFailed(errorDrawable: JDrawable); cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJBaseTarget = class(TJavaGenericImport<JBaseTargetClass, JBaseTarget>) end;

  JListPreloader_PreloadTargetClass = interface(JBaseTargetClass) // or JObjectClass
  ['{CDFD678C-D992-4765-9CD7-519E1B774E8E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader$PreloadTarget')]
  JListPreloader_PreloadTarget = interface(JBaseTarget) // or JObject
  ['{7FFD5E0C-71F7-454D-AE26-CC0BA9131E16}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl;
    procedure getSize(cb: JSizeReadyCallback); cdecl;
    procedure removeCallback(cb: JSizeReadyCallback); cdecl;

    { Property }
  end;

  TJListPreloader_PreloadTarget = class(TJavaGenericImport<JListPreloader_PreloadTargetClass, JListPreloader_PreloadTarget>) end;

  JListPreloader_PreloadTargetQueueClass = interface(JObjectClass)
  ['{032DE016-0B5C-4289-9AE9-9DB894D52A29}']
    { static Property Methods }

    { static Methods }
    {class} function init(size: Integer): JListPreloader_PreloadTargetQueue; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader$PreloadTargetQueue')]
  JListPreloader_PreloadTargetQueue = interface(JObject)
  ['{721B3817-E507-46E4-91D8-0209AFD39DE2}']
    { Property Methods }

    { methods }
    function next(width: Integer; height: Integer): JListPreloader_PreloadTarget; cdecl;

    { Property }
  end;

  TJListPreloader_PreloadTargetQueue = class(TJavaGenericImport<JListPreloader_PreloadTargetQueueClass, JListPreloader_PreloadTargetQueue>) end;

  JListPreloaderClass = interface(JObjectClass)
  ['{0CC0451D-0C8F-46BA-8554-AB88A9065087}']
    { static Property Methods }

    { static Methods }
    {class} function init(requestManager: JRequestManager; preloadModelProvider: JListPreloader_PreloadModelProvider; preloadDimensionProvider: JListPreloader_PreloadSizeProvider; maxPreload: Integer): JListPreloader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/ListPreloader')]
  JListPreloader = interface(JObject)
  ['{800302D3-91BA-4E8B-A9FA-194D58E42C62}']
    { Property Methods }

    { methods }
    procedure onScrollStateChanged(absListView: JAbsListView; scrollState: Integer); cdecl;
    procedure onScroll(absListView: JAbsListView; firstVisible: Integer; visibleCount: Integer; totalCount: Integer); cdecl;

    { Property }
  end;

  TJListPreloader = class(TJavaGenericImport<JListPreloaderClass, JListPreloader>) end;

  JAssetPathFetcherClass = interface(JObjectClass)
  ['{31A155DD-B43C-4922-9202-6449C819473B}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager; assetPath: JString): JAssetPathFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/AssetPathFetcher')]
  JAssetPathFetcher = interface(JObject)
  ['{38975A80-9E9B-4B53-9B75-D88B89931D0B}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJAssetPathFetcher = class(TJavaGenericImport<JAssetPathFetcherClass, JAssetPathFetcher>) end;

  JDataFetcher_DataCallbackClass = interface(JObjectClass)
  ['{17730038-D441-474E-AF9A-2F23425EB146}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataFetcher$DataCallback')]
  JDataFetcher_DataCallback = interface(IJavaInstance)
  ['{1E6442EB-0547-4950-A83F-8BCB8FA18DE8}']
    { Property Methods }

    { methods }
    procedure onDataReady(P1: JObject); cdecl;
    procedure onLoadFailed(P1: JException); cdecl;

    { Property }
  end;

  TJDataFetcher_DataCallback = class(TJavaGenericImport<JDataFetcher_DataCallbackClass, JDataFetcher_DataCallback>) end;

  JDataFetcherClass = interface(JObjectClass)
  ['{40AA84CC-65EE-48CF-AC14-EB84F3AACC07}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataFetcher')]
  JDataFetcher = interface(IJavaInstance)
  ['{E088EF54-6C81-4E51-A237-4CEE1696C597}']
    { Property Methods }

    { methods }
    procedure loadData(P1: JPriority; P2: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
//    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJDataFetcher = class(TJavaGenericImport<JDataFetcherClass, JDataFetcher>) end;

  JDataRewinder_FactoryClass = interface(JObjectClass)
  ['{8AC7FFA5-129E-4F1E-B31F-A679BF6BEE5E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataRewinder$Factory')]
  JDataRewinder_Factory = interface(IJavaInstance)
  ['{1DFBA3FB-35E6-49B8-97B9-225952007E7E}']
    { Property Methods }

    { methods }
    function build(P1: JObject): JDataRewinder; cdecl;
//    //function getDataClass: JClass; cdecl;

    { Property }
  end;

  TJDataRewinder_Factory = class(TJavaGenericImport<JDataRewinder_FactoryClass, JDataRewinder_Factory>) end;

  JDataRewinderClass = interface(JObjectClass)
  ['{03F19EA8-E947-41A0-8535-A589356564A4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataRewinder')]
  JDataRewinder = interface(IJavaInstance)
  ['{28229DEB-06C5-4958-A4B2-4331FE80078F}']
    { Property Methods }

    { methods }
    function rewindAndGet: JObject; cdecl;
    procedure cleanup; cdecl;

    { Property }
  end;

  TJDataRewinder = class(TJavaGenericImport<JDataRewinderClass, JDataRewinder>) end;

//  JDataRewinderRegistry_1Class = interface(JObjectClass)
//  ['{25CE8A08-8B20-43D5-8127-E1723DBD261C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/data/DataRewinderRegistry$1')]
//  JDataRewinderRegistry_1 = interface(JObject)
//  ['{9EFBEA27-8E77-401F-8C2A-12F2D5D1856F}']
//    { Property Methods }
//
//    { methods }
//    function build(data: JObject): JDataRewinder; cdecl;
//    //function getDataClass: JClass; cdecl;
//
//    { Property }
//  end;
//
//  TJDataRewinderRegistry_1 = class(TJavaGenericImport<JDataRewinderRegistry_1Class, JDataRewinderRegistry_1>) end;

  JDataRewinderRegistry_DefaultRewinderClass = interface(JObjectClass)
  ['{2111A8D2-F8F7-4AFD-94F5-16E009654C9F}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: JObject): JDataRewinderRegistry_DefaultRewinder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataRewinderRegistry$DefaultRewinder')]
  JDataRewinderRegistry_DefaultRewinder = interface(JObject)
  ['{5E1542D6-ED85-4CC6-8CEF-63BFC36548C5}']
    { Property Methods }

    { methods }
    function rewindAndGet: JObject; cdecl;
    procedure cleanup; cdecl;

    { Property }
  end;

  TJDataRewinderRegistry_DefaultRewinder = class(TJavaGenericImport<JDataRewinderRegistry_DefaultRewinderClass, JDataRewinderRegistry_DefaultRewinder>) end;

  JDataRewinderRegistryClass = interface(JObjectClass)
  ['{2957A2D9-B94F-4410-8DCB-058B5442DE14}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataRewinderRegistry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/DataRewinderRegistry')]
  JDataRewinderRegistry = interface(JObject)
  ['{1A57704A-CE43-443A-BB2C-973D0317CD22}']
    { Property Methods }

    { methods }
    procedure &register(factory: JDataRewinder_Factory); cdecl;
    function build(data: JObject): JDataRewinder; cdecl;

    { Property }
  end;

  TJDataRewinderRegistry = class(TJavaGenericImport<JDataRewinderRegistryClass, JDataRewinderRegistry>) end;

//  JExifOrientationStreamClass = interface(JFilterInputStreamClass) // or JObjectClass
//  ['{324D7C61-16C6-4D1B-8EA9-805828D9CEF2}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream; orientation: Integer): JExifOrientationStream; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/data/ExifOrientationStream')]
//  JExifOrientationStream = interface(JFilterInputStream) // or JObject
//  ['{E9C17F36-FFB3-4173-ADD6-A09910B851E6}']
//    { Property Methods }
//
//    { methods }
//    function markSupported: Boolean; cdecl;
//    procedure mark(readlimit: Integer); cdecl;
//    function read: Integer; cdecl; overload;
//    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload;
//    function skip(byteCount: Int64): Int64; cdecl;
//    procedure reset; cdecl;
//
//    { Property }
//  end;
//
//  TJExifOrientationStream = class(TJavaGenericImport<JExifOrientationStreamClass, JExifOrientationStream>) end;

  JFileDescriptorAssetPathFetcherClass = interface(JAssetPathFetcherClass) // or JObjectClass
  ['{13E4431C-22CD-496B-ABDE-58F0B4A79E35}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager; assetPath: JString): JFileDescriptorAssetPathFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/FileDescriptorAssetPathFetcher')]
  JFileDescriptorAssetPathFetcher = interface(JAssetPathFetcher) // or JObject
  ['{D1FC9CFB-F2EB-45F5-B2FE-CF628FBC1221}']
    { Property Methods }

    { methods }
//    //function getDataClass: JClass; cdecl;

    { Property }
  end;

  TJFileDescriptorAssetPathFetcher = class(TJavaGenericImport<JFileDescriptorAssetPathFetcherClass, JFileDescriptorAssetPathFetcher>) end;

  JLocalUriFetcherClass = interface(JObjectClass)
  ['{16C886F2-F7E5-4595-8A38-6F54D46BF1D5}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver; uri: JUri): JLocalUriFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/LocalUriFetcher')]
  JLocalUriFetcher = interface(JObject)
  ['{BDF7A1ED-4A86-4746-BD2F-30285D40EA42}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJLocalUriFetcher = class(TJavaGenericImport<JLocalUriFetcherClass, JLocalUriFetcher>) end;

  JFileDescriptorLocalUriFetcherClass = interface(JLocalUriFetcherClass) // or JObjectClass
  ['{C1EE21F1-093B-43C7-B137-3B3474C26C38}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver; uri: JUri): JFileDescriptorLocalUriFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/FileDescriptorLocalUriFetcher')]
  JFileDescriptorLocalUriFetcher = interface(JLocalUriFetcher) // or JObject
  ['{1F70F38A-574B-402F-996D-8807894FE49C}']
    { Property Methods }

    { methods }
//    //function getDataClass: JClass; cdecl;

    { Property }
  end;

  TJFileDescriptorLocalUriFetcher = class(TJavaGenericImport<JFileDescriptorLocalUriFetcherClass, JFileDescriptorLocalUriFetcher>) end;

  JHttpUrlFetcher_DefaultHttpUrlConnectionFactoryClass = interface(JObjectClass)
  ['{A67CBBA1-FA17-4D3B-AC1C-82A8C1C2BADC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/HttpUrlFetcher$DefaultHttpUrlConnectionFactory')]
  JHttpUrlFetcher_DefaultHttpUrlConnectionFactory = interface(JObject)
  ['{667121E6-5A23-45B7-A052-95FDE9014729}']
    { Property Methods }

    { methods }
    function build(url: JURL): JHttpURLConnection; cdecl;

    { Property }
  end;

  TJHttpUrlFetcher_DefaultHttpUrlConnectionFactory = class(TJavaGenericImport<JHttpUrlFetcher_DefaultHttpUrlConnectionFactoryClass, JHttpUrlFetcher_DefaultHttpUrlConnectionFactory>) end;

  JHttpUrlFetcher_HttpUrlConnectionFactoryClass = interface(JObjectClass)
  ['{A1CBF4C8-94B3-4F36-A52C-C58034EE513E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/HttpUrlFetcher$HttpUrlConnectionFactory')]
  JHttpUrlFetcher_HttpUrlConnectionFactory = interface(IJavaInstance)
  ['{3281E761-FFAA-4A26-82C4-3E84F77445F1}']
    { Property Methods }

    { methods }
    function build(P1: JURL): JHttpURLConnection; cdecl;

    { Property }
  end;

  TJHttpUrlFetcher_HttpUrlConnectionFactory = class(TJavaGenericImport<JHttpUrlFetcher_HttpUrlConnectionFactoryClass, JHttpUrlFetcher_HttpUrlConnectionFactory>) end;

  JHttpUrlFetcherClass = interface(JObjectClass)
  ['{3CDEB8F2-52E3-4CDF-8E63-0149C28E47CD}']
    { static Property Methods }

    { static Methods }
    {class} function init(glideUrl: JGlideUrl; timeout: Integer): JHttpUrlFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/HttpUrlFetcher')]
  JHttpUrlFetcher = interface(JObject)
  ['{06C37BA7-5B36-4ED4-9EAA-31B542F50E07}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
//    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJHttpUrlFetcher = class(TJavaGenericImport<JHttpUrlFetcherClass, JHttpUrlFetcher>) end;

  JInputStreamRewinder_FactoryClass = interface(JObjectClass)
  ['{AF91634C-E6A9-49D2-A33E-978023D276C9}']
    { static Property Methods }

    { static Methods }
    {class} function init(byteArrayPool: JArrayPool): JInputStreamRewinder_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/InputStreamRewinder$Factory')]
  JInputStreamRewinder_Factory = interface(JObject)
  ['{5ADCEEB6-DACC-4ED4-8445-269C7809076A}']
    { Property Methods }

    { methods }
    function build(data: JInputStream): JDataRewinder; cdecl; overload;
//    //function getDataClass: JClass; cdecl;
    function build(this: JObject): JDataRewinder; cdecl; overload;

    { Property }
  end;

  TJInputStreamRewinder_Factory = class(TJavaGenericImport<JInputStreamRewinder_FactoryClass, JInputStreamRewinder_Factory>) end;

  JInputStreamRewinderClass = interface(JObjectClass)
  ['{4735BE12-0368-43C7-88AB-887FB670DFED}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/InputStreamRewinder')]
  JInputStreamRewinder = interface(JObject)
  ['{49200D61-D1CB-4229-A972-DD3463D25DA9}']
    { Property Methods }

    { methods }
    function rewindAndGet: JInputStream; cdecl; overload;
    procedure cleanup; cdecl;
//    function rewindAndGet: JObject; cdecl; overload;

    { Property }
  end;

  TJInputStreamRewinder = class(TJavaGenericImport<JInputStreamRewinderClass, JInputStreamRewinder>) end;

  JFileServiceClass = interface(JObjectClass)
  ['{2EBE076A-0BBB-4780-8FF6-9D0DEBA3B521}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/FileService')]
  JFileService = interface(JObject)
  ['{64E8DAC5-C8F5-4C08-AB79-1B5372AD7EC2}']
    { Property Methods }

    { methods }
    function exists(afile: JFile): Boolean; cdecl;
    function length(afile: JFile): Int64; cdecl;
    function get(path: JString): JFile; cdecl;

    { Property }
  end;

  TJFileService = class(TJavaGenericImport<JFileServiceClass, JFileService>) end;

  JMediaStoreUtilClass = interface(JObjectClass)
  ['{1C92C5B4-66B5-45FC-8A2B-DC4A2BCB299A}']
    { static Property Methods }

    { static Methods }
    {class} function isMediaStoreUri(uri: JUri): Boolean; cdecl;
    {class} function isMediaStoreVideoUri(uri: JUri): Boolean; cdecl;
    {class} function isMediaStoreImageUri(uri: JUri): Boolean; cdecl;
    {class} function isThumbnailSize(width: Integer; height: Integer): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/MediaStoreUtil')]
  JMediaStoreUtil = interface(JObject)
  ['{51FF1372-7A24-4124-8B35-24D67A60A28E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJMediaStoreUtil = class(TJavaGenericImport<JMediaStoreUtilClass, JMediaStoreUtil>) end;

  JThumbFetcher_ImageThumbnailQueryClass = interface(JObjectClass)
  ['{E4487421-7B28-4170-8D52-CC8E65191645}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbFetcher$ImageThumbnailQuery')]
  JThumbFetcher_ImageThumbnailQuery = interface(JObject)
  ['{C08062EB-CF34-439B-B62B-5A373F8A8F32}']
    { Property Methods }

    { methods }
    function query(uri: JUri): JCursor; cdecl;

    { Property }
  end;

  TJThumbFetcher_ImageThumbnailQuery = class(TJavaGenericImport<JThumbFetcher_ImageThumbnailQueryClass, JThumbFetcher_ImageThumbnailQuery>) end;

  JThumbFetcher_VideoThumbnailQueryClass = interface(JObjectClass)
  ['{2A22DE03-C7C0-430F-A90D-D3FDF5CA300A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbFetcher$VideoThumbnailQuery')]
  JThumbFetcher_VideoThumbnailQuery = interface(JObject)
  ['{558D7B27-05EE-4E8B-96FE-EDF8E76EA0D4}']
    { Property Methods }

    { methods }
    function query(uri: JUri): JCursor; cdecl;

    { Property }
  end;

  TJThumbFetcher_VideoThumbnailQuery = class(TJavaGenericImport<JThumbFetcher_VideoThumbnailQueryClass, JThumbFetcher_VideoThumbnailQuery>) end;

  JThumbFetcherClass = interface(JObjectClass)
  ['{BABF2034-DBE4-4696-924F-A3A90D5AC63F}']
    { static Property Methods }

    { static Methods }
    {class} function buildImageFetcher(context: JContext; uri: JUri): JThumbFetcher; cdecl;
    {class} function buildVideoFetcher(context: JContext; uri: JUri): JThumbFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbFetcher')]
  JThumbFetcher = interface(JObject)
  ['{A971B974-728C-4CD6-A7C5-951C6CBAE36C}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJThumbFetcher = class(TJavaGenericImport<JThumbFetcherClass, JThumbFetcher>) end;

  JThumbnailQueryClass = interface(JObjectClass)
  ['{F6882CB4-20BE-456F-A96C-61EE54353939}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbnailQuery')]
  JThumbnailQuery = interface(IJavaInstance)
  ['{18872676-4D07-4AAE-80F2-F78A8F1C669D}']
    { Property Methods }

    { methods }
    function query(P1: JUri): JCursor; cdecl;

    { Property }
  end;

  TJThumbnailQuery = class(TJavaGenericImport<JThumbnailQueryClass, JThumbnailQuery>) end;

  JThumbnailStreamOpenerClass = interface(JObjectClass)
  ['{7B60B524-A73D-419C-BC26-B810AE86C13C}']
    { static Property Methods }

    { static Methods }
    {class} function init(parsers: JList; P2: JThumbnailQuery; byteArrayPool: JArrayPool; contentResolver: JContentResolver): JThumbnailStreamOpener; cdecl; overload;
    {class} function init(parsers: JList; P2: JFileService; query: JThumbnailQuery; byteArrayPool: JArrayPool; contentResolver: JContentResolver): JThumbnailStreamOpener; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/mediastore/ThumbnailStreamOpener')]
  JThumbnailStreamOpener = interface(JObject)
  ['{052B3F7D-E288-4064-9D68-05643298DB28}']
    { Property Methods }

    { methods }
    function getOrientation(uri: JUri): Integer; cdecl;
    function open(uri: JUri): JInputStream; cdecl;

    { Property }
  end;

  TJThumbnailStreamOpener = class(TJavaGenericImport<JThumbnailStreamOpenerClass, JThumbnailStreamOpener>) end;

  JStreamAssetPathFetcherClass = interface(JAssetPathFetcherClass) // or JObjectClass
  ['{7CB07833-060D-4BFE-A724-9444651AB99E}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager; assetPath: JString): JStreamAssetPathFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/StreamAssetPathFetcher')]
  JStreamAssetPathFetcher = interface(JAssetPathFetcher) // or JObject
  ['{AC154D82-7107-4939-968E-20D177C80DA0}']
    { Property Methods }

    { methods }
    //function getDataClass: JClass; cdecl;

    { Property }
  end;

  TJStreamAssetPathFetcher = class(TJavaGenericImport<JStreamAssetPathFetcherClass, JStreamAssetPathFetcher>) end;

  JStreamLocalUriFetcherClass = interface(JLocalUriFetcherClass) // or JObjectClass
  ['{96B1E8F5-874E-4F9D-86DC-261A82519D42}']
    { static Property Methods }

    { static Methods }
    {class} function init(resolver: JContentResolver; uri: JUri): JStreamLocalUriFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/data/StreamLocalUriFetcher')]
  JStreamLocalUriFetcher = interface(JLocalUriFetcher) // or JObject
  ['{81D3C1FF-7571-4870-9A9F-221C21F22213}']
    { Property Methods }

    { methods }
    //function getDataClass: JClass; cdecl;

    { Property }
  end;

  TJStreamLocalUriFetcher = class(TJavaGenericImport<JStreamLocalUriFetcherClass, JStreamLocalUriFetcher>) end;

  JDataSourceClass = interface(JEnumClass) // or JObjectClass
  ['{EDBD2690-C1C0-40C2-9312-69061399D6C6}']
    { static Property Methods }
    {class} function _GetLOCAL: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetREMOTE: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_DISK_CACHE: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESOURCE_DISK_CACHE: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMEMORY_CACHE: JDataSource;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDataSource>; cdecl;
    {class} function valueOf(name: JString): JDataSource; cdecl;

    { static Property }
    {class} property LOCAL: JDataSource read _GetLOCAL;
    {class} property REMOTE: JDataSource read _GetREMOTE;
    {class} property DATA_DISK_CACHE: JDataSource read _GetDATA_DISK_CACHE;
    {class} property RESOURCE_DISK_CACHE: JDataSource read _GetRESOURCE_DISK_CACHE;
    {class} property MEMORY_CACHE: JDataSource read _GetMEMORY_CACHE;
  end;

  [JavaSignature('com/bumptech/glide/load/DataSource')]
  JDataSource = interface(JEnum) // or JObject
  ['{F0114A1C-0254-4176-8B62-CD8D8475883E}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDataSource = class(TJavaGenericImport<JDataSourceClass, JDataSource>) end;

  JDecodeFormatClass = interface(JEnumClass) // or JObjectClass
  ['{7FC2DD8E-26E4-43D9-9882-ED41DD898926}']
    { static Property Methods }
    {class} function _GetPREFER_ARGB_8888: JDecodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPREFER_RGB_565: JDecodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT: JDecodeFormat;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodeFormat>; cdecl;
    {class} function valueOf(name: JString): JDecodeFormat; cdecl;

    { static Property }
    {class} property PREFER_ARGB_8888: JDecodeFormat read _GetPREFER_ARGB_8888;
    {class} property PREFER_RGB_565: JDecodeFormat read _GetPREFER_RGB_565;
    {class} property DEFAULT: JDecodeFormat read _GetDEFAULT;
  end;

  [JavaSignature('com/bumptech/glide/load/DecodeFormat')]
  JDecodeFormat = interface(JEnum) // or JObject
  ['{6BCA529D-D0D8-4F7A-A630-81B0BEB7B9BD}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeFormat = class(TJavaGenericImport<JDecodeFormatClass, JDecodeFormat>) end;

  JEncoderClass = interface(JObjectClass)
  ['{C3AE37EA-177F-4756-8734-2A9E6EDEC8F9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Encoder')]
  JEncoder = interface(IJavaInstance)
  ['{DBB90879-2865-4DDB-9EF8-D2EE73603887}']
    { Property Methods }

    { methods }
    function encode(P1: JObject; P2: JFile; P3: JOptions): Boolean; cdecl;

    { Property }
  end;

  TJEncoder = class(TJavaGenericImport<JEncoderClass, JEncoder>) end;

  JEncodeStrategyClass = interface(JEnumClass) // or JObjectClass
  ['{B5834264-9D34-4423-9E2E-96409B2D74F8}']
    { static Property Methods }
    {class} function _GetSOURCE: JEncodeStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTRANSFORMED: JEncodeStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNONE: JEncodeStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JEncodeStrategy>; cdecl;
    {class} function valueOf(name: JString): JEncodeStrategy; cdecl;

    { static Property }
    {class} property SOURCE: JEncodeStrategy read _GetSOURCE;
    {class} property TRANSFORMED: JEncodeStrategy read _GetTRANSFORMED;
    {class} property NONE: JEncodeStrategy read _GetNONE;
  end;

  [JavaSignature('com/bumptech/glide/load/EncodeStrategy')]
  JEncodeStrategy = interface(JEnum) // or JObject
  ['{9EB5387C-0435-493B-ABB3-08EC1ACF437F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEncodeStrategy = class(TJavaGenericImport<JEncodeStrategyClass, JEncodeStrategy>) end;

  JArrayAdapterInterfaceClass = interface(JObjectClass)
  ['{D5F4D34D-8EEA-479F-BF31-8D9B42C7B4BA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/ArrayAdapterInterface')]
  JArrayAdapterInterface = interface(IJavaInstance)
  ['{D3FDE122-5E9A-4222-BDAA-525F3670AB20}']
    { Property Methods }

    { methods }
    function getTag: JString; cdecl;
    function getArrayLength(P1: JObject): Integer; cdecl;
    function newArray(P1: Integer): JObject; cdecl;
    function getElementSizeInBytes: Integer; cdecl;

    { Property }
  end;

  TJArrayAdapterInterface = class(TJavaGenericImport<JArrayAdapterInterfaceClass, JArrayAdapterInterface>) end;

  JArrayPoolClass = interface(JObjectClass)
  ['{06E1132D-867A-4F5E-994C-E9581EB26221}']
    { static Property Methods }
    {class} function _GetSTANDARD_BUFFER_SIZE_BYTES: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property STANDARD_BUFFER_SIZE_BYTES: Integer read _GetSTANDARD_BUFFER_SIZE_BYTES;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/ArrayPool')]
  JArrayPool = interface(IJavaInstance)
  ['{03EB5E22-74B6-4EC1-9B5B-F3ACDA27F1C4}']
    { Property Methods }

    { methods }
//    procedure put(P1: JObject; P2: JClass); cdecl;
//    function get(P1: Integer; P2: JClass): JObject; cdecl;
    procedure clearMemory; cdecl;
    procedure trimMemory(P1: Integer); cdecl;

    { Property }
  end;

  TJArrayPool = class(TJavaGenericImport<JArrayPoolClass, JArrayPool>) end;

  JAttributeStrategy_KeyClass = interface(JObjectClass)
  ['{674B16B7-22F4-4678-8A83-8E29F81C8520}']
    { static Property Methods }

    { static Methods }
    {class} function init(pool: JAttributeStrategy_KeyPool): JAttributeStrategy_Key; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$Key')]
  JAttributeStrategy_Key = interface(JObject)
  ['{B9191CDE-399C-49C8-AE56-13E19E743FA0}']
    { Property Methods }

    { methods }
    procedure init(width: Integer; height: Integer; config: JBitmap_Config); cdecl; overload;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure offer; cdecl;

    { Property }
  end;

  TJAttributeStrategy_Key = class(TJavaGenericImport<JAttributeStrategy_KeyClass, JAttributeStrategy_Key>) end;

  JBaseKeyPoolClass = interface(JObjectClass)
  ['{0F662D81-59D1-49C9-B380-86E717026303}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/BaseKeyPool')]
  JBaseKeyPool = interface(JObject)
  ['{51F2F9D9-A3FA-411C-BF0E-6C9B7EEC85EF}']
    { Property Methods }

    { methods }
    procedure offer(key: JPoolable); cdecl;

    { Property }
  end;

  TJBaseKeyPool = class(TJavaGenericImport<JBaseKeyPoolClass, JBaseKeyPool>) end;

  JAttributeStrategy_KeyPoolClass = interface(JBaseKeyPoolClass) // or JObjectClass
  ['{387C5FF5-6799-44F7-91A8-5FD5DBA7B9DE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy$KeyPool')]
  JAttributeStrategy_KeyPool = interface(JBaseKeyPool) // or JObject
  ['{681D08E9-1477-4F2F-960B-13ADA1D39E2B}']
    { Property Methods }

    { methods }
    function get(width: Integer; height: Integer; config: JBitmap_Config): JAttributeStrategy_Key; cdecl;

    { Property }
  end;

  TJAttributeStrategy_KeyPool = class(TJavaGenericImport<JAttributeStrategy_KeyPoolClass, JAttributeStrategy_KeyPool>) end;

  JAttributeStrategyClass = interface(JObjectClass)
  ['{6F86D16B-A6E8-4950-B162-D412732B2CB4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/AttributeStrategy')]
  JAttributeStrategy = interface(JObject)
  ['{E5D7712B-B77B-44ED-A615-A961803AD590}']
    { Property Methods }

    { methods }
    procedure put(bitmap: JBitmap); cdecl;
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl;
    function removeLast: JBitmap; cdecl;
    function logBitmap(bitmap: JBitmap): JString; cdecl; overload;
    function logBitmap(width: Integer; height: Integer; config: JBitmap_Config): JString; cdecl; overload;
    function getSize(bitmap: JBitmap): Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJAttributeStrategy = class(TJavaGenericImport<JAttributeStrategyClass, JAttributeStrategy>) end;

  JBitmapPoolClass = interface(JObjectClass)
  ['{1AD73C32-A068-413C-BF29-859B4AE118BD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/BitmapPool')]
  JBitmapPool = interface(IJavaInstance)
  ['{9B36F210-DCD9-4FA5-BEE9-83C9FCF53E92}']
    { Property Methods }

    { methods }
    function getMaxSize: Integer; cdecl;
    procedure setSizeMultiplier(P1: Single); cdecl;
    procedure put(P1: JBitmap); cdecl;
    function get(P1: Integer; P2: Integer; P3: JBitmap_Config): JBitmap; cdecl;
    function getDirty(P1: Integer; P2: Integer; P3: JBitmap_Config): JBitmap; cdecl;
    procedure clearMemory; cdecl;
    procedure trimMemory(P1: Integer); cdecl;

    { Property }
  end;

  TJBitmapPool = class(TJavaGenericImport<JBitmapPoolClass, JBitmapPool>) end;

  JBitmapPoolAdapterClass = interface(JObjectClass)
  ['{50E5FBC7-51FD-4A12-B929-7BF40E63F587}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapPoolAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/BitmapPoolAdapter')]
  JBitmapPoolAdapter = interface(JObject)
  ['{72ADBAC2-9F21-4438-91A9-89D8667F0E03}']
    { Property Methods }

    { methods }
    function getMaxSize: Integer; cdecl;
    procedure setSizeMultiplier(sizeMultiplier: Single); cdecl;
    procedure put(bitmap: JBitmap); cdecl;
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl;
    function getDirty(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl;
    procedure clearMemory; cdecl;
    procedure trimMemory(level: Integer); cdecl;

    { Property }
  end;

  TJBitmapPoolAdapter = class(TJavaGenericImport<JBitmapPoolAdapterClass, JBitmapPoolAdapter>) end;

  JByteArrayAdapterClass = interface(JObjectClass)
  ['{160C001D-1D80-4A1E-AD41-22DB9E07C1EE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteArrayAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/ByteArrayAdapter')]
  JByteArrayAdapter = interface(JObject)
  ['{0AD43899-2178-4259-A1BD-A96ACC78E6CE}']
    { Property Methods }

    { methods }
    function getTag: JString; cdecl;
    function getArrayLength(aarray: TJavaArray<Byte>): Integer; cdecl; overload;
    function newArray(length: Integer): TJavaArray<Byte>; cdecl; overload;
    function getElementSizeInBytes: Integer; cdecl;
//    function newArray(this: Integer): JObject; cdecl; overload;
    function getArrayLength(this: JObject): Integer; cdecl; overload;

    { Property }
  end;

  TJByteArrayAdapter = class(TJavaGenericImport<JByteArrayAdapterClass, JByteArrayAdapter>) end;

  JGroupedLinkedMap_LinkedEntryClass = interface(JObjectClass)
  ['{2C531F99-5823-4EA9-8643-F659977ADA9C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGroupedLinkedMap_LinkedEntry; cdecl; overload;
    {class} function init(key: JObject): JGroupedLinkedMap_LinkedEntry; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/GroupedLinkedMap$LinkedEntry')]
  JGroupedLinkedMap_LinkedEntry = interface(JObject)
  ['{3BA443E2-0BBD-40D6-867A-EAFA84FEFA01}']
    { Property Methods }

    { methods }
    function removeLast: JObject; cdecl;
    function size: Integer; cdecl;
    procedure add(value: JObject); cdecl;

    { Property }
  end;

  TJGroupedLinkedMap_LinkedEntry = class(TJavaGenericImport<JGroupedLinkedMap_LinkedEntryClass, JGroupedLinkedMap_LinkedEntry>) end;

  JGroupedLinkedMapClass = interface(JObjectClass)
  ['{6D8E27DE-1AB1-4553-B139-3D9868EA56BC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/GroupedLinkedMap')]
  JGroupedLinkedMap = interface(JObject)
  ['{3796CD89-FD89-42AF-8056-C2DCD692B777}']
    { Property Methods }

    { methods }
    procedure put(key: JPoolable; value: JObject); cdecl;
    function get(key: JPoolable): JObject; cdecl;
    function removeLast: JObject; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJGroupedLinkedMap = class(TJavaGenericImport<JGroupedLinkedMapClass, JGroupedLinkedMap>) end;

  JIntegerArrayAdapterClass = interface(JObjectClass)
  ['{73B27C28-37C5-4F7D-A7C2-642D086B5C40}']
    { static Property Methods }

    { static Methods }
    {class} function init: JIntegerArrayAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/IntegerArrayAdapter')]
  JIntegerArrayAdapter = interface(JObject)
  ['{A7476807-401E-465D-9482-F123C9753B6C}']
    { Property Methods }

    { methods }
    function getTag: JString; cdecl;
    function getArrayLength(aarray: TJavaArray<Integer>): Integer; cdecl; overload;
    function newArray(length: Integer): TJavaArray<Integer>; cdecl; overload;
    function getElementSizeInBytes: Integer; cdecl;
//    function newArray(this: Integer): JObject; cdecl; overload;
    function getArrayLength(this: JObject): Integer; cdecl; overload;

    { Property }
  end;

  TJIntegerArrayAdapter = class(TJavaGenericImport<JIntegerArrayAdapterClass, JIntegerArrayAdapter>) end;

  JLruArrayPool_KeyClass = interface(JObjectClass)
  ['{E25DAC99-B6D4-4DFF-8583-E00320705B51}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruArrayPool$Key')]
  JLruArrayPool_Key = interface(JObject)
  ['{D6C6439F-78B1-4DBE-8E15-9050BD1B4B64}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function toString: JString; cdecl;
    procedure offer; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJLruArrayPool_Key = class(TJavaGenericImport<JLruArrayPool_KeyClass, JLruArrayPool_Key>) end;

  JLruArrayPool_KeyPoolClass = interface(JBaseKeyPoolClass) // or JObjectClass
  ['{7FEFA543-7EC1-4E88-B16C-F64ABC792461}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruArrayPool$KeyPool')]
  JLruArrayPool_KeyPool = interface(JBaseKeyPool) // or JObject
  ['{5370C313-1D1D-48FC-B948-66FBCADCBB16}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLruArrayPool_KeyPool = class(TJavaGenericImport<JLruArrayPool_KeyPoolClass, JLruArrayPool_KeyPool>) end;

  JLruArrayPoolClass = interface(JObjectClass)
  ['{F38B128B-082B-45FE-824C-02816BF408E5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLruArrayPool; cdecl; overload;
    {class} function init(maxSize: Integer): JLruArrayPool; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruArrayPool')]
  JLruArrayPool = interface(JObject)
  ['{40CAEFAC-2AAD-4A18-B6DA-9ECEB3C583C2}']
    { Property Methods }

    { methods }
//    procedure put(aarray: JObject; P2: JClass); cdecl;
//    function get(size: Integer; arrayClass: JClass): JObject; cdecl;
    procedure clearMemory; cdecl;
    procedure trimMemory(level: Integer); cdecl;

    { Property }
  end;

  TJLruArrayPool = class(TJavaGenericImport<JLruArrayPoolClass, JLruArrayPool>) end;

  JLruBitmapPool_BitmapTrackerClass = interface(JObjectClass)
  ['{9CAA5528-5A37-4E66-AC12-362D90ECF413}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$BitmapTracker')]
  JLruBitmapPool_BitmapTracker = interface(IJavaInstance)
  ['{CB04380C-37DA-42D8-BFAC-93FB2912109B}']
    { Property Methods }

    { methods }
    procedure add(P1: JBitmap); cdecl;
    procedure remove(P1: JBitmap); cdecl;

    { Property }
  end;

  TJLruBitmapPool_BitmapTracker = class(TJavaGenericImport<JLruBitmapPool_BitmapTrackerClass, JLruBitmapPool_BitmapTracker>) end;

  JLruBitmapPool_NullBitmapTrackerClass = interface(JObjectClass)
  ['{B67A16E2-BEF5-4DC0-BC6A-79DF6CCB40DA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$NullBitmapTracker')]
  JLruBitmapPool_NullBitmapTracker = interface(JObject)
  ['{CFEE2979-EF37-4CD2-B903-2CECBCDA337B}']
    { Property Methods }

    { methods }
    procedure add(bitmap: JBitmap); cdecl;
    procedure remove(bitmap: JBitmap); cdecl;

    { Property }
  end;

  TJLruBitmapPool_NullBitmapTracker = class(TJavaGenericImport<JLruBitmapPool_NullBitmapTrackerClass, JLruBitmapPool_NullBitmapTracker>) end;

  JLruBitmapPool_ThrowingBitmapTrackerClass = interface(JObjectClass)
  ['{6A4ACDD9-EEAC-4D15-88C3-2D59866F0DD5}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool$ThrowingBitmapTracker')]
  JLruBitmapPool_ThrowingBitmapTracker = interface(JObject)
  ['{26EABBF2-9889-4E38-B66A-4880721D418D}']
    { Property Methods }

    { methods }
    procedure add(bitmap: JBitmap); cdecl;
    procedure remove(bitmap: JBitmap); cdecl;

    { Property }
  end;

  TJLruBitmapPool_ThrowingBitmapTracker = class(TJavaGenericImport<JLruBitmapPool_ThrowingBitmapTrackerClass, JLruBitmapPool_ThrowingBitmapTracker>) end;

  JLruBitmapPoolClass = interface(JObjectClass)
  ['{04905554-0586-4897-9E87-7FC1B36565C0}']
    { static Property Methods }

    { static Methods }
    {class} function init(maxSize: Integer): JLruBitmapPool; cdecl; overload;
    {class} function init(maxSize: Integer; allowedConfigs: JSet): JLruBitmapPool; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruBitmapPool')]
  JLruBitmapPool = interface(JObject)
  ['{74BA9405-383E-468F-8B8F-BB0E6895AD8C}']
    { Property Methods }

    { methods }
    function getMaxSize: Integer; cdecl;
    procedure setSizeMultiplier(sizeMultiplier: Single); cdecl;
    procedure put(bitmap: JBitmap); cdecl;
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl;
    function getDirty(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl;
    procedure clearMemory; cdecl;
    procedure trimMemory(level: Integer); cdecl;

    { Property }
  end;

  TJLruBitmapPool = class(TJavaGenericImport<JLruBitmapPoolClass, JLruBitmapPool>) end;

  JLruPoolStrategyClass = interface(JObjectClass)
  ['{CDC45BE3-03C1-4419-9DDC-7DF7D3AD6718}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/LruPoolStrategy')]
  JLruPoolStrategy = interface(IJavaInstance)
  ['{A9137EF4-CABE-47CB-8155-0DE016E96113}']
    { Property Methods }

    { methods }
    procedure put(P1: JBitmap); cdecl;
    function get(P1: Integer; P2: Integer; P3: JBitmap_Config): JBitmap; cdecl;
    function removeLast: JBitmap; cdecl;
    function logBitmap(P1: JBitmap): JString; cdecl; overload;
    function logBitmap(P1: Integer; P2: Integer; P3: JBitmap_Config): JString; cdecl; overload;
    function getSize(P1: JBitmap): Integer; cdecl;

    { Property }
  end;

  TJLruPoolStrategy = class(TJavaGenericImport<JLruPoolStrategyClass, JLruPoolStrategy>) end;

  JPoolableClass = interface(JObjectClass)
  ['{6D5DCC98-129B-45A0-B9D7-CB1473BDAB5D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/Poolable')]
  JPoolable = interface(IJavaInstance)
  ['{5159CAA0-F8AE-4CA9-8E4A-1F0FC489700D}']
    { Property Methods }

    { methods }
    procedure offer; cdecl;

    { Property }
  end;

  TJPoolable = class(TJavaGenericImport<JPoolableClass, JPoolable>) end;

//  JPrettyPrintTreeMapClass = interface(JTreeMapClass) // or JObjectClass
//  ['{3FE56097-97D9-42CE-8EB9-445572672360}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/PrettyPrintTreeMap')]
//  JPrettyPrintTreeMap = interface(JTreeMap) // or JObject
//  ['{81265CAA-B324-46C3-AA7A-CCD79D45D1A0}']
//    { Property Methods }
//
//    { methods }
//    function toString: JString; cdecl;
//
//    { Property }
//  end;
//
//  TJPrettyPrintTreeMap = class(TJavaGenericImport<JPrettyPrintTreeMapClass, JPrettyPrintTreeMap>) end;

//  JSizeConfigStrategy_1Class = interface(JObjectClass)
//  ['{92EBF29B-C953-42F1-9D16-431C4F23956D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$1')]
//  JSizeConfigStrategy_1 = interface(JObject)
//  ['{C3334AAB-DA8E-4B2D-B1B4-980C1B43D6D0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJSizeConfigStrategy_1 = class(TJavaGenericImport<JSizeConfigStrategy_1Class, JSizeConfigStrategy_1>) end;

  JSizeConfigStrategy_KeyClass = interface(JObjectClass)
  ['{2516F2F8-4698-4553-9F15-5B559222AD8F}']
    { static Property Methods }

    { static Methods }
    {class} function init(pool: JSizeConfigStrategy_KeyPool): JSizeConfigStrategy_Key; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$Key')]
  JSizeConfigStrategy_Key = interface(JObject)
  ['{7140C155-24F3-4E47-A3B6-700A87E40665}']
    { Property Methods }

    { methods }
    procedure init(size: Integer; config: JBitmap_Config); cdecl; overload;
    procedure offer; cdecl;
    function toString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJSizeConfigStrategy_Key = class(TJavaGenericImport<JSizeConfigStrategy_KeyClass, JSizeConfigStrategy_Key>) end;

  JSizeConfigStrategy_KeyPoolClass = interface(JBaseKeyPoolClass) // or JObjectClass
  ['{0B9E910E-E61B-4D05-8466-CF0FCE73B497}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy$KeyPool')]
  JSizeConfigStrategy_KeyPool = interface(JBaseKeyPool) // or JObject
  ['{604E6BCD-AD6A-4FB0-ADC9-C50BE4A27F23}']
    { Property Methods }

    { methods }
    function get(size: Integer; config: JBitmap_Config): JSizeConfigStrategy_Key; cdecl;

    { Property }
  end;

  TJSizeConfigStrategy_KeyPool = class(TJavaGenericImport<JSizeConfigStrategy_KeyPoolClass, JSizeConfigStrategy_KeyPool>) end;

  JSizeConfigStrategyClass = interface(JObjectClass)
  ['{8803CA53-D84F-40E5-985A-6B29D18BAA49}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSizeConfigStrategy; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeConfigStrategy')]
  JSizeConfigStrategy = interface(JObject)
  ['{A786F4A7-BC10-4685-8500-28328753E20D}']
    { Property Methods }

    { methods }
    procedure put(bitmap: JBitmap); cdecl;
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl;
    function removeLast: JBitmap; cdecl;
    function logBitmap(bitmap: JBitmap): JString; cdecl; overload;
    function logBitmap(width: Integer; height: Integer; config: JBitmap_Config): JString; cdecl; overload;
    function getSize(bitmap: JBitmap): Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJSizeConfigStrategy = class(TJavaGenericImport<JSizeConfigStrategyClass, JSizeConfigStrategy>) end;

  JSizeStrategy_KeyClass = interface(JObjectClass)
  ['{4541062E-ADC0-4C92-8487-2A675FEC80CD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$Key')]
  JSizeStrategy_Key = interface(JObject)
  ['{3789FA65-C706-4199-BA78-EBC5780E7D5D}']
    { Property Methods }

    { methods }
    procedure init(size: Integer); cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
    procedure offer; cdecl;

    { Property }
  end;

  TJSizeStrategy_Key = class(TJavaGenericImport<JSizeStrategy_KeyClass, JSizeStrategy_Key>) end;

  JSizeStrategy_KeyPoolClass = interface(JBaseKeyPoolClass) // or JObjectClass
  ['{40D99567-7E1A-4CFC-93A2-9324EE0796F9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy$KeyPool')]
  JSizeStrategy_KeyPool = interface(JBaseKeyPool) // or JObject
  ['{05E89551-F3DB-43E1-AAE4-F308BC81B38A}']
    { Property Methods }

    { methods }
    function get(size: Integer): JSizeStrategy_Key; cdecl;

    { Property }
  end;

  TJSizeStrategy_KeyPool = class(TJavaGenericImport<JSizeStrategy_KeyPoolClass, JSizeStrategy_KeyPool>) end;

  JSizeStrategyClass = interface(JObjectClass)
  ['{7FEDF637-720F-4CEC-97AC-E1659929F453}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/bitmap_recycle/SizeStrategy')]
  JSizeStrategy = interface(JObject)
  ['{181825E9-B99A-4C8E-9C29-3F8A304F7890}']
    { Property Methods }

    { methods }
    procedure put(bitmap: JBitmap); cdecl;
    function get(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl;
    function removeLast: JBitmap; cdecl;
    function logBitmap(bitmap: JBitmap): JString; cdecl; overload;
    function logBitmap(width: Integer; height: Integer; config: JBitmap_Config): JString; cdecl; overload;
    function getSize(bitmap: JBitmap): Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJSizeStrategy = class(TJavaGenericImport<JSizeStrategyClass, JSizeStrategy>) end;

  JDiskCache_FactoryClass = interface(JObjectClass)
  ['{F6B55654-BD67-461C-A3E7-D467622536B1}']
    { static Property Methods }
    {class} function _GetDEFAULT_DISK_CACHE_SIZE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_DISK_CACHE_DIR: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property DEFAULT_DISK_CACHE_SIZE: Integer read _GetDEFAULT_DISK_CACHE_SIZE;
    {class} property DEFAULT_DISK_CACHE_DIR: JString read _GetDEFAULT_DISK_CACHE_DIR;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCache$Factory')]
  JDiskCache_Factory = interface(IJavaInstance)
  ['{65F5F71B-708D-46FA-99C6-3879BA2073E6}']
    { Property Methods }

    { methods }
    function build: JDiskCache; cdecl;

    { Property }
  end;

  TJDiskCache_Factory = class(TJavaGenericImport<JDiskCache_FactoryClass, JDiskCache_Factory>) end;

  JDiskCache_WriterClass = interface(JObjectClass)
  ['{DF54BAE1-CF06-43E3-B48C-7D3E47C5AE4B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCache$Writer')]
  JDiskCache_Writer = interface(IJavaInstance)
  ['{43079B0C-CD07-4E65-8DF5-EA46A3AB0B87}']
    { Property Methods }

    { methods }
    function write(P1: JFile): Boolean; cdecl;

    { Property }
  end;

  TJDiskCache_Writer = class(TJavaGenericImport<JDiskCache_WriterClass, JDiskCache_Writer>) end;

  JDiskCacheClass = interface(JObjectClass)
  ['{4B0C7A0D-99EC-4590-BB81-E8507B499D6F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCache')]
  JDiskCache = interface(IJavaInstance)
  ['{364A9743-33A6-4CC8-9925-79F1ABD88DA3}']
    { Property Methods }

    { methods }
    function get(P1: JKey): JFile; cdecl;
    procedure put(P1: JKey; P2: JDiskCache_Writer); cdecl;
    procedure delete(P1: JKey); cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJDiskCache = class(TJavaGenericImport<JDiskCacheClass, JDiskCache>) end;

  JDiskCacheAdapterClass = interface(JObjectClass)
  ['{8160732C-6298-4F5C-9B4B-BFFF74EB8EDE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDiskCacheAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheAdapter')]
  JDiskCacheAdapter = interface(JObject)
  ['{FFF86756-2DF6-4925-BA5C-3858D345D950}']
    { Property Methods }

    { methods }
    function get(key: JKey): JFile; cdecl;
    procedure put(key: JKey; writer: JDiskCache_Writer); cdecl;
    procedure delete(key: JKey); cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJDiskCacheAdapter = class(TJavaGenericImport<JDiskCacheAdapterClass, JDiskCacheAdapter>) end;

  JDiskCacheWriteLocker_WriteLockClass = interface(JObjectClass)
  ['{EF51E085-C857-4D08-89BD-E2294B7D5B37}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheWriteLocker$WriteLock')]
  JDiskCacheWriteLocker_WriteLock = interface(JObject)
  ['{470CDE94-5365-4A5E-867F-AB770DD44D5A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDiskCacheWriteLocker_WriteLock = class(TJavaGenericImport<JDiskCacheWriteLocker_WriteLockClass, JDiskCacheWriteLocker_WriteLock>) end;

  JDiskCacheWriteLocker_WriteLockPoolClass = interface(JObjectClass)
  ['{01516250-50C5-4A3F-BF60-E5339273F0C2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheWriteLocker$WriteLockPool')]
  JDiskCacheWriteLocker_WriteLockPool = interface(JObject)
  ['{CD0E89FF-9946-4078-BBFC-F2852803AEC9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDiskCacheWriteLocker_WriteLockPool = class(TJavaGenericImport<JDiskCacheWriteLocker_WriteLockPoolClass, JDiskCacheWriteLocker_WriteLockPool>) end;

  JDiskCacheWriteLockerClass = interface(JObjectClass)
  ['{C74FC98E-5A6A-4532-B968-AB28A50E0E08}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskCacheWriteLocker')]
  JDiskCacheWriteLocker = interface(JObject)
  ['{87E089A8-DD1C-4A17-85CC-F11650717B20}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDiskCacheWriteLocker = class(TJavaGenericImport<JDiskCacheWriteLockerClass, JDiskCacheWriteLocker>) end;

//  JDiskLruCacheFactory_1Class = interface(JObjectClass)
//  ['{69CD519F-4270-4B2C-9E85-BD26D7BEB858}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskLruCacheFactory$1')]
//  JDiskLruCacheFactory_1 = interface(JObject)
//  ['{71872553-93CF-40E1-9E3B-51B295A271F5}']
//    { Property Methods }
//
//    { methods }
//    function getCacheDirectory: JFile; cdecl;
//
//    { Property }
//  end;
//
//  TJDiskLruCacheFactory_1 = class(TJavaGenericImport<JDiskLruCacheFactory_1Class, JDiskLruCacheFactory_1>) end;

//  JDiskLruCacheFactory_2Class = interface(JObjectClass)
//  ['{F0B1DA21-EAB5-4E36-95D8-1EDE92D26E88}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskLruCacheFactory$2')]
//  JDiskLruCacheFactory_2 = interface(JObject)
//  ['{F3D8FD51-2602-41BC-9DC1-F0DFF3864742}']
//    { Property Methods }
//
//    { methods }
//    function getCacheDirectory: JFile; cdecl;
//
//    { Property }
//  end;
//
//  TJDiskLruCacheFactory_2 = class(TJavaGenericImport<JDiskLruCacheFactory_2Class, JDiskLruCacheFactory_2>) end;

  JDiskLruCacheFactory_CacheDirectoryGetterClass = interface(JObjectClass)
  ['{AEEE19DC-CAF2-4E43-B340-F8B84C31BBC3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskLruCacheFactory$CacheDirectoryGetter')]
  JDiskLruCacheFactory_CacheDirectoryGetter = interface(IJavaInstance)
  ['{AE3577DD-DE9C-49F0-9657-8B63F7D78831}']
    { Property Methods }

    { methods }
    function getCacheDirectory: JFile; cdecl;

    { Property }
  end;

  TJDiskLruCacheFactory_CacheDirectoryGetter = class(TJavaGenericImport<JDiskLruCacheFactory_CacheDirectoryGetterClass, JDiskLruCacheFactory_CacheDirectoryGetter>) end;

  JDiskLruCacheFactoryClass = interface(JObjectClass)
  ['{7E9220C9-3FD1-4515-AB5C-2ABA17A57029}']
    { static Property Methods }

    { static Methods }
    {class} function init(diskCacheFolder: JString; diskCacheSize: Integer): JDiskLruCacheFactory; cdecl; overload;
    {class} function init(diskCacheFolder: JString; diskCacheName: JString; diskCacheSize: Integer): JDiskLruCacheFactory; cdecl; overload;
    {class} function init(cacheDirectoryGetter: JDiskLruCacheFactory_CacheDirectoryGetter; diskCacheSize: Integer): JDiskLruCacheFactory; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskLruCacheFactory')]
  JDiskLruCacheFactory = interface(JObject)
  ['{5608524D-448C-4BB2-B637-6C8C425EC0DE}']
    { Property Methods }

    { methods }
    function build: JDiskCache; cdecl;

    { Property }
  end;

  TJDiskLruCacheFactory = class(TJavaGenericImport<JDiskLruCacheFactoryClass, JDiskLruCacheFactory>) end;

  JDiskLruCacheWrapperClass = interface(JObjectClass)
  ['{12966914-7642-41AF-B03A-B267711487B6}']
    { static Property Methods }

    { static Methods }
    {class} function get(directory: JFile; maxSize: Integer): JDiskCache; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/DiskLruCacheWrapper')]
  JDiskLruCacheWrapper = interface(JObject)
  ['{FE6F4E9C-71BC-4405-AD70-9E17AE2BD1BB}']
    { Property Methods }

    { methods }
    function get(key: JKey): JFile; cdecl; overload;
    procedure put(key: JKey; writer: JDiskCache_Writer); cdecl;
    procedure delete(key: JKey); cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJDiskLruCacheWrapper = class(TJavaGenericImport<JDiskLruCacheWrapperClass, JDiskLruCacheWrapper>) end;

//  JExternalCacheDiskCacheFactory_1Class = interface(JObjectClass)
//  ['{FA5998B9-04BA-4201-80D6-053C41F93AEC}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/cache/ExternalCacheDiskCacheFactory$1')]
//  JExternalCacheDiskCacheFactory_1 = interface(JObject)
//  ['{CBE71ED2-D62E-4203-B908-FB3CF3A154BE}']
//    { Property Methods }
//
//    { methods }
//    function getCacheDirectory: JFile; cdecl;
//
//    { Property }
//  end;
//
//  TJExternalCacheDiskCacheFactory_1 = class(TJavaGenericImport<JExternalCacheDiskCacheFactory_1Class, JExternalCacheDiskCacheFactory_1>) end;

  JExternalCacheDiskCacheFactoryClass = interface(JDiskLruCacheFactoryClass) // or JObjectClass
  ['{CDE6333E-C055-4005-A53A-064571A8406C}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JExternalCacheDiskCacheFactory; cdecl; overload;
    {class} function init(context: JContext; diskCacheSize: Integer): JExternalCacheDiskCacheFactory; cdecl; overload;
    {class} function init(context: JContext; diskCacheName: JString; diskCacheSize: Integer): JExternalCacheDiskCacheFactory; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/ExternalCacheDiskCacheFactory')]
  JExternalCacheDiskCacheFactory = interface(JDiskLruCacheFactory) // or JObject
  ['{A9023618-E7DC-4486-B54F-06F47C2D51F6}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJExternalCacheDiskCacheFactory = class(TJavaGenericImport<JExternalCacheDiskCacheFactoryClass, JExternalCacheDiskCacheFactory>) end;

//  JInternalCacheDiskCacheFactory_1Class = interface(JObjectClass)
//  ['{21F51CB3-F20B-44A6-817C-3489F1E45BC1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory$1')]
//  JInternalCacheDiskCacheFactory_1 = interface(JObject)
//  ['{986FA5E0-3112-4737-A9E2-BABAD20E5236}']
//    { Property Methods }
//
//    { methods }
//    function getCacheDirectory: JFile; cdecl;
//
//    { Property }
//  end;
//
//  TJInternalCacheDiskCacheFactory_1 = class(TJavaGenericImport<JInternalCacheDiskCacheFactory_1Class, JInternalCacheDiskCacheFactory_1>) end;

  JInternalCacheDiskCacheFactoryClass = interface(JDiskLruCacheFactoryClass) // or JObjectClass
  ['{10A03C52-26F7-4617-BBE7-EB0192BE5021}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JInternalCacheDiskCacheFactory; cdecl; overload;
    {class} function init(context: JContext; diskCacheSize: Integer): JInternalCacheDiskCacheFactory; cdecl; overload;
    {class} function init(context: JContext; diskCacheName: JString; diskCacheSize: Integer): JInternalCacheDiskCacheFactory; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/InternalCacheDiskCacheFactory')]
  JInternalCacheDiskCacheFactory = interface(JDiskLruCacheFactory) // or JObject
  ['{EA4B5DC2-F097-47CB-9A0D-00C92F58B763}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJInternalCacheDiskCacheFactory = class(TJavaGenericImport<JInternalCacheDiskCacheFactoryClass, JInternalCacheDiskCacheFactory>) end;

  JLruCacheClass = interface(JObjectClass)
  ['{B2112639-76EA-4247-B048-9C43D0F05435}']
    { static Property Methods }

    { static Methods }
    {class} function init(size: Integer): JLruCache; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/LruCache')]
  JLruCache = interface(JObject)
  ['{2F335CDA-6D7B-4C01-A455-8B240CC37B78}']
    { Property Methods }

    { methods }
    procedure setSizeMultiplier(multiplier: Single); cdecl;
    function getMaxSize: Integer; cdecl;
    function getCurrentSize: Integer; cdecl;
    function contains(key: JObject): Boolean; cdecl;
    function get(key: JObject): JObject; cdecl;
    function put(key: JObject; item: JObject): JObject; cdecl;
    function remove(key: JObject): JObject; cdecl;
    procedure clearMemory; cdecl;

    { Property }
  end;

  TJLruCache = class(TJavaGenericImport<JLruCacheClass, JLruCache>) end;

  JLruResourceCacheClass = interface(JLruCacheClass) // or JObjectClass
  ['{74C04392-A076-4580-B5AB-450F8E0C3B23}']
    { static Property Methods }

    { static Methods }
    {class} function init(size: Integer): JLruResourceCache; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/LruResourceCache')]
  JLruResourceCache = interface(JLruCache) // or JObject
  ['{20CFC455-3DC4-4D72-B366-6D84945D870B}']
    { Property Methods }

    { methods }
    procedure setResourceRemovedListener(listener: JMemoryCache_ResourceRemovedListener); cdecl;
    procedure trimMemory(level: Integer); cdecl;
    function put(this: JKey; P2: JResource): JResource; cdecl;
    function remove(this: JKey): JResource; cdecl;

    { Property }
  end;

  TJLruResourceCache = class(TJavaGenericImport<JLruResourceCacheClass, JLruResourceCache>) end;

  JMemoryCache_ResourceRemovedListenerClass = interface(JObjectClass)
  ['{DEFFF57A-AC9D-455F-88BE-8970BC729461}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemoryCache$ResourceRemovedListener')]
  JMemoryCache_ResourceRemovedListener = interface(IJavaInstance)
  ['{AF2FE3CF-E68F-4031-B611-6D98C3AB1E10}']
    { Property Methods }

    { methods }
    procedure onResourceRemoved(P1: JResource); cdecl;

    { Property }
  end;

  TJMemoryCache_ResourceRemovedListener = class(TJavaGenericImport<JMemoryCache_ResourceRemovedListenerClass, JMemoryCache_ResourceRemovedListener>) end;

  JMemoryCacheClass = interface(JObjectClass)
  ['{972189D2-FF23-4370-884A-7603EE4350A6}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemoryCache')]
  JMemoryCache = interface(IJavaInstance)
  ['{B7DE0E60-D9FB-4417-BE1C-D0F086B28A40}']
    { Property Methods }

    { methods }
    function getCurrentSize: Integer; cdecl;
    function getMaxSize: Integer; cdecl;
    procedure setSizeMultiplier(P1: Single); cdecl;
    function remove(P1: JKey): JResource; cdecl;
    function put(P1: JKey; P2: JResource): JResource; cdecl;
    procedure setResourceRemovedListener(P1: JMemoryCache_ResourceRemovedListener); cdecl;
    procedure clearMemory; cdecl;
    procedure trimMemory(P1: Integer); cdecl;

    { Property }
  end;

  TJMemoryCache = class(TJavaGenericImport<JMemoryCacheClass, JMemoryCache>) end;

  JMemoryCacheAdapterClass = interface(JObjectClass)
  ['{75A2EBA0-75FC-4934-8B2D-2182BD35FF12}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMemoryCacheAdapter; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemoryCacheAdapter')]
  JMemoryCacheAdapter = interface(JObject)
  ['{E632739D-FB80-4312-A41E-662A3D06A9C4}']
    { Property Methods }

    { methods }
    function getCurrentSize: Integer; cdecl;
    function getMaxSize: Integer; cdecl;
    procedure setSizeMultiplier(multiplier: Single); cdecl;
    function remove(key: JKey): JResource; cdecl;
    function put(key: JKey; resource: JResource): JResource; cdecl;
    procedure setResourceRemovedListener(listener: JMemoryCache_ResourceRemovedListener); cdecl;
    procedure clearMemory; cdecl;
    procedure trimMemory(level: Integer); cdecl;

    { Property }
  end;

  TJMemoryCacheAdapter = class(TJavaGenericImport<JMemoryCacheAdapterClass, JMemoryCacheAdapter>) end;

  JMemorySizeCalculator_BuilderClass = interface(JObjectClass)
  ['{5CFB7683-0509-47B0-84F4-822B30A5DEC9}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMemorySizeCalculator_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemorySizeCalculator$Builder')]
  JMemorySizeCalculator_Builder = interface(JObject)
  ['{2AE30410-7E64-46C0-9D70-5FB7B25DF659}']
    { Property Methods }

    { methods }
    function setMemoryCacheScreens(memoryCacheScreens: Single): JMemorySizeCalculator_Builder; cdecl;
    function setBitmapPoolScreens(bitmapPoolScreens: Single): JMemorySizeCalculator_Builder; cdecl;
    function setMaxSizeMultiplier(maxSizeMultiplier: Single): JMemorySizeCalculator_Builder; cdecl;
    function setLowMemoryMaxSizeMultiplier(lowMemoryMaxSizeMultiplier: Single): JMemorySizeCalculator_Builder; cdecl;
    function setArrayPoolSize(arrayPoolSizeBytes: Integer): JMemorySizeCalculator_Builder; cdecl;
    function build: JMemorySizeCalculator; cdecl;

    { Property }
  end;

  TJMemorySizeCalculator_Builder = class(TJavaGenericImport<JMemorySizeCalculator_BuilderClass, JMemorySizeCalculator_Builder>) end;

  JMemorySizeCalculator_DisplayMetricsScreenDimensionsClass = interface(JObjectClass)
  ['{FA078CCE-D68C-4952-9E16-7025D8B619D1}']
    { static Property Methods }

    { static Methods }
    {class} function init(displayMetrics: JDisplayMetrics): JMemorySizeCalculator_DisplayMetricsScreenDimensions; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemorySizeCalculator$DisplayMetricsScreenDimensions')]
  JMemorySizeCalculator_DisplayMetricsScreenDimensions = interface(JObject)
  ['{FAE8EF57-23C1-48C5-9B79-9107390DD256}']
    { Property Methods }

    { methods }
    function getWidthPixels: Integer; cdecl;
    function getHeightPixels: Integer; cdecl;

    { Property }
  end;

  TJMemorySizeCalculator_DisplayMetricsScreenDimensions = class(TJavaGenericImport<JMemorySizeCalculator_DisplayMetricsScreenDimensionsClass, JMemorySizeCalculator_DisplayMetricsScreenDimensions>) end;

  JMemorySizeCalculator_ScreenDimensionsClass = interface(JObjectClass)
  ['{BCFC2D5D-2EBE-47F5-9578-223486C97B0C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemorySizeCalculator$ScreenDimensions')]
  JMemorySizeCalculator_ScreenDimensions = interface(IJavaInstance)
  ['{C31309A3-5059-45B9-B804-DBB5A6F26302}']
    { Property Methods }

    { methods }
    function getWidthPixels: Integer; cdecl;
    function getHeightPixels: Integer; cdecl;

    { Property }
  end;

  TJMemorySizeCalculator_ScreenDimensions = class(TJavaGenericImport<JMemorySizeCalculator_ScreenDimensionsClass, JMemorySizeCalculator_ScreenDimensions>) end;

  JMemorySizeCalculatorClass = interface(JObjectClass)
  ['{1CA68C57-2BC6-4A0A-A464-59644185D749}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/MemorySizeCalculator')]
  JMemorySizeCalculator = interface(JObject)
  ['{1A6EA54B-3E10-4BF6-9622-6435660D1455}']
    { Property Methods }

    { methods }
    function getMemoryCacheSize: Integer; cdecl;
    function getBitmapPoolSize: Integer; cdecl;
    function getArrayPoolSizeInBytes: Integer; cdecl;

    { Property }
  end;

  TJMemorySizeCalculator = class(TJavaGenericImport<JMemorySizeCalculatorClass, JMemorySizeCalculator>) end;

//  JSafeKeyGenerator_1Class = interface(JObjectClass)
//  ['{6E43C906-A86B-4F21-847D-A3364F72D5EA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/cache/SafeKeyGenerator$1')]
//  JSafeKeyGenerator_1 = interface(JObject)
//  ['{2A234F50-8238-4E6A-A86E-3BC3BED1FCE0}']
//    { Property Methods }
//
//    { methods }
//    function create: JSafeKeyGenerator_PoolableDigestContainer; cdecl; overload;
//    function create: JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJSafeKeyGenerator_1 = class(TJavaGenericImport<JSafeKeyGenerator_1Class, JSafeKeyGenerator_1>) end;

  JSafeKeyGenerator_PoolableDigestContainerClass = interface(JObjectClass)
  ['{5EEC53BB-BFBC-4F16-B842-81636D7EE03E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/SafeKeyGenerator$PoolableDigestContainer')]
  JSafeKeyGenerator_PoolableDigestContainer = interface(JObject)
  ['{8697A2AA-A73C-4531-9370-4A4B3FE64890}']
    { Property Methods }

    { methods }
    function getVerifier: JStateVerifier; cdecl;

    { Property }
  end;

  TJSafeKeyGenerator_PoolableDigestContainer = class(TJavaGenericImport<JSafeKeyGenerator_PoolableDigestContainerClass, JSafeKeyGenerator_PoolableDigestContainer>) end;

  JSafeKeyGeneratorClass = interface(JObjectClass)
  ['{63CBF472-2A07-4BE6-8D57-56C116A6D2C6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSafeKeyGenerator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/cache/SafeKeyGenerator')]
  JSafeKeyGenerator = interface(JObject)
  ['{75623A9D-D0B5-4C6C-BFCE-EA1CE87254C0}']
    { Property Methods }

    { methods }
    function getSafeKey(key: JKey): JString; cdecl;

    { Property }
  end;

  TJSafeKeyGenerator = class(TJavaGenericImport<JSafeKeyGeneratorClass, JSafeKeyGenerator>) end;

  JDataCacheGeneratorClass = interface(JObjectClass)
  ['{350F7374-E623-4B39-AFAD-F666E0BED757}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataCacheGenerator')]
  JDataCacheGenerator = interface(JObject)
  ['{BA1F10DF-6886-4648-A85F-A8623FEC9F92}']
    { Property Methods }

    { methods }
    function startNext: Boolean; cdecl;
    procedure cancel; cdecl;
    procedure onDataReady(data: JObject); cdecl;
    procedure onLoadFailed(e: JException); cdecl;

    { Property }
  end;

  TJDataCacheGenerator = class(TJavaGenericImport<JDataCacheGeneratorClass, JDataCacheGenerator>) end;

  JDataCacheKeyClass = interface(JObjectClass)
  ['{269FC9C9-B454-4EE7-B18E-D87BEAAD49DD}']
    { static Property Methods }

    { static Methods }
    {class} function init(sourceKey: JKey; signature: JKey): JDataCacheKey; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataCacheKey')]
  JDataCacheKey = interface(JObject)
  ['{FAD9F6F8-26F7-458E-858D-D2CD6D6750C6}']
    { Property Methods }

    { methods }
    function getSourceKey: JKey; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJDataCacheKey = class(TJavaGenericImport<JDataCacheKeyClass, JDataCacheKey>) end;

  JDataCacheWriterClass = interface(JObjectClass)
  ['{3BCFCF29-6987-40C8-B222-A3DB5C6F8132}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataCacheWriter')]
  JDataCacheWriter = interface(JObject)
  ['{AE207C21-7B3C-42DF-BA53-03E15818EA85}']
    { Property Methods }

    { methods }
    function write(afile: JFile): Boolean; cdecl;

    { Property }
  end;

  TJDataCacheWriter = class(TJavaGenericImport<JDataCacheWriterClass, JDataCacheWriter>) end;

  JDataFetcherGenerator_FetcherReadyCallbackClass = interface(JObjectClass)
  ['{D957C574-1A03-4728-BAA6-061424C00066}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataFetcherGenerator$FetcherReadyCallback')]
  JDataFetcherGenerator_FetcherReadyCallback = interface(IJavaInstance)
  ['{EBF61121-ED83-4EEB-827F-5A0D2D7B8FA3}']
    { Property Methods }

    { methods }
    procedure reschedule; cdecl;
    procedure onDataFetcherReady(P1: JKey; P2: JObject; P3: JDataFetcher; P4: JDataSource; P5: JKey); cdecl;
    procedure onDataFetcherFailed(P1: JKey; P2: JException; P3: JDataFetcher; P4: JDataSource); cdecl;

    { Property }
  end;

  TJDataFetcherGenerator_FetcherReadyCallback = class(TJavaGenericImport<JDataFetcherGenerator_FetcherReadyCallbackClass, JDataFetcherGenerator_FetcherReadyCallback>) end;

  JDataFetcherGeneratorClass = interface(JObjectClass)
  ['{AFD5FC41-6D41-417E-A279-08F43A290CFD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DataFetcherGenerator')]
  JDataFetcherGenerator = interface(IJavaInstance)
  ['{D8CB7E78-35D3-41AE-8353-CCB412F93163}']
    { Property Methods }

    { methods }
    function startNext: Boolean; cdecl;
    procedure cancel; cdecl;

    { Property }
  end;

  TJDataFetcherGenerator = class(TJavaGenericImport<JDataFetcherGeneratorClass, JDataFetcherGenerator>) end;

  JDecodeHelperClass = interface(JObjectClass)
  ['{5249BC1E-A152-4AB4-A1C0-C1FECB37E696}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeHelper')]
  JDecodeHelper = interface(JObject)
  ['{812E12D0-DC4D-4639-8EFF-8BED9F27C783}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeHelper = class(TJavaGenericImport<JDecodeHelperClass, JDecodeHelper>) end;

//  JDecodeJob_1Class = interface(JObjectClass)
//  ['{5CA94882-C827-4679-8E00-8EF9043AAA22}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$1')]
//  JDecodeJob_1 = interface(JObject)
//  ['{1B28E489-4ACE-4F75-9297-281CB113727D}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJDecodeJob_1 = class(TJavaGenericImport<JDecodeJob_1Class, JDecodeJob_1>) end;

  JDecodeJob_CallbackClass = interface(JObjectClass)
  ['{2A357BEA-56F0-44B7-8FB0-9188B5C9A664}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$Callback')]
  JDecodeJob_Callback = interface(IJavaInstance)
  ['{8F794DCE-B436-436C-8C06-A7734876FCEC}']
    { Property Methods }

    { methods }
    procedure onResourceReady(P1: JResource; P2: JDataSource); cdecl;
    procedure onLoadFailed(P1: JGlideException); cdecl;
    procedure reschedule(P1: JDecodeJob); cdecl;

    { Property }
  end;

  TJDecodeJob_Callback = class(TJavaGenericImport<JDecodeJob_CallbackClass, JDecodeJob_Callback>) end;

  JDecodeJob_DecodeCallbackClass = interface(JObjectClass)
  ['{2C29E52E-2F77-4B15-940C-8F1D7FA5358A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$DecodeCallback')]
  JDecodeJob_DecodeCallback = interface(JObject)
  ['{CD9E2D80-2948-446C-B7BA-85F09554631D}']
    { Property Methods }

    { methods }
    function onResourceDecoded(decoded: JResource): JResource; cdecl;

    { Property }
  end;

  TJDecodeJob_DecodeCallback = class(TJavaGenericImport<JDecodeJob_DecodeCallbackClass, JDecodeJob_DecodeCallback>) end;

  JDecodeJob_DeferredEncodeManagerClass = interface(JObjectClass)
  ['{884151DC-73BE-4672-A02A-339935274B8D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$DeferredEncodeManager')]
  JDecodeJob_DeferredEncodeManager = interface(JObject)
  ['{53A01BD0-CB87-41FD-9734-F5AFF0D735AC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeJob_DeferredEncodeManager = class(TJavaGenericImport<JDecodeJob_DeferredEncodeManagerClass, JDecodeJob_DeferredEncodeManager>) end;

  JDecodeJob_DiskCacheProviderClass = interface(JObjectClass)
  ['{5B7B7FE7-AD55-4470-BAE7-58FCA8125C68}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$DiskCacheProvider')]
  JDecodeJob_DiskCacheProvider = interface(IJavaInstance)
  ['{B93D5932-5EC2-4D19-B3E0-5572F4BDF3F9}']
    { Property Methods }

    { methods }
    function getDiskCache: JDiskCache; cdecl;

    { Property }
  end;

  TJDecodeJob_DiskCacheProvider = class(TJavaGenericImport<JDecodeJob_DiskCacheProviderClass, JDecodeJob_DiskCacheProvider>) end;

  JDecodeJob_ReleaseManagerClass = interface(JObjectClass)
  ['{55E776E1-E7A1-4C03-9A0B-52766A406E5F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$ReleaseManager')]
  JDecodeJob_ReleaseManager = interface(JObject)
  ['{28202A15-F98A-4CBB-A2D1-50718AD9C43C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeJob_ReleaseManager = class(TJavaGenericImport<JDecodeJob_ReleaseManagerClass, JDecodeJob_ReleaseManager>) end;

  JDecodeJob_RunReasonClass = interface(JEnumClass) // or JObjectClass
  ['{7848B111-2A03-477A-ABF8-A79B6AECEDDE}']
    { static Property Methods }
    {class} function _GetINITIALIZE: JDecodeJob_RunReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSWITCH_TO_SOURCE_SERVICE: JDecodeJob_RunReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDECODE_DATA: JDecodeJob_RunReason;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodeJob_RunReason>; cdecl;
    {class} function valueOf(name: JString): JDecodeJob_RunReason; cdecl;

    { static Property }
    {class} property INITIALIZE: JDecodeJob_RunReason read _GetINITIALIZE;
    {class} property SWITCH_TO_SOURCE_SERVICE: JDecodeJob_RunReason read _GetSWITCH_TO_SOURCE_SERVICE;
    {class} property DECODE_DATA: JDecodeJob_RunReason read _GetDECODE_DATA;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$RunReason')]
  JDecodeJob_RunReason = interface(JEnum) // or JObject
  ['{B9F4F1F2-630F-47F9-A82E-275A7FA7FCE0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeJob_RunReason = class(TJavaGenericImport<JDecodeJob_RunReasonClass, JDecodeJob_RunReason>) end;

  JDecodeJob_StageClass = interface(JEnumClass) // or JObjectClass
  ['{9297A2AD-8AF6-4C08-940F-DFB16015676E}']
    { static Property Methods }
    {class} function _GetINITIALIZE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESOURCE_CACHE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA_CACHE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetSOURCE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetENCODE: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFINISHED: JDecodeJob_Stage;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDecodeJob_Stage>; cdecl;
    {class} function valueOf(name: JString): JDecodeJob_Stage; cdecl;

    { static Property }
    {class} property INITIALIZE: JDecodeJob_Stage read _GetINITIALIZE;
    {class} property RESOURCE_CACHE: JDecodeJob_Stage read _GetRESOURCE_CACHE;
    {class} property DATA_CACHE: JDecodeJob_Stage read _GetDATA_CACHE;
    {class} property SOURCE: JDecodeJob_Stage read _GetSOURCE;
    {class} property ENCODE: JDecodeJob_Stage read _GetENCODE;
    {class} property FINISHED: JDecodeJob_Stage read _GetFINISHED;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob$Stage')]
  JDecodeJob_Stage = interface(JEnum) // or JObject
  ['{6CA67A56-EBED-445B-81B0-37175A5B26BF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDecodeJob_Stage = class(TJavaGenericImport<JDecodeJob_StageClass, JDecodeJob_Stage>) end;

  JDecodeJobClass = interface(JObjectClass)
  ['{D02BF2ED-70AC-4839-9897-6E5F91A80150}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodeJob')]
  JDecodeJob = interface(JObject)
  ['{D5EB8124-E498-4D8B-A260-9DED3DFD3FCD}']
    { Property Methods }

    { methods }
    function compareTo(other: JDecodeJob): Integer; cdecl; overload;
    procedure cancel; cdecl;
    procedure run; cdecl;
    procedure reschedule; cdecl;
    procedure onDataFetcherReady(sourceKey: JKey; data: JObject; fetcher: JDataFetcher; dataSource: JDataSource; attemptedKey: JKey); cdecl;
    procedure onDataFetcherFailed(attemptedKey: JKey; e: JException; fetcher: JDataFetcher; dataSource: JDataSource); cdecl;
    function getVerifier: JStateVerifier; cdecl;
    function compareTo(this: JObject): Integer; cdecl; overload;

    { Property }
  end;

  TJDecodeJob = class(TJavaGenericImport<JDecodeJobClass, JDecodeJob>) end;

  JDecodePath_DecodeCallbackClass = interface(JObjectClass)
  ['{57CF0450-59E2-4AB9-A65F-3FBF816DF01A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodePath$DecodeCallback')]
  JDecodePath_DecodeCallback = interface(IJavaInstance)
  ['{D87393A4-8D6F-4C90-A404-47F58DD8ECA7}']
    { Property Methods }

    { methods }
    function onResourceDecoded(P1: JResource): JResource; cdecl;

    { Property }
  end;

  TJDecodePath_DecodeCallback = class(TJavaGenericImport<JDecodePath_DecodeCallbackClass, JDecodePath_DecodeCallback>) end;

  JDecodePathClass = interface(JObjectClass)
  ['{5BCC3672-A8A1-49F7-BF14-6649ED1AFE5B}']
    { static Property Methods }

    { static Methods }
//    {class} function init(dataClass: JClass; resourceClass: JClass; transcodeClass: JClass; decoders: JList; transcoder: JResourceTranscoder; listPool: JPools_Pool): JDecodePath; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DecodePath')]
  JDecodePath = interface(JObject)
  ['{A7679D07-DC43-4B22-B8CF-3F10E6BBAC54}']
    { Property Methods }

    { methods }
    function decode(rewinder: JDataRewinder; width: Integer; height: Integer; options: JOptions; callback: JDecodePath_DecodeCallback): JResource; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJDecodePath = class(TJavaGenericImport<JDecodePathClass, JDecodePath>) end;

  JDiskCacheStrategyClass = interface(JObjectClass)
  ['{FBA8FD45-AB4F-43A8-B1FC-BD5C6B825D80}']
    { static Property Methods }
    {class} function _GetALL: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNONE: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDATA: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRESOURCE: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAUTOMATIC: JDiskCacheStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDiskCacheStrategy; cdecl;

    { static Property }
    {class} property ALL: JDiskCacheStrategy read _GetALL;
    {class} property NONE: JDiskCacheStrategy read _GetNONE;
    {class} property DATA: JDiskCacheStrategy read _GetDATA;
    {class} property RESOURCE: JDiskCacheStrategy read _GetRESOURCE;
    {class} property AUTOMATIC: JDiskCacheStrategy read _GetAUTOMATIC;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/DiskCacheStrategy')]
  JDiskCacheStrategy = interface(JObject)
  ['{88FB1FE9-13A3-459C-8AA8-3022F1EEA047}']
    { Property Methods }

    { methods }
    function isDataCacheable(P1: JDataSource): Boolean; cdecl;
    function isResourceCacheable(P1: Boolean; P2: JDataSource; P3: JEncodeStrategy): Boolean; cdecl;
    function decodeCachedResource: Boolean; cdecl;
    function decodeCachedData: Boolean; cdecl;

    { Property }
  end;

  TJDiskCacheStrategy = class(TJavaGenericImport<JDiskCacheStrategyClass, JDiskCacheStrategy>) end;

//  JDiskCacheStrategy_1Class = interface(JDiskCacheStrategyClass) // or JObjectClass
//  ['{89D98495-D7E7-4FD3-AB61-4D7BF276781B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/DiskCacheStrategy$1')]
//  JDiskCacheStrategy_1 = interface(JDiskCacheStrategy) // or JObject
//  ['{04FC7198-FFB8-4678-9D48-F2DFD5B189E9}']
//    { Property Methods }
//
//    { methods }
//    function isDataCacheable(dataSource: JDataSource): Boolean; cdecl;
//    function isResourceCacheable(isFromAlternateCacheKey: Boolean; dataSource: JDataSource; encodeStrategy: JEncodeStrategy): Boolean; cdecl;
//    function decodeCachedResource: Boolean; cdecl;
//    function decodeCachedData: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDiskCacheStrategy_1 = class(TJavaGenericImport<JDiskCacheStrategy_1Class, JDiskCacheStrategy_1>) end;

//  JDiskCacheStrategy_2Class = interface(JDiskCacheStrategyClass) // or JObjectClass
//  ['{0AD93CD6-A20A-49E5-B821-329B75851E33}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/DiskCacheStrategy$2')]
//  JDiskCacheStrategy_2 = interface(JDiskCacheStrategy) // or JObject
//  ['{6184284A-43A1-4F9D-8EF7-9DDB2126A3F8}']
//    { Property Methods }
//
//    { methods }
//    function isDataCacheable(dataSource: JDataSource): Boolean; cdecl;
//    function isResourceCacheable(isFromAlternateCacheKey: Boolean; dataSource: JDataSource; encodeStrategy: JEncodeStrategy): Boolean; cdecl;
//    function decodeCachedResource: Boolean; cdecl;
//    function decodeCachedData: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDiskCacheStrategy_2 = class(TJavaGenericImport<JDiskCacheStrategy_2Class, JDiskCacheStrategy_2>) end;

//  JDiskCacheStrategy_3Class = interface(JDiskCacheStrategyClass) // or JObjectClass
//  ['{8DF6D6E4-5BFA-4659-9379-D8C5CE19810C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/DiskCacheStrategy$3')]
//  JDiskCacheStrategy_3 = interface(JDiskCacheStrategy) // or JObject
//  ['{080F8DDB-AF10-419F-A57A-138664D0E1DB}']
//    { Property Methods }
//
//    { methods }
//    function isDataCacheable(dataSource: JDataSource): Boolean; cdecl;
//    function isResourceCacheable(isFromAlternateCacheKey: Boolean; dataSource: JDataSource; encodeStrategy: JEncodeStrategy): Boolean; cdecl;
//    function decodeCachedResource: Boolean; cdecl;
//    function decodeCachedData: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDiskCacheStrategy_3 = class(TJavaGenericImport<JDiskCacheStrategy_3Class, JDiskCacheStrategy_3>) end;

//  JDiskCacheStrategy_4Class = interface(JDiskCacheStrategyClass) // or JObjectClass
//  ['{FE5A07FB-EAEC-4F56-9532-BEB88B9A6F6D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/DiskCacheStrategy$4')]
//  JDiskCacheStrategy_4 = interface(JDiskCacheStrategy) // or JObject
//  ['{7FA05FC7-975B-483B-A932-16943008878C}']
//    { Property Methods }
//
//    { methods }
//    function isDataCacheable(dataSource: JDataSource): Boolean; cdecl;
//    function isResourceCacheable(isFromAlternateCacheKey: Boolean; dataSource: JDataSource; encodeStrategy: JEncodeStrategy): Boolean; cdecl;
//    function decodeCachedResource: Boolean; cdecl;
//    function decodeCachedData: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDiskCacheStrategy_4 = class(TJavaGenericImport<JDiskCacheStrategy_4Class, JDiskCacheStrategy_4>) end;

//  JDiskCacheStrategy_5Class = interface(JDiskCacheStrategyClass) // or JObjectClass
//  ['{A2EA557E-165B-43D1-923B-CCB4835E18FA}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/DiskCacheStrategy$5')]
//  JDiskCacheStrategy_5 = interface(JDiskCacheStrategy) // or JObject
//  ['{DB02A1E8-8D0E-4174-9600-9FDF8E05153A}']
//    { Property Methods }
//
//    { methods }
//    function isDataCacheable(dataSource: JDataSource): Boolean; cdecl;
//    function isResourceCacheable(isFromAlternateCacheKey: Boolean; dataSource: JDataSource; encodeStrategy: JEncodeStrategy): Boolean; cdecl;
//    function decodeCachedResource: Boolean; cdecl;
//    function decodeCachedData: Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJDiskCacheStrategy_5 = class(TJavaGenericImport<JDiskCacheStrategy_5Class, JDiskCacheStrategy_5>) end;

//  JEngine_DecodeJobFactory_1Class = interface(JObjectClass)
//  ['{BC5924A7-AFA2-4521-8657-628AAE97920C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/Engine$DecodeJobFactory$1')]
//  JEngine_DecodeJobFactory_1 = interface(JObject)
//  ['{2197581F-85EE-4E63-B307-90AA19502E00}']
//    { Property Methods }
//
//    { methods }
//    function create: JDecodeJob; cdecl; overload;
//    function create: JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJEngine_DecodeJobFactory_1 = class(TJavaGenericImport<JEngine_DecodeJobFactory_1Class, JEngine_DecodeJobFactory_1>) end;

  JEngine_DecodeJobFactoryClass = interface(JObjectClass)
  ['{FB675FFF-3C33-4625-B53E-5F558E125ABB}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$DecodeJobFactory')]
  JEngine_DecodeJobFactory = interface(JObject)
  ['{2E6F2507-6041-4864-AC3E-F24C01E193CB}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEngine_DecodeJobFactory = class(TJavaGenericImport<JEngine_DecodeJobFactoryClass, JEngine_DecodeJobFactory>) end;

//  JEngine_EngineJobFactory_1Class = interface(JObjectClass)
//  ['{2B44F2F8-BA6D-4C58-B23A-5B4B45AF5590}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/Engine$EngineJobFactory$1')]
//  JEngine_EngineJobFactory_1 = interface(JObject)
//  ['{47AC96D2-61B5-46CA-B518-C52E4635F10F}']
//    { Property Methods }
//
//    { methods }
//    function create: JEngineJob; cdecl; overload;
//    function create: JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJEngine_EngineJobFactory_1 = class(TJavaGenericImport<JEngine_EngineJobFactory_1Class, JEngine_EngineJobFactory_1>) end;

  JEngine_EngineJobFactoryClass = interface(JObjectClass)
  ['{52DD0E0C-4620-4599-ADC0-89D9437177FF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$EngineJobFactory')]
  JEngine_EngineJobFactory = interface(JObject)
  ['{42D55A68-E2E6-4F29-917C-D441B0AA5AB8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJEngine_EngineJobFactory = class(TJavaGenericImport<JEngine_EngineJobFactoryClass, JEngine_EngineJobFactory>) end;

  JEngine_LazyDiskCacheProviderClass = interface(JObjectClass)
  ['{2A1197C8-4E62-41BE-9DE0-CB790A410D9C}']
    { static Property Methods }

    { static Methods }
    {class} function init(factory: JDiskCache_Factory): JEngine_LazyDiskCacheProvider; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$LazyDiskCacheProvider')]
  JEngine_LazyDiskCacheProvider = interface(JObject)
  ['{8521A371-7ABD-4C6E-99FC-2154C1A98543}']
    { Property Methods }

    { methods }
    function getDiskCache: JDiskCache; cdecl;

    { Property }
  end;

  TJEngine_LazyDiskCacheProvider = class(TJavaGenericImport<JEngine_LazyDiskCacheProviderClass, JEngine_LazyDiskCacheProvider>) end;

  JEngine_LoadStatusClass = interface(JObjectClass)
  ['{A285F903-4A51-43BF-BA1C-78E3476DB12C}']
    { static Property Methods }

    { static Methods }
    {class} function init(cb: JResourceCallback; engineJob: JEngineJob): JEngine_LoadStatus; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$LoadStatus')]
  JEngine_LoadStatus = interface(JObject)
  ['{D17366B2-398E-449A-8ECE-8F30FD25995D}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl;

    { Property }
  end;

  TJEngine_LoadStatus = class(TJavaGenericImport<JEngine_LoadStatusClass, JEngine_LoadStatus>) end;

  JEngine_RefQueueIdleHandlerClass = interface(JObjectClass)
  ['{3686EB68-BA88-4B73-8F6A-0F0637DDCF9C}']
    { static Property Methods }

    { static Methods }
//    {class} function init(activeResources: JMap; P2: JReferenceQueue): JEngine_RefQueueIdleHandler; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine$RefQueueIdleHandler')]
  JEngine_RefQueueIdleHandler = interface(JObject)
  ['{88DC139E-9D86-4B65-BB62-236CD4E9F571}']
    { Property Methods }

    { methods }
    function queueIdle: Boolean; cdecl;

    { Property }
  end;

  TJEngine_RefQueueIdleHandler = class(TJavaGenericImport<JEngine_RefQueueIdleHandlerClass, JEngine_RefQueueIdleHandler>) end;

//  JEngine_ResourceWeakReferenceClass = interface(JWeakReferenceClass) // or JObjectClass
//  ['{DF8F574C-048C-45F4-B220-89B5617B60E6}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(key: JKey; r: JEngineResource; P3: JReferenceQueue): JEngine_ResourceWeakReference; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/Engine$ResourceWeakReference')]
//  JEngine_ResourceWeakReference = interface(JWeakReference) // or JObject
//  ['{4335DB04-5E47-45EE-B566-1CAD08B2F6FB}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJEngine_ResourceWeakReference = class(TJavaGenericImport<JEngine_ResourceWeakReferenceClass, JEngine_ResourceWeakReference>) end;

  JEngineClass = interface(JObjectClass)
  ['{238B69EF-7B5D-49A0-9C7B-BF6DC8310098}']
    { static Property Methods }

    { static Methods }
    {class} function init(memoryCache: JMemoryCache; diskCacheFactory: JDiskCache_Factory; diskCacheExecutor: JGlideExecutor; sourceExecutor: JGlideExecutor; sourceUnlimitedExecutor: JGlideExecutor): JEngine; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Engine')]
  JEngine = interface(JObject)
  ['{AC172028-CA17-4392-B888-722F20FD4FC5}']
    { Property Methods }

    { methods }
//    function load(glideContext: JGlideContext; model: JObject; signature: JKey; width: Integer; height: Integer; resourceClass: JClass; P7: JClass; transcodeClass: JPriority; diskCacheStrategy: JDiskCacheStrategy; transformations: JMap; P11: Boolean; options: JOptions; isMemoryCacheable: Boolean; useUnlimitedSourceExecutorPool: Boolean; onlyRetrieveFromCache: Boolean; cb: JResourceCallback): JEngine_LoadStatus; cdecl;
    procedure release(resource: JResource); cdecl;
    procedure onEngineJobComplete(key: JKey; resource: JEngineResource); cdecl;
    procedure onEngineJobCancelled(engineJob: JEngineJob; key: JKey); cdecl;
    procedure onResourceRemoved(resource: JResource); cdecl;
    procedure onResourceReleased(cacheKey: JKey; resource: JEngineResource); cdecl;
    procedure clearDiskCache; cdecl;

    { Property }
  end;

  TJEngine = class(TJavaGenericImport<JEngineClass, JEngine>) end;

  JEngineJob_EngineResourceFactoryClass = interface(JObjectClass)
  ['{A5A96464-CDFD-4282-BCC7-F9ED36F02742}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineJob$EngineResourceFactory')]
  JEngineJob_EngineResourceFactory = interface(JObject)
  ['{58AD8599-C50E-4E5C-8F5B-A6852FF854C9}']
    { Property Methods }

    { methods }
    function build(resource: JResource; P2: Boolean): JEngineResource; cdecl;

    { Property }
  end;

  TJEngineJob_EngineResourceFactory = class(TJavaGenericImport<JEngineJob_EngineResourceFactoryClass, JEngineJob_EngineResourceFactory>) end;

  JEngineJob_MainThreadCallbackClass = interface(JObjectClass)
  ['{98F19C70-6208-4099-B896-C07B7AA0589B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineJob$MainThreadCallback')]
  JEngineJob_MainThreadCallback = interface(JObject)
  ['{527BB7BB-F11C-41F7-9F72-F57E8CD64A89}']
    { Property Methods }

    { methods }
    function handleMessage(amessage: JMessage): Boolean; cdecl;

    { Property }
  end;

  TJEngineJob_MainThreadCallback = class(TJavaGenericImport<JEngineJob_MainThreadCallbackClass, JEngineJob_MainThreadCallback>) end;

  JEngineJobClass = interface(JObjectClass)
  ['{289A9DD8-4E10-4897-B565-5C9C8E3E3E91}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineJob')]
  JEngineJob = interface(JObject)
  ['{A9DFBCE7-D1E6-4364-BC77-CC3D36A63248}']
    { Property Methods }

    { methods }
    procedure start(decodeJob: JDecodeJob); cdecl;
    procedure addCallback(cb: JResourceCallback); cdecl;
    procedure removeCallback(cb: JResourceCallback); cdecl;
    procedure onResourceReady(resource: JResource; dataSource: JDataSource); cdecl;
    procedure onLoadFailed(e: JGlideException); cdecl;
    procedure reschedule(job: JDecodeJob); cdecl;
    function getVerifier: JStateVerifier; cdecl;

    { Property }
  end;

  TJEngineJob = class(TJavaGenericImport<JEngineJobClass, JEngineJob>) end;

  JEngineJobListenerClass = interface(JObjectClass)
  ['{DD7EB74C-94BF-46BB-8487-1AA46A8BA936}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineJobListener')]
  JEngineJobListener = interface(IJavaInstance)
  ['{B1F655FB-51EE-4A27-982F-F5AA3EE58F58}']
    { Property Methods }

    { methods }
    procedure onEngineJobComplete(P1: JKey; P2: JEngineResource); cdecl;
    procedure onEngineJobCancelled(P1: JEngineJob; P2: JKey); cdecl;

    { Property }
  end;

  TJEngineJobListener = class(TJavaGenericImport<JEngineJobListenerClass, JEngineJobListener>) end;

  JEngineKeyClass = interface(JObjectClass)
  ['{9A74DC21-9CDA-4AFE-88BD-97F05D52BBF0}']
    { static Property Methods }

    { static Methods }
//    {class} function init(model: JObject; signature: JKey; width: Integer; height: Integer; transformations: JMap; P6: JClass; resourceClass: JClass; transcodeClass: JOptions): JEngineKey; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineKey')]
  JEngineKey = interface(JObject)
  ['{EC419D45-ECB4-4EBC-A159-60992A62E283}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJEngineKey = class(TJavaGenericImport<JEngineKeyClass, JEngineKey>) end;

  JEngineKeyFactoryClass = interface(JObjectClass)
  ['{21B86CA1-1F86-4D6E-A3CE-D934773A17A8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineKeyFactory')]
  JEngineKeyFactory = interface(JObject)
  ['{A193E864-504A-4FC4-928A-6E3EB551EE39}']
    { Property Methods }

    { methods }
//    function buildKey(model: JObject; signature: JKey; width: Integer; height: Integer; transformations: JMap; P6: JClass; resourceClass: JClass; transcodeClass: JOptions): JEngineKey; cdecl;

    { Property }
  end;

  TJEngineKeyFactory = class(TJavaGenericImport<JEngineKeyFactoryClass, JEngineKeyFactory>) end;

  JEngineResource_ResourceListenerClass = interface(JObjectClass)
  ['{5181A49D-CE09-4C4B-A675-0C2D8CC8F698}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineResource$ResourceListener')]
  JEngineResource_ResourceListener = interface(IJavaInstance)
  ['{B0A78A81-4E06-4939-A080-B6B5CBE4F876}']
    { Property Methods }

    { methods }
    procedure onResourceReleased(P1: JKey; P2: JEngineResource); cdecl;

    { Property }
  end;

  TJEngineResource_ResourceListener = class(TJavaGenericImport<JEngineResource_ResourceListenerClass, JEngineResource_ResourceListener>) end;

  JEngineResourceClass = interface(JObjectClass)
  ['{AB009E69-01E5-4B74-9C29-ABC44B75C0FA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/EngineResource')]
  JEngineResource = interface(JObject)
  ['{B31BD09B-C322-4387-B84A-F96CE61F9808}']
    { Property Methods }

    { methods }
//    function getResourceClass: JClass; cdecl;
    function get: JObject; cdecl;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJEngineResource = class(TJavaGenericImport<JEngineResourceClass, JEngineResource>) end;

//  JGlideExecutor_1Class = interface(JObjectClass)
//  ['{0B83E8DC-3F7E-4D6D-9201-EF547B62C3D1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor$1')]
//  JGlideExecutor_1 = interface(JObject)
//  ['{4B4060F3-4C92-443C-A829-454ADD7BE6F7}']
//    { Property Methods }
//
//    { methods }
//    function accept(afile: JFile; s: JString): Boolean; cdecl;
//
//    { Property }
//  end;
//
//  TJGlideExecutor_1 = class(TJavaGenericImport<JGlideExecutor_1Class, JGlideExecutor_1>) end;

//  JGlideExecutor_DefaultThreadFactory_1Class = interface(JThreadClass) // or JObjectClass
//  ['{33ECD1AE-5A7C-4DD1-8C9E-CBE4D002C41A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory$1')]
//  JGlideExecutor_DefaultThreadFactory_1 = interface(JThread) // or JObject
//  ['{0CC84595-2735-4477-9E2F-274ABA041898}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJGlideExecutor_DefaultThreadFactory_1 = class(TJavaGenericImport<JGlideExecutor_DefaultThreadFactory_1Class, JGlideExecutor_DefaultThreadFactory_1>) end;

  JGlideExecutor_DefaultThreadFactoryClass = interface(JObjectClass)
  ['{081A6F85-72F5-4731-B83B-91D87E510DFF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor$DefaultThreadFactory')]
  JGlideExecutor_DefaultThreadFactory = interface(JObject)
  ['{3A087F6D-01C6-4C8B-9704-21B877499DE3}']
    { Property Methods }

    { methods }
    function newThread(runnable: JRunnable): JThread; cdecl;

    { Property }
  end;

  TJGlideExecutor_DefaultThreadFactory = class(TJavaGenericImport<JGlideExecutor_DefaultThreadFactoryClass, JGlideExecutor_DefaultThreadFactory>) end;

  JGlideExecutor_UncaughtThrowableStrategyClass = interface(JEnumClass) // or JObjectClass
  ['{1E47DA19-BADF-435C-AF0A-207914D1D60A}']
    { static Property Methods }
    {class} function _GetIGNORE: JGlideExecutor_UncaughtThrowableStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOG: JGlideExecutor_UncaughtThrowableStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTHROW: JGlideExecutor_UncaughtThrowableStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT: JGlideExecutor_UncaughtThrowableStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JGlideExecutor_UncaughtThrowableStrategy>; cdecl;
    {class} function valueOf(name: JString): JGlideExecutor_UncaughtThrowableStrategy; cdecl;

    { static Property }
    {class} property IGNORE: JGlideExecutor_UncaughtThrowableStrategy read _GetIGNORE;
    {class} property LOG: JGlideExecutor_UncaughtThrowableStrategy read _GetLOG;
    {class} property THROW: JGlideExecutor_UncaughtThrowableStrategy read _GetTHROW;
    {class} property DEFAULT: JGlideExecutor_UncaughtThrowableStrategy read _GetDEFAULT;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy')]
  JGlideExecutor_UncaughtThrowableStrategy = interface(JEnum) // or JObject
  ['{DA96A2C4-616F-40B4-9FF3-9EDD6C45A7F3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGlideExecutor_UncaughtThrowableStrategy = class(TJavaGenericImport<JGlideExecutor_UncaughtThrowableStrategyClass, JGlideExecutor_UncaughtThrowableStrategy>) end;

//  JGlideExecutor_UncaughtThrowableStrategy_1Class = interface(JGlideExecutor_UncaughtThrowableStrategyClass) // or JObjectClass
//  ['{C0236F6D-2B57-4EBB-9C00-B2961757DC6C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy$1')]
//  JGlideExecutor_UncaughtThrowableStrategy_1 = interface(JGlideExecutor_UncaughtThrowableStrategy) // or JObject
//  ['{BEB33237-D540-451F-946A-B4F22D68699F}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJGlideExecutor_UncaughtThrowableStrategy_1 = class(TJavaGenericImport<JGlideExecutor_UncaughtThrowableStrategy_1Class, JGlideExecutor_UncaughtThrowableStrategy_1>) end;

//  JGlideExecutor_UncaughtThrowableStrategy_2Class = interface(JGlideExecutor_UncaughtThrowableStrategyClass) // or JObjectClass
//  ['{597CFB60-847C-4044-AE0B-1E113A00BD0D}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor$UncaughtThrowableStrategy$2')]
//  JGlideExecutor_UncaughtThrowableStrategy_2 = interface(JGlideExecutor_UncaughtThrowableStrategy) // or JObject
//  ['{FF1ACF0D-7393-400B-BF92-E80100FB65B0}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJGlideExecutor_UncaughtThrowableStrategy_2 = class(TJavaGenericImport<JGlideExecutor_UncaughtThrowableStrategy_2Class, JGlideExecutor_UncaughtThrowableStrategy_2>) end;

  JGlideExecutorClass = interface(JThreadPoolExecutorClass) // or JObjectClass
  ['{0B7E7131-05CE-4684-9C0D-94523218ADBF}']
    { static Property Methods }
    {class} function _GetDEFAULT_SOURCE_EXECUTOR_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_DISK_CACHE_EXECUTOR_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT_DISK_CACHE_EXECUTOR_THREADS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function newDiskCacheExecutor: JGlideExecutor; cdecl; overload;
    {class} function newDiskCacheExecutor(threadCount: Integer; name: JString; uncaughtThrowableStrategy: JGlideExecutor_UncaughtThrowableStrategy): JGlideExecutor; cdecl; overload;
    {class} function newSourceExecutor: JGlideExecutor; cdecl; overload;
    {class} function newSourceExecutor(threadCount: Integer; name: JString; uncaughtThrowableStrategy: JGlideExecutor_UncaughtThrowableStrategy): JGlideExecutor; cdecl; overload;
    {class} function newUnlimitedSourceExecutor: JGlideExecutor; cdecl;
    {class} function calculateBestThreadCount: Integer; cdecl;

    { static Property }
    {class} property DEFAULT_SOURCE_EXECUTOR_NAME: JString read _GetDEFAULT_SOURCE_EXECUTOR_NAME;
    {class} property DEFAULT_DISK_CACHE_EXECUTOR_NAME: JString read _GetDEFAULT_DISK_CACHE_EXECUTOR_NAME;
    {class} property DEFAULT_DISK_CACHE_EXECUTOR_THREADS: Integer read _GetDEFAULT_DISK_CACHE_EXECUTOR_THREADS;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/executor/GlideExecutor')]
  JGlideExecutor = interface(JThreadPoolExecutor) // or JObject
  ['{078EB4CA-7A96-4624-BC47-AB9DDB5F2C91}']
    { Property Methods }

    { methods }
    procedure execute(command: JRunnable); cdecl;
    function submit(task: JRunnable): JFuture; cdecl; overload;
    function submit(task: JRunnable; result: JObject): JFuture; cdecl; overload;
    function submit(task: JCallable): JFuture; cdecl; overload;

    { Property }
  end;

  TJGlideExecutor = class(TJavaGenericImport<JGlideExecutorClass, JGlideExecutor>) end;

  JGlideException_IndentedAppendableClass = interface(JObjectClass)
  ['{8366E241-E651-4CF4-A94B-1D54A6FE2B02}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/GlideException$IndentedAppendable')]
  JGlideException_IndentedAppendable = interface(JObject)
  ['{E3F150F4-E8B4-429D-851A-44D41DC4B592}']
    { Property Methods }

    { methods }
    function append(c: Char): JAppendable; cdecl; overload;
    function append(charSequence: JCharSequence): JAppendable; cdecl; overload;
    function append(charSequence: JCharSequence; start: Integer; aend: Integer): JAppendable; cdecl; overload;

    { Property }
  end;

  TJGlideException_IndentedAppendable = class(TJavaGenericImport<JGlideException_IndentedAppendableClass, JGlideException_IndentedAppendable>) end;

  JGlideExceptionClass = interface(JExceptionClass) // or JObjectClass
  ['{26A2D47B-B31D-4C0D-9656-3F18C0852987}']
    { static Property Methods }

    { static Methods }
    {class} function init(amessage: JString): JGlideException; cdecl; overload;
    {class} function init(detailMessage: JString; cause: JException): JGlideException; cdecl; overload;
    {class} function init(detailMessage: JString; causes: JList): JGlideException; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/GlideException')]
  JGlideException = interface(JException) // or JObject
  ['{FAA63A19-18A5-42D6-8384-E49DB22B5D64}']
    { Property Methods }

    { methods }
    function fillInStackTrace: JThrowable; cdecl;
    function getCauses: JList; cdecl;
    function getRootCauses: JList; cdecl;
    procedure logRootCauses(tag: JString); cdecl;
    procedure printStackTrace; cdecl; overload;
    procedure printStackTrace(err: JPrintStream); cdecl; overload;
    procedure printStackTrace(err: JPrintWriter); cdecl; overload;
    function getMessage: JString; cdecl;

    { Property }
  end;

  TJGlideException = class(TJavaGenericImport<JGlideExceptionClass, JGlideException>) end;

  JInitializableClass = interface(JObjectClass)
  ['{CCE0F1B0-5BB1-4B87-8321-96D986553432}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Initializable')]
  JInitializable = interface(IJavaInstance)
  ['{FBAD4AA4-27EE-4D40-9BA1-84235EF6F494}']
    { Property Methods }

    { methods }
    procedure initialize; cdecl;

    { Property }
  end;

  TJInitializable = class(TJavaGenericImport<JInitializableClass, JInitializable>) end;

  JLoadPathClass = interface(JObjectClass)
  ['{26111D4D-7C96-48B7-BB0D-FC4EB419D318}']
    { static Property Methods }

    { static Methods }
//    {class} function init(dataClass: JClass; resourceClass: JClass; transcodeClass: JClass; decodePaths: JList; listPool: JPools_Pool): JLoadPath; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/LoadPath')]
  JLoadPath = interface(JObject)
  ['{AB5F6373-7533-4101-9963-709279D413E3}']
    { Property Methods }

    { methods }
    function load(rewinder: JDataRewinder; options: JOptions; width: Integer; height: Integer; decodeCallback: JDecodePath_DecodeCallback): JResource; cdecl;
    //function getDataClass: JClass; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJLoadPath = class(TJavaGenericImport<JLoadPathClass, JLoadPath>) end;

//  JLockedResource_1Class = interface(JObjectClass)
//  ['{66EB7155-0564-484A-BE47-397AC142DB31}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/engine/LockedResource$1')]
//  JLockedResource_1 = interface(JObject)
//  ['{AEFA015C-20B4-485C-9A29-92DC3DD6EA74}']
//    { Property Methods }
//
//    { methods }
//    function create: JLockedResource; cdecl; overload;
//    function create: JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJLockedResource_1 = class(TJavaGenericImport<JLockedResource_1Class, JLockedResource_1>) end;

  JLockedResourceClass = interface(JObjectClass)
  ['{36B42B6B-6E09-4DD9-9DCA-EBD62C7EAA1B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/LockedResource')]
  JLockedResource = interface(JObject)
  ['{93AD0FE9-4BDA-4694-8B90-5ABFC18F1448}']
    { Property Methods }

    { methods }
    procedure unlock; cdecl;
//    function getResourceClass: JClass; cdecl;
    function get: JObject; cdecl;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;
    function getVerifier: JStateVerifier; cdecl;

    { Property }
  end;

  TJLockedResource = class(TJavaGenericImport<JLockedResourceClass, JLockedResource>) end;

  JBitmapPreFillerClass = interface(JObjectClass)
  ['{3BA3AAEA-5EAC-4433-98F4-306FB34966DC}']
    { static Property Methods }

    { static Methods }
    {class} function init(memoryCache: JMemoryCache; bitmapPool: JBitmapPool; defaultFormat: JDecodeFormat): JBitmapPreFiller; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/BitmapPreFiller')]
  JBitmapPreFiller = interface(JObject)
  ['{79B8012A-D27A-47FE-BA3E-F2EE2A2661B1}']
    { Property Methods }

    { methods }
    procedure preFill(bitmapAttributeBuilders: TJavaObjectArray<JPreFillType_Builder>); cdecl;

    { Property }
  end;

  TJBitmapPreFiller = class(TJavaGenericImport<JBitmapPreFillerClass, JBitmapPreFiller>) end;

  JBitmapPreFillRunner_ClockClass = interface(JObjectClass)
  ['{416E4BAE-3DB1-41BE-B699-9D4E72B9D6CA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/BitmapPreFillRunner$Clock')]
  JBitmapPreFillRunner_Clock = interface(JObject)
  ['{DD1F2D38-34ED-4105-BBD7-6887DAC73E9D}']
    { Property Methods }

    { methods }
    function now: Int64; cdecl;

    { Property }
  end;

  TJBitmapPreFillRunner_Clock = class(TJavaGenericImport<JBitmapPreFillRunner_ClockClass, JBitmapPreFillRunner_Clock>) end;

  JBitmapPreFillRunner_UniqueKeyClass = interface(JObjectClass)
  ['{DE08CBD3-38F7-479F-9FE4-76D6275D4F2C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/BitmapPreFillRunner$UniqueKey')]
  JBitmapPreFillRunner_UniqueKey = interface(JObject)
  ['{81C9F2EF-A9D4-4975-81CB-E1ED1809C6A6}']
    { Property Methods }

    { methods }
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJBitmapPreFillRunner_UniqueKey = class(TJavaGenericImport<JBitmapPreFillRunner_UniqueKeyClass, JBitmapPreFillRunner_UniqueKey>) end;

  JBitmapPreFillRunnerClass = interface(JObjectClass)
  ['{B902EF4C-1845-4767-8433-DEB6C4244CA0}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool; memoryCache: JMemoryCache; allocationOrder: JPreFillQueue): JBitmapPreFillRunner; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/BitmapPreFillRunner')]
  JBitmapPreFillRunner = interface(JObject)
  ['{64EE6C99-CF9E-4D49-964A-605E450B49AC}']
    { Property Methods }

    { methods }
    procedure cancel; cdecl;
    procedure run; cdecl;

    { Property }
  end;

  TJBitmapPreFillRunner = class(TJavaGenericImport<JBitmapPreFillRunnerClass, JBitmapPreFillRunner>) end;

  JPreFillQueueClass = interface(JObjectClass)
  ['{00AEC9C5-5210-48E1-9352-A42EA89C5C60}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapsPerType: JMap): JPreFillQueue; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/PreFillQueue')]
  JPreFillQueue = interface(JObject)
  ['{64EE5A20-99B7-4654-A597-F6322699D483}']
    { Property Methods }

    { methods }
    function remove: JPreFillType; cdecl;
    function getSize: Integer; cdecl;
    function isEmpty: Boolean; cdecl;

    { Property }
  end;

  TJPreFillQueue = class(TJavaGenericImport<JPreFillQueueClass, JPreFillQueue>) end;

  JPreFillType_BuilderClass = interface(JObjectClass)
  ['{E5E43524-D3A0-4B97-8136-B8211337D799}']
    { static Property Methods }

    { static Methods }
    {class} function init(size: Integer): JPreFillType_Builder; cdecl; overload;
    {class} function init(width: Integer; height: Integer): JPreFillType_Builder; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/PreFillType$Builder')]
  JPreFillType_Builder = interface(JObject)
  ['{EC0B6EC6-9865-4B62-BB1E-EDCF81DB6B7F}']
    { Property Methods }

    { methods }
    function setConfig(config: JBitmap_Config): JPreFillType_Builder; cdecl;
    function setWeight(weight: Integer): JPreFillType_Builder; cdecl;

    { Property }
  end;

  TJPreFillType_Builder = class(TJavaGenericImport<JPreFillType_BuilderClass, JPreFillType_Builder>) end;

  JPreFillTypeClass = interface(JObjectClass)
  ['{E11390D4-0F42-433D-A812-3A25A1BCA7D8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/prefill/PreFillType')]
  JPreFillType = interface(JObject)
  ['{F8BD1E70-AB23-443F-B100-02E44DB748B2}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJPreFillType = class(TJavaGenericImport<JPreFillTypeClass, JPreFillType>) end;

  JResourceClass = interface(JObjectClass)
  ['{705678AC-2039-437A-AC3B-83F989E9A4B3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/Resource')]
  JResource = interface(IJavaInstance)
  ['{072346E6-2B97-4263-AAF5-55CA7902E2B5}']
    { Property Methods }

    { methods }
//    function getResourceClass: JClass; cdecl;
    function get: JObject; cdecl;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;

    { Property }
  end;

  TJResource = class(TJavaGenericImport<JResourceClass, JResource>) end;

  JResourceCacheGeneratorClass = interface(JObjectClass)
  ['{3942521A-9908-4367-998C-D2B78256EB13}']
    { static Property Methods }

    { static Methods }
    {class} function init(helper: JDecodeHelper; P2: JDataFetcherGenerator_FetcherReadyCallback): JResourceCacheGenerator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ResourceCacheGenerator')]
  JResourceCacheGenerator = interface(JObject)
  ['{3B15FCAE-C5B0-4F88-A10F-8A8B1248F810}']
    { Property Methods }

    { methods }
    function startNext: Boolean; cdecl;
    procedure cancel; cdecl;
    procedure onDataReady(data: JObject); cdecl;
    procedure onLoadFailed(e: JException); cdecl;

    { Property }
  end;

  TJResourceCacheGenerator = class(TJavaGenericImport<JResourceCacheGeneratorClass, JResourceCacheGenerator>) end;

  JResourceCacheKeyClass = interface(JObjectClass)
  ['{D9D15AD3-A03C-48CB-80AC-CD6351B110C7}']
    { static Property Methods }

    { static Methods }
//    {class} function init(sourceKey: JKey; signature: JKey; width: Integer; height: Integer; appliedTransformation: JTransformation; P6: JClass; decodedResourceClass: JOptions): JResourceCacheKey; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ResourceCacheKey')]
  JResourceCacheKey = interface(JObject)
  ['{92237314-8E95-488B-9DD9-04D9963327D9}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJResourceCacheKey = class(TJavaGenericImport<JResourceCacheKeyClass, JResourceCacheKey>) end;

  JResourceRecycler_ResourceRecyclerCallbackClass = interface(JObjectClass)
  ['{3A6600C7-9D5E-406A-A6B5-256E24B7F105}']
    { static Property Methods }
    {class} function _GetRECYCLE_RESOURCE: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property RECYCLE_RESOURCE: Integer read _GetRECYCLE_RESOURCE;
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ResourceRecycler$ResourceRecyclerCallback')]
  JResourceRecycler_ResourceRecyclerCallback = interface(JObject)
  ['{FF63F8C5-6D25-4B2C-B84B-A88426EB97FC}']
    { Property Methods }

    { methods }
    function handleMessage(amessage: JMessage): Boolean; cdecl;

    { Property }
  end;

  TJResourceRecycler_ResourceRecyclerCallback = class(TJavaGenericImport<JResourceRecycler_ResourceRecyclerCallbackClass, JResourceRecycler_ResourceRecyclerCallback>) end;

  JResourceRecyclerClass = interface(JObjectClass)
  ['{0326C2BF-13E9-48F0-B9F0-F5B3745B516D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/ResourceRecycler')]
  JResourceRecycler = interface(JObject)
  ['{14FB0288-CC26-4003-BA78-1DA2D7F83105}']
    { Property Methods }

    { methods }
    procedure recycle(resource: JResource); cdecl;

    { Property }
  end;

  TJResourceRecycler = class(TJavaGenericImport<JResourceRecyclerClass, JResourceRecycler>) end;

  JSourceGeneratorClass = interface(JObjectClass)
  ['{C3591057-3231-4B3A-B54D-9996AEAA5316}']
    { static Property Methods }

    { static Methods }
    {class} function init(helper: JDecodeHelper; P2: JDataFetcherGenerator_FetcherReadyCallback): JSourceGenerator; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/engine/SourceGenerator')]
  JSourceGenerator = interface(JObject)
  ['{08D37A9E-D93F-4809-AD32-E5DFEAC0E77C}']
    { Property Methods }

    { methods }
    function startNext: Boolean; cdecl;
    procedure cancel; cdecl;
    procedure onDataReady(data: JObject); cdecl;
    procedure onLoadFailed(e: JException); cdecl;
    procedure reschedule; cdecl;
    procedure onDataFetcherReady(sourceKey: JKey; data: JObject; fetcher: JDataFetcher; P4: JDataSource; attemptedKey: JKey); cdecl;
    procedure onDataFetcherFailed(sourceKey: JKey; e: JException; fetcher: JDataFetcher; P4: JDataSource); cdecl;

    { Property }
  end;

  TJSourceGenerator = class(TJavaGenericImport<JSourceGeneratorClass, JSourceGenerator>) end;

  JHttpExceptionClass = interface(JIOExceptionClass) // or JObjectClass
  ['{D2C1FC32-9B99-4134-81D0-6B3AC49345A1}']
    { static Property Methods }
    {class} function _GetUNKNOWN: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(statusCode: Integer): JHttpException; cdecl; overload;
    {class} function init(amessage: JString): JHttpException; cdecl; overload;
    {class} function init(amessage: JString; statusCode: Integer): JHttpException; cdecl; overload;
    {class} function init(amessage: JString; statusCode: Integer; cause: JThrowable): JHttpException; cdecl; overload;

    { static Property }
    {class} property UNKNOWN: Integer read _GetUNKNOWN;
  end;

  [JavaSignature('com/bumptech/glide/load/HttpException')]
  JHttpException = interface(JIOException) // or JObject
  ['{B20C37D4-B9E0-483E-BEB9-D2D4D3B13153}']
    { Property Methods }

    { methods }
    function getStatusCode: Integer; cdecl;

    { Property }
  end;

  TJHttpException = class(TJavaGenericImport<JHttpExceptionClass, JHttpException>) end;

  JImageHeaderParser_ImageTypeClass = interface(JEnumClass) // or JObjectClass
  ['{B62FD250-EFB8-4670-BEA4-6553035D34FC}']
    { static Property Methods }
    {class} function _GetGIF: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetJPEG: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRAW: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPNG_A: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPNG: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWEBP_A: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWEBP: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetUNKNOWN: JImageHeaderParser_ImageType;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JImageHeaderParser_ImageType>; cdecl;
    {class} function valueOf(name: JString): JImageHeaderParser_ImageType; cdecl;

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
  JImageHeaderParser_ImageType = interface(JEnum) // or JObject
  ['{B56F03C9-6CB6-4867-A05A-67A8FE8441B8}']
    { Property Methods }

    { methods }
    function hasAlpha: Boolean; cdecl;

    { Property }
  end;

  TJImageHeaderParser_ImageType = class(TJavaGenericImport<JImageHeaderParser_ImageTypeClass, JImageHeaderParser_ImageType>) end;

  JImageHeaderParserClass = interface(JObjectClass)
  ['{7EB6AA79-EF25-40AD-8A40-BA7CFCB81A91}']
    { static Property Methods }
    {class} function _GetUNKNOWN_ORIENTATION: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property UNKNOWN_ORIENTATION: Integer read _GetUNKNOWN_ORIENTATION;
  end;

  [JavaSignature('com/bumptech/glide/load/ImageHeaderParser')]
  JImageHeaderParser = interface(IJavaInstance)
  ['{A74A257B-EC14-4FBF-9E44-4CA57466D9E7}']
    { Property Methods }

    { methods }
    function getType(P1: JInputStream): JImageHeaderParser_ImageType; cdecl; overload;
    function getType(P1: JByteBuffer): JImageHeaderParser_ImageType; cdecl; overload;
    function getOrientation(P1: JInputStream; P2: JArrayPool): Integer; cdecl; overload;
    function getOrientation(P1: JByteBuffer; P2: JArrayPool): Integer; cdecl; overload;

    { Property }
  end;

  TJImageHeaderParser = class(TJavaGenericImport<JImageHeaderParserClass, JImageHeaderParser>) end;

  JImageHeaderParserUtilsClass = interface(JObjectClass)
  ['{122E66CE-80F9-47F0-B394-CB8CBA0F89F0}']
    { static Property Methods }

    { static Methods }
    {class} function getType(parsers: JList; ais: JInputStream; byteArrayPool: JArrayPool): JImageHeaderParser_ImageType; cdecl; overload;
    {class} function getType(parsers: JList; buffer: JByteBuffer): JImageHeaderParser_ImageType; cdecl; overload;
    {class} function getOrientation(parsers: JList; ais: JInputStream; byteArrayPool: JArrayPool): Integer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/ImageHeaderParserUtils')]
  JImageHeaderParserUtils = interface(JObject)
  ['{5A7CC730-6FB1-47DE-96C6-1ACF8DEA6001}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJImageHeaderParserUtils = class(TJavaGenericImport<JImageHeaderParserUtilsClass, JImageHeaderParserUtils>) end;

  JKeyClass = interface(JObjectClass)
  ['{EB177F88-860F-45E4-9464-3014A00A992A}']
    { static Property Methods }
    {class} function _GetSTRING_CHARSET_NAME: JString;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCHARSET: JCharset;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property STRING_CHARSET_NAME: JString read _GetSTRING_CHARSET_NAME;
    {class} property CHARSET: JCharset read _GetCHARSET;
  end;

  [JavaSignature('com/bumptech/glide/load/Key')]
  JKey = interface(IJavaInstance)
  ['{7EE52679-4E42-48D2-BD05-39BC4F263285}']
    { Property Methods }

    { methods }
//    procedure updateDiskCacheKey(P1: JMessageDigest); cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJKey = class(TJavaGenericImport<JKeyClass, JKey>) end;

  JAssetUriLoader_AssetFetcherFactoryClass = interface(JObjectClass)
  ['{870C3A67-6347-4EC9-B00F-F7FAE491AECD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/AssetUriLoader$AssetFetcherFactory')]
  JAssetUriLoader_AssetFetcherFactory = interface(IJavaInstance)
  ['{C7577F75-32FA-4E2F-8C28-293395DF2911}']
    { Property Methods }

    { methods }
    function buildFetcher(P1: JAssetManager; P2: JString): JDataFetcher; cdecl;

    { Property }
  end;

  TJAssetUriLoader_AssetFetcherFactory = class(TJavaGenericImport<JAssetUriLoader_AssetFetcherFactoryClass, JAssetUriLoader_AssetFetcherFactory>) end;

  JAssetUriLoader_FileDescriptorFactoryClass = interface(JObjectClass)
  ['{E047FD90-577C-4E3F-9395-FA7E1DA5A092}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager): JAssetUriLoader_FileDescriptorFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/AssetUriLoader$FileDescriptorFactory')]
  JAssetUriLoader_FileDescriptorFactory = interface(JObject)
  ['{38DF78C8-2BC3-49E5-B502-36805FA61243}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;
    function buildFetcher(assetManager: JAssetManager; assetPath: JString): JDataFetcher; cdecl;

    { Property }
  end;

  TJAssetUriLoader_FileDescriptorFactory = class(TJavaGenericImport<JAssetUriLoader_FileDescriptorFactoryClass, JAssetUriLoader_FileDescriptorFactory>) end;

  JAssetUriLoader_StreamFactoryClass = interface(JObjectClass)
  ['{ACC5B942-4EC0-4196-93EA-88233E889B13}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager): JAssetUriLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/AssetUriLoader$StreamFactory')]
  JAssetUriLoader_StreamFactory = interface(JObject)
  ['{7F5E72AD-F797-403D-8A0D-D5BE37E30F64}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;
    function buildFetcher(assetManager: JAssetManager; assetPath: JString): JDataFetcher; cdecl;

    { Property }
  end;

  TJAssetUriLoader_StreamFactory = class(TJavaGenericImport<JAssetUriLoader_StreamFactoryClass, JAssetUriLoader_StreamFactory>) end;

  JAssetUriLoaderClass = interface(JObjectClass)
  ['{2E65603A-9F02-4A7F-A32D-81D3B1035713}']
    { static Property Methods }

    { static Methods }
    {class} function init(assetManager: JAssetManager; factory: JAssetUriLoader_AssetFetcherFactory): JAssetUriLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/AssetUriLoader')]
  JAssetUriLoader = interface(JObject)
  ['{C138B228-723C-4DFE-B6D1-81BA5F77A2B5}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JUri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JUri): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJAssetUriLoader = class(TJavaGenericImport<JAssetUriLoaderClass, JAssetUriLoader>) end;

//  JByteArrayLoader_ByteBufferFactory_1Class = interface(JObjectClass)
//  ['{3906B614-CEA5-4089-A8B5-4A3712FB6FE7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$ByteBufferFactory$1')]
//  JByteArrayLoader_ByteBufferFactory_1 = interface(JObject)
//  ['{A71F1043-CB06-40BF-9731-FE14301CBCEA}']
//    { Property Methods }
//
//    { methods }
//    function convert(model: TJavaArray<Byte>): JByteBuffer; cdecl; overload;
//    //function getDataClass: JClass; cdecl;
//    function convert(this: TJavaArray<Byte>): JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJByteArrayLoader_ByteBufferFactory_1 = class(TJavaGenericImport<JByteArrayLoader_ByteBufferFactory_1Class, JByteArrayLoader_ByteBufferFactory_1>) end;

  JByteArrayLoader_ByteBufferFactoryClass = interface(JObjectClass)
  ['{A36B0F0C-E8C6-498D-9568-FDD04D83C143}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteArrayLoader_ByteBufferFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$ByteBufferFactory')]
  JByteArrayLoader_ByteBufferFactory = interface(JObject)
  ['{DDA14DA3-2A19-46E0-A50A-71A34FD05C02}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJByteArrayLoader_ByteBufferFactory = class(TJavaGenericImport<JByteArrayLoader_ByteBufferFactoryClass, JByteArrayLoader_ByteBufferFactory>) end;

  JByteArrayLoader_ConverterClass = interface(JObjectClass)
  ['{0E6C3C71-0E66-41CF-A820-D6F421CFD61F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$Converter')]
  JByteArrayLoader_Converter = interface(IJavaInstance)
  ['{A22FA3D9-F8F0-44B1-AA97-C183A2E72689}']
    { Property Methods }

    { methods }
    function convert(P1: TJavaArray<Byte>): JObject; cdecl;
    //function getDataClass: JClass; cdecl;

    { Property }
  end;

  TJByteArrayLoader_Converter = class(TJavaGenericImport<JByteArrayLoader_ConverterClass, JByteArrayLoader_Converter>) end;

  JByteArrayLoader_FetcherClass = interface(JObjectClass)
  ['{B5F3C747-467E-49DD-BB42-5A86D924B61C}']
    { static Property Methods }

    { static Methods }
    {class} function init(model: TJavaArray<Byte>; converter: JByteArrayLoader_Converter): JByteArrayLoader_Fetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$Fetcher')]
  JByteArrayLoader_Fetcher = interface(JObject)
  ['{D05CB6C5-633F-4B65-9C31-296C49EEAA20}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJByteArrayLoader_Fetcher = class(TJavaGenericImport<JByteArrayLoader_FetcherClass, JByteArrayLoader_Fetcher>) end;

//  JByteArrayLoader_StreamFactory_1Class = interface(JObjectClass)
//  ['{C5FF07E4-634D-4157-A577-978ED568D778}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$StreamFactory$1')]
//  JByteArrayLoader_StreamFactory_1 = interface(JObject)
//  ['{CA037F1D-DA0A-42FA-8B70-799C2F04899D}']
//    { Property Methods }
//
//    { methods }
//    function convert(model: TJavaArray<Byte>): JInputStream; cdecl; overload;
//    //function getDataClass: JClass; cdecl;
//    function convert(this: TJavaArray<Byte>): JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJByteArrayLoader_StreamFactory_1 = class(TJavaGenericImport<JByteArrayLoader_StreamFactory_1Class, JByteArrayLoader_StreamFactory_1>) end;

  JByteArrayLoader_StreamFactoryClass = interface(JObjectClass)
  ['{4F1EC633-9071-460D-BE42-2E61B9981BD9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteArrayLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader$StreamFactory')]
  JByteArrayLoader_StreamFactory = interface(JObject)
  ['{A9CE5971-E042-4E60-8294-8E1C5D973282}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJByteArrayLoader_StreamFactory = class(TJavaGenericImport<JByteArrayLoader_StreamFactoryClass, JByteArrayLoader_StreamFactory>) end;

  JByteArrayLoaderClass = interface(JObjectClass)
  ['{27327388-2414-4861-A2CD-5A3EF5B6F8DC}']
    { static Property Methods }

    { static Methods }
    {class} function init(converter: JByteArrayLoader_Converter): JByteArrayLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteArrayLoader')]
  JByteArrayLoader = interface(JObject)
  ['{6178F116-1195-46E1-9197-EF8B5F4B49A2}']
    { Property Methods }

    { methods }
    function buildLoadData(model: TJavaArray<Byte>; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: TJavaArray<Byte>): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJByteArrayLoader = class(TJavaGenericImport<JByteArrayLoaderClass, JByteArrayLoader>) end;

  JByteBufferEncoderClass = interface(JObjectClass)
  ['{6D92CC10-9DA5-4FA3-B931-92D6C4702B24}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteBufferEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteBufferEncoder')]
  JByteBufferEncoder = interface(JObject)
  ['{DCF44E14-AAA5-4A77-AD20-7E8AFF92C5E8}']
    { Property Methods }

    { methods }
    function encode(data: JByteBuffer; afile: JFile; options: JOptions): Boolean; cdecl; overload;
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJByteBufferEncoder = class(TJavaGenericImport<JByteBufferEncoderClass, JByteBufferEncoder>) end;

  JByteBufferFileLoader_ByteBufferFetcherClass = interface(JObjectClass)
  ['{2A304295-8211-49A2-BBAB-26286DAC6333}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile): JByteBufferFileLoader_ByteBufferFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteBufferFileLoader$ByteBufferFetcher')]
  JByteBufferFileLoader_ByteBufferFetcher = interface(JObject)
  ['{09EB71CE-5D1A-4577-8520-E36F975901A6}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJByteBufferFileLoader_ByteBufferFetcher = class(TJavaGenericImport<JByteBufferFileLoader_ByteBufferFetcherClass, JByteBufferFileLoader_ByteBufferFetcher>) end;

  JByteBufferFileLoader_FactoryClass = interface(JObjectClass)
  ['{E92CE0F8-37BD-4111-B8C3-9A1C8E57661E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteBufferFileLoader_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteBufferFileLoader$Factory')]
  JByteBufferFileLoader_Factory = interface(JObject)
  ['{D4F6B2CC-2044-408E-8400-D0E74D3F29E1}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJByteBufferFileLoader_Factory = class(TJavaGenericImport<JByteBufferFileLoader_FactoryClass, JByteBufferFileLoader_Factory>) end;

  JByteBufferFileLoaderClass = interface(JObjectClass)
  ['{F1A896CF-8C6D-46EE-90A4-AC8284DCED2C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteBufferFileLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ByteBufferFileLoader')]
  JByteBufferFileLoader = interface(JObject)
  ['{275A1A48-ED8C-48C3-BF51-64BEF71BF849}']
    { Property Methods }

    { methods }
    function buildLoadData(afile: JFile; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(afile: JFile): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJByteBufferFileLoader = class(TJavaGenericImport<JByteBufferFileLoaderClass, JByteBufferFileLoader>) end;

  JDataUrlLoader_DataDecoderClass = interface(JObjectClass)
  ['{79BDC334-323F-4271-B067-F0688FCC90C4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader$DataDecoder')]
  JDataUrlLoader_DataDecoder = interface(IJavaInstance)
  ['{B0985440-6DEF-4ECF-BA77-D997018D74C5}']
    { Property Methods }

    { methods }
    function decode(P1: JString): JObject; cdecl;
    procedure close(P1: JObject); cdecl;
    //function getDataClass: JClass; cdecl;

    { Property }
  end;

  TJDataUrlLoader_DataDecoder = class(TJavaGenericImport<JDataUrlLoader_DataDecoderClass, JDataUrlLoader_DataDecoder>) end;

  JDataUrlLoader_DataUriFetcherClass = interface(JObjectClass)
  ['{AB101860-0140-4579-B281-FBA378865BE7}']
    { static Property Methods }

    { static Methods }
    {class} function init(dataUri: JString; reader: JDataUrlLoader_DataDecoder): JDataUrlLoader_DataUriFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader$DataUriFetcher')]
  JDataUrlLoader_DataUriFetcher = interface(JObject)
  ['{C2A6E4F6-E7FF-4235-B258-5A1E565E0599}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJDataUrlLoader_DataUriFetcher = class(TJavaGenericImport<JDataUrlLoader_DataUriFetcherClass, JDataUrlLoader_DataUriFetcher>) end;

//  JDataUrlLoader_StreamFactory_1Class = interface(JObjectClass)
//  ['{DBC7AB97-372A-4464-AA99-51DFD099CCB6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader$StreamFactory$1')]
//  JDataUrlLoader_StreamFactory_1 = interface(JObject)
//  ['{1A4F7F4E-E4DD-464F-BA4E-A108C3591E0A}']
//    { Property Methods }
//
//    { methods }
//    function decode(url: JString): JInputStream; cdecl; overload;
//    procedure close(inputStream: JInputStream); cdecl; overload;
//    //function getDataClass: JClass; cdecl;
//    procedure close(this: JObject); cdecl; overload;
//    function decode(this: JString): JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJDataUrlLoader_StreamFactory_1 = class(TJavaGenericImport<JDataUrlLoader_StreamFactory_1Class, JDataUrlLoader_StreamFactory_1>) end;

  JDataUrlLoader_StreamFactoryClass = interface(JObjectClass)
  ['{436B51FA-2C97-4756-9868-2A7B4DE9D508}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDataUrlLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader$StreamFactory')]
  JDataUrlLoader_StreamFactory = interface(JObject)
  ['{7EBC65D0-2446-4D66-A41C-A23A4FC6C2EF}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJDataUrlLoader_StreamFactory = class(TJavaGenericImport<JDataUrlLoader_StreamFactoryClass, JDataUrlLoader_StreamFactory>) end;

  JDataUrlLoaderClass = interface(JObjectClass)
  ['{92BC65C9-92AE-40D9-BB38-FB1179A66C88}']
    { static Property Methods }

    { static Methods }
    {class} function init(dataDecoder: JDataUrlLoader_DataDecoder): JDataUrlLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/DataUrlLoader')]
  JDataUrlLoader = interface(JObject)
  ['{0970395E-0332-4EC3-897F-CA3AF9AB2C61}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JString; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(url: JString): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJDataUrlLoader = class(TJavaGenericImport<JDataUrlLoaderClass, JDataUrlLoader>) end;

  JFileLoader_FactoryClass = interface(JObjectClass)
  ['{EFF895FE-AE1B-4F26-9C4D-A71748982375}']
    { static Property Methods }

    { static Methods }
    {class} function init(opener: JFileLoader_FileOpener): JFileLoader_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$Factory')]
  JFileLoader_Factory = interface(JObject)
  ['{561D6BAC-BC2A-42C3-A62A-758B1CA3442B}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJFileLoader_Factory = class(TJavaGenericImport<JFileLoader_FactoryClass, JFileLoader_Factory>) end;

//  JFileLoader_FileDescriptorFactory_1Class = interface(JObjectClass)
//  ['{716AE1E6-EDE3-4C55-915C-8CCDBF8D9169}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/model/FileLoader$FileDescriptorFactory$1')]
//  JFileLoader_FileDescriptorFactory_1 = interface(JObject)
//  ['{C282D852-3F85-44D9-BB3A-C9B82EB1E0C9}']
//    { Property Methods }
//
//    { methods }
//    function open(afile: JFile): JParcelFileDescriptor; cdecl; overload;
//    procedure close(parcelFileDescriptor: JParcelFileDescriptor); cdecl; overload;
//    //function getDataClass: JClass; cdecl;
//    procedure close(this: JObject); cdecl; overload;
//    function open(this: JFile): JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJFileLoader_FileDescriptorFactory_1 = class(TJavaGenericImport<JFileLoader_FileDescriptorFactory_1Class, JFileLoader_FileDescriptorFactory_1>) end;

  JFileLoader_FileDescriptorFactoryClass = interface(JFileLoader_FactoryClass) // or JObjectClass
  ['{323F3E9A-817F-4388-B031-E605CA7E7233}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileLoader_FileDescriptorFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$FileDescriptorFactory')]
  JFileLoader_FileDescriptorFactory = interface(JFileLoader_Factory) // or JObject
  ['{7A3BEF1E-B9F7-4DBE-88AB-FFC1E7C637C9}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileLoader_FileDescriptorFactory = class(TJavaGenericImport<JFileLoader_FileDescriptorFactoryClass, JFileLoader_FileDescriptorFactory>) end;

  JFileLoader_FileFetcherClass = interface(JObjectClass)
  ['{DADA4506-FDB6-4DA9-BDDD-E395AAF01A23}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile; opener: JFileLoader_FileOpener): JFileLoader_FileFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$FileFetcher')]
  JFileLoader_FileFetcher = interface(JObject)
  ['{8A5CFEF7-FD8E-48D2-A878-03AB021523B5}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJFileLoader_FileFetcher = class(TJavaGenericImport<JFileLoader_FileFetcherClass, JFileLoader_FileFetcher>) end;

  JFileLoader_FileOpenerClass = interface(JObjectClass)
  ['{C246583F-CE9C-4F81-B060-E91AF02E4276}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$FileOpener')]
  JFileLoader_FileOpener = interface(IJavaInstance)
  ['{1BD8E497-9C6D-4F8F-A070-547A39C20F71}']
    { Property Methods }

    { methods }
    function open(P1: JFile): JObject; cdecl;
    procedure close(P1: JObject); cdecl;
    //function getDataClass: JClass; cdecl;

    { Property }
  end;

  TJFileLoader_FileOpener = class(TJavaGenericImport<JFileLoader_FileOpenerClass, JFileLoader_FileOpener>) end;

//  JFileLoader_StreamFactory_1Class = interface(JObjectClass)
//  ['{581F4F1C-A20D-418A-92F8-4BF2CFD98D11}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/model/FileLoader$StreamFactory$1')]
//  JFileLoader_StreamFactory_1 = interface(JObject)
//  ['{72E1F2D2-826F-4A64-91A7-98FFA02EC383}']
//    { Property Methods }
//
//    { methods }
//    function open(afile: JFile): JInputStream; cdecl; overload;
//    procedure close(inputStream: JInputStream); cdecl; overload;
//    //function getDataClass: JClass; cdecl;
//    procedure close(this: JObject); cdecl; overload;
//    function open(this: JFile): JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJFileLoader_StreamFactory_1 = class(TJavaGenericImport<JFileLoader_StreamFactory_1Class, JFileLoader_StreamFactory_1>) end;

  JFileLoader_StreamFactoryClass = interface(JFileLoader_FactoryClass) // or JObjectClass
  ['{41CD9637-2CD0-4EAD-8C37-20D44F2AC461}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader$StreamFactory')]
  JFileLoader_StreamFactory = interface(JFileLoader_Factory) // or JObject
  ['{4CFA3301-CAF1-4961-8643-FE03BC83F944}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileLoader_StreamFactory = class(TJavaGenericImport<JFileLoader_StreamFactoryClass, JFileLoader_StreamFactory>) end;

  JFileLoaderClass = interface(JObjectClass)
  ['{0E8D2088-87F3-477A-B106-3043F2EEFEAF}']
    { static Property Methods }

    { static Methods }
    {class} function init(fileOpener: JFileLoader_FileOpener): JFileLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/FileLoader')]
  JFileLoader = interface(JObject)
  ['{B7658D75-0926-4A3A-B580-AECDD9DAC12B}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JFile; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JFile): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJFileLoader = class(TJavaGenericImport<JFileLoaderClass, JFileLoader>) end;

  JGlideUrlClass = interface(JObjectClass)
  ['{0D088478-5327-45EC-8A7A-7BAE47D3044B}']
    { static Property Methods }

    { static Methods }
    {class} function init(url: JURL): JGlideUrl; cdecl; overload;
    {class} function init(url: JString): JGlideUrl; cdecl; overload;
    {class} function init(url: JURL; headers: JHeaders): JGlideUrl; cdecl; overload;
    {class} function init(url: JString; headers: JHeaders): JGlideUrl; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/GlideUrl')]
  JGlideUrl = interface(JObject)
  ['{2CCB5463-5E82-4412-AA83-5B63617A0EAE}']
    { Property Methods }

    { methods }
    function toURL: JURL; cdecl;
    function toStringUrl: JString; cdecl;
    function getHeaders: JMap; cdecl;
    function getCacheKey: JString; cdecl;
    function toString: JString; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJGlideUrl = class(TJavaGenericImport<JGlideUrlClass, JGlideUrl>) end;

//  JHeaders_1Class = interface(JObjectClass)
//  ['{D7566F5C-FA8C-4F8D-8141-5C630BF7D539}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/model/Headers$1')]
//  JHeaders_1 = interface(JObject)
//  ['{91180206-BBE4-4296-8B3C-DE31ED602033}']
//    { Property Methods }
//
//    { methods }
//    function getHeaders: JMap; cdecl;
//
//    { Property }
//  end;
//
//  TJHeaders_1 = class(TJavaGenericImport<JHeaders_1Class, JHeaders_1>) end;

  JHeadersClass = interface(JObjectClass)
  ['{3608F57C-B4A7-479F-A6DF-64DAD6A426B0}']
    { static Property Methods }
    {class} function _GetNONE: JHeaders;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT: JHeaders;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property NONE: JHeaders read _GetNONE;
    {class} property DEFAULT: JHeaders read _GetDEFAULT;
  end;

  [JavaSignature('com/bumptech/glide/load/model/Headers')]
  JHeaders = interface(IJavaInstance)
  ['{EA3CBA0C-2B91-4671-B2AF-5F803382848D}']
    { Property Methods }

    { methods }
    function getHeaders: JMap; cdecl;

    { Property }
  end;

  TJHeaders = class(TJavaGenericImport<JHeadersClass, JHeaders>) end;

  JLazyHeaderFactoryClass = interface(JObjectClass)
  ['{C1111EF5-7C4A-4161-B488-8EDE581E8523}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/LazyHeaderFactory')]
  JLazyHeaderFactory = interface(IJavaInstance)
  ['{F1D3E046-3A3A-4D26-AC08-0E5E13EB6E31}']
    { Property Methods }

    { methods }
    function buildHeader: JString; cdecl;

    { Property }
  end;

  TJLazyHeaderFactory = class(TJavaGenericImport<JLazyHeaderFactoryClass, JLazyHeaderFactory>) end;

  JLazyHeaders_BuilderClass = interface(JObjectClass)
  ['{D43592E6-677E-4D24-AB33-E4629BD5A6BB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLazyHeaders_Builder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/LazyHeaders$Builder')]
  JLazyHeaders_Builder = interface(JObject)
  ['{BA5EF9CA-57D5-430F-9EB6-52E9039CCF7D}']
    { Property Methods }

    { methods }
    function addHeader(key: JString; value: JString): JLazyHeaders_Builder; cdecl; overload;
    function addHeader(key: JString; factory: JLazyHeaderFactory): JLazyHeaders_Builder; cdecl; overload;
    function setHeader(key: JString; value: JString): JLazyHeaders_Builder; cdecl; overload;
    function setHeader(key: JString; factory: JLazyHeaderFactory): JLazyHeaders_Builder; cdecl; overload;
    function build: JLazyHeaders; cdecl;

    { Property }
  end;

  TJLazyHeaders_Builder = class(TJavaGenericImport<JLazyHeaders_BuilderClass, JLazyHeaders_Builder>) end;

  JLazyHeaders_StringHeaderFactoryClass = interface(JObjectClass)
  ['{8FD00518-9BC8-4CAC-994A-B632EB3F4264}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/LazyHeaders$StringHeaderFactory')]
  JLazyHeaders_StringHeaderFactory = interface(JObject)
  ['{1498A2C4-EF51-4BED-80BA-6A606686FC1A}']
    { Property Methods }

    { methods }
    function buildHeader: JString; cdecl;
    function toString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJLazyHeaders_StringHeaderFactory = class(TJavaGenericImport<JLazyHeaders_StringHeaderFactoryClass, JLazyHeaders_StringHeaderFactory>) end;

  JLazyHeadersClass = interface(JObjectClass)
  ['{88C2F468-1400-4031-AE83-6A5967C24EFD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/LazyHeaders')]
  JLazyHeaders = interface(JObject)
  ['{3E11019D-EC89-4598-BD29-868A78E31879}']
    { Property Methods }

    { methods }
    function getHeaders: JMap; cdecl;
    function toString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJLazyHeaders = class(TJavaGenericImport<JLazyHeadersClass, JLazyHeaders>) end;

  JMediaStoreFileLoader_FactoryClass = interface(JObjectClass)
  ['{1FEC381F-9572-42FF-A6EB-594A7BB90E7C}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreFileLoader_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MediaStoreFileLoader$Factory')]
  JMediaStoreFileLoader_Factory = interface(JObject)
  ['{AF27C522-ACD6-4C7E-B12E-BBF74F849A64}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJMediaStoreFileLoader_Factory = class(TJavaGenericImport<JMediaStoreFileLoader_FactoryClass, JMediaStoreFileLoader_Factory>) end;

  JMediaStoreFileLoader_FilePathFetcherClass = interface(JObjectClass)
  ['{968500A8-220D-463A-A382-E0D10562B42D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MediaStoreFileLoader$FilePathFetcher')]
  JMediaStoreFileLoader_FilePathFetcher = interface(JObject)
  ['{C206BE0F-03FE-4165-969F-D7E0D1D9685C}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJMediaStoreFileLoader_FilePathFetcher = class(TJavaGenericImport<JMediaStoreFileLoader_FilePathFetcherClass, JMediaStoreFileLoader_FilePathFetcher>) end;

  JMediaStoreFileLoaderClass = interface(JObjectClass)
  ['{4FEABD4E-179C-42C8-BDF9-94BD33B4E00D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MediaStoreFileLoader')]
  JMediaStoreFileLoader = interface(JObject)
  ['{956E021C-B3EB-4423-B2E6-D04644532054}']
    { Property Methods }

    { methods }
    function buildLoadData(uri: JUri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(uri: JUri): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJMediaStoreFileLoader = class(TJavaGenericImport<JMediaStoreFileLoaderClass, JMediaStoreFileLoader>) end;

//  JModelCache_1Class = interface(JLruCacheClass) // or JObjectClass
//  ['{00FE2D41-CEFC-4F00-8188-DC2C03FD4AB9}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/model/ModelCache$1')]
//  JModelCache_1 = interface(JLruCache) // or JObject
//  ['{F905EDF7-4C86-48AA-AF8C-D3AEA5FD4F53}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJModelCache_1 = class(TJavaGenericImport<JModelCache_1Class, JModelCache_1>) end;

  JModelCache_ModelKeyClass = interface(JObjectClass)
  ['{9CF04658-5D25-450A-90FB-18607C5489C8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelCache$ModelKey')]
  JModelCache_ModelKey = interface(JObject)
  ['{A46365C4-5094-494D-9C5D-D68443DEDCA2}']
    { Property Methods }

    { methods }
    procedure release; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJModelCache_ModelKey = class(TJavaGenericImport<JModelCache_ModelKeyClass, JModelCache_ModelKey>) end;

  JModelCacheClass = interface(JObjectClass)
  ['{E74DA5F0-483D-4D9F-9B63-18B72747B919}']
    { static Property Methods }

    { static Methods }
    {class} function init: JModelCache; cdecl; overload;
    {class} function init(size: Integer): JModelCache; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelCache')]
  JModelCache = interface(JObject)
  ['{8D4D105F-9096-4F38-AF15-A1A360AAF404}']
    { Property Methods }

    { methods }
    function get(model: JObject; width: Integer; height: Integer): JObject; cdecl;
    procedure put(model: JObject; width: Integer; height: Integer; value: JObject); cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJModelCache = class(TJavaGenericImport<JModelCacheClass, JModelCache>) end;

  JModelLoader_LoadDataClass = interface(JObjectClass)
  ['{939EF536-CB91-486A-9B75-ED1AC2436A68}']
    { static Property Methods }

    { static Methods }
    {class} function init(sourceKey: JKey; fetcher: JDataFetcher): JModelLoader_LoadData; cdecl; overload;
    {class} function init(sourceKey: JKey; alternateKeys: JList; fetcher: JDataFetcher): JModelLoader_LoadData; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoader$LoadData')]
  JModelLoader_LoadData = interface(JObject)
  ['{C2CED9C9-5846-489C-90F8-C41F032A15E0}']
    { Property Methods }
    function _GetsourceKey: JKey;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetsourceKey(asourceKey: JKey);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _GetalternateKeys: JList;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _SetalternateKeys(aalternateKeys: JList);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    function _Getfetcher: JDataFetcher;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setfetcher(afetcher: JDataFetcher);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }

    { Property }
    property sourceKey: JKey read _GetsourceKey write _SetsourceKey;
    property alternateKeys: JList read _GetalternateKeys write _SetalternateKeys;
    property fetcher: JDataFetcher read _Getfetcher write _Setfetcher;
  end;

  TJModelLoader_LoadData = class(TJavaGenericImport<JModelLoader_LoadDataClass, JModelLoader_LoadData>) end;

  JModelLoaderClass = interface(JObjectClass)
  ['{618266DD-C7F4-4B98-A026-2C9809BD3E9B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoader')]
  JModelLoader = interface(IJavaInstance)
  ['{235F5057-4753-4B60-9215-D3A9880CC55C}']
    { Property Methods }

    { methods }
    function buildLoadData(P1: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl;
    function handles(P1: JObject): Boolean; cdecl;

    { Property }
  end;

  TJModelLoader = class(TJavaGenericImport<JModelLoaderClass, JModelLoader>) end;

  JModelLoaderFactoryClass = interface(JObjectClass)
  ['{0FB84124-B854-43B2-A6DA-26DB9F63582B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoaderFactory')]
  JModelLoaderFactory = interface(IJavaInstance)
  ['{E2436A55-3E11-4614-B4C4-613CA9880FD8}']
    { Property Methods }

    { methods }
    function build(P1: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJModelLoaderFactory = class(TJavaGenericImport<JModelLoaderFactoryClass, JModelLoaderFactory>) end;

  JModelLoaderRegistry_ModelLoaderCache_EntryClass = interface(JObjectClass)
  ['{42864487-055F-4B48-B068-1F1BCF34ACAC}']
    { static Property Methods }

    { static Methods }
    {class} function init(loaders: JList): JModelLoaderRegistry_ModelLoaderCache_Entry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache$Entry')]
  JModelLoaderRegistry_ModelLoaderCache_Entry = interface(JObject)
  ['{E7A9428F-5CD3-4E0F-911A-C0D8B49E8660}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJModelLoaderRegistry_ModelLoaderCache_Entry = class(TJavaGenericImport<JModelLoaderRegistry_ModelLoaderCache_EntryClass, JModelLoaderRegistry_ModelLoaderCache_Entry>) end;

  JModelLoaderRegistry_ModelLoaderCacheClass = interface(JObjectClass)
  ['{50E3D34A-D118-415A-86E7-E5F51AA4EDAA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoaderRegistry$ModelLoaderCache')]
  JModelLoaderRegistry_ModelLoaderCache = interface(JObject)
  ['{CF4C799E-30C8-48C9-ADFF-6D85254D4C78}']
    { Property Methods }

    { methods }
    procedure clear; cdecl;
//    procedure put(modelClass: JClass; P2: JList); cdecl;
//    function get(modelClass: JClass): JList; cdecl;

    { Property }
  end;

  TJModelLoaderRegistry_ModelLoaderCache = class(TJavaGenericImport<JModelLoaderRegistry_ModelLoaderCacheClass, JModelLoaderRegistry_ModelLoaderCache>) end;

  JModelLoaderRegistryClass = interface(JObjectClass)
  ['{35D7F72D-4097-4E43-A934-0B113B079C34}']
    { static Property Methods }

    { static Methods }
//    {class} function init(exceptionListPool: JPools_Pool): JModelLoaderRegistry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ModelLoaderRegistry')]
  JModelLoaderRegistry = interface(JObject)
  ['{AFF7DEED-06D9-45BC-8D00-C271A9BE4700}']
    { Property Methods }

    { methods }
//    procedure append(modelClass: JClass; P2: JClass; dataClass: JModelLoaderFactory); cdecl;
//    procedure prepend(modelClass: JClass; P2: JClass; dataClass: JModelLoaderFactory); cdecl;
//    procedure remove(modelClass: JClass; P2: JClass); cdecl;
//    procedure replace(modelClass: JClass; P2: JClass; dataClass: JModelLoaderFactory); cdecl;
//    function getModelLoaders(model: JObject): JList; cdecl;
//    function build(modelClass: JClass; P2: JClass): JModelLoader; cdecl;
//    function getDataClasses(modelClass: JClass): JList; cdecl;

    { Property }
  end;

  TJModelLoaderRegistry = class(TJavaGenericImport<JModelLoaderRegistryClass, JModelLoaderRegistry>) end;

  JMultiModelLoader_MultiFetcherClass = interface(JObjectClass)
  ['{FCAF44F3-87F6-4256-8D72-B85587B84943}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoader$MultiFetcher')]
  JMultiModelLoader_MultiFetcher = interface(JObject)
  ['{5EA39BC7-CEFB-401E-B185-62855FF0DEEE}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;
    procedure onDataReady(data: JObject); cdecl;
    procedure onLoadFailed(e: JException); cdecl;

    { Property }
  end;

  TJMultiModelLoader_MultiFetcher = class(TJavaGenericImport<JMultiModelLoader_MultiFetcherClass, JMultiModelLoader_MultiFetcher>) end;

  JMultiModelLoaderClass = interface(JObjectClass)
  ['{A56BC663-C57D-4E09-9AB4-E2739DE7F246}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoader')]
  JMultiModelLoader = interface(JObject)
  ['{AAFEDF5B-37CF-4B72-891C-C4C09980F4C0}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl;
    function handles(model: JObject): Boolean; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJMultiModelLoader = class(TJavaGenericImport<JMultiModelLoaderClass, JMultiModelLoader>) end;

  JMultiModelLoaderFactory_EmptyModelLoaderClass = interface(JObjectClass)
  ['{42EBB857-06EC-401C-B1B3-8603CB96170D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoaderFactory$EmptyModelLoader')]
  JMultiModelLoaderFactory_EmptyModelLoader = interface(JObject)
  ['{D15F79DF-413C-487A-B592-42E96E2202A6}']
    { Property Methods }

    { methods }
    function buildLoadData(o: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl;
    function handles(o: JObject): Boolean; cdecl;

    { Property }
  end;

  TJMultiModelLoaderFactory_EmptyModelLoader = class(TJavaGenericImport<JMultiModelLoaderFactory_EmptyModelLoaderClass, JMultiModelLoaderFactory_EmptyModelLoader>) end;

  JMultiModelLoaderFactory_EntryClass = interface(JObjectClass)
  ['{5C76F535-45BB-46A9-B1BF-C7C036D076E1}']
    { static Property Methods }

    { static Methods }
//    {class} function init(modelClass: JClass; dataClass: JClass; factory: JModelLoaderFactory): JMultiModelLoaderFactory_Entry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoaderFactory$Entry')]
  JMultiModelLoaderFactory_Entry = interface(JObject)
  ['{B5B5EE0E-3B64-4FB8-998F-37EEEA596AF9}']
    { Property Methods }

    { methods }
//    function handles(modelClass: JClass; dataClass: JClass): Boolean; cdecl; overload;
//    function handles(modelClass: JClass): Boolean; cdecl; overload;

    { Property }
  end;

  TJMultiModelLoaderFactory_Entry = class(TJavaGenericImport<JMultiModelLoaderFactory_EntryClass, JMultiModelLoaderFactory_Entry>) end;

  JMultiModelLoaderFactory_FactoryClass = interface(JObjectClass)
  ['{8581A7C8-E875-4D0C-A305-804E37E3F8E1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoaderFactory$Factory')]
  JMultiModelLoaderFactory_Factory = interface(JObject)
  ['{6C3C812F-31AB-4CDD-94F2-46216964EBCE}']
    { Property Methods }

    { methods }
//    function build(modelLoaders: JList; P2: JPools_Pool): JMultiModelLoader; cdecl;

    { Property }
  end;

  TJMultiModelLoaderFactory_Factory = class(TJavaGenericImport<JMultiModelLoaderFactory_FactoryClass, JMultiModelLoaderFactory_Factory>) end;

  JMultiModelLoaderFactoryClass = interface(JObjectClass)
  ['{140F90CB-265C-4999-998E-07DB38D8191C}']
    { static Property Methods }

    { static Methods }
//    {class} function init(exceptionListPool: JPools_Pool): JMultiModelLoaderFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/MultiModelLoaderFactory')]
  JMultiModelLoaderFactory = interface(JObject)
  ['{2DB5FE04-1ACA-4EBE-BB4D-B438AC37D28B}']
    { Property Methods }

    { methods }
//    function build(modelClass: JClass; P2: JClass): JModelLoader; cdecl;

    { Property }
  end;

  TJMultiModelLoaderFactory = class(TJavaGenericImport<JMultiModelLoaderFactoryClass, JMultiModelLoaderFactory>) end;

  JResourceLoader_FileDescriptorFactoryClass = interface(JObjectClass)
  ['{3C9DE3AA-6718-4FAE-B023-3256F61C68E4}']
    { static Property Methods }

    { static Methods }
    {class} function init(resources: JResources): JResourceLoader_FileDescriptorFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ResourceLoader$FileDescriptorFactory')]
  JResourceLoader_FileDescriptorFactory = interface(JObject)
  ['{3C0653D4-28BC-40F4-8C19-66EA81418942}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJResourceLoader_FileDescriptorFactory = class(TJavaGenericImport<JResourceLoader_FileDescriptorFactoryClass, JResourceLoader_FileDescriptorFactory>) end;

  JResourceLoader_StreamFactoryClass = interface(JObjectClass)
  ['{D7D810ED-8879-4B45-82EE-F0F193AE45E9}']
    { static Property Methods }

    { static Methods }
    {class} function init(resources: JResources): JResourceLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ResourceLoader$StreamFactory')]
  JResourceLoader_StreamFactory = interface(JObject)
  ['{E213AD5B-5CCB-46AB-871F-C9B62F4EC147}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJResourceLoader_StreamFactory = class(TJavaGenericImport<JResourceLoader_StreamFactoryClass, JResourceLoader_StreamFactory>) end;

  JResourceLoaderClass = interface(JObjectClass)
  ['{65AB0F83-A025-4B57-8316-DF635384ACF0}']
    { static Property Methods }

    { static Methods }
    {class} function init(resources: JResources; uriLoader: JModelLoader): JResourceLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/ResourceLoader')]
  JResourceLoader = interface(JObject)
  ['{2E48498A-83E2-4812-9E3A-1B86484BE942}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JInteger; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JInteger): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJResourceLoader = class(TJavaGenericImport<JResourceLoaderClass, JResourceLoader>) end;

  JBaseGlideUrlLoaderClass = interface(JObjectClass)
  ['{CAE75740-1743-4769-80A0-403CE12F59CD}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/BaseGlideUrlLoader')]
  JBaseGlideUrlLoader = interface(JObject)
  ['{5744B05F-B16A-4CEF-944A-83911B537924}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl;

    { Property }
  end;

  TJBaseGlideUrlLoader = class(TJavaGenericImport<JBaseGlideUrlLoaderClass, JBaseGlideUrlLoader>) end;

  JHttpGlideUrlLoader_FactoryClass = interface(JObjectClass)
  ['{0F0D0CB8-267D-4D88-9E45-FAC9C8938951}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHttpGlideUrlLoader_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/HttpGlideUrlLoader$Factory')]
  JHttpGlideUrlLoader_Factory = interface(JObject)
  ['{E70497E9-8AA1-43C9-9EEA-F31D400A233B}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJHttpGlideUrlLoader_Factory = class(TJavaGenericImport<JHttpGlideUrlLoader_FactoryClass, JHttpGlideUrlLoader_Factory>) end;

  JHttpGlideUrlLoaderClass = interface(JObjectClass)
  ['{275F3B8D-AFE3-405E-A481-4463F1F04780}']
    { static Property Methods }
    {class} function _GetTIMEOUT: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JHttpGlideUrlLoader; cdecl; overload;
    {class} function init(modelCache: JModelCache): JHttpGlideUrlLoader; cdecl; overload;

    { static Property }
    {class} property TIMEOUT: JOption read _GetTIMEOUT;
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/HttpGlideUrlLoader')]
  JHttpGlideUrlLoader = interface(JObject)
  ['{A9E9FFD6-090D-4005-B6F6-6610DD174DEC}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JGlideUrl; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JGlideUrl): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJHttpGlideUrlLoader = class(TJavaGenericImport<JHttpGlideUrlLoaderClass, JHttpGlideUrlLoader>) end;

  JHttpUriLoader_FactoryClass = interface(JObjectClass)
  ['{FB799833-4D36-44F5-9157-49A373DF8A59}']
    { static Property Methods }

    { static Methods }
    {class} function init: JHttpUriLoader_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/HttpUriLoader$Factory')]
  JHttpUriLoader_Factory = interface(JObject)
  ['{1EE0C6A2-FA52-480B-B7A5-55EEB2107F38}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJHttpUriLoader_Factory = class(TJavaGenericImport<JHttpUriLoader_FactoryClass, JHttpUriLoader_Factory>) end;

  JHttpUriLoaderClass = interface(JObjectClass)
  ['{4CDED863-403D-4D0D-A477-BBBF3BB6BADD}']
    { static Property Methods }

    { static Methods }
    {class} function init(urlLoader: JModelLoader): JHttpUriLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/HttpUriLoader')]
  JHttpUriLoader = interface(JObject)
  ['{9BADAB74-4A7A-494E-B23B-D51F2CCB907C}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JUri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JUri): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJHttpUriLoader = class(TJavaGenericImport<JHttpUriLoaderClass, JHttpUriLoader>) end;

  JMediaStoreImageThumbLoader_FactoryClass = interface(JObjectClass)
  ['{DCC65E4E-A7FF-4485-872C-F74CBF483B86}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreImageThumbLoader_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/MediaStoreImageThumbLoader$Factory')]
  JMediaStoreImageThumbLoader_Factory = interface(JObject)
  ['{0237970E-0E84-49A4-951A-A4A052CDB4E5}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJMediaStoreImageThumbLoader_Factory = class(TJavaGenericImport<JMediaStoreImageThumbLoader_FactoryClass, JMediaStoreImageThumbLoader_Factory>) end;

  JMediaStoreImageThumbLoaderClass = interface(JObjectClass)
  ['{F7B8AA54-0ADA-458F-9036-9F02082A4E61}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreImageThumbLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/MediaStoreImageThumbLoader')]
  JMediaStoreImageThumbLoader = interface(JObject)
  ['{EF2E0013-E47C-4AEF-AACF-BFB3532B2F42}']
    { Property Methods }
    function _Getcontext: JContext;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    procedure _Setcontext(acontext: JContext);{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { methods }
    function buildLoadData(model: JUri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JUri): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
    property context: JContext read _Getcontext write _Setcontext;
  end;

  TJMediaStoreImageThumbLoader = class(TJavaGenericImport<JMediaStoreImageThumbLoaderClass, JMediaStoreImageThumbLoader>) end;

  JMediaStoreVideoThumbLoader_FactoryClass = interface(JObjectClass)
  ['{0072A7CD-9678-4622-9364-D719133E78D1}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JMediaStoreVideoThumbLoader_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/MediaStoreVideoThumbLoader$Factory')]
  JMediaStoreVideoThumbLoader_Factory = interface(JObject)
  ['{BFBC1159-FBEC-40B3-A9E3-2AEDC54CA64B}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJMediaStoreVideoThumbLoader_Factory = class(TJavaGenericImport<JMediaStoreVideoThumbLoader_FactoryClass, JMediaStoreVideoThumbLoader_Factory>) end;

  JMediaStoreVideoThumbLoaderClass = interface(JObjectClass)
  ['{D5A66FD7-7DB9-4938-BF40-C9FB00E526EC}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/MediaStoreVideoThumbLoader')]
  JMediaStoreVideoThumbLoader = interface(JObject)
  ['{7175688D-27AB-4FDC-B913-4BFE706003A6}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JUri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JUri): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJMediaStoreVideoThumbLoader = class(TJavaGenericImport<JMediaStoreVideoThumbLoaderClass, JMediaStoreVideoThumbLoader>) end;

  JUrlLoader_StreamFactoryClass = interface(JObjectClass)
  ['{8598B4C4-C04F-446F-8536-558757B3FC42}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUrlLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/UrlLoader$StreamFactory')]
  JUrlLoader_StreamFactory = interface(JObject)
  ['{D84F68CE-414D-45A6-8257-EEFB08FAE0AE}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJUrlLoader_StreamFactory = class(TJavaGenericImport<JUrlLoader_StreamFactoryClass, JUrlLoader_StreamFactory>) end;

  JUrlLoaderClass = interface(JObjectClass)
  ['{56E50F5E-F58E-457C-994D-93DA782DD989}']
    { static Property Methods }

    { static Methods }
    {class} function init(glideUrlLoader: JModelLoader): JUrlLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/stream/UrlLoader')]
  JUrlLoader = interface(JObject)
  ['{6F8B6529-8A06-4EB7-A203-F33C05AD2D6A}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JURL; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JURL): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJUrlLoader = class(TJavaGenericImport<JUrlLoaderClass, JUrlLoader>) end;

  JStreamEncoderClass = interface(JObjectClass)
  ['{27246A56-BD25-48F9-BBF3-BC456EA6C47E}']
    { static Property Methods }

    { static Methods }
    {class} function init(byteArrayPool: JArrayPool): JStreamEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StreamEncoder')]
  JStreamEncoder = interface(JObject)
  ['{B52811CA-7691-4ED6-8882-79D0C9F14196}']
    { Property Methods }

    { methods }
    function encode(data: JInputStream; afile: JFile; options: JOptions): Boolean; cdecl; overload;
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJStreamEncoder = class(TJavaGenericImport<JStreamEncoderClass, JStreamEncoder>) end;

  JStringLoader_FileDescriptorFactoryClass = interface(JObjectClass)
  ['{186CF37F-49DF-45AE-BFED-0FA9CA2D2F9B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JStringLoader_FileDescriptorFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StringLoader$FileDescriptorFactory')]
  JStringLoader_FileDescriptorFactory = interface(JObject)
  ['{0617618E-1FFC-47E5-9D54-488AC752506A}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJStringLoader_FileDescriptorFactory = class(TJavaGenericImport<JStringLoader_FileDescriptorFactoryClass, JStringLoader_FileDescriptorFactory>) end;

  JStringLoader_StreamFactoryClass = interface(JObjectClass)
  ['{9DF13C3B-0A76-41F6-8E25-BBED415FE53F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JStringLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StringLoader$StreamFactory')]
  JStringLoader_StreamFactory = interface(JObject)
  ['{CC792D6F-7322-46D5-AC57-C068667705D7}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJStringLoader_StreamFactory = class(TJavaGenericImport<JStringLoader_StreamFactoryClass, JStringLoader_StreamFactory>) end;

  JStringLoaderClass = interface(JObjectClass)
  ['{CA16E7EA-3406-4338-98AB-5CB72646CC53}']
    { static Property Methods }

    { static Methods }
    {class} function init(uriLoader: JModelLoader): JStringLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/StringLoader')]
  JStringLoader = interface(JObject)
  ['{5EC273AC-810F-4D96-B0D7-7579587C98D2}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JString; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JString): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJStringLoader = class(TJavaGenericImport<JStringLoaderClass, JStringLoader>) end;

  JUnitModelLoader_FactoryClass = interface(JObjectClass)
  ['{F1447FC7-B279-4877-ABBD-C6C77A029FC8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnitModelLoader_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UnitModelLoader$Factory')]
  JUnitModelLoader_Factory = interface(JObject)
  ['{C163683D-8D00-445D-8A0E-C0E74B0B19A0}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJUnitModelLoader_Factory = class(TJavaGenericImport<JUnitModelLoader_FactoryClass, JUnitModelLoader_Factory>) end;

  JUnitModelLoader_UnitFetcherClass = interface(JObjectClass)
  ['{78CE7211-A044-4D00-9911-B0CDF524B982}']
    { static Property Methods }

    { static Methods }
    {class} function init(resource: JObject): JUnitModelLoader_UnitFetcher; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UnitModelLoader$UnitFetcher')]
  JUnitModelLoader_UnitFetcher = interface(JObject)
  ['{81EA48F1-07FA-45BC-B5D5-8E2C92CD69AE}']
    { Property Methods }

    { methods }
    procedure loadData(priority: JPriority; callback: JDataFetcher_DataCallback); cdecl;
    procedure cleanup; cdecl;
    procedure cancel; cdecl;
    //function getDataClass: JClass; cdecl;
    function getDataSource: JDataSource; cdecl;

    { Property }
  end;

  TJUnitModelLoader_UnitFetcher = class(TJavaGenericImport<JUnitModelLoader_UnitFetcherClass, JUnitModelLoader_UnitFetcher>) end;

  JUnitModelLoaderClass = interface(JObjectClass)
  ['{CB5038AD-A491-4376-922A-8F946C5B7650}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnitModelLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UnitModelLoader')]
  JUnitModelLoader = interface(JObject)
  ['{039299B9-9C36-43AB-BC29-46351383BB6B}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JObject; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl;
    function handles(model: JObject): Boolean; cdecl;

    { Property }
  end;

  TJUnitModelLoader = class(TJavaGenericImport<JUnitModelLoaderClass, JUnitModelLoader>) end;

  JUriLoader_FileDescriptorFactoryClass = interface(JObjectClass)
  ['{FDAEC1C4-30BA-464D-B4F2-09F3DFEE7EE1}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver): JUriLoader_FileDescriptorFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader$FileDescriptorFactory')]
  JUriLoader_FileDescriptorFactory = interface(JObject)
  ['{A5E5C871-0186-40E3-B72A-EF2788B7478A}']
    { Property Methods }

    { methods }
    function build(uri: JUri): JDataFetcher; cdecl; overload;
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; overload;
    procedure teardown; cdecl;

    { Property }
  end;

  TJUriLoader_FileDescriptorFactory = class(TJavaGenericImport<JUriLoader_FileDescriptorFactoryClass, JUriLoader_FileDescriptorFactory>) end;

  JUriLoader_LocalUriFetcherFactoryClass = interface(JObjectClass)
  ['{D00A8108-8005-46AF-A726-AD695523B754}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader$LocalUriFetcherFactory')]
  JUriLoader_LocalUriFetcherFactory = interface(IJavaInstance)
  ['{20F3901E-13A3-4E46-A6E4-28920974ECDA}']
    { Property Methods }

    { methods }
    function build(P1: JUri): JDataFetcher; cdecl;

    { Property }
  end;

  TJUriLoader_LocalUriFetcherFactory = class(TJavaGenericImport<JUriLoader_LocalUriFetcherFactoryClass, JUriLoader_LocalUriFetcherFactory>) end;

  JUriLoader_StreamFactoryClass = interface(JObjectClass)
  ['{2DED3C92-6ED4-433F-AACC-BEE9C644AA80}']
    { static Property Methods }

    { static Methods }
    {class} function init(contentResolver: JContentResolver): JUriLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader$StreamFactory')]
  JUriLoader_StreamFactory = interface(JObject)
  ['{63F5A086-C15A-45C9-9C55-B97845BA7B3D}']
    { Property Methods }

    { methods }
    function build(uri: JUri): JDataFetcher; cdecl; overload;
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl; overload;
    procedure teardown; cdecl;

    { Property }
  end;

  TJUriLoader_StreamFactory = class(TJavaGenericImport<JUriLoader_StreamFactoryClass, JUriLoader_StreamFactory>) end;

  JUriLoaderClass = interface(JObjectClass)
  ['{24FACF10-7712-4D18-BC6B-D7BA9DE1226B}']
    { static Property Methods }

    { static Methods }
    {class} function init(factory: JUriLoader_LocalUriFetcherFactory): JUriLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UriLoader')]
  JUriLoader = interface(JObject)
  ['{FF7BE0BA-997C-4148-8CCE-0E24B564906B}']
    { Property Methods }

    { methods }
    function buildLoadData(model: JUri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(model: JUri): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJUriLoader = class(TJavaGenericImport<JUriLoaderClass, JUriLoader>) end;

  JUrlUriLoader_StreamFactoryClass = interface(JObjectClass)
  ['{6B677F3C-F6A1-45F5-9EDE-46104DE55167}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUrlUriLoader_StreamFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UrlUriLoader$StreamFactory')]
  JUrlUriLoader_StreamFactory = interface(JObject)
  ['{A4B3BBAD-779E-4383-9E56-CF00EB8E96A5}']
    { Property Methods }

    { methods }
    function build(multiFactory: JMultiModelLoaderFactory): JModelLoader; cdecl;
    procedure teardown; cdecl;

    { Property }
  end;

  TJUrlUriLoader_StreamFactory = class(TJavaGenericImport<JUrlUriLoader_StreamFactoryClass, JUrlUriLoader_StreamFactory>) end;

  JUrlUriLoaderClass = interface(JObjectClass)
  ['{6941A6AD-C6A6-43E8-9E56-856C578C8186}']
    { static Property Methods }

    { static Methods }
    {class} function init(urlLoader: JModelLoader): JUrlUriLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/model/UrlUriLoader')]
  JUrlUriLoader = interface(JObject)
  ['{8B070AD9-5D41-4FCB-A3D7-B0059303B11B}']
    { Property Methods }

    { methods }
    function buildLoadData(uri: JUri; width: Integer; height: Integer; options: JOptions): JModelLoader_LoadData; cdecl; overload;
    function handles(uri: JUri): Boolean; cdecl; overload;
    function handles(this: JObject): Boolean; cdecl; overload;
    function buildLoadData(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JModelLoader_LoadData; cdecl; overload;

    { Property }
  end;

  TJUrlUriLoader = class(TJavaGenericImport<JUrlUriLoaderClass, JUrlUriLoader>) end;

  JMultiTransformationClass = interface(JObjectClass)
  ['{BDB16B18-E550-4CF8-83BA-DAD1940BF1E8}']
    { static Property Methods }

    { static Methods }
    {class} function init(transformations: TJavaObjectArray<JTransformation>): JMultiTransformation; cdecl; overload;
    {class} function init(transformationList: JCollection): JMultiTransformation; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/MultiTransformation')]
  JMultiTransformation = interface(JObject)
  ['{E9B14F87-0F1D-4AF7-B8D6-7F8E83D38DB2}']
    { Property Methods }

    { methods }
    function transform(context: JContext; resource: JResource; outWidth: Integer; outHeight: Integer): JResource; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJMultiTransformation = class(TJavaGenericImport<JMultiTransformationClass, JMultiTransformation>) end;

//  JOption_1Class = interface(JObjectClass)
//  ['{61D8515C-8106-4EAD-981B-600AC59E97E5}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/Option$1')]
//  JOption_1 = interface(JObject)
//  ['{29208D7B-E757-487F-BD6E-1381BD9844D4}']
//    { Property Methods }
//
//    { methods }
//    procedure update(keyBytes: TJavaArray<Byte>; value: JObject; messageDigest: JMessageDigest); cdecl;
//
//    { Property }
//  end;
//
//  TJOption_1 = class(TJavaGenericImport<JOption_1Class, JOption_1>) end;

  JOption_CacheKeyUpdaterClass = interface(JObjectClass)
  ['{2EAB2875-7A2E-4DDD-B2DE-7AB022067DA8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Option$CacheKeyUpdater')]
  JOption_CacheKeyUpdater = interface(IJavaInstance)
  ['{33056EF2-FA4D-4B32-BA7F-8EF17284A81F}']
    { Property Methods }

    { methods }
//    procedure update(P1: TJavaArray<Byte>; P2: JObject; P3: JMessageDigest); cdecl;

    { Property }
  end;

  TJOption_CacheKeyUpdater = class(TJavaGenericImport<JOption_CacheKeyUpdaterClass, JOption_CacheKeyUpdater>) end;

  JOptionClass = interface(JObjectClass)
  ['{0D8F8618-3617-4BA0-A034-A28F1FE19C88}']
    { static Property Methods }

    { static Methods }
    {class} function memory(key: JString): JOption; cdecl; overload;
    {class} function memory(key: JString; defaultValue: JObject): JOption; cdecl; overload;
    {class} function disk(key: JString; cacheKeyUpdater: JOption_CacheKeyUpdater): JOption; cdecl; overload;
    {class} function disk(key: JString; defaultValue: JObject; cacheKeyUpdater: JOption_CacheKeyUpdater): JOption; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Option')]
  JOption = interface(JObject)
  ['{A24122CE-62FC-411F-835A-8402360AD2DC}']
    { Property Methods }

    { methods }
    function getDefaultValue: JObject; cdecl;
    procedure update(value: JObject; messageDigest: JMessageDigest); cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJOption = class(TJavaGenericImport<JOptionClass, JOption>) end;

  JOptionsClass = interface(JObjectClass)
  ['{D802F563-EA4A-4B0A-BAC4-415DECBBEAC5}']
    { static Property Methods }

    { static Methods }
    {class} function init: JOptions; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Options')]
  JOptions = interface(JObject)
  ['{DC84569A-303B-43E5-89AC-52B52D7F3266}']
    { Property Methods }

    { methods }
    procedure putAll(other: JOptions); cdecl;
    function &set(option: JOption; P2: JObject): JOptions; cdecl;
    function get(option: JOption): JObject; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJOptions = class(TJavaGenericImport<JOptionsClass, JOptions>) end;

  JBitmapDrawableDecoderClass = interface(JObjectClass)
  ['{41C46315-7382-47E4-87AC-A6B34782396D}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; decoder: JResourceDecoder): JBitmapDrawableDecoder; cdecl; overload;
    {class} function init(resources: JResources; bitmapPool: JBitmapPool; decoder: JResourceDecoder): JBitmapDrawableDecoder; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapDrawableDecoder')]
  JBitmapDrawableDecoder = interface(JObject)
  ['{6BDDFEA8-9A36-4623-8D11-CF0DD9C74F69}']
    { Property Methods }

    { methods }
    function handles(source: JObject; options: JOptions): Boolean; cdecl;
    function decode(source: JObject; width: Integer; height: Integer; options: JOptions): JResource; cdecl;

    { Property }
  end;

  TJBitmapDrawableDecoder = class(TJavaGenericImport<JBitmapDrawableDecoderClass, JBitmapDrawableDecoder>) end;

  JBitmapDrawableEncoderClass = interface(JObjectClass)
  ['{47FE7B6A-1C9D-4958-86F1-39D429BC454D}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool; encoder: JResourceEncoder): JBitmapDrawableEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapDrawableEncoder')]
  JBitmapDrawableEncoder = interface(JObject)
  ['{3E4A6636-E6B2-411D-987C-3B107815BE40}']
    { Property Methods }

    { methods }
    function encode(data: JResource; P2: JFile; options: JOptions): Boolean; cdecl; overload;
    function getEncodeStrategy(options: JOptions): JEncodeStrategy; cdecl;
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJBitmapDrawableEncoder = class(TJavaGenericImport<JBitmapDrawableEncoderClass, JBitmapDrawableEncoder>) end;

  JDrawableResourceClass = interface(JObjectClass)
  ['{251BFC83-BB97-4752-AF86-FAFFF464A754}']
    { static Property Methods }

    { static Methods }
    {class} function init(drawable: JDrawable): JDrawableResource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/drawable/DrawableResource')]
  JDrawableResource = interface(JObject)
  ['{BE446256-B88B-4564-994A-D0EA3580929B}']
    { Property Methods }

    { methods }
    function get: JDrawable; cdecl; overload;
    procedure initialize; cdecl;
//    function get: JObject; cdecl; overload;

    { Property }
  end;

  TJDrawableResource = class(TJavaGenericImport<JDrawableResourceClass, JDrawableResource>) end;

  JBitmapDrawableResourceClass = interface(JDrawableResourceClass) // or JObjectClass
  ['{EFB6C4AF-1C2C-4F6A-B886-D3128E51CB06}']
    { static Property Methods }

    { static Methods }
    {class} function init(drawable: JBitmapDrawable; bitmapPool: JBitmapPool): JBitmapDrawableResource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapDrawableResource')]
  JBitmapDrawableResource = interface(JDrawableResource) // or JObject
  ['{F95D6EAC-DD80-44A8-8308-6CBDEBE26222}']
    { Property Methods }

    { methods }
//    function getResourceClass: JClass; cdecl;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;
    procedure initialize; cdecl;

    { Property }
  end;

  TJBitmapDrawableResource = class(TJavaGenericImport<JBitmapDrawableResourceClass, JBitmapDrawableResource>) end;

  JBitmapDrawableTransformationClass = interface(JObjectClass)
  ['{B73E1792-03D0-44D3-B010-DF4D246AB522}']
    { static Property Methods }

    { static Methods }
    {class} function init(wrapped: JTransformation): JBitmapDrawableTransformation; cdecl; overload;
    {class} function init(context: JContext; wrapped: JTransformation): JBitmapDrawableTransformation; cdecl; overload; //Deprecated
    {class} function init(context: JContext; bitmapPool: JBitmapPool; wrapped: JTransformation): JBitmapDrawableTransformation; cdecl; overload; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapDrawableTransformation')]
  JBitmapDrawableTransformation = interface(JObject)
  ['{9A6EC19F-0C1E-40DF-A5E6-BCA6DBC241EF}']
    { Property Methods }

    { methods }
    function transform(context: JContext; drawableResourceToTransform: JResource; P3: Integer; outHeight: Integer): JResource; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJBitmapDrawableTransformation = class(TJavaGenericImport<JBitmapDrawableTransformationClass, JBitmapDrawableTransformation>) end;

  JBitmapEncoderClass = interface(JObjectClass)
  ['{E1E3B604-A6F9-4195-8F2A-8EFF74237832}']
    { static Property Methods }
    {class} function _GetCOMPRESSION_QUALITY: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOMPRESSION_FORMAT: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JBitmapEncoder; cdecl;

    { static Property }
    {class} property COMPRESSION_QUALITY: JOption read _GetCOMPRESSION_QUALITY;
    {class} property COMPRESSION_FORMAT: JOption read _GetCOMPRESSION_FORMAT;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapEncoder')]
  JBitmapEncoder = interface(JObject)
  ['{3F4117BD-25B1-4DE1-BE21-FC5637220DA0}']
    { Property Methods }

    { methods }
    function encode(resource: JResource; P2: JFile; options: JOptions): Boolean; cdecl; overload;
    function getEncodeStrategy(options: JOptions): JEncodeStrategy; cdecl;
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJBitmapEncoder = class(TJavaGenericImport<JBitmapEncoderClass, JBitmapEncoder>) end;

  JBitmapResourceClass = interface(JObjectClass)
  ['{70DE067C-2CB7-46A9-BCE1-A7ECE46055CF}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(bitmap: JBitmap; bitmapPool: JBitmapPool): JBitmapResource; cdecl;
    {class} function init(bitmap: JBitmap; bitmapPool: JBitmapPool): JBitmapResource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapResource')]
  JBitmapResource = interface(JObject)
  ['{ABCA61E8-6A83-45DD-BEC0-D52062863886}']
    { Property Methods }

    { methods }
//    function getResourceClass: JClass; cdecl;
    function get: JBitmap; cdecl; overload;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;
    procedure initialize; cdecl;
//    function get: JObject; cdecl; overload;

    { Property }
  end;

  TJBitmapResource = class(TJavaGenericImport<JBitmapResourceClass, JBitmapResource>) end;

  JBitmapTransformationClass = interface(JObjectClass)
  ['{AFA2E047-38E8-4619-B93D-6B1A116AD79D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapTransformation; cdecl; overload;
    {class} function init(context: JContext): JBitmapTransformation; cdecl; overload; //Deprecated
    {class} function init(bitmapPool: JBitmapPool): JBitmapTransformation; cdecl; overload; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapTransformation')]
  JBitmapTransformation = interface(JObject)
  ['{B467EBB2-1124-40E4-B367-1C90EA7EB08A}']
    { Property Methods }

    { methods }
    function transform(context: JContext; resource: JResource; P3: Integer; outHeight: Integer): JResource; cdecl;

    { Property }
  end;

  TJBitmapTransformation = class(TJavaGenericImport<JBitmapTransformationClass, JBitmapTransformation>) end;

  JBitmapTransitionOptionsClass = interface(JTransitionOptionsClass) // or JObjectClass
  ['{A1F082D3-F6FE-4897-89C5-4553C191FB54}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapTransitionOptions; cdecl;
    {class} function withCrossFade: JBitmapTransitionOptions; cdecl; overload;
    {class} function withCrossFade(duration: Integer): JBitmapTransitionOptions; cdecl; overload;
    {class} function withCrossFade(animationId: Integer; duration: Integer): JBitmapTransitionOptions; cdecl; overload;
    {class} function withCrossFade(drawableCrossFadeFactory: JDrawableCrossFadeFactory): JBitmapTransitionOptions; cdecl; overload;
    {class} function withCrossFade(builder: JDrawableCrossFadeFactory_Builder): JBitmapTransitionOptions; cdecl; overload;
    {class} function withWrapped(drawableCrossFadeFactory: JTransitionFactory): JBitmapTransitionOptions; cdecl;
    {class} function &with(transitionFactory: JTransitionFactory): JBitmapTransitionOptions; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/BitmapTransitionOptions')]
  JBitmapTransitionOptions = interface(JTransitionOptions) // or JObject
  ['{D6BD728A-6425-413C-AD3E-31C2CC02A242}']
    { Property Methods }

    { methods }
    function crossFade: JBitmapTransitionOptions; cdecl; overload;
    function crossFade(duration: Integer): JBitmapTransitionOptions; cdecl; overload;
    function crossFade(animationId: Integer; duration: Integer): JBitmapTransitionOptions; cdecl; overload;
    function crossFade(drawableCrossFadeFactory: JDrawableCrossFadeFactory): JBitmapTransitionOptions; cdecl; overload;
    function transitionUsing(drawableCrossFadeFactory: JTransitionFactory): JBitmapTransitionOptions; cdecl;
    function crossFade(builder: JDrawableCrossFadeFactory_Builder): JBitmapTransitionOptions; cdecl; overload;

    { Property }
  end;

  TJBitmapTransitionOptions = class(TJavaGenericImport<JBitmapTransitionOptionsClass, JBitmapTransitionOptions>) end;

  JByteBufferBitmapDecoderClass = interface(JObjectClass)
  ['{ED78C2D2-6DF6-47F1-B271-94348EDE2807}']
    { static Property Methods }

    { static Methods }
    {class} function init(downsampler: JDownsampler): JByteBufferBitmapDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/ByteBufferBitmapDecoder')]
  JByteBufferBitmapDecoder = interface(JObject)
  ['{2DE1B612-CF95-4C6C-A997-7309C8583722}']
    { Property Methods }

    { methods }
    function handles(source: JByteBuffer; options: JOptions): Boolean; cdecl; overload;
    function decode(source: JByteBuffer; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJByteBufferBitmapDecoder = class(TJavaGenericImport<JByteBufferBitmapDecoderClass, JByteBufferBitmapDecoder>) end;

  JCenterCropClass = interface(JBitmapTransformationClass) // or JObjectClass
  ['{89C9A052-CD61-4DAE-B7AE-3012F3B11F42}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCenterCrop; cdecl; overload;
    {class} function init(context: JContext): JCenterCrop; cdecl; overload; //Deprecated
    {class} function init(bitmapPool: JBitmapPool): JCenterCrop; cdecl; overload; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/CenterCrop')]
  JCenterCrop = interface(JBitmapTransformation) // or JObject
  ['{0A46CC5A-A74C-4637-BA1F-08286F67B382}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJCenterCrop = class(TJavaGenericImport<JCenterCropClass, JCenterCrop>) end;

  JCenterInsideClass = interface(JBitmapTransformationClass) // or JObjectClass
  ['{6CA60FDA-C7FE-47AE-B709-228C2A9620E6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCenterInside; cdecl; overload;
    {class} function init(context: JContext): JCenterInside; cdecl; overload; //Deprecated
    {class} function init(bitmapPool: JBitmapPool): JCenterInside; cdecl; overload; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/CenterInside')]
  JCenterInside = interface(JBitmapTransformation) // or JObject
  ['{579912B0-03F6-4ED7-B507-512DE3A10BBF}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJCenterInside = class(TJavaGenericImport<JCenterInsideClass, JCenterInside>) end;

  JCircleCropClass = interface(JBitmapTransformationClass) // or JObjectClass
  ['{615A47B8-8087-458F-99CC-256D86967F6F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JCircleCrop; cdecl; overload;
    {class} function init(context: JContext): JCircleCrop; cdecl; overload; //Deprecated
    {class} function init(bitmapPool: JBitmapPool): JCircleCrop; cdecl; overload; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/CircleCrop')]
  JCircleCrop = interface(JBitmapTransformation) // or JObject
  ['{CFAA54BB-DC60-43DE-884A-AD647554CCFC}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJCircleCrop = class(TJavaGenericImport<JCircleCropClass, JCircleCrop>) end;

  JDefaultImageHeaderParser_ByteBufferReaderClass = interface(JObjectClass)
  ['{59D16AF0-F975-4FAA-83CE-41D266C4EFD2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$ByteBufferReader')]
  JDefaultImageHeaderParser_ByteBufferReader = interface(JObject)
  ['{F12A474B-2A01-462E-AC9B-8BFF672AFED9}']
    { Property Methods }

    { methods }
    function getUInt16: Integer; cdecl;
    function getUInt8: Word; cdecl;
    function skip(total: Int64): Int64; cdecl;
    function read(buffer: TJavaArray<Byte>; byteCount: Integer): Integer; cdecl;
    function getByte: Integer; cdecl;

    { Property }
  end;

  TJDefaultImageHeaderParser_ByteBufferReader = class(TJavaGenericImport<JDefaultImageHeaderParser_ByteBufferReaderClass, JDefaultImageHeaderParser_ByteBufferReader>) end;

  JDefaultImageHeaderParser_RandomAccessReaderClass = interface(JObjectClass)
  ['{E5790FDA-7ED6-49EE-96DB-D2D7A73E5230}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$RandomAccessReader')]
  JDefaultImageHeaderParser_RandomAccessReader = interface(JObject)
  ['{DC9DEE85-BADA-412A-A398-70D2F09EE6D0}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDefaultImageHeaderParser_RandomAccessReader = class(TJavaGenericImport<JDefaultImageHeaderParser_RandomAccessReaderClass, JDefaultImageHeaderParser_RandomAccessReader>) end;

  JDefaultImageHeaderParser_ReaderClass = interface(JObjectClass)
  ['{8B73ADBF-D453-4348-B6FD-3A8709B36141}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$Reader')]
  JDefaultImageHeaderParser_Reader = interface(IJavaInstance)
  ['{EF6905C9-4917-49C5-850B-CEC709558206}']
    { Property Methods }

    { methods }
    function getUInt16: Integer; cdecl;
    function getUInt8: Word; cdecl;
    function skip(P1: Int64): Int64; cdecl;
    function read(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    function getByte: Integer; cdecl;

    { Property }
  end;

  TJDefaultImageHeaderParser_Reader = class(TJavaGenericImport<JDefaultImageHeaderParser_ReaderClass, JDefaultImageHeaderParser_Reader>) end;

  JDefaultImageHeaderParser_StreamReaderClass = interface(JObjectClass)
  ['{CBFC5637-A839-4970-9E3C-4DE0C3E0EF19}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser$StreamReader')]
  JDefaultImageHeaderParser_StreamReader = interface(JObject)
  ['{D88A19FD-00AD-440D-9F90-CBDD3A5147E1}']
    { Property Methods }

    { methods }
    function getUInt16: Integer; cdecl;
    function getUInt8: Word; cdecl;
    function skip(total: Int64): Int64; cdecl;
    function read(buffer: TJavaArray<Byte>; byteCount: Integer): Integer; cdecl;
    function getByte: Integer; cdecl;

    { Property }
  end;

  TJDefaultImageHeaderParser_StreamReader = class(TJavaGenericImport<JDefaultImageHeaderParser_StreamReaderClass, JDefaultImageHeaderParser_StreamReader>) end;

  JDefaultImageHeaderParserClass = interface(JObjectClass)
  ['{BC598617-ECDE-4031-8865-5A93AB76B31E}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDefaultImageHeaderParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DefaultImageHeaderParser')]
  JDefaultImageHeaderParser = interface(JObject)
  ['{29E667B7-88D6-436B-8C23-27A9DCF48A5B}']
    { Property Methods }

    { methods }
    function getType(ais: JInputStream): JImageHeaderParser_ImageType; cdecl; overload;
    function getType(byteBuffer: JByteBuffer): JImageHeaderParser_ImageType; cdecl; overload;
    function getOrientation(ais: JInputStream; byteArrayPool: JArrayPool): Integer; cdecl; overload;
    function getOrientation(byteBuffer: JByteBuffer; byteArrayPool: JArrayPool): Integer; cdecl; overload;

    { Property }
  end;

  TJDefaultImageHeaderParser = class(TJavaGenericImport<JDefaultImageHeaderParserClass, JDefaultImageHeaderParser>) end;

//  JDownsampler_1Class = interface(JObjectClass)
//  ['{202F47E8-6871-4912-AA94-9716720D6403}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/resource/bitmap/Downsampler$1')]
//  JDownsampler_1 = interface(JObject)
//  ['{C4B1F7C6-C6E2-4830-BB22-7DF4CBE40C06}']
//    { Property Methods }
//
//    { methods }
//    procedure onObtainBounds; cdecl;
//    procedure onDecodeComplete(bitmapPool: JBitmapPool; downsampled: JBitmap); cdecl;
//
//    { Property }
//  end;
//
//  TJDownsampler_1 = class(TJavaGenericImport<JDownsampler_1Class, JDownsampler_1>) end;

  JDownsampler_DecodeCallbacksClass = interface(JObjectClass)
  ['{48101BB6-F5D8-4F91-9513-432FC0B21C0B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/Downsampler$DecodeCallbacks')]
  JDownsampler_DecodeCallbacks = interface(IJavaInstance)
  ['{CF91D123-246F-4EAF-8361-DE247A1846C7}']
    { Property Methods }

    { methods }
    procedure onObtainBounds; cdecl;
    procedure onDecodeComplete(P1: JBitmapPool; P2: JBitmap); cdecl;

    { Property }
  end;

  TJDownsampler_DecodeCallbacks = class(TJavaGenericImport<JDownsampler_DecodeCallbacksClass, JDownsampler_DecodeCallbacks>) end;

  JDownsamplerClass = interface(JObjectClass)
  ['{B8BC5E39-6EB1-49F5-8F03-1827E5FE0F31}']
    { static Property Methods }
    {class} function _GetDECODE_FORMAT: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDOWNSAMPLE_STRATEGY: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(parsers: JList; P2: JDisplayMetrics; bitmapPool: JBitmapPool; byteArrayPool: JArrayPool): JDownsampler; cdecl;

    { static Property }
    {class} property DECODE_FORMAT: JOption read _GetDECODE_FORMAT;
    {class} property DOWNSAMPLE_STRATEGY: JOption read _GetDOWNSAMPLE_STRATEGY;
    {class} property FIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS: JOption read _GetFIX_BITMAP_SIZE_TO_REQUESTED_DIMENSIONS;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/Downsampler')]
  JDownsampler = interface(JObject)
  ['{413FD52F-DA98-4F0C-A6FB-A13DDD4747D2}']
    { Property Methods }

    { methods }
    function handles(ais: JInputStream): Boolean; cdecl; overload;
    function handles(byteBuffer: JByteBuffer): Boolean; cdecl; overload;
    function decode(ais: JInputStream; outWidth: Integer; outHeight: Integer; options: JOptions): JResource; cdecl; overload;
    function decode(ais: JInputStream; requestedWidth: Integer; requestedHeight: Integer; options: JOptions; callbacks: JDownsampler_DecodeCallbacks): JResource; cdecl; overload;

    { Property }
  end;

  TJDownsampler = class(TJavaGenericImport<JDownsamplerClass, JDownsampler>) end;

  JDownsampleStrategyClass = interface(JObjectClass)
  ['{9D4A6189-67EF-4747-B98F-A4E2252EFA5C}']
    { static Property Methods }
    {class} function _GetFIT_CENTER: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCENTER_OUTSIDE: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT_LEAST: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetAT_MOST: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCENTER_INSIDE: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNONE: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetDEFAULT: JDownsampleStrategy;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init: JDownsampleStrategy; cdecl;

    { static Property }
    {class} property FIT_CENTER: JDownsampleStrategy read _GetFIT_CENTER;
    {class} property CENTER_OUTSIDE: JDownsampleStrategy read _GetCENTER_OUTSIDE;
    {class} property AT_LEAST: JDownsampleStrategy read _GetAT_LEAST;
    {class} property AT_MOST: JDownsampleStrategy read _GetAT_MOST;
    {class} property CENTER_INSIDE: JDownsampleStrategy read _GetCENTER_INSIDE;
    {class} property NONE: JDownsampleStrategy read _GetNONE;
    {class} property DEFAULT: JDownsampleStrategy read _GetDEFAULT;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy')]
  JDownsampleStrategy = interface(JObject)
  ['{273CFBF7-1576-45F5-AE57-85E0C9FC6F12}']
    { Property Methods }

    { methods }
    function getScaleFactor(P1: Integer; P2: Integer; P3: Integer; P4: Integer): Single; cdecl;
    function getSampleSizeRounding(P1: Integer; P2: Integer; P3: Integer; P4: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl;

    { Property }
  end;

  TJDownsampleStrategy = class(TJavaGenericImport<JDownsampleStrategyClass, JDownsampleStrategy>) end;

  JDownsampleStrategy_AtLeastClass = interface(JDownsampleStrategyClass) // or JObjectClass
  ['{D7138201-BA23-4BD0-AA4C-AAF047C5A31A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$AtLeast')]
  JDownsampleStrategy_AtLeast = interface(JDownsampleStrategy) // or JObject
  ['{22DCE38F-0946-4113-B656-0A21E564EBF5}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl;
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl;

    { Property }
  end;

  TJDownsampleStrategy_AtLeast = class(TJavaGenericImport<JDownsampleStrategy_AtLeastClass, JDownsampleStrategy_AtLeast>) end;

  JDownsampleStrategy_AtMostClass = interface(JDownsampleStrategyClass) // or JObjectClass
  ['{CDDA714F-FDEE-49EE-B227-4B760D765874}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$AtMost')]
  JDownsampleStrategy_AtMost = interface(JDownsampleStrategy) // or JObject
  ['{6F618AEE-A08E-47BC-89BC-0AA82660B06C}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl;
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl;

    { Property }
  end;

  TJDownsampleStrategy_AtMost = class(TJavaGenericImport<JDownsampleStrategy_AtMostClass, JDownsampleStrategy_AtMost>) end;

  JDownsampleStrategy_CenterInsideClass = interface(JDownsampleStrategyClass) // or JObjectClass
  ['{E707CA0C-636C-46FA-AE72-E76CAECC238B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$CenterInside')]
  JDownsampleStrategy_CenterInside = interface(JDownsampleStrategy) // or JObject
  ['{A81E4CB8-7293-43CE-BF90-7CA7078FDAEA}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl;
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl;

    { Property }
  end;

  TJDownsampleStrategy_CenterInside = class(TJavaGenericImport<JDownsampleStrategy_CenterInsideClass, JDownsampleStrategy_CenterInside>) end;

  JDownsampleStrategy_CenterOutsideClass = interface(JDownsampleStrategyClass) // or JObjectClass
  ['{08264105-6391-46D3-ADFD-941E6C1F66D9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$CenterOutside')]
  JDownsampleStrategy_CenterOutside = interface(JDownsampleStrategy) // or JObject
  ['{A669A867-4451-4C8B-A9D7-3D4783493F55}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl;
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl;

    { Property }
  end;

  TJDownsampleStrategy_CenterOutside = class(TJavaGenericImport<JDownsampleStrategy_CenterOutsideClass, JDownsampleStrategy_CenterOutside>) end;

  JDownsampleStrategy_FitCenterClass = interface(JDownsampleStrategyClass) // or JObjectClass
  ['{5A7648A3-3499-4E6B-AFF4-FB8CE1237F5F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$FitCenter')]
  JDownsampleStrategy_FitCenter = interface(JDownsampleStrategy) // or JObject
  ['{FCD2C09B-C758-45A5-ABD0-9EEFBAA9D038}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl;
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl;

    { Property }
  end;

  TJDownsampleStrategy_FitCenter = class(TJavaGenericImport<JDownsampleStrategy_FitCenterClass, JDownsampleStrategy_FitCenter>) end;

  JDownsampleStrategy_NoneClass = interface(JDownsampleStrategyClass) // or JObjectClass
  ['{9D866DB0-794A-43D2-9EA5-CBB29EED026A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$None')]
  JDownsampleStrategy_None = interface(JDownsampleStrategy) // or JObject
  ['{AA29FA16-48A8-4427-BF49-734D7A8AD66C}']
    { Property Methods }

    { methods }
    function getScaleFactor(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): Single; cdecl;
    function getSampleSizeRounding(sourceWidth: Integer; sourceHeight: Integer; requestedWidth: Integer; requestedHeight: Integer): JDownsampleStrategy_SampleSizeRounding; cdecl;

    { Property }
  end;

  TJDownsampleStrategy_None = class(TJavaGenericImport<JDownsampleStrategy_NoneClass, JDownsampleStrategy_None>) end;

  JDownsampleStrategy_SampleSizeRoundingClass = interface(JEnumClass) // or JObjectClass
  ['{43F8E8CF-55CB-4CBC-804D-836EA17DBB7D}']
    { static Property Methods }
    {class} function _GetMEMORY: JDownsampleStrategy_SampleSizeRounding;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetQUALITY: JDownsampleStrategy_SampleSizeRounding;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JDownsampleStrategy_SampleSizeRounding>; cdecl;
    {class} function valueOf(name: JString): JDownsampleStrategy_SampleSizeRounding; cdecl;

    { static Property }
    {class} property MEMORY: JDownsampleStrategy_SampleSizeRounding read _GetMEMORY;
    {class} property QUALITY: JDownsampleStrategy_SampleSizeRounding read _GetQUALITY;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/DownsampleStrategy$SampleSizeRounding')]
  JDownsampleStrategy_SampleSizeRounding = interface(JEnum) // or JObject
  ['{696569E0-6F40-4CA9-B924-DDCE7F3B42CC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDownsampleStrategy_SampleSizeRounding = class(TJavaGenericImport<JDownsampleStrategy_SampleSizeRoundingClass, JDownsampleStrategy_SampleSizeRounding>) end;

  JFitCenterClass = interface(JBitmapTransformationClass) // or JObjectClass
  ['{9DFE63E7-1F5C-4561-B49C-7D5AE00AB991}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFitCenter; cdecl; overload;
    {class} function init(context: JContext): JFitCenter; cdecl; overload; //Deprecated
    {class} function init(bitmapPool: JBitmapPool): JFitCenter; cdecl; overload; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/FitCenter')]
  JFitCenter = interface(JBitmapTransformation) // or JObject
  ['{457EE20A-8FEC-4FE5-BBDD-D377294D8B5B}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJFitCenter = class(TJavaGenericImport<JFitCenterClass, JFitCenter>) end;

  JLazyBitmapDrawableResourceClass = interface(JObjectClass)
  ['{FD73FDA8-6474-4B52-B148-D2EDF47B0467}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(context: JContext; bitmap: JBitmap): JLazyBitmapDrawableResource; cdecl; overload;
    {class} function obtain(resources: JResources; bitmapPool: JBitmapPool; bitmap: JBitmap): JLazyBitmapDrawableResource; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/LazyBitmapDrawableResource')]
  JLazyBitmapDrawableResource = interface(JObject)
  ['{AA0C6749-55AF-4FBE-807F-2557660A5E89}']
    { Property Methods }

    { methods }
//    function getResourceClass: JClass; cdecl;
    function get: JBitmapDrawable; cdecl; overload;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;
    procedure initialize; cdecl;
//    function get: JObject; cdecl; overload;

    { Property }
  end;

  TJLazyBitmapDrawableResource = class(TJavaGenericImport<JLazyBitmapDrawableResourceClass, JLazyBitmapDrawableResource>) end;

  JRecyclableBufferedInputStream_InvalidMarkExceptionClass = interface(JIOExceptionClass) // or JObjectClass
  ['{042CA494-4E25-48E0-9A16-D43CAF64024A}']
    { static Property Methods }

    { static Methods }
    {class} function init(detailMessage: JString): JRecyclableBufferedInputStream_InvalidMarkException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream$InvalidMarkException')]
  JRecyclableBufferedInputStream_InvalidMarkException = interface(JIOException) // or JObject
  ['{AF81F293-1DD3-462A-A630-A20DBB6B4C84}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRecyclableBufferedInputStream_InvalidMarkException = class(TJavaGenericImport<JRecyclableBufferedInputStream_InvalidMarkExceptionClass, JRecyclableBufferedInputStream_InvalidMarkException>) end;

//  JRecyclableBufferedInputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass
//  ['{75B1E888-2927-43B4-9BC2-4AAD5CB4DAD9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream; byteArrayPool: JArrayPool): JRecyclableBufferedInputStream; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/resource/bitmap/RecyclableBufferedInputStream')]
//  JRecyclableBufferedInputStream = interface(JFilterInputStream) // or JObject
//  ['{C821C68A-2F39-494B-A5AE-2713F3FEE762}']
//    { Property Methods }
//
//    { methods }
//    function available: Integer; cdecl;
//    procedure fixMarkLimit; cdecl;
//    procedure release; cdecl;
//    procedure close; cdecl;
//    procedure mark(readlimit: Integer); cdecl;
//    function markSupported: Boolean; cdecl;
//    function read: Integer; cdecl; overload;
//    function read(buffer: TJavaArray<Byte>; offset: Integer; byteCount: Integer): Integer; cdecl; overload;
//    procedure reset; cdecl;
//    function skip(byteCount: Int64): Int64; cdecl;
//
//    { Property }
//  end;
//
//  TJRecyclableBufferedInputStream = class(TJavaGenericImport<JRecyclableBufferedInputStreamClass, JRecyclableBufferedInputStream>) end;

  JRoundedCornersClass = interface(JBitmapTransformationClass) // or JObjectClass
  ['{66F7993B-C335-42AD-96C5-59EBD00FAA96}']
    { static Property Methods }

    { static Methods }
    {class} function init(roundingRadius: Integer): JRoundedCorners; cdecl; overload;
    {class} function init(bitmapPool: JBitmapPool; roundingRadius: Integer): JRoundedCorners; cdecl; overload; //Deprecated
    {class} function init(context: JContext; roundingRadius: Integer): JRoundedCorners; cdecl; overload; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/RoundedCorners')]
  JRoundedCorners = interface(JBitmapTransformation) // or JObject
  ['{5A34FF22-4533-42D9-AFBE-728345C98397}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJRoundedCorners = class(TJavaGenericImport<JRoundedCornersClass, JRoundedCorners>) end;

  JStreamBitmapDecoder_UntrustedCallbacksClass = interface(JObjectClass)
  ['{20E8CC69-38D3-4F44-9B5C-5ADE1F7A1CD3}']
    { static Property Methods }

    { static Methods }
//    {class} function init(bufferedStream: JRecyclableBufferedInputStream; exceptionStream: JExceptionCatchingInputStream): JStreamBitmapDecoder_UntrustedCallbacks; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/StreamBitmapDecoder$UntrustedCallbacks')]
  JStreamBitmapDecoder_UntrustedCallbacks = interface(JObject)
  ['{5BF447DC-02FC-42E3-B55E-6A76A86BD608}']
    { Property Methods }

    { methods }
    procedure onObtainBounds; cdecl;
    procedure onDecodeComplete(bitmapPool: JBitmapPool; downsampled: JBitmap); cdecl;

    { Property }
  end;

  TJStreamBitmapDecoder_UntrustedCallbacks = class(TJavaGenericImport<JStreamBitmapDecoder_UntrustedCallbacksClass, JStreamBitmapDecoder_UntrustedCallbacks>) end;

  JStreamBitmapDecoderClass = interface(JObjectClass)
  ['{04F96BFA-AEFE-426A-8D7A-E10707984BFB}']
    { static Property Methods }

    { static Methods }
    {class} function init(downsampler: JDownsampler; byteArrayPool: JArrayPool): JStreamBitmapDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/StreamBitmapDecoder')]
  JStreamBitmapDecoder = interface(JObject)
  ['{D29F7F41-D96E-46E1-BD48-ECC4B8174A23}']
    { Property Methods }

    { methods }
    function handles(source: JInputStream; options: JOptions): Boolean; cdecl; overload;
    function decode(source: JInputStream; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJStreamBitmapDecoder = class(TJavaGenericImport<JStreamBitmapDecoderClass, JStreamBitmapDecoder>) end;

  JTransformationUtils_NoLockClass = interface(JObjectClass)
  ['{60CBF44F-5A2C-4A52-B15C-0BAFDA8C3631}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/TransformationUtils$NoLock')]
  JTransformationUtils_NoLock = interface(JObject)
  ['{77F47AA8-55E5-4A2E-B34D-DE0B43390208}']
    { Property Methods }

    { methods }
    procedure lock; cdecl;
    procedure lockInterruptibly; cdecl;
    function tryLock: Boolean; cdecl; overload;
    function tryLock(time: Int64; P2: JTimeUnit): Boolean; cdecl; overload;
    procedure unlock; cdecl;
//    function newCondition: JCondition; cdecl;

    { Property }
  end;

  TJTransformationUtils_NoLock = class(TJavaGenericImport<JTransformationUtils_NoLockClass, JTransformationUtils_NoLock>) end;

  JTransformationUtilsClass = interface(JObjectClass)
  ['{DC2F013F-E6F3-455F-8FBA-34D646A26B68}']
    { static Property Methods }
    {class} function _GetPAINT_FLAGS: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
//    {class} function getBitmapDrawableLock: JLock; cdecl;
    {class} function centerCrop(pool: JBitmapPool; inBitmap: JBitmap; width: Integer; height: Integer): JBitmap; cdecl;
    {class} function fitCenter(pool: JBitmapPool; inBitmap: JBitmap; width: Integer; height: Integer): JBitmap; cdecl;
    {class} function centerInside(pool: JBitmapPool; inBitmap: JBitmap; width: Integer; height: Integer): JBitmap; cdecl;
    {class} procedure setAlpha(inBitmap: JBitmap; outBitmap: JBitmap); cdecl;
    {class} function rotateImage(imageToOrient: JBitmap; degreesToRotate: Integer): JBitmap; cdecl;
    {class} function getExifOrientationDegrees(exifOrientation: Integer): Integer; cdecl;
    {class} function rotateImageExif(pool: JBitmapPool; inBitmap: JBitmap; exifOrientation: Integer): JBitmap; cdecl;
    {class} function circleCrop(pool: JBitmapPool; inBitmap: JBitmap; destWidth: Integer; destHeight: Integer): JBitmap; cdecl;
    {class} function roundedCorners(pool: JBitmapPool; inBitmap: JBitmap; width: Integer; height: Integer; roundingRadius: Integer): JBitmap; cdecl;

    { static Property }
    {class} property PAINT_FLAGS: Integer read _GetPAINT_FLAGS;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/TransformationUtils')]
  JTransformationUtils = interface(JObject)
  ['{B89A5893-D3EA-4EDC-B790-19845C59F7C5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJTransformationUtils = class(TJavaGenericImport<JTransformationUtilsClass, JTransformationUtils>) end;

//  JVideoBitmapDecoder_1Class = interface(JObjectClass)
//  ['{D6D09336-5FAE-4333-9353-389542B06E78}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoBitmapDecoder$1')]
//  JVideoBitmapDecoder_1 = interface(JObject)
//  ['{95BDE98D-DEE0-462E-A270-A76A63690B86}']
//    { Property Methods }
//
//    { methods }
//    procedure update(keyBytes: TJavaArray<Byte>; value: JLong; messageDigest: JMessageDigest); cdecl; overload;
//    procedure update(this: TJavaArray<Byte>; P2: JObject; P3: JMessageDigest); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJVideoBitmapDecoder_1 = class(TJavaGenericImport<JVideoBitmapDecoder_1Class, JVideoBitmapDecoder_1>) end;

//  JVideoBitmapDecoder_2Class = interface(JObjectClass)
//  ['{0941584B-69BD-4E8A-8D55-8F123DBC3F83}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoBitmapDecoder$2')]
//  JVideoBitmapDecoder_2 = interface(JObject)
//  ['{2EF76CFC-19CA-4D79-9B03-58D922C13B43}']
//    { Property Methods }
//
//    { methods }
//    procedure update(keyBytes: TJavaArray<Byte>; value: JInteger; messageDigest: JMessageDigest); cdecl; overload;
//    procedure update(this: TJavaArray<Byte>; P2: JObject; P3: JMessageDigest); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJVideoBitmapDecoder_2 = class(TJavaGenericImport<JVideoBitmapDecoder_2Class, JVideoBitmapDecoder_2>) end;

  JVideoBitmapDecoder_MediaMetadataRetrieverFactoryClass = interface(JObjectClass)
  ['{F20443B0-4CEB-4E0F-B58C-099089C73D89}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoBitmapDecoder$MediaMetadataRetrieverFactory')]
  JVideoBitmapDecoder_MediaMetadataRetrieverFactory = interface(JObject)
  ['{E8B5CB59-DC16-4B08-AD78-A6FDD149D582}']
    { Property Methods }

    { methods }
//    function build: JMediaMetadataRetriever; cdecl;

    { Property }
  end;

  TJVideoBitmapDecoder_MediaMetadataRetrieverFactory = class(TJavaGenericImport<JVideoBitmapDecoder_MediaMetadataRetrieverFactoryClass, JVideoBitmapDecoder_MediaMetadataRetrieverFactory>) end;

  JVideoBitmapDecoderClass = interface(JObjectClass)
  ['{E16D4BC1-F418-410A-A66E-3D58D30418D9}']
    { static Property Methods }
    {class} function _GetDEFAULT_FRAME: Int64;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetTARGET_FRAME: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFRAME_OPTION: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(context: JContext): JVideoBitmapDecoder; cdecl; overload;
    {class} function init(bitmapPool: JBitmapPool): JVideoBitmapDecoder; cdecl; overload;

    { static Property }
    {class} property DEFAULT_FRAME: Int64 read _GetDEFAULT_FRAME;
    {class} property TARGET_FRAME: JOption read _GetTARGET_FRAME;
    {class} property FRAME_OPTION: JOption read _GetFRAME_OPTION;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bitmap/VideoBitmapDecoder')]
  JVideoBitmapDecoder = interface(JObject)
  ['{070D41DF-AA81-459D-AEE6-5DEBB377D8F0}']
    { Property Methods }

    { methods }
    function handles(data: JParcelFileDescriptor; options: JOptions): Boolean; cdecl; overload;
    function decode(resource: JParcelFileDescriptor; outWidth: Integer; outHeight: Integer; options: JOptions): JResource; cdecl; overload;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJVideoBitmapDecoder = class(TJavaGenericImport<JVideoBitmapDecoderClass, JVideoBitmapDecoder>) end;

  JByteBufferRewinder_FactoryClass = interface(JObjectClass)
  ['{8F119F56-09D8-4569-A664-03EB8090F7EB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JByteBufferRewinder_Factory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bytes/ByteBufferRewinder$Factory')]
  JByteBufferRewinder_Factory = interface(JObject)
  ['{3657A34F-1DB5-407F-BCD7-745AE9AD7333}']
    { Property Methods }

    { methods }
    function build(data: JByteBuffer): JDataRewinder; cdecl; overload;
    //function getDataClass: JClass; cdecl;
    function build(this: JObject): JDataRewinder; cdecl; overload;

    { Property }
  end;

  TJByteBufferRewinder_Factory = class(TJavaGenericImport<JByteBufferRewinder_FactoryClass, JByteBufferRewinder_Factory>) end;

  JByteBufferRewinderClass = interface(JObjectClass)
  ['{4153E840-10FB-493A-8C2A-4DD96C3D9E59}']
    { static Property Methods }

    { static Methods }
    {class} function init(buffer: JByteBuffer): JByteBufferRewinder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bytes/ByteBufferRewinder')]
  JByteBufferRewinder = interface(JObject)
  ['{72DA5B17-F163-4FCF-8A7F-17952111FDED}']
    { Property Methods }

    { methods }
    function rewindAndGet: JByteBuffer; cdecl; overload;
    procedure cleanup; cdecl;
//    function rewindAndGet: JObject; cdecl; overload;

    { Property }
  end;

  TJByteBufferRewinder = class(TJavaGenericImport<JByteBufferRewinderClass, JByteBufferRewinder>) end;

  JBytesResourceClass = interface(JObjectClass)
  ['{F048ED3F-28E5-486B-BFFF-FFAF3D3C4187}']
    { static Property Methods }

    { static Methods }
    {class} function init(bytes: TJavaArray<Byte>): JBytesResource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/bytes/BytesResource')]
  JBytesResource = interface(JObject)
  ['{40FC8089-B48A-4E46-B48A-D1CED1FDE066}']
    { Property Methods }

    { methods }
//    function getResourceClass: JClass; cdecl;
    function get: TJavaArray<Byte>; cdecl; overload;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;
//    function get: JObject; cdecl; overload;

    { Property }
  end;

  TJBytesResource = class(TJavaGenericImport<JBytesResourceClass, JBytesResource>) end;

  JDrawableTransitionOptionsClass = interface(JTransitionOptionsClass) // or JObjectClass
  ['{539FB7BC-4F5B-4392-A578-C6377C17E00A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDrawableTransitionOptions; cdecl;
    {class} function withCrossFade: JDrawableTransitionOptions; cdecl; overload;
    {class} function withCrossFade(duration: Integer): JDrawableTransitionOptions; cdecl; overload;
    {class} function withCrossFade(animationId: Integer; duration: Integer): JDrawableTransitionOptions; cdecl; overload;
    {class} function withCrossFade(drawableCrossFadeFactory: JDrawableCrossFadeFactory): JDrawableTransitionOptions; cdecl; overload;
    {class} function withCrossFade(builder: JDrawableCrossFadeFactory_Builder): JDrawableTransitionOptions; cdecl; overload;
    {class} function &with(transitionFactory: JTransitionFactory): JDrawableTransitionOptions; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/drawable/DrawableTransitionOptions')]
  JDrawableTransitionOptions = interface(JTransitionOptions) // or JObject
  ['{7A9068DA-F626-453D-8C70-5E0C04243171}']
    { Property Methods }

    { methods }
    function crossFade: JDrawableTransitionOptions; cdecl; overload;
    function crossFade(duration: Integer): JDrawableTransitionOptions; cdecl; overload;
    function crossFade(animationId: Integer; duration: Integer): JDrawableTransitionOptions; cdecl; overload;
    function crossFade(drawableCrossFadeFactory: JDrawableCrossFadeFactory): JDrawableTransitionOptions; cdecl; overload;
    function crossFade(builder: JDrawableCrossFadeFactory_Builder): JDrawableTransitionOptions; cdecl; overload;

    { Property }
  end;

  TJDrawableTransitionOptions = class(TJavaGenericImport<JDrawableTransitionOptionsClass, JDrawableTransitionOptions>) end;

  JFileDecoderClass = interface(JObjectClass)
  ['{85304D9B-8831-4731-B426-F938DCA3AE4A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JFileDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/file/FileDecoder')]
  JFileDecoder = interface(JObject)
  ['{7835848B-1F26-4657-B00D-AD263F386F25}']
    { Property Methods }

    { methods }
    function handles(source: JFile; options: JOptions): Boolean; cdecl; overload;
    function decode(source: JFile; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJFileDecoder = class(TJavaGenericImport<JFileDecoderClass, JFileDecoder>) end;

  JSimpleResourceClass = interface(JObjectClass)
  ['{B9BDA2ED-046D-47FA-B104-9A717989372F}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: JObject): JSimpleResource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/SimpleResource')]
  JSimpleResource = interface(JObject)
  ['{0C82CDA0-8054-459D-95AE-CFC02F382C7F}']
    { Property Methods }

    { methods }
//    function getResourceClass: JClass; cdecl;
    function get: JObject; cdecl;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;

    { Property }
  end;

  TJSimpleResource = class(TJavaGenericImport<JSimpleResourceClass, JSimpleResource>) end;

  JFileResourceClass = interface(JSimpleResourceClass) // or JObjectClass
  ['{AD182B6F-EBDD-4B3A-A22E-27019ADABCE6}']
    { static Property Methods }

    { static Methods }
    {class} function init(afile: JFile): JFileResource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/file/FileResource')]
  JFileResource = interface(JSimpleResource) // or JObject
  ['{25F1552B-BD94-41CE-9756-7934C6220CA8}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFileResource = class(TJavaGenericImport<JFileResourceClass, JFileResource>) end;

  JByteBufferGifDecoder_GifDecoderFactoryClass = interface(JObjectClass)
  ['{0F422230-CB60-4BB1-8D3C-6CA572094AB4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifDecoderFactory')]
  JByteBufferGifDecoder_GifDecoderFactory = interface(JObject)
  ['{BA22CD2A-BD2A-41BB-A1AD-B940B98D9693}']
    { Property Methods }

    { methods }
//    function build(provider: JGifDecoder_BitmapProvider; header: JGifHeader; data: JByteBuffer; sampleSize: Integer): JGifDecoder; cdecl;

    { Property }
  end;

  TJByteBufferGifDecoder_GifDecoderFactory = class(TJavaGenericImport<JByteBufferGifDecoder_GifDecoderFactoryClass, JByteBufferGifDecoder_GifDecoderFactory>) end;

  JByteBufferGifDecoder_GifHeaderParserPoolClass = interface(JObjectClass)
  ['{D6A3DD8D-36DB-49E2-A809-B5E176D3059A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/ByteBufferGifDecoder$GifHeaderParserPool')]
  JByteBufferGifDecoder_GifHeaderParserPool = interface(JObject)
  ['{6096CBCA-08B9-4D63-9E3C-07720CC160E4}']
    { Property Methods }

    { methods }
//    function obtain(buffer: JByteBuffer): JGifHeaderParser; cdecl;
//    procedure release(parser: JGifHeaderParser); cdecl;

    { Property }
  end;

  TJByteBufferGifDecoder_GifHeaderParserPool = class(TJavaGenericImport<JByteBufferGifDecoder_GifHeaderParserPoolClass, JByteBufferGifDecoder_GifHeaderParserPool>) end;

  JByteBufferGifDecoderClass = interface(JObjectClass)
  ['{93DDA4C1-B24A-45E0-BA9A-499712DB4E17}']
    { static Property Methods }
    {class} function _GetDISABLE_ANIMATION: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(context: JContext): JByteBufferGifDecoder; cdecl; overload;
    {class} function init(context: JContext; parsers: JList; P3: JBitmapPool; arrayPool: JArrayPool): JByteBufferGifDecoder; cdecl; overload;

    { static Property }
    {class} property DISABLE_ANIMATION: JOption read _GetDISABLE_ANIMATION;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/ByteBufferGifDecoder')]
  JByteBufferGifDecoder = interface(JObject)
  ['{C672C37E-206B-4D1A-9767-C80EE748ACF9}']
    { Property Methods }

    { methods }
    function handles(source: JByteBuffer; options: JOptions): Boolean; cdecl; overload;
    function decode(source: JByteBuffer; width: Integer; height: Integer; options: JOptions): JGifDrawableResource; cdecl; overload;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJByteBufferGifDecoder = class(TJavaGenericImport<JByteBufferGifDecoderClass, JByteBufferGifDecoder>) end;

  JGifBitmapProviderClass = interface(JObjectClass)
  ['{6F58C1D9-2655-48DB-AC0E-2425876CD0F7}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool): JGifBitmapProvider; cdecl; overload;
    {class} function init(bitmapPool: JBitmapPool; arrayPool: JArrayPool): JGifBitmapProvider; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifBitmapProvider')]
  JGifBitmapProvider = interface(JObject)
  ['{CEFA2936-AC5D-4472-861C-BE37F989F470}']
    { Property Methods }

    { methods }
    function obtain(width: Integer; height: Integer; config: JBitmap_Config): JBitmap; cdecl;
    procedure release(bitmap: JBitmap); cdecl; overload;
    function obtainByteArray(size: Integer): TJavaArray<Byte>; cdecl;
    procedure release(bytes: TJavaArray<Byte>); cdecl; overload;
    function obtainIntArray(size: Integer): TJavaArray<Integer>; cdecl;
    procedure release(aarray: TJavaArray<Integer>); cdecl; overload;

    { Property }
  end;

  TJGifBitmapProvider = class(TJavaGenericImport<JGifBitmapProviderClass, JGifBitmapProvider>) end;

  JGifDrawable_GifStateClass = interface(JDrawable_ConstantStateClass) // or JObjectClass
  ['{CBE6B670-D789-4AFC-9676-AB0E3B834276}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool; frameLoader: JGifFrameLoader): JGifDrawable_GifState; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawable$GifState')]
  JGifDrawable_GifState = interface(JDrawable_ConstantState) // or JObject
  ['{5BCFB2A8-400E-49AD-BEBD-FE30BAB4416C}']
    { Property Methods }

    { methods }
    function newDrawable(res: JResources): JDrawable; cdecl; overload;
    function newDrawable: JDrawable; cdecl; overload;
    function getChangingConfigurations: Integer; cdecl;

    { Property }
  end;

  TJGifDrawable_GifState = class(TJavaGenericImport<JGifDrawable_GifStateClass, JGifDrawable_GifState>) end;

  JGifDrawableClass = interface(JDrawableClass) // or JObjectClass
  ['{D517CE73-FB22-4F9F-9BF6-391181FAE4F0}']
    { static Property Methods }
    {class} function _GetLOOP_FOREVER: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOOP_INTRINSIC: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
//    {class} function init(context: JContext; gifDecoder: JGifDecoder; bitmapPool: JBitmapPool; frameTransformation: JTransformation; P5: Integer; targetFrameHeight: Integer; firstFrame: JBitmap): JGifDrawable; cdecl;

    { static Property }
    {class} property LOOP_FOREVER: Integer read _GetLOOP_FOREVER;
    {class} property LOOP_INTRINSIC: Integer read _GetLOOP_INTRINSIC;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawable')]
  JGifDrawable = interface(JDrawable) // or JObject
  ['{1E14FC64-F47C-460C-93AC-EE71AD649227}']
    { Property Methods }

    { methods }
    function getSize: Integer; cdecl;
    function getFirstFrame: JBitmap; cdecl;
    procedure setFrameTransformation(frameTransformation: JTransformation; P2: JBitmap); cdecl;
    function getFrameTransformation: JTransformation; cdecl;
    function getBuffer: JByteBuffer; cdecl;
    function getFrameCount: Integer; cdecl;
    function getFrameIndex: Integer; cdecl;
    procedure startFromFirstFrame; cdecl;
    procedure start; cdecl;
    procedure stop; cdecl;
    function setVisible(visible: Boolean; restart: Boolean): Boolean; cdecl;
    function getIntrinsicWidth: Integer; cdecl;
    function getIntrinsicHeight: Integer; cdecl;
    function isRunning: Boolean; cdecl;
    procedure draw(canvas: JCanvas); cdecl;
    procedure setAlpha(i: Integer); cdecl;
    procedure setColorFilter(colorFilter: JColorFilter); cdecl;
    function getOpacity: Integer; cdecl;
    procedure onFrameReady; cdecl;
    function getConstantState: JDrawable_ConstantState; cdecl;
    procedure recycle; cdecl;
    procedure setLoopCount(loopCount: Integer); cdecl;

    { Property }
  end;

  TJGifDrawable = class(TJavaGenericImport<JGifDrawableClass, JGifDrawable>) end;

  JGifDrawableEncoderClass = interface(JObjectClass)
  ['{2C9ADB2E-9BC9-40EB-B438-C450AD6D9DC4}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGifDrawableEncoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawableEncoder')]
  JGifDrawableEncoder = interface(JObject)
  ['{77FD4FFE-87D0-47CE-B566-612E56488D1B}']
    { Property Methods }

    { methods }
    function getEncodeStrategy(options: JOptions): JEncodeStrategy; cdecl;
    function encode(data: JResource; P2: JFile; options: JOptions): Boolean; cdecl; overload;
    function encode(this: JObject; P2: JFile; P3: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJGifDrawableEncoder = class(TJavaGenericImport<JGifDrawableEncoderClass, JGifDrawableEncoder>) end;

  JGifDrawableResourceClass = interface(JDrawableResourceClass) // or JObjectClass
  ['{299059CA-6CB8-4E20-ABC9-C7B6D5BAE5FC}']
    { static Property Methods }

    { static Methods }
    {class} function init(drawable: JGifDrawable): JGifDrawableResource; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawableResource')]
  JGifDrawableResource = interface(JDrawableResource) // or JObject
  ['{DD0E0D39-DFBC-442A-93B2-F99A18A93F7F}']
    { Property Methods }

    { methods }
//    function getResourceClass: JClass; cdecl;
    function getSize: Integer; cdecl;
    procedure recycle; cdecl;
    procedure initialize; cdecl;

    { Property }
  end;

  TJGifDrawableResource = class(TJavaGenericImport<JGifDrawableResourceClass, JGifDrawableResource>) end;

  JGifDrawableTransformationClass = interface(JObjectClass)
  ['{CF62C536-3294-40E3-B92A-6B3A4D181B7C}']
    { static Property Methods }

    { static Methods }
    {class} function init(wrapped: JTransformation): JGifDrawableTransformation; cdecl; overload;
    {class} function init(context: JContext; wrapped: JTransformation): JGifDrawableTransformation; cdecl; overload; //Deprecated
    {class} function init(wrapped: JTransformation; P2: JBitmapPool): JGifDrawableTransformation; cdecl; overload; //Deprecated

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifDrawableTransformation')]
  JGifDrawableTransformation = interface(JObject)
  ['{D2C8C2FE-3BE3-413E-8FB7-CBC740AD0D26}']
    { Property Methods }

    { methods }
    function transform(context: JContext; resource: JResource; P3: Integer; outHeight: Integer): JResource; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
//    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJGifDrawableTransformation = class(TJavaGenericImport<JGifDrawableTransformationClass, JGifDrawableTransformation>) end;

  JSimpleTargetClass = interface(JBaseTargetClass) // or JObjectClass
  ['{7AB260FA-C26F-4B13-9DE5-26B43ACD472B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSimpleTarget; cdecl; overload;
    {class} function init(width: Integer; height: Integer): JSimpleTarget; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/SimpleTarget')]
  JSimpleTarget = interface(JBaseTarget) // or JObject
  ['{5E0FD773-21AC-4658-AE8D-AAA17E50CD94}']
    { Property Methods }

    { methods }
    procedure getSize(cb: JSizeReadyCallback); cdecl;
    procedure removeCallback(cb: JSizeReadyCallback); cdecl;

    { Property }
  end;

  TJSimpleTarget = class(TJavaGenericImport<JSimpleTargetClass, JSimpleTarget>) end;

  JGifFrameLoader_DelayTargetClass = interface(JSimpleTargetClass) // or JObjectClass
  ['{19F46538-893C-49AE-9690-8751C46D19CA}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader$DelayTarget')]
  JGifFrameLoader_DelayTarget = interface(JSimpleTarget) // or JObject
  ['{F1BCE57E-EE47-43F9-9FA6-19057420EF5C}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JBitmap; transition: JTransition); cdecl; overload;
    procedure onResourceReady(this: JObject; P2: JTransition); cdecl; overload;

    { Property }
  end;

  TJGifFrameLoader_DelayTarget = class(TJavaGenericImport<JGifFrameLoader_DelayTargetClass, JGifFrameLoader_DelayTarget>) end;

  JGifFrameLoader_FrameCallbackClass = interface(JObjectClass)
  ['{13FB3BD3-4698-4069-AAC6-C5FE2C08BF57}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader$FrameCallback')]
  JGifFrameLoader_FrameCallback = interface(IJavaInstance)
  ['{625A2431-8095-4ADE-9CE3-ABF099F0A636}']
    { Property Methods }

    { methods }
    procedure onFrameReady; cdecl;

    { Property }
  end;

  TJGifFrameLoader_FrameCallback = class(TJavaGenericImport<JGifFrameLoader_FrameCallbackClass, JGifFrameLoader_FrameCallback>) end;

  JGifFrameLoader_FrameLoaderCallbackClass = interface(JObjectClass)
  ['{F6093DD1-AB05-453D-82D2-1DA968A61062}']
    { static Property Methods }
    {class} function _GetMSG_DELAY: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetMSG_CLEAR: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property MSG_DELAY: Integer read _GetMSG_DELAY;
    {class} property MSG_CLEAR: Integer read _GetMSG_CLEAR;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader$FrameLoaderCallback')]
  JGifFrameLoader_FrameLoaderCallback = interface(JObject)
  ['{899BA148-DADE-41E9-99F1-9BAD4402FF84}']
    { Property Methods }

    { methods }
    function handleMessage(msg: JMessage): Boolean; cdecl;

    { Property }
  end;

  TJGifFrameLoader_FrameLoaderCallback = class(TJavaGenericImport<JGifFrameLoader_FrameLoaderCallbackClass, JGifFrameLoader_FrameLoaderCallback>) end;

  JGifFrameLoader_FrameSignatureClass = interface(JObjectClass)
  ['{B2980D8E-5296-4570-B548-6CDAA3AFEAFE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGifFrameLoader_FrameSignature; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader$FrameSignature')]
  JGifFrameLoader_FrameSignature = interface(JObject)
  ['{70ACACB2-4AAF-44EC-87D8-A4672350E473}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJGifFrameLoader_FrameSignature = class(TJavaGenericImport<JGifFrameLoader_FrameSignatureClass, JGifFrameLoader_FrameSignature>) end;

  JGifFrameLoaderClass = interface(JObjectClass)
  ['{190E42CA-7771-42E8-BB4C-54ED9167917E}']
    { static Property Methods }

    { static Methods }
//    {class} function init(glide: JGlide; gifDecoder: JGifDecoder; width: Integer; height: Integer; transformation: JTransformation; P6: JBitmap): JGifFrameLoader; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameLoader')]
  JGifFrameLoader = interface(JObject)
  ['{CDCC6399-9FD2-4623-BF55-86E71EAB2EBA}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGifFrameLoader = class(TJavaGenericImport<JGifFrameLoaderClass, JGifFrameLoader>) end;

  JGifFrameResourceDecoderClass = interface(JObjectClass)
  ['{78D67291-7E87-43AF-B100-A3D3E34F1CE8}']
    { static Property Methods }

    { static Methods }
    {class} function init(bitmapPool: JBitmapPool): JGifFrameResourceDecoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/GifFrameResourceDecoder')]
  JGifFrameResourceDecoder = interface(JObject)
  ['{AE5ECFBB-089B-4F4D-9901-B2B02B62A7C4}']
    { Property Methods }

    { methods }
    function handles(source: JGifDecoder; options: JOptions): Boolean; cdecl; overload;
    function decode(source: JGifDecoder; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload;
//    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload;
//    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJGifFrameResourceDecoder = class(TJavaGenericImport<JGifFrameResourceDecoderClass, JGifFrameResourceDecoder>) end;

  JStreamGifDecoderClass = interface(JObjectClass)
  ['{98C44AA9-827A-4DB0-92C9-3FE9CE9F0579}']
    { static Property Methods }
    {class} function _GetDISABLE_ANIMATION: JOption;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function init(parsers: JList; P2: JResourceDecoder; byteBufferDecoder: JArrayPool): JStreamGifDecoder; cdecl;

    { static Property }
    {class} property DISABLE_ANIMATION: JOption read _GetDISABLE_ANIMATION;
  end;

  [JavaSignature('com/bumptech/glide/load/resource/gif/StreamGifDecoder')]
  JStreamGifDecoder = interface(JObject)
  ['{7BB42DEF-4358-4092-93FA-BEB29B82B63C}']
    { Property Methods }

    { methods }
    function handles(source: JInputStream; options: JOptions): Boolean; cdecl; overload;
    function decode(source: JInputStream; width: Integer; height: Integer; options: JOptions): JResource; cdecl; overload;
    function decode(this: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl; overload;
    function handles(this: JObject; P2: JOptions): Boolean; cdecl; overload;

    { Property }
  end;

  TJStreamGifDecoder = class(TJavaGenericImport<JStreamGifDecoderClass, JStreamGifDecoder>) end;

  JBitmapBytesTranscoderClass = interface(JObjectClass)
  ['{9C80BD8F-427A-49A0-8F82-E31E83372D10}']
    { static Property Methods }

    { static Methods }
    {class} function init: JBitmapBytesTranscoder; cdecl; overload;
    {class} function init(compressFormat: JBitmap_CompressFormat; quality: Integer): JBitmapBytesTranscoder; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/BitmapBytesTranscoder')]
  JBitmapBytesTranscoder = interface(JObject)
  ['{BA69FECB-61F8-450D-919F-96125C674355}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource): JResource; cdecl;

    { Property }
  end;

  TJBitmapBytesTranscoder = class(TJavaGenericImport<JBitmapBytesTranscoderClass, JBitmapBytesTranscoder>) end;

  JBitmapDrawableTranscoderClass = interface(JObjectClass)
  ['{3F0EDCFB-1657-479E-B249-E7E896D274DB}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JBitmapDrawableTranscoder; cdecl; overload;
    {class} function init(resources: JResources; bitmapPool: JBitmapPool): JBitmapDrawableTranscoder; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/BitmapDrawableTranscoder')]
  JBitmapDrawableTranscoder = interface(JObject)
  ['{D9D4E6A1-B6F3-4BE8-BBD3-20D10832057D}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource): JResource; cdecl;

    { Property }
  end;

  TJBitmapDrawableTranscoder = class(TJavaGenericImport<JBitmapDrawableTranscoderClass, JBitmapDrawableTranscoder>) end;

  JGifDrawableBytesTranscoderClass = interface(JObjectClass)
  ['{B34C591C-4D8F-4CD4-8931-C4761BF00803}']
    { static Property Methods }

    { static Methods }
    {class} function init: JGifDrawableBytesTranscoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/GifDrawableBytesTranscoder')]
  JGifDrawableBytesTranscoder = interface(JObject)
  ['{739F947D-978F-4A28-AD19-3EB0489B9937}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource): JResource; cdecl;

    { Property }
  end;

  TJGifDrawableBytesTranscoder = class(TJavaGenericImport<JGifDrawableBytesTranscoderClass, JGifDrawableBytesTranscoder>) end;

  JResourceTranscoderClass = interface(JObjectClass)
  ['{F03EB814-2545-40FF-B796-B778BE3A2CB4}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/ResourceTranscoder')]
  JResourceTranscoder = interface(IJavaInstance)
  ['{BAA74BB5-3BA8-4A0B-9F4E-075613C1813F}']
    { Property Methods }

    { methods }
    function transcode(P1: JResource): JResource; cdecl;

    { Property }
  end;

  TJResourceTranscoder = class(TJavaGenericImport<JResourceTranscoderClass, JResourceTranscoder>) end;

  JTranscoderRegistry_EntryClass = interface(JObjectClass)
  ['{53938824-0360-4801-BDCE-EA4B708171BE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/TranscoderRegistry$Entry')]
  JTranscoderRegistry_Entry = interface(JObject)
  ['{571EFB8B-4188-4C23-BD1D-DC3F1B319AEE}']
    { Property Methods }

    { methods }
//    function handles(fromClass: JClass; toClass: JClass): Boolean; cdecl;

    { Property }
  end;

  TJTranscoderRegistry_Entry = class(TJavaGenericImport<JTranscoderRegistry_EntryClass, JTranscoderRegistry_Entry>) end;

  JTranscoderRegistryClass = interface(JObjectClass)
  ['{B607171F-39F4-4E9B-B0AE-DE3C9C3296BC}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTranscoderRegistry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/TranscoderRegistry')]
  JTranscoderRegistry = interface(JObject)
  ['{365FC996-3AFA-4E6D-88B7-7B478B376028}']
    { Property Methods }

    { methods }
//    procedure &register(decodedClass: JClass; P2: JClass; transcodedClass: JResourceTranscoder); cdecl;
//    function get(resourceClass: JClass; P2: JClass): JResourceTranscoder; cdecl;
//    function getTranscodeClasses(resourceClass: JClass; P2: JClass): JList; cdecl;

    { Property }
  end;

  TJTranscoderRegistry = class(TJavaGenericImport<JTranscoderRegistryClass, JTranscoderRegistry>) end;

  JUnitTranscoderClass = interface(JObjectClass)
  ['{5691601D-DF51-40F7-ABAB-F20DB442A0D6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JUnitTranscoder; cdecl;
    {class} function get: JResourceTranscoder; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/transcode/UnitTranscoder')]
  JUnitTranscoder = interface(JObject)
  ['{E2EDA9E7-7CF4-484B-86F6-193EEDDB76DF}']
    { Property Methods }

    { methods }
    function transcode(toTranscode: JResource): JResource; cdecl;

    { Property }
  end;

  TJUnitTranscoder = class(TJavaGenericImport<JUnitTranscoderClass, JUnitTranscoder>) end;

  JUnitTransformationClass = interface(JObjectClass)
  ['{41854F7D-F50B-4EE2-BF20-894AEB129144}']
    { static Property Methods }

    { static Methods }
    {class} function get: JUnitTransformation; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/resource/UnitTransformation')]
  JUnitTransformation = interface(JObject)
  ['{91A5945D-BADB-4CFE-83F3-409380842CB1}']
    { Property Methods }

    { methods }
    function transform(context: JContext; resource: JResource; outWidth: Integer; outHeight: Integer): JResource; cdecl;
    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJUnitTransformation = class(TJavaGenericImport<JUnitTransformationClass, JUnitTransformation>) end;

  JResourceDecoderClass = interface(JObjectClass)
  ['{56164167-4F67-4A9D-9ABE-7FCADF51EC86}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/ResourceDecoder')]
  JResourceDecoder = interface(IJavaInstance)
  ['{34874B96-69F4-4B6B-9B5D-D4E71D7D27E7}']
    { Property Methods }

    { methods }
    function handles(P1: JObject; P2: JOptions): Boolean; cdecl;
    function decode(P1: JObject; P2: Integer; P3: Integer; P4: JOptions): JResource; cdecl;

    { Property }
  end;

  TJResourceDecoder = class(TJavaGenericImport<JResourceDecoderClass, JResourceDecoder>) end;

  JResourceEncoderClass = interface(JObjectClass)
  ['{BC8A88B0-7858-4AA2-BABE-B163D96B4A62}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/ResourceEncoder')]
  JResourceEncoder = interface(IJavaInstance)
  ['{7255B59A-F85A-4AAC-80FA-3033C2A61FAE}']
    { Property Methods }

    { methods }
    function getEncodeStrategy(P1: JOptions): JEncodeStrategy; cdecl;

    { Property }
  end;

  TJResourceEncoder = class(TJavaGenericImport<JResourceEncoderClass, JResourceEncoder>) end;

  JTransformationClass = interface(JObjectClass)
  ['{D49E7D67-07FA-403F-9333-4436742E3EFE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/load/Transformation')]
  JTransformation = interface(IJavaInstance)
  ['{3AEF1A61-1B98-4288-A2C4-6D655391A18C}']
    { Property Methods }

    { methods }
    function transform(P1: JContext; P2: JResource; P3: Integer; P4: Integer): JResource; cdecl;
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJTransformation = class(TJavaGenericImport<JTransformationClass, JTransformation>) end;

  JActivityFragmentLifecycleClass = interface(JObjectClass)
  ['{C6D2E63E-2AA5-40D1-A7FB-73A6A4BCDE54}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ActivityFragmentLifecycle')]
  JActivityFragmentLifecycle = interface(JObject)
  ['{2397FDC9-37A1-452D-BC7F-25B91756BC4B}']
    { Property Methods }

    { methods }
    procedure addListener(listener: JLifecycleListener); cdecl;
    procedure removeListener(listener: JLifecycleListener); cdecl;

    { Property }
  end;

  TJActivityFragmentLifecycle = class(TJavaGenericImport<JActivityFragmentLifecycleClass, JActivityFragmentLifecycle>) end;

  JApplicationLifecycleClass = interface(JObjectClass)
  ['{BBB664B7-491B-4FA7-99EE-37A027185B35}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ApplicationLifecycle')]
  JApplicationLifecycle = interface(JObject)
  ['{35B05772-C0E6-4C15-988F-09772628C7F4}']
    { Property Methods }

    { methods }
    procedure addListener(listener: JLifecycleListener); cdecl;
    procedure removeListener(listener: JLifecycleListener); cdecl;

    { Property }
  end;

  TJApplicationLifecycle = class(TJavaGenericImport<JApplicationLifecycleClass, JApplicationLifecycle>) end;

  JConnectivityMonitor_ConnectivityListenerClass = interface(JObjectClass)
  ['{B72B1F50-4623-4EFF-BB35-B671D9DBAC0D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ConnectivityMonitor$ConnectivityListener')]
  JConnectivityMonitor_ConnectivityListener = interface(IJavaInstance)
  ['{6D8878E3-74E3-4F67-816E-F1707218A914}']
    { Property Methods }

    { methods }
    procedure onConnectivityChanged(P1: Boolean); cdecl;

    { Property }
  end;

  TJConnectivityMonitor_ConnectivityListener = class(TJavaGenericImport<JConnectivityMonitor_ConnectivityListenerClass, JConnectivityMonitor_ConnectivityListener>) end;

  JConnectivityMonitorClass = interface(JObjectClass)
  ['{E6CAE712-1E53-4842-8289-D6777D909F93}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ConnectivityMonitor')]
  JConnectivityMonitor = interface(IJavaInstance)
  ['{FC5BC578-D548-4525-8D55-E95DF7403F18}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJConnectivityMonitor = class(TJavaGenericImport<JConnectivityMonitorClass, JConnectivityMonitor>) end;

  JConnectivityMonitorFactoryClass = interface(JObjectClass)
  ['{3B57A8AA-A070-4DDC-B3FC-69130AA5A041}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/ConnectivityMonitorFactory')]
  JConnectivityMonitorFactory = interface(IJavaInstance)
  ['{3B2A790C-B802-4515-92FB-E5E8D22E0276}']
    { Property Methods }

    { methods }
    function build(P1: JContext; P2: JConnectivityMonitor_ConnectivityListener): JConnectivityMonitor; cdecl;

    { Property }
  end;

  TJConnectivityMonitorFactory = class(TJavaGenericImport<JConnectivityMonitorFactoryClass, JConnectivityMonitorFactory>) end;

//  JDefaultConnectivityMonitor_1Class = interface(JBroadcastReceiverClass) // or JObjectClass
//  ['{10475EC9-0106-4A0D-B08E-46B5EFB1F9C1}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/manager/DefaultConnectivityMonitor$1')]
//  JDefaultConnectivityMonitor_1 = interface(JBroadcastReceiver) // or JObject
//  ['{9F182C04-D3CF-4315-953A-090A376897B0}']
//    { Property Methods }
//
//    { methods }
//    procedure onReceive(context: JContext; intent: JIntent); cdecl;
//
//    { Property }
//  end;
//
//  TJDefaultConnectivityMonitor_1 = class(TJavaGenericImport<JDefaultConnectivityMonitor_1Class, JDefaultConnectivityMonitor_1>) end;

  JDefaultConnectivityMonitorClass = interface(JObjectClass)
  ['{48ACB122-1537-473B-84C3-37C47A829849}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; listener: JConnectivityMonitor_ConnectivityListener): JDefaultConnectivityMonitor; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/DefaultConnectivityMonitor')]
  JDefaultConnectivityMonitor = interface(JObject)
  ['{331315FB-BFD6-4C31-AD60-3D787C8EDD89}']
    { Property Methods }

    { methods }
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJDefaultConnectivityMonitor = class(TJavaGenericImport<JDefaultConnectivityMonitorClass, JDefaultConnectivityMonitor>) end;

  JDefaultConnectivityMonitorFactoryClass = interface(JObjectClass)
  ['{49EA8335-988D-4CAF-84C0-2F540D067BBB}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDefaultConnectivityMonitorFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/DefaultConnectivityMonitorFactory')]
  JDefaultConnectivityMonitorFactory = interface(JObject)
  ['{500CA435-92D2-42B0-8DD9-B94A7578C082}']
    { Property Methods }

    { methods }
    function build(context: JContext; listener: JConnectivityMonitor_ConnectivityListener): JConnectivityMonitor; cdecl;

    { Property }
  end;

  TJDefaultConnectivityMonitorFactory = class(TJavaGenericImport<JDefaultConnectivityMonitorFactoryClass, JDefaultConnectivityMonitorFactory>) end;

  JEmptyRequestManagerTreeNodeClass = interface(JObjectClass)
  ['{12B30424-5E05-4C8D-97AA-545ED24C07A9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/EmptyRequestManagerTreeNode')]
  JEmptyRequestManagerTreeNode = interface(JObject)
  ['{72A3B3F9-4D06-409A-B68C-90F11E5AF4DD}']
    { Property Methods }

    { methods }
    function getDescendants: JSet; cdecl;

    { Property }
  end;

  TJEmptyRequestManagerTreeNode = class(TJavaGenericImport<JEmptyRequestManagerTreeNodeClass, JEmptyRequestManagerTreeNode>) end;

  JLifecycleClass = interface(JObjectClass)
  ['{3B905CA8-5A1B-48A4-8764-B4C1C3330978}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/Lifecycle')]
  JLifecycle = interface(IJavaInstance)
  ['{7B6B256E-885A-4F4E-B517-A077AB0FF65F}']
    { Property Methods }

    { methods }
    procedure addListener(P1: JLifecycleListener); cdecl;
    procedure removeListener(P1: JLifecycleListener); cdecl;

    { Property }
  end;

  TJLifecycle = class(TJavaGenericImport<JLifecycleClass, JLifecycle>) end;

  JLifecycleListenerClass = interface(JObjectClass)
  ['{9C7DB46A-D3F1-49C4-9B4D-7EEC758664F8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/LifecycleListener')]
  JLifecycleListener = interface(IJavaInstance)
  ['{A1722926-B45D-4691-A36E-EF0325D92657}']
    { Property Methods }

    { methods }
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJLifecycleListener = class(TJavaGenericImport<JLifecycleListenerClass, JLifecycleListener>) end;

  JNullConnectivityMonitorClass = interface(JObjectClass)
  ['{99486691-E1B4-4B71-B73C-5003E5429171}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/NullConnectivityMonitor')]
  JNullConnectivityMonitor = interface(JObject)
  ['{2393895E-3584-4F6F-92DE-7B799497A4AE}']
    { Property Methods }

    { methods }
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJNullConnectivityMonitor = class(TJavaGenericImport<JNullConnectivityMonitorClass, JNullConnectivityMonitor>) end;

  JRequestManagerFragment_FragmentRequestManagerTreeNodeClass = interface(JObjectClass)
  ['{DBA5E04B-6E99-4B5D-9774-CC9EA4A83097}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerFragment$FragmentRequestManagerTreeNode')]
  JRequestManagerFragment_FragmentRequestManagerTreeNode = interface(JObject)
  ['{52B3BADF-6CE9-4AA9-8867-BFA90181441D}']
    { Property Methods }

    { methods }
    function getDescendants: JSet; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJRequestManagerFragment_FragmentRequestManagerTreeNode = class(TJavaGenericImport<JRequestManagerFragment_FragmentRequestManagerTreeNodeClass, JRequestManagerFragment_FragmentRequestManagerTreeNode>) end;

  JRequestManagerFragmentClass = interface(JFragmentClass) // or JObjectClass
  ['{049AC2EA-3C77-4809-A788-1DCCFA868B0F}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRequestManagerFragment; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerFragment')]
  JRequestManagerFragment = interface(JFragment) // or JObject
  ['{74E55A9D-6489-4EE2-B364-1A677082B3C8}']
    { Property Methods }

    { methods }
    procedure setRequestManager(requestManager: JRequestManager); cdecl;
    function getRequestManager: JRequestManager; cdecl;
    function getRequestManagerTreeNode: JRequestManagerTreeNode; cdecl;
    function getDescendantRequestManagerFragments: JSet; cdecl;
    procedure onAttach(activity: JActivity); cdecl;
    procedure onDetach; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;
    procedure onTrimMemory(level: Integer); cdecl;
    procedure onLowMemory; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJRequestManagerFragment = class(TJavaGenericImport<JRequestManagerFragmentClass, JRequestManagerFragment>) end;

//  JRequestManagerRetriever_1Class = interface(JObjectClass)
//  ['{E8E8E9BA-937F-4945-8D1C-39F6729FB66B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/manager/RequestManagerRetriever$1')]
//  JRequestManagerRetriever_1 = interface(JObject)
//  ['{43B2B107-5F01-4392-8662-248D4A2D9535}']
//    { Property Methods }
//
//    { methods }
//    function build(glide: JGlide; lifecycle: JLifecycle; requestManagerTreeNode: JRequestManagerTreeNode): JRequestManager; cdecl;
//
//    { Property }
//  end;
//
//  TJRequestManagerRetriever_1 = class(TJavaGenericImport<JRequestManagerRetriever_1Class, JRequestManagerRetriever_1>) end;

  JRequestManagerRetriever_RequestManagerFactoryClass = interface(JObjectClass)
  ['{9A73B92C-12ED-412E-BD76-293EB992AF63}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerRetriever$RequestManagerFactory')]
  JRequestManagerRetriever_RequestManagerFactory = interface(IJavaInstance)
  ['{71D9C69D-298B-48D0-B863-C60275F88B4B}']
    { Property Methods }

    { methods }
    function build(P1: JGlide; P2: JLifecycle; P3: JRequestManagerTreeNode): JRequestManager; cdecl;

    { Property }
  end;

  TJRequestManagerRetriever_RequestManagerFactory = class(TJavaGenericImport<JRequestManagerRetriever_RequestManagerFactoryClass, JRequestManagerRetriever_RequestManagerFactory>) end;

  JRequestManagerRetrieverClass = interface(JObjectClass)
  ['{270801B8-6601-44B2-B1F5-999CDD2EB533}']
    { static Property Methods }

    { static Methods }
    {class} function init(factory: JRequestManagerRetriever_RequestManagerFactory): JRequestManagerRetriever; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerRetriever')]
  JRequestManagerRetriever = interface(JObject)
  ['{BA035FF2-1DEF-4E01-BD92-3ABD1354A50F}']
    { Property Methods }

    { methods }
    function get(context: JContext): JRequestManager; cdecl; overload;
//    function get(activity: JFragmentActivity): JRequestManager; cdecl; overload;
    function get(fragment: JFragment): JRequestManager; cdecl; overload;
    function get(activity: JActivity): JRequestManager; cdecl; overload;
    function get(view: JView): JRequestManager; cdecl; overload;
//    function get(fragment: JFragment): JRequestManager; cdecl; overload;
    function handleMessage(amessage: JMessage): Boolean; cdecl;

    { Property }
  end;

  TJRequestManagerRetriever = class(TJavaGenericImport<JRequestManagerRetrieverClass, JRequestManagerRetriever>) end;

  JRequestManagerTreeNodeClass = interface(JObjectClass)
  ['{EC6877C0-0D7A-4AF3-B120-039258AB293E}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestManagerTreeNode')]
  JRequestManagerTreeNode = interface(IJavaInstance)
  ['{29AB8735-6767-43CF-A894-587DB7C1976B}']
    { Property Methods }

    { methods }
    function getDescendants: JSet; cdecl;

    { Property }
  end;

  TJRequestManagerTreeNode = class(TJavaGenericImport<JRequestManagerTreeNodeClass, JRequestManagerTreeNode>) end;

  JRequestTrackerClass = interface(JObjectClass)
  ['{16B1ACBB-E927-47C7-99C2-DD3D233FD4D0}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRequestTracker; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/RequestTracker')]
  JRequestTracker = interface(JObject)
  ['{6DC1AD22-06A5-4709-913A-2A5ABB1FEA63}']
    { Property Methods }

    { methods }
    procedure runRequest(request: JRequest); cdecl;
    function clearRemoveAndRecycle(request: JRequest): Boolean; cdecl;
    function isPaused: Boolean; cdecl;
    procedure pauseRequests; cdecl;
    procedure resumeRequests; cdecl;
    procedure clearRequests; cdecl;
    procedure restartRequests; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJRequestTracker = class(TJavaGenericImport<JRequestTrackerClass, JRequestTracker>) end;

  JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNodeClass = interface(JObjectClass)
  ['{8A92328B-F231-44FD-B09E-67028310B6F2}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/SupportRequestManagerFragment$SupportFragmentRequestManagerTreeNode')]
  JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNode = interface(JObject)
  ['{9CF8722F-63BE-4DBA-B02F-46326764D775}']
    { Property Methods }

    { methods }
    function getDescendants: JSet; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNode = class(TJavaGenericImport<JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNodeClass, JSupportRequestManagerFragment_SupportFragmentRequestManagerTreeNode>) end;

  JSupportRequestManagerFragmentClass = interface(JFragmentClass) // or JObjectClass
  ['{B6F05922-DC8C-44C9-A976-98F056C635CD}']
    { static Property Methods }

    { static Methods }
    {class} function init: JSupportRequestManagerFragment; cdecl; overload;
    {class} function init(lifecycle: JActivityFragmentLifecycle): JSupportRequestManagerFragment; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/SupportRequestManagerFragment')]
  JSupportRequestManagerFragment = interface(JFragment) // or JObject
  ['{6E12141B-33A2-4DBF-B52C-0EDF350C8E29}']
    { Property Methods }

    { methods }
    procedure setRequestManager(requestManager: JRequestManager); cdecl;
    function getRequestManager: JRequestManager; cdecl;
    function getRequestManagerTreeNode: JRequestManagerTreeNode; cdecl;
    function getDescendantRequestManagerFragments: JSet; cdecl;
    procedure onAttach(context: JContext); cdecl;
    procedure onDetach; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;
    procedure onLowMemory; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJSupportRequestManagerFragment = class(TJavaGenericImport<JSupportRequestManagerFragmentClass, JSupportRequestManagerFragment>) end;

  JTargetTrackerClass = interface(JObjectClass)
  ['{C5BCC2ED-E63C-4DD8-AF31-7C37F29E8F9A}']
    { static Property Methods }

    { static Methods }
    {class} function init: JTargetTracker; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/manager/TargetTracker')]
  JTargetTracker = interface(JObject)
  ['{908CD84E-CC25-4F55-BFD9-8FE46C858384}']
    { Property Methods }

    { methods }
    procedure track(target: JTarget); cdecl;
    procedure untrack(target: JTarget); cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;
    function getAll: JList; cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJTargetTracker = class(TJavaGenericImport<JTargetTrackerClass, JTargetTracker>) end;

  JMemoryCategoryClass = interface(JEnumClass) // or JObjectClass
  ['{B41A199C-07B3-430F-ABDE-D512918ECECC}']
    { static Property Methods }
    {class} function _GetLOW: JMemoryCategory;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORMAL: JMemoryCategory;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHIGH: JMemoryCategory;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JMemoryCategory>; cdecl;
    {class} function valueOf(name: JString): JMemoryCategory; cdecl;

    { static Property }
    {class} property LOW: JMemoryCategory read _GetLOW;
    {class} property NORMAL: JMemoryCategory read _GetNORMAL;
    {class} property HIGH: JMemoryCategory read _GetHIGH;
  end;

  [JavaSignature('com/bumptech/glide/MemoryCategory')]
  JMemoryCategory = interface(JEnum) // or JObject
  ['{467CBDD9-8DB8-48B5-AB1D-78BA5F67CA7E}']
    { Property Methods }

    { methods }
    function getMultiplier: Single; cdecl;

    { Property }
  end;

  TJMemoryCategory = class(TJavaGenericImport<JMemoryCategoryClass, JMemoryCategory>) end;

  JAppliesOptionsClass = interface(JObjectClass)
  ['{0469FAE4-46FC-4A42-91E1-3C52CE43C27C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/AppliesOptions')]
  JAppliesOptions = interface(IJavaInstance)
  ['{B6083C85-0A15-4E25-B5C5-5D296C323D69}']
    { Property Methods }

    { methods }
    procedure applyOptions(P1: JContext; P2: JGlideBuilder); cdecl;

    { Property }
  end;

  TJAppliesOptions = class(TJavaGenericImport<JAppliesOptionsClass, JAppliesOptions>) end;

  JGlideModuleClass = interface(JObjectClass)
  ['{27B01751-AD71-45D2-9D1C-B5924834F8E3}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/GlideModule')]
  JGlideModule = interface(IJavaInstance)
  ['{BA339E27-5BAE-45CB-B439-D2CBB9C7A544}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJGlideModule = class(TJavaGenericImport<JGlideModuleClass, JGlideModule>) end;

  JManifestParserClass = interface(JObjectClass)
  ['{51E2C11D-0A9F-4B09-A315-F76E6C961641}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext): JManifestParser; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/ManifestParser')]
  JManifestParser = interface(JObject)
  ['{038ABC7D-3D76-4CBD-899D-9324D6114817}']
    { Property Methods }

    { methods }
    function parse: JList; cdecl;

    { Property }
  end;

  TJManifestParser = class(TJavaGenericImport<JManifestParserClass, JManifestParser>) end;

  JRegistersComponentsClass = interface(JObjectClass)
  ['{867F675B-1055-4B2A-BCC1-8253C6AB5255}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/module/RegistersComponents')]
  JRegistersComponents = interface(IJavaInstance)
  ['{1C8A804D-DF3B-4BB6-8B20-DAB9F4562A18}']
    { Property Methods }

    { methods }
    procedure registerComponents(P1: JContext; P2: JGlide; P3: JRegistry); cdecl;

    { Property }
  end;

  TJRegistersComponents = class(TJavaGenericImport<JRegistersComponentsClass, JRegistersComponents>) end;

  JPriorityClass = interface(JEnumClass) // or JObjectClass
  ['{40778BA2-F25D-4E54-A2D9-3BA7BF753BD9}']
    { static Property Methods }
    {class} function _GetIMMEDIATE: JPriority;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetHIGH: JPriority;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetNORMAL: JPriority;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetLOW: JPriority;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JPriority>; cdecl;
    {class} function valueOf(name: JString): JPriority; cdecl;

    { static Property }
    {class} property IMMEDIATE: JPriority read _GetIMMEDIATE;
    {class} property HIGH: JPriority read _GetHIGH;
    {class} property NORMAL: JPriority read _GetNORMAL;
    {class} property LOW: JPriority read _GetLOW;
  end;

  [JavaSignature('com/bumptech/glide/Priority')]
  JPriority = interface(JEnum) // or JObject
  ['{291F3196-B17E-4B81-AC7F-E21AA2B894E4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPriority = class(TJavaGenericImport<JPriorityClass, JPriority>) end;

  JEncoderRegistry_EntryClass = interface(JObjectClass)
  ['{9AB5116D-CF4E-49A2-A865-65261E313A1F}']
    { static Property Methods }

    { static Methods }
//    {class} function init(dataClass: JClass; encoder: JEncoder): JEncoderRegistry_Entry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/EncoderRegistry$Entry')]
  JEncoderRegistry_Entry = interface(JObject)
  ['{4C92094F-AEA5-49E9-957B-31E15070CA00}']
    { Property Methods }

    { methods }
//    function handles(dataClass: JClass): Boolean; cdecl;

    { Property }
  end;

  TJEncoderRegistry_Entry = class(TJavaGenericImport<JEncoderRegistry_EntryClass, JEncoderRegistry_Entry>) end;

  JEncoderRegistryClass = interface(JObjectClass)
  ['{3B95DBB0-F4D0-4D5E-A836-183A7696B48C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JEncoderRegistry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/EncoderRegistry')]
  JEncoderRegistry = interface(JObject)
  ['{888D6982-B37B-4E52-902B-F2B4C339A368}']
    { Property Methods }

    { methods }
//    function getEncoder(dataClass: JClass): JEncoder; cdecl;
//    procedure add(dataClass: JClass; P2: JEncoder); cdecl;

    { Property }
  end;

  TJEncoderRegistry = class(TJavaGenericImport<JEncoderRegistryClass, JEncoderRegistry>) end;

  JImageHeaderParserRegistryClass = interface(JObjectClass)
  ['{FE95C8FD-6F2D-40F8-B5D9-0E043BC592A8}']
    { static Property Methods }

    { static Methods }
    {class} function init: JImageHeaderParserRegistry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ImageHeaderParserRegistry')]
  JImageHeaderParserRegistry = interface(JObject)
  ['{7A661FEC-6125-4EAE-B6A8-10A020D497C1}']
    { Property Methods }

    { methods }
    function getParsers: JList; cdecl;
    procedure add(parser: JImageHeaderParser); cdecl;

    { Property }
  end;

  TJImageHeaderParserRegistry = class(TJavaGenericImport<JImageHeaderParserRegistryClass, JImageHeaderParserRegistry>) end;

  JLoadPathCacheClass = interface(JObjectClass)
  ['{66C60ED0-BEA8-4715-AB2E-CF9DE856E12C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JLoadPathCache; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/LoadPathCache')]
  JLoadPathCache = interface(JObject)
  ['{E7FF49EF-83E1-4B58-9DF6-19A30337FFF4}']
    { Property Methods }

    { methods }
//    function contains(dataClass: JClass; P2: JClass; resourceClass: JClass): Boolean; cdecl;
//    function get(dataClass: JClass; P2: JClass; resourceClass: JClass): JLoadPath; cdecl;
//    procedure put(dataClass: JClass; P2: JClass; resourceClass: JClass; transcodeClass: JLoadPath); cdecl;

    { Property }
  end;

  TJLoadPathCache = class(TJavaGenericImport<JLoadPathCacheClass, JLoadPathCache>) end;

  JModelToResourceClassCacheClass = interface(JObjectClass)
  ['{42CFD9B6-A4FB-4AD1-82ED-46BC5F9B37F2}']
    { static Property Methods }

    { static Methods }
    {class} function init: JModelToResourceClassCache; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ModelToResourceClassCache')]
  JModelToResourceClassCache = interface(JObject)
  ['{86B91606-04A7-47CF-825F-C2D795EC0A21}']
    { Property Methods }

    { methods }
//    function get(modelClass: JClass; P2: JClass): JList; cdecl;
//    procedure put(modelClass: JClass; P2: JClass; resourceClass: JList); cdecl;
    procedure clear; cdecl;

    { Property }
  end;

  TJModelToResourceClassCache = class(TJavaGenericImport<JModelToResourceClassCacheClass, JModelToResourceClassCache>) end;

  JResourceDecoderRegistry_EntryClass = interface(JObjectClass)
  ['{62428083-61F3-4F06-9C42-05D64F605723}']
    { static Property Methods }

    { static Methods }
//    {class} function init(dataClass: JClass; resourceClass: JClass; decoder: JResourceDecoder): JResourceDecoderRegistry_Entry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ResourceDecoderRegistry$Entry')]
  JResourceDecoderRegistry_Entry = interface(JObject)
  ['{282E8987-8780-47B3-9417-4DF1C76527BB}']
    { Property Methods }

    { methods }
//    function handles(dataClass: JClass; resourceClass: JClass): Boolean; cdecl;

    { Property }
  end;

  TJResourceDecoderRegistry_Entry = class(TJavaGenericImport<JResourceDecoderRegistry_EntryClass, JResourceDecoderRegistry_Entry>) end;

  JResourceDecoderRegistryClass = interface(JObjectClass)
  ['{05D5CAA7-9A72-4F69-A646-D1A5F9574E6B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JResourceDecoderRegistry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ResourceDecoderRegistry')]
  JResourceDecoderRegistry = interface(JObject)
  ['{0E933735-EC57-44B1-BD22-73FF6FF9FBA4}']
    { Property Methods }

    { methods }
//    function getDecoders(dataClass: JClass; P2: JClass): JList; cdecl;
//    function getResourceClasses(dataClass: JClass; P2: JClass): JList; cdecl;
//    procedure append(decoder: JResourceDecoder; P2: JClass; dataClass: JClass); cdecl;
//    procedure prepend(decoder: JResourceDecoder; P2: JClass; dataClass: JClass); cdecl;

    { Property }
  end;

  TJResourceDecoderRegistry = class(TJavaGenericImport<JResourceDecoderRegistryClass, JResourceDecoderRegistry>) end;

  JResourceEncoderRegistry_EntryClass = interface(JObjectClass)
  ['{4C67899D-4BEE-4FB9-A050-C04CDEC3411F}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ResourceEncoderRegistry$Entry')]
  JResourceEncoderRegistry_Entry = interface(JObject)
  ['{D91E8BE5-4A97-4C19-ADD9-DA434222BF3F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJResourceEncoderRegistry_Entry = class(TJavaGenericImport<JResourceEncoderRegistry_EntryClass, JResourceEncoderRegistry_Entry>) end;

  JResourceEncoderRegistryClass = interface(JObjectClass)
  ['{F266C3F5-0E09-43D7-A02F-2E1737911A89}']
    { static Property Methods }

    { static Methods }
    {class} function init: JResourceEncoderRegistry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/provider/ResourceEncoderRegistry')]
  JResourceEncoderRegistry = interface(JObject)
  ['{47C64266-FE82-48C7-9390-57F2AB84872B}']
    { Property Methods }

    { methods }
//    procedure add(resourceClass: JClass; P2: JResourceEncoder); cdecl;
//    function get(resourceClass: JClass): JResourceEncoder; cdecl;

    { Property }
  end;

  TJResourceEncoderRegistry = class(TJavaGenericImport<JResourceEncoderRegistryClass, JResourceEncoderRegistry>) end;

  JRegistry_MissingComponentExceptionClass = interface(JRuntimeExceptionClass) // or JObjectClass
  ['{DA34F824-8D75-4FFA-8A8C-69F4E6B9FFBA}']
    { static Property Methods }

    { static Methods }
    {class} function init(amessage: JString): JRegistry_MissingComponentException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$MissingComponentException')]
  JRegistry_MissingComponentException = interface(JRuntimeException) // or JObject
  ['{EEDDDA4B-8169-48AA-9314-997BACE244C3}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_MissingComponentException = class(TJavaGenericImport<JRegistry_MissingComponentExceptionClass, JRegistry_MissingComponentException>) end;

  JRegistry_NoImageHeaderParserExceptionClass = interface(JRegistry_MissingComponentExceptionClass) // or JObjectClass
  ['{2209997E-5DAF-4277-93A2-849392F6FEEE}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRegistry_NoImageHeaderParserException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$NoImageHeaderParserException')]
  JRegistry_NoImageHeaderParserException = interface(JRegistry_MissingComponentException) // or JObject
  ['{6CDCF279-94C1-4FCE-838F-60AC02F02BA4}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_NoImageHeaderParserException = class(TJavaGenericImport<JRegistry_NoImageHeaderParserExceptionClass, JRegistry_NoImageHeaderParserException>) end;

  JRegistry_NoModelLoaderAvailableExceptionClass = interface(JRegistry_MissingComponentExceptionClass) // or JObjectClass
  ['{E5C18B11-4C5F-4CCE-8EA9-DB2885DE1FAB}']
    { static Property Methods }

    { static Methods }
    {class} function init(model: JObject): JRegistry_NoModelLoaderAvailableException; cdecl; overload;
//    {class} function init(modelClass: JClass; P2: JClass): JRegistry_NoModelLoaderAvailableException; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$NoModelLoaderAvailableException')]
  JRegistry_NoModelLoaderAvailableException = interface(JRegistry_MissingComponentException) // or JObject
  ['{41CBE5DA-0714-4549-957E-C0D70F2FE62B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_NoModelLoaderAvailableException = class(TJavaGenericImport<JRegistry_NoModelLoaderAvailableExceptionClass, JRegistry_NoModelLoaderAvailableException>) end;

  JRegistry_NoResultEncoderAvailableExceptionClass = interface(JRegistry_MissingComponentExceptionClass) // or JObjectClass
  ['{16A669B7-ED0B-461C-96AC-ED7012092E10}']
    { static Property Methods }

    { static Methods }
//    {class} function init(resourceClass: JClass): JRegistry_NoResultEncoderAvailableException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$NoResultEncoderAvailableException')]
  JRegistry_NoResultEncoderAvailableException = interface(JRegistry_MissingComponentException) // or JObject
  ['{542B106F-99C1-4514-93C8-D7D3E24536B5}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_NoResultEncoderAvailableException = class(TJavaGenericImport<JRegistry_NoResultEncoderAvailableExceptionClass, JRegistry_NoResultEncoderAvailableException>) end;

  JRegistry_NoSourceEncoderAvailableExceptionClass = interface(JRegistry_MissingComponentExceptionClass) // or JObjectClass
  ['{29C0682C-1833-4C94-8DB2-66B80A7CE91D}']
    { static Property Methods }

    { static Methods }
//    {class} function init(dataClass: JClass): JRegistry_NoSourceEncoderAvailableException; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry$NoSourceEncoderAvailableException')]
  JRegistry_NoSourceEncoderAvailableException = interface(JRegistry_MissingComponentException) // or JObject
  ['{ABD999F2-401A-439A-A6A6-CE6B7A0BFA4C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJRegistry_NoSourceEncoderAvailableException = class(TJavaGenericImport<JRegistry_NoSourceEncoderAvailableExceptionClass, JRegistry_NoSourceEncoderAvailableException>) end;

  JRegistryClass = interface(JObjectClass)
  ['{858AD27E-643F-4B51-ABA0-6D00D00C691C}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRegistry; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/Registry')]
  JRegistry = interface(JObject)
  ['{B34DBB8C-1A3C-449B-BD06-730D2F65F4FD}']
    { Property Methods }

    { methods }
//    function &register(dataClass: JClass; P2: JEncoder): JRegistry; cdecl; overload;
//    function append(dataClass: JClass; P2: JClass; resourceClass: JResourceDecoder): JRegistry; cdecl; overload;
//    function prepend(dataClass: JClass; P2: JClass; resourceClass: JResourceDecoder): JRegistry; cdecl; overload;
//    function &register(resourceClass: JClass; P2: JResourceEncoder): JRegistry; cdecl; overload;
//    function &register(factory: JDataRewinder_Factory): JRegistry; cdecl; overload;
//    function &register(resourceClass: JClass; P2: JClass; transcodeClass: JResourceTranscoder): JRegistry; cdecl; overload;
    function &register(parser: JImageHeaderParser): JRegistry; cdecl; overload;
//    function append(modelClass: JClass; P2: JClass; dataClass: JModelLoaderFactory): JRegistry; cdecl; overload;
//    function prepend(modelClass: JClass; P2: JClass; dataClass: JModelLoaderFactory): JRegistry; cdecl; overload;
//    function replace(modelClass: JClass; P2: JClass; dataClass: JModelLoaderFactory): JRegistry; cdecl;
//    function getLoadPath(dataClass: JClass; P2: JClass; resourceClass: JClass): JLoadPath; cdecl;
//    function getRegisteredResourceClasses(modelClass: JClass; P2: JClass; resourceClass: JClass): JList; cdecl;
    function isResourceEncoderAvailable(resource: JResource): Boolean; cdecl;
    function getResultEncoder(resource: JResource): JResourceEncoder; cdecl;
    function getSourceEncoder(data: JObject): JEncoder; cdecl;
    function getRewinder(data: JObject): JDataRewinder; cdecl;
    function getModelLoaders(model: JObject): JList; cdecl;
    function getImageHeaderParsers: JList; cdecl;

    { Property }
  end;

  TJRegistry = class(TJavaGenericImport<JRegistryClass, JRegistry>) end;

  JFutureTargetClass = interface(JObjectClass)
  ['{4F31FE99-2891-4933-B841-540AECE145B1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/FutureTarget')]
  JFutureTarget = interface(IJavaInstance)
  ['{028EEFBE-0F8A-47A5-9A5A-DF54F0B44269}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFutureTarget = class(TJavaGenericImport<JFutureTargetClass, JFutureTarget>) end;

  JRequestClass = interface(JObjectClass)
  ['{F160FC5B-1CA0-407C-A5C6-A74CA775CD5B}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/Request')]
  JRequest = interface(IJavaInstance)
  ['{CACA48B4-80A4-48BB-8BD7-C69E2C43580F}']
    { Property Methods }

    { methods }
    procedure &begin; cdecl;
    procedure pause; cdecl;
    procedure clear; cdecl;
    function isPaused: Boolean; cdecl;
    function isRunning: Boolean; cdecl;
    function isComplete: Boolean; cdecl;
    function isResourceSet: Boolean; cdecl;
    function isCancelled: Boolean; cdecl;
    function isFailed: Boolean; cdecl;
    procedure recycle; cdecl;

    { Property }
  end;

  TJRequest = class(TJavaGenericImport<JRequestClass, JRequest>) end;

  JRequestCoordinatorClass = interface(JObjectClass)
  ['{965A1AD2-66F3-4BFA-B839-0106B27B8EDF}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestCoordinator')]
  JRequestCoordinator = interface(IJavaInstance)
  ['{BFA0B476-1462-4DCB-9620-3E74F4AA3512}']
    { Property Methods }

    { methods }
    function canSetImage(P1: JRequest): Boolean; cdecl;
    function canNotifyStatusChanged(P1: JRequest): Boolean; cdecl;
    function isAnyResourceSet: Boolean; cdecl;
    procedure onRequestSuccess(P1: JRequest); cdecl;

    { Property }
  end;

  TJRequestCoordinator = class(TJavaGenericImport<JRequestCoordinatorClass, JRequestCoordinator>) end;

  JRequestFutureTarget_WaiterClass = interface(JObjectClass)
  ['{8FA6BC87-B55C-4B56-ACBD-AF8D40EB99B9}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestFutureTarget$Waiter')]
  JRequestFutureTarget_Waiter = interface(JObject)
  ['{A2800841-22EE-4D53-8216-D38E0A21B9F9}']
    { Property Methods }

    { methods }
    procedure waitForTimeout(toWaitOn: JObject; timeoutMillis: Int64); cdecl;
    procedure notifyAll(toNotify: JObject); cdecl;

    { Property }
  end;

  TJRequestFutureTarget_Waiter = class(TJavaGenericImport<JRequestFutureTarget_WaiterClass, JRequestFutureTarget_Waiter>) end;

  JRequestFutureTargetClass = interface(JObjectClass)
  ['{025CED53-985E-4112-AE50-BFD617264D3B}']
    { static Property Methods }

    { static Methods }
    {class} function init(mainHandler: JHandler; width: Integer; height: Integer): JRequestFutureTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestFutureTarget')]
  JRequestFutureTarget = interface(JObject)
  ['{1FABDE9A-60D7-47C0-B0ED-4EDE52082285}']
    { Property Methods }

    { methods }
    function cancel(mayInterruptIfRunning: Boolean): Boolean; cdecl;
    function isCancelled: Boolean; cdecl;
    function isDone: Boolean; cdecl;
    function get: JObject; cdecl; overload;
    function get(time: Int64; P2: JTimeUnit): JObject; cdecl; overload;
    procedure getSize(cb: JSizeReadyCallback); cdecl;
    procedure removeCallback(cb: JSizeReadyCallback); cdecl;
    procedure setRequest(request: JRequest); cdecl;
    function getRequest: JRequest; cdecl;
    procedure onLoadCleared(placeholder: JDrawable); cdecl;
    procedure onLoadStarted(placeholder: JDrawable); cdecl;
    procedure onLoadFailed(errorDrawable: JDrawable); cdecl;
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl;
    procedure run; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;

    { Property }
  end;

  TJRequestFutureTarget = class(TJavaGenericImport<JRequestFutureTargetClass, JRequestFutureTarget>) end;

  JRequestListenerClass = interface(JObjectClass)
  ['{66524B91-9C93-461A-A014-2283489BBE6C}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestListener')]
  JRequestListener = interface(IJavaInstance)
  ['{3DDBA98C-173E-4F26-904A-66E80D3E852F}']
    { Property Methods }

    { methods }
    function onLoadFailed(P1: JGlideException; P2: JObject; P3: JTarget; P4: Boolean): Boolean; cdecl;
    function onResourceReady(P1: JObject; P2: JObject; P3: JTarget; P4: JDataSource; P5: Boolean): Boolean; cdecl;

    { Property }
  end;

  TJRequestListener = class(TJavaGenericImport<JRequestListenerClass, JRequestListener>) end;

  JRequestOptionsClass = interface(JObjectClass)
  ['{803151E4-23AC-47DA-827F-2B59AC1AADF9}']
    { static Property Methods }

    { static Methods }
    {class} function init: JRequestOptions; cdecl;
    {class} function sizeMultiplierOf(sizeMultiplier: Single): JRequestOptions; cdecl;
    {class} function diskCacheStrategyOf(diskCacheStrategy: JDiskCacheStrategy): JRequestOptions; cdecl;
    {class} function priorityOf(priority: JPriority): JRequestOptions; cdecl;
    {class} function placeholderOf(placeholder: JDrawable): JRequestOptions; cdecl; overload;
    {class} function placeholderOf(placeholderId: Integer): JRequestOptions; cdecl; overload;
    {class} function errorOf(errorDrawable: JDrawable): JRequestOptions; cdecl; overload;
    {class} function errorOf(errorId: Integer): JRequestOptions; cdecl; overload;
    {class} function skipMemoryCacheOf(skipMemoryCache: Boolean): JRequestOptions; cdecl;
    {class} function overrideOf(width: Integer; height: Integer): JRequestOptions; cdecl; overload;
    {class} function overrideOf(size: Integer): JRequestOptions; cdecl; overload;
    {class} function signatureOf(signature: JKey): JRequestOptions; cdecl;
    {class} function fitCenterTransform: JRequestOptions; cdecl;
    {class} function centerInsideTransform: JRequestOptions; cdecl;
    {class} function centerCropTransform: JRequestOptions; cdecl;
    {class} function circleCropTransform: JRequestOptions; cdecl;
    {class} function bitmapTransform(transformation: JTransformation): JRequestOptions; cdecl;
    {class} function noTransformation: JRequestOptions; cdecl;
    {class} function option(option: JOption; value: JObject): JRequestOptions; cdecl;
//    {class} function decodeTypeOf(resourceClass: JClass): JRequestOptions; cdecl;
    {class} function formatOf(format: JDecodeFormat): JRequestOptions; cdecl;
    {class} function frameOf(frameTimeMicros: Int64): JRequestOptions; cdecl;
    {class} function downsampleOf(strategy: JDownsampleStrategy): JRequestOptions; cdecl;
    {class} function encodeQualityOf(quality: Integer): JRequestOptions; cdecl;
    {class} function encodeFormatOf(format: JBitmap_CompressFormat): JRequestOptions; cdecl;
    {class} function noAnimation: JRequestOptions; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/RequestOptions')]
  JRequestOptions = interface(JObject)
  ['{299E9315-15F5-4783-88C9-618270AC0F69}']
    { Property Methods }

    { methods }
    function sizeMultiplier(sizeMultiplier: Single): JRequestOptions; cdecl;
    function useUnlimitedSourceGeneratorsPool(flag: Boolean): JRequestOptions; cdecl;
    function onlyRetrieveFromCache(flag: Boolean): JRequestOptions; cdecl;
    function diskCacheStrategy(strategy: JDiskCacheStrategy): JRequestOptions; cdecl;
    function priority(priority: JPriority): JRequestOptions; cdecl;
    function placeholder(drawable: JDrawable): JRequestOptions; cdecl; overload;
    function placeholder(resourceId: Integer): JRequestOptions; cdecl; overload;
    function fallback(drawable: JDrawable): JRequestOptions; cdecl; overload;
    function fallback(resourceId: Integer): JRequestOptions; cdecl; overload;
    function error(drawable: JDrawable): JRequestOptions; cdecl; overload;
    function error(resourceId: Integer): JRequestOptions; cdecl; overload;
    function theme(theme: JResources_Theme): JRequestOptions; cdecl;
    function skipMemoryCache(skip: Boolean): JRequestOptions; cdecl;
    function &override(width: Integer; height: Integer): JRequestOptions; cdecl; overload;
    function &override(size: Integer): JRequestOptions; cdecl; overload;
    function signature(signature: JKey): JRequestOptions; cdecl;
    function clone: JRequestOptions; cdecl; overload;
    function &set(option: JOption; P2: JObject): JRequestOptions; cdecl;
//    function decode(resourceClass: JClass): JRequestOptions; cdecl;
    function isTransformationAllowed: Boolean; cdecl;
    function isTransformationSet: Boolean; cdecl;
    function isLocked: Boolean; cdecl;
    function encodeFormat(format: JBitmap_CompressFormat): JRequestOptions; cdecl;
    function encodeQuality(quality: Integer): JRequestOptions; cdecl;
    function format(format: JDecodeFormat): JRequestOptions; cdecl;
    function frame(frameTimeMicros: Int64): JRequestOptions; cdecl;
    function downsample(strategy: JDownsampleStrategy): JRequestOptions; cdecl;
    function optionalCenterCrop: JRequestOptions; cdecl;
    function centerCrop: JRequestOptions; cdecl;
    function optionalFitCenter: JRequestOptions; cdecl;
    function fitCenter: JRequestOptions; cdecl;
    function optionalCenterInside: JRequestOptions; cdecl;
    function centerInside: JRequestOptions; cdecl;
    function optionalCircleCrop: JRequestOptions; cdecl;
    function circleCrop: JRequestOptions; cdecl;
    function transform(transformation: JTransformation): JRequestOptions; cdecl; overload;
    function optionalTransform(transformation: JTransformation): JRequestOptions; cdecl; overload;
//    function optionalTransform(resourceClass: JClass; P2: JTransformation): JRequestOptions; cdecl; overload;
//    function transform(resourceClass: JClass; P2: JTransformation): JRequestOptions; cdecl; overload;
    function dontTransform: JRequestOptions; cdecl;
    function dontAnimate: JRequestOptions; cdecl;
    function apply(other: JRequestOptions): JRequestOptions; cdecl;
    function lock: JRequestOptions; cdecl;
    function autoClone: JRequestOptions; cdecl;
    function getTransformations: JMap; cdecl;
    function isTransformationRequired: Boolean; cdecl;
    function getOptions: JOptions; cdecl;
//    function getResourceClass: JClass; cdecl;
    function getDiskCacheStrategy: JDiskCacheStrategy; cdecl;
    function getErrorPlaceholder: JDrawable; cdecl;
    function getErrorId: Integer; cdecl;
    function getPlaceholderId: Integer; cdecl;
    function getPlaceholderDrawable: JDrawable; cdecl;
    function getFallbackId: Integer; cdecl;
    function getFallbackDrawable: JDrawable; cdecl;
    function getTheme: JResources_Theme; cdecl;
    function isMemoryCacheable: Boolean; cdecl;
    function getSignature: JKey; cdecl;
    function isPrioritySet: Boolean; cdecl;
    function getPriority: JPriority; cdecl;
    function getOverrideWidth: Integer; cdecl;
    function isValidOverride: Boolean; cdecl;
    function getOverrideHeight: Integer; cdecl;
    function getSizeMultiplier: Single; cdecl;
    function getUseUnlimitedSourceGeneratorsPool: Boolean; cdecl;
    function getOnlyRetrieveFromCache: Boolean; cdecl;
//    function clone: JObject; cdecl; overload;

    { Property }
  end;

  TJRequestOptions = class(TJavaGenericImport<JRequestOptionsClass, JRequestOptions>) end;

  JResourceCallbackClass = interface(JObjectClass)
  ['{748CCD42-B3B6-4E3F-9B9E-BC1020DB0FEE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/ResourceCallback')]
  JResourceCallback = interface(IJavaInstance)
  ['{D8DBEC8B-52DD-462E-8B54-A475E2CAB06A}']
    { Property Methods }

    { methods }
    procedure onResourceReady(P1: JResource; P2: JDataSource); cdecl;
    procedure onLoadFailed(P1: JGlideException); cdecl;

    { Property }
  end;

  TJResourceCallback = class(TJavaGenericImport<JResourceCallbackClass, JResourceCallback>) end;

//  JSingleRequest_1Class = interface(JObjectClass)
//  ['{4F6F3C1D-45E2-41D4-B050-42FAEC61A081}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/request/SingleRequest$1')]
//  JSingleRequest_1 = interface(JObject)
//  ['{0B204F0B-727A-4AA2-9A5D-3CEBD00364AE}']
//    { Property Methods }
//
//    { methods }
//    function create: JSingleRequest; cdecl; overload;
//    function create: JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJSingleRequest_1 = class(TJavaGenericImport<JSingleRequest_1Class, JSingleRequest_1>) end;

  JSingleRequest_StatusClass = interface(JEnumClass) // or JObjectClass
  ['{D45BE2C5-398E-4A28-9873-9B8DB029ED2B}']
    { static Property Methods }
    {class} function _GetPENDING: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetRUNNING: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetWAITING_FOR_SIZE: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCOMPLETE: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetFAILED: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCANCELLED: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetCLEARED: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}
    {class} function _GetPAUSED: JSingleRequest_Status;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }
    {class} function values: TJavaObjectArray<JSingleRequest_Status>; cdecl;
    {class} function valueOf(name: JString): JSingleRequest_Status; cdecl;

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
  JSingleRequest_Status = interface(JEnum) // or JObject
  ['{17E3EF87-EB58-43D6-B0F1-9931FCD631A2}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSingleRequest_Status = class(TJavaGenericImport<JSingleRequest_StatusClass, JSingleRequest_Status>) end;

  JSingleRequestClass = interface(JObjectClass)
  ['{22E5143B-97D6-4A7D-A5E2-2258CE7B2DC7}']
    { static Property Methods }

    { static Methods }
//    {class} function obtain(glideContext: JGlideContext; model: JObject; transcodeClass: JClass; requestOptions: JRequestOptions; overrideWidth: Integer; overrideHeight: Integer; priority: JPriority; target: JTarget; requestListener: JRequestListener; requestCoordinator: JRequestCoordinator; engine: JEngine; animationFactory: JTransitionFactory): JSingleRequest; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/SingleRequest')]
  JSingleRequest = interface(JObject)
  ['{DFBFE6DF-C121-46C0-9119-CCED9FA563E8}']
    { Property Methods }

    { methods }
    function getVerifier: JStateVerifier; cdecl;
    procedure recycle; cdecl;
    procedure &begin; cdecl;
    procedure clear; cdecl;
    function isPaused: Boolean; cdecl;
    procedure pause; cdecl;
    function isRunning: Boolean; cdecl;
    function isComplete: Boolean; cdecl;
    function isResourceSet: Boolean; cdecl;
    function isCancelled: Boolean; cdecl;
    function isFailed: Boolean; cdecl;
    procedure onSizeReady(width: Integer; height: Integer); cdecl;
    procedure onResourceReady(resource: JResource; dataSource: JDataSource); cdecl;
    procedure onLoadFailed(e: JGlideException); cdecl;

    { Property }
  end;

  TJSingleRequest = class(TJavaGenericImport<JSingleRequestClass, JSingleRequest>) end;

  JAppWidgetTargetClass = interface(JSimpleTargetClass) // or JObjectClass
  ['{B67E7C52-604A-4954-9BB5-BAE88132E1B9}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; width: Integer; height: Integer; viewId: Integer; remoteViews: JRemoteViews; widgetIds: TJavaArray<Integer>): JAppWidgetTarget; cdecl; overload;
    {class} function init(context: JContext; viewId: Integer; remoteViews: JRemoteViews; widgetIds: TJavaArray<Integer>): JAppWidgetTarget; cdecl; overload;
    {class} function init(context: JContext; width: Integer; height: Integer; viewId: Integer; remoteViews: JRemoteViews; componentName: JComponentName): JAppWidgetTarget; cdecl; overload;
    {class} function init(context: JContext; viewId: Integer; remoteViews: JRemoteViews; componentName: JComponentName): JAppWidgetTarget; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/AppWidgetTarget')]
  JAppWidgetTarget = interface(JSimpleTarget) // or JObject
  ['{07AED8A1-41C7-415F-ACBE-23C2CE7BE65B}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JBitmap; transition: JTransition); cdecl; overload;
    procedure onResourceReady(this: JObject; P2: JTransition); cdecl; overload;

    { Property }
  end;

  TJAppWidgetTarget = class(TJavaGenericImport<JAppWidgetTargetClass, JAppWidgetTarget>) end;

  JViewTargetClass = interface(JBaseTargetClass) // or JObjectClass
  ['{9131DF0D-F0AB-46F6-BF15-80CB0DEBEC74}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JView): JViewTarget; cdecl;
    {class} procedure setTagId(tagId: Integer); cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ViewTarget')]
  JViewTarget = interface(JBaseTarget) // or JObject
  ['{0566629C-B38A-4F7A-93E7-A9E190503FCC}']
    { Property Methods }

    { methods }
    function getView: JView; cdecl;
    procedure getSize(cb: JSizeReadyCallback); cdecl;
    procedure removeCallback(cb: JSizeReadyCallback); cdecl;
    procedure onLoadCleared(placeholder: JDrawable); cdecl;
    procedure setRequest(request: JRequest); cdecl;
    function getRequest: JRequest; cdecl;
    function toString: JString; cdecl;

    { Property }
  end;

  TJViewTarget = class(TJavaGenericImport<JViewTargetClass, JViewTarget>) end;

  JImageViewTargetClass = interface(JViewTargetClass) // or JObjectClass
  ['{E5D9D6C8-D4B3-4A0D-A9AF-3B52E67FC06C}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JImageViewTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ImageViewTarget')]
  JImageViewTarget = interface(JViewTarget) // or JObject
  ['{80382A8E-9A83-4D2A-B391-D2257E988EA7}']
    { Property Methods }

    { methods }
    function getCurrentDrawable: JDrawable; cdecl;
    procedure setDrawable(drawable: JDrawable); cdecl;
    procedure onLoadStarted(placeholder: JDrawable); cdecl;
    procedure onLoadFailed(errorDrawable: JDrawable); cdecl;
    procedure onLoadCleared(placeholder: JDrawable); cdecl;
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;

    { Property }
  end;

  TJImageViewTarget = class(TJavaGenericImport<JImageViewTargetClass, JImageViewTarget>) end;

  JBitmapImageViewTargetClass = interface(JImageViewTargetClass) // or JObjectClass
  ['{DC65BAD6-120A-4611-9F2A-68167A7640B0}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JBitmapImageViewTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/BitmapImageViewTarget')]
  JBitmapImageViewTarget = interface(JImageViewTarget) // or JObject
  ['{082B1E8B-90F1-42E0-AF03-E4A62FAE1E04}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapImageViewTarget = class(TJavaGenericImport<JBitmapImageViewTargetClass, JBitmapImageViewTarget>) end;

  JThumbnailImageViewTargetClass = interface(JImageViewTargetClass) // or JObjectClass
  ['{C2EB120E-1040-4440-899C-54B9B1111B59}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JThumbnailImageViewTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ThumbnailImageViewTarget')]
  JThumbnailImageViewTarget = interface(JImageViewTarget) // or JObject
  ['{A793BA57-BEFC-44B3-A59A-4B6FA726C7F1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJThumbnailImageViewTarget = class(TJavaGenericImport<JThumbnailImageViewTargetClass, JThumbnailImageViewTarget>) end;

  JBitmapThumbnailImageViewTargetClass = interface(JThumbnailImageViewTargetClass) // or JObjectClass
  ['{8547702B-CD04-489B-8AED-578A3DF2E093}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JBitmapThumbnailImageViewTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/BitmapThumbnailImageViewTarget')]
  JBitmapThumbnailImageViewTarget = interface(JThumbnailImageViewTarget) // or JObject
  ['{EBB8EFA2-66C9-4965-AA21-62ABA4AC348A}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapThumbnailImageViewTarget = class(TJavaGenericImport<JBitmapThumbnailImageViewTargetClass, JBitmapThumbnailImageViewTarget>) end;

  JDrawableImageViewTargetClass = interface(JImageViewTargetClass) // or JObjectClass
  ['{05D8EB55-DCF6-496A-ADA4-3102D6640DF1}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JDrawableImageViewTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/DrawableImageViewTarget')]
  JDrawableImageViewTarget = interface(JImageViewTarget) // or JObject
  ['{6542903E-0337-4E2B-86BF-21EC405475BF}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDrawableImageViewTarget = class(TJavaGenericImport<JDrawableImageViewTargetClass, JDrawableImageViewTarget>) end;

  JDrawableThumbnailImageViewTargetClass = interface(JThumbnailImageViewTargetClass) // or JObjectClass
  ['{9561ADFD-3456-4537-BAE8-D778C47759CF}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JImageView): JDrawableThumbnailImageViewTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/DrawableThumbnailImageViewTarget')]
  JDrawableThumbnailImageViewTarget = interface(JThumbnailImageViewTarget) // or JObject
  ['{6C871AE7-2998-4CE9-86A7-FAE3779BA26C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJDrawableThumbnailImageViewTarget = class(TJavaGenericImport<JDrawableThumbnailImageViewTargetClass, JDrawableThumbnailImageViewTarget>) end;

  JFixedSizeDrawable_StateClass = interface(JDrawable_ConstantStateClass) // or JObjectClass
  ['{8F58A2AA-4DCA-45A2-BC4B-98F79345A827}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/FixedSizeDrawable$State')]
  JFixedSizeDrawable_State = interface(JDrawable_ConstantState) // or JObject
  ['{075D6ABC-004D-41B1-A3AC-3AADCB4CB11A}']
    { Property Methods }

    { methods }
    function newDrawable: JDrawable; cdecl; overload;
    function newDrawable(res: JResources): JDrawable; cdecl; overload;
    function getChangingConfigurations: Integer; cdecl;

    { Property }
  end;

  TJFixedSizeDrawable_State = class(TJavaGenericImport<JFixedSizeDrawable_StateClass, JFixedSizeDrawable_State>) end;

  JFixedSizeDrawableClass = interface(JDrawableClass) // or JObjectClass
  ['{D179B860-598D-45CA-89F0-CEACE43CB524}']
    { static Property Methods }

    { static Methods }
    {class} function init(wrapped: JDrawable; width: Integer; height: Integer): JFixedSizeDrawable; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/FixedSizeDrawable')]
  JFixedSizeDrawable = interface(JDrawable) // or JObject
  ['{2D4A4268-A09A-460A-A531-CDDAD7B6F8E4}']
    { Property Methods }

    { methods }
    procedure setBounds(left: Integer; top: Integer; right: Integer; bottom: Integer); cdecl; overload;
    procedure setBounds(bounds: JRect); cdecl; overload;
    procedure setChangingConfigurations(configs: Integer); cdecl;
    function getChangingConfigurations: Integer; cdecl;
    procedure setDither(dither: Boolean); cdecl;
    procedure setFilterBitmap(filter: Boolean); cdecl;
    function getCallback: JDrawable_Callback; cdecl;
    function getAlpha: Integer; cdecl;
    procedure setColorFilter(color: Integer; mode: JPorterDuff_Mode); cdecl; overload;
    procedure clearColorFilter; cdecl;
    function getCurrent: JDrawable; cdecl;
    function setVisible(visible: Boolean; restart: Boolean): Boolean; cdecl;
    function getIntrinsicWidth: Integer; cdecl;
    function getIntrinsicHeight: Integer; cdecl;
    function getMinimumWidth: Integer; cdecl;
    function getMinimumHeight: Integer; cdecl;
    function getPadding(padding: JRect): Boolean; cdecl;
    procedure invalidateSelf; cdecl;
    procedure unscheduleSelf(what: JRunnable); cdecl;
    procedure scheduleSelf(what: JRunnable; when: Int64); cdecl;
    procedure draw(canvas: JCanvas); cdecl;
    procedure setAlpha(i: Integer); cdecl;
    procedure setColorFilter(colorFilter: JColorFilter); cdecl; overload;
    function getOpacity: Integer; cdecl;
    function mutate: JDrawable; cdecl;
    function getConstantState: JDrawable_ConstantState; cdecl;

    { Property }
  end;

  TJFixedSizeDrawable = class(TJavaGenericImport<JFixedSizeDrawableClass, JFixedSizeDrawable>) end;

  JImageViewTargetFactoryClass = interface(JObjectClass)
  ['{CA226C16-D5D8-4DCB-89C2-25D45BC8C92B}']
    { static Property Methods }

    { static Methods }
    {class} function init: JImageViewTargetFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ImageViewTargetFactory')]
  JImageViewTargetFactory = interface(JObject)
  ['{8488F429-61B5-46C5-8AD2-005C48E10F04}']
    { Property Methods }

    { methods }
//    function buildTarget(view: JImageView; clazz: JClass): JTarget; cdecl;

    { Property }
  end;

  TJImageViewTargetFactory = class(TJavaGenericImport<JImageViewTargetFactoryClass, JImageViewTargetFactory>) end;

  JNotificationTargetClass = interface(JSimpleTargetClass) // or JObjectClass
  ['{A377D484-3212-4785-A9AA-929D555850C6}']
    { static Property Methods }

    { static Methods }
    {class} function init(context: JContext; viewId: Integer; remoteViews: JRemoteViews; notification: JNotification; notificationId: Integer): JNotificationTarget; cdecl; overload;
    {class} function init(context: JContext; viewId: Integer; remoteViews: JRemoteViews; notification: JNotification; notificationId: Integer; notificationTag: JString): JNotificationTarget; cdecl; overload;
    {class} function init(context: JContext; width: Integer; height: Integer; viewId: Integer; remoteViews: JRemoteViews; notification: JNotification; notificationId: Integer; notificationTag: JString): JNotificationTarget; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/NotificationTarget')]
  JNotificationTarget = interface(JSimpleTarget) // or JObject
  ['{757733D1-FE2D-45CB-AAB8-B0C03C378C4C}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JBitmap; transition: JTransition); cdecl; overload;
    procedure onResourceReady(this: JObject; P2: JTransition); cdecl; overload;

    { Property }
  end;

  TJNotificationTarget = class(TJavaGenericImport<JNotificationTargetClass, JNotificationTarget>) end;

  JPreloadTargetClass = interface(JSimpleTargetClass) // or JObjectClass
  ['{4A999976-DE02-49A2-99E4-DA8BA0DABF03}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(requestManager: JRequestManager; width: Integer; height: Integer): JPreloadTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/PreloadTarget')]
  JPreloadTarget = interface(JSimpleTarget) // or JObject
  ['{6D894C9C-D79E-4878-BBEC-C9DA0B26348F}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl;

    { Property }
  end;

  TJPreloadTarget = class(TJavaGenericImport<JPreloadTargetClass, JPreloadTarget>) end;

  JSizeReadyCallbackClass = interface(JObjectClass)
  ['{0EF3C811-0B1C-4B61-B61B-42E436DBAA7D}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/SizeReadyCallback')]
  JSizeReadyCallback = interface(IJavaInstance)
  ['{1308A43B-0C7F-4668-9172-FF87C80256C7}']
    { Property Methods }

    { methods }
    procedure onSizeReady(P1: Integer; P2: Integer); cdecl;

    { Property }
  end;

  TJSizeReadyCallback = class(TJavaGenericImport<JSizeReadyCallbackClass, JSizeReadyCallback>) end;

  JTargetClass = interface(JObjectClass)
  ['{E3492F38-830D-4E53-8318-F09836A90826}']
    { static Property Methods }
    {class} function _GetSIZE_ORIGINAL: Integer;{$IF CompilerVersion >= 29.0} cdecl; {>=XE8}{$IFEND}

    { static Methods }

    { static Property }
    {class} property SIZE_ORIGINAL: Integer read _GetSIZE_ORIGINAL;
  end;

  [JavaSignature('com/bumptech/glide/request/target/Target')]
  JTarget = interface(IJavaInstance)
  ['{42FD4125-E63D-419B-95F2-A22E488B1A61}']
    { Property Methods }

    { methods }
    procedure onLoadStarted(P1: JDrawable); cdecl;
    procedure onLoadFailed(P1: JDrawable); cdecl;
    procedure onResourceReady(P1: JObject; P2: JTransition); cdecl;
    procedure onLoadCleared(P1: JDrawable); cdecl;
    procedure getSize(P1: JSizeReadyCallback); cdecl;
    procedure removeCallback(P1: JSizeReadyCallback); cdecl;
    procedure setRequest(P1: JRequest); cdecl;
    function getRequest: JRequest; cdecl;

    { Property }
  end;

  TJTarget = class(TJavaGenericImport<JTargetClass, JTarget>) end;

  JViewTarget_SizeDeterminer_SizeDeterminerLayoutListenerClass = interface(JObjectClass)
  ['{CD4C759D-C3AA-497E-9EB9-B2ECE28AD927}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ViewTarget$SizeDeterminer$SizeDeterminerLayoutListener')]
  JViewTarget_SizeDeterminer_SizeDeterminerLayoutListener = interface(JObject)
  ['{499F04C0-992E-4E12-AA0F-B4AFDE0F3EF4}']
    { Property Methods }

    { methods }
    function onPreDraw: Boolean; cdecl;

    { Property }
  end;

  TJViewTarget_SizeDeterminer_SizeDeterminerLayoutListener = class(TJavaGenericImport<JViewTarget_SizeDeterminer_SizeDeterminerLayoutListenerClass, JViewTarget_SizeDeterminer_SizeDeterminerLayoutListener>) end;

  JViewTarget_SizeDeterminerClass = interface(JObjectClass)
  ['{3D23A80C-22B6-4147-BE2D-1A0CB5404415}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/target/ViewTarget$SizeDeterminer')]
  JViewTarget_SizeDeterminer = interface(JObject)
  ['{7018D879-1755-46E6-B287-4C46C6F304F7}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJViewTarget_SizeDeterminer = class(TJavaGenericImport<JViewTarget_SizeDeterminerClass, JViewTarget_SizeDeterminer>) end;

  JThumbnailRequestCoordinatorClass = interface(JObjectClass)
  ['{722FDBCF-8661-42BD-91E2-9097DCE17887}']
    { static Property Methods }

    { static Methods }
    {class} function init: JThumbnailRequestCoordinator; cdecl; overload;
    {class} function init(coordinator: JRequestCoordinator): JThumbnailRequestCoordinator; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/ThumbnailRequestCoordinator')]
  JThumbnailRequestCoordinator = interface(JObject)
  ['{7C594D54-58A6-4319-A52C-D56E7D1771EE}']
    { Property Methods }

    { methods }
    procedure setRequests(full: JRequest; thumb: JRequest); cdecl;
    function canSetImage(request: JRequest): Boolean; cdecl;
    function canNotifyStatusChanged(request: JRequest): Boolean; cdecl;
    function isAnyResourceSet: Boolean; cdecl;
    procedure onRequestSuccess(request: JRequest); cdecl;
    procedure &begin; cdecl;
    procedure pause; cdecl;
    procedure clear; cdecl;
    function isPaused: Boolean; cdecl;
    function isRunning: Boolean; cdecl;
    function isComplete: Boolean; cdecl;
    function isResourceSet: Boolean; cdecl;
    function isCancelled: Boolean; cdecl;
    function isFailed: Boolean; cdecl;
    procedure recycle; cdecl;

    { Property }
  end;

  TJThumbnailRequestCoordinator = class(TJavaGenericImport<JThumbnailRequestCoordinatorClass, JThumbnailRequestCoordinator>) end;

  JBitmapContainerTransitionFactory_BitmapGlideAnimationClass = interface(JObjectClass)
  ['{3188F34B-475C-44E1-8A5E-577184A2F531}']
    { static Property Methods }

    { static Methods }
    {class} function init(this: JBitmapContainerTransitionFactory; transition: JTransition): JBitmapContainerTransitionFactory_BitmapGlideAnimation; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/BitmapContainerTransitionFactory$BitmapGlideAnimation')]
  JBitmapContainerTransitionFactory_BitmapGlideAnimation = interface(JObject)
  ['{983A24C9-CF9B-4579-8FAF-4B6A4E982675}']
    { Property Methods }

    { methods }
    function transition(current: JObject; adapter: JTransition_ViewAdapter): Boolean; cdecl;

    { Property }
  end;

  TJBitmapContainerTransitionFactory_BitmapGlideAnimation = class(TJavaGenericImport<JBitmapContainerTransitionFactory_BitmapGlideAnimationClass, JBitmapContainerTransitionFactory_BitmapGlideAnimation>) end;

  JBitmapContainerTransitionFactoryClass = interface(JObjectClass)
  ['{2C14C680-A89A-4D9F-B884-0D855EFE6DEB}']
    { static Property Methods }

    { static Methods }
    {class} function init(realFactory: JTransitionFactory): JBitmapContainerTransitionFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/BitmapContainerTransitionFactory')]
  JBitmapContainerTransitionFactory = interface(JObject)
  ['{46AF41F2-36F9-419D-823B-2FCDA1490EC6}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl;

    { Property }
  end;

  TJBitmapContainerTransitionFactory = class(TJavaGenericImport<JBitmapContainerTransitionFactoryClass, JBitmapContainerTransitionFactory>) end;

  JBitmapTransitionFactoryClass = interface(JBitmapContainerTransitionFactoryClass) // or JObjectClass
  ['{B390EE53-6D61-47BC-8AFA-6C6934E4E7CC}']
    { static Property Methods }

    { static Methods }
    {class} function init(realFactory: JTransitionFactory): JBitmapTransitionFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/BitmapTransitionFactory')]
  JBitmapTransitionFactory = interface(JBitmapContainerTransitionFactory) // or JObject
  ['{6CC2DC87-4308-4055-B7CA-B2D330FEC76F}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJBitmapTransitionFactory = class(TJavaGenericImport<JBitmapTransitionFactoryClass, JBitmapTransitionFactory>) end;

  JDrawableCrossFadeFactory_BuilderClass = interface(JObjectClass)
  ['{0B36BB43-4DBC-49D3-A582-B75861CD9157}']
    { static Property Methods }

    { static Methods }
    {class} function init: JDrawableCrossFadeFactory_Builder; cdecl; overload;
    {class} function init(durationMillis: Integer): JDrawableCrossFadeFactory_Builder; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/DrawableCrossFadeFactory$Builder')]
  JDrawableCrossFadeFactory_Builder = interface(JObject)
  ['{89DB8328-D757-4B2C-AFD5-3822410D0B13}']
    { Property Methods }

    { methods }
    function setCrossFadeEnabled(isCrossFadeEnabled: Boolean): JDrawableCrossFadeFactory_Builder; cdecl;
    function setDefaultAnimationId(animationId: Integer): JDrawableCrossFadeFactory_Builder; cdecl;
    function setDefaultAnimation(animation: JAnimation): JDrawableCrossFadeFactory_Builder; cdecl;
    function setDefaultAnimationFactory(factory: JViewAnimationFactory): JDrawableCrossFadeFactory_Builder; cdecl;
    function build: JDrawableCrossFadeFactory; cdecl;

    { Property }
  end;

  TJDrawableCrossFadeFactory_Builder = class(TJavaGenericImport<JDrawableCrossFadeFactory_BuilderClass, JDrawableCrossFadeFactory_Builder>) end;

  JDrawableCrossFadeFactory_DefaultViewTransitionAnimationFactoryClass = interface(JObjectClass)
  ['{34975A0F-85AC-4C36-B128-D957CE256B89}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/DrawableCrossFadeFactory$DefaultViewTransitionAnimationFactory')]
  JDrawableCrossFadeFactory_DefaultViewTransitionAnimationFactory = interface(JObject)
  ['{FDEF05FA-40D7-4FD4-9638-DA8A75E1DC9E}']
    { Property Methods }

    { methods }
    function build(context: JContext): JAnimation; cdecl;

    { Property }
  end;

  TJDrawableCrossFadeFactory_DefaultViewTransitionAnimationFactory = class(TJavaGenericImport<JDrawableCrossFadeFactory_DefaultViewTransitionAnimationFactoryClass, JDrawableCrossFadeFactory_DefaultViewTransitionAnimationFactory>) end;

  JDrawableCrossFadeFactoryClass = interface(JObjectClass)
  ['{7735411B-17A5-40D8-B5E6-FF6A1B1354C1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/DrawableCrossFadeFactory')]
  JDrawableCrossFadeFactory = interface(JObject)
  ['{C9EC0486-F9A7-4DD4-A7D0-E7930173C5B7}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl;

    { Property }
  end;

  TJDrawableCrossFadeFactory = class(TJavaGenericImport<JDrawableCrossFadeFactoryClass, JDrawableCrossFadeFactory>) end;

  JDrawableCrossFadeTransitionClass = interface(JObjectClass)
  ['{C155CE78-D13A-49F5-AC69-EEA5E74E4963}']
    { static Property Methods }

    { static Methods }
    {class} function init(defaultAnimation: JTransition; P2: Integer; isCrossFadeEnabled: Boolean): JDrawableCrossFadeTransition; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/DrawableCrossFadeTransition')]
  JDrawableCrossFadeTransition = interface(JObject)
  ['{2606CF2A-233C-422A-9C6C-4DF9277F0663}']
    { Property Methods }

    { methods }
    function transition(current: JDrawable; adapter: JTransition_ViewAdapter): Boolean; cdecl; overload;
    function transition(this: JObject; P2: JTransition_ViewAdapter): Boolean; cdecl; overload;

    { Property }
  end;

  TJDrawableCrossFadeTransition = class(TJavaGenericImport<JDrawableCrossFadeTransitionClass, JDrawableCrossFadeTransition>) end;

  JNoTransition_NoAnimationFactoryClass = interface(JObjectClass)
  ['{409C7D25-29FE-42FB-9746-526E377BF48D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JNoTransition_NoAnimationFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/NoTransition$NoAnimationFactory')]
  JNoTransition_NoAnimationFactory = interface(JObject)
  ['{75D562C2-3D2E-4BA1-B8B4-1AB3A9C356F6}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl;

    { Property }
  end;

  TJNoTransition_NoAnimationFactory = class(TJavaGenericImport<JNoTransition_NoAnimationFactoryClass, JNoTransition_NoAnimationFactory>) end;

  JNoTransitionClass = interface(JObjectClass)
  ['{F46EF47B-F3B0-46F1-AF7B-3268C655274D}']
    { static Property Methods }

    { static Methods }
    {class} function init: JNoTransition; cdecl;
    {class} function getFactory: JTransitionFactory; cdecl;
    {class} function get: JTransition; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/NoTransition')]
  JNoTransition = interface(JObject)
  ['{4032E5D5-BB39-4CFA-AE8D-1E5533079849}']
    { Property Methods }

    { methods }
    function transition(current: JObject; adapter: JTransition_ViewAdapter): Boolean; cdecl;

    { Property }
  end;

  TJNoTransition = class(TJavaGenericImport<JNoTransitionClass, JNoTransition>) end;

  JTransition_ViewAdapterClass = interface(JObjectClass)
  ['{12FFBC04-40E6-40F0-860F-D830868BBBD0}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/Transition$ViewAdapter')]
  JTransition_ViewAdapter = interface(IJavaInstance)
  ['{E7753829-C61A-4737-B56E-5492574C78E8}']
    { Property Methods }

    { methods }
    function getView: JView; cdecl;
    function getCurrentDrawable: JDrawable; cdecl;
    procedure setDrawable(P1: JDrawable); cdecl;

    { Property }
  end;

  TJTransition_ViewAdapter = class(TJavaGenericImport<JTransition_ViewAdapterClass, JTransition_ViewAdapter>) end;

  JTransitionClass = interface(JObjectClass)
  ['{DB8FBAC4-E089-4942-AACD-31598029B011}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/Transition')]
  JTransition = interface(IJavaInstance)
  ['{1B710C21-CBA4-4DB2-98AA-15E769384EDD}']
    { Property Methods }

    { methods }
    function transition(P1: JObject; P2: JTransition_ViewAdapter): Boolean; cdecl;

    { Property }
  end;

  TJTransition = class(TJavaGenericImport<JTransitionClass, JTransition>) end;

  JTransitionFactoryClass = interface(JObjectClass)
  ['{73BB2845-7FD2-4810-B887-C70B9EA03B49}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/TransitionFactory')]
  JTransitionFactory = interface(IJavaInstance)
  ['{503F6C53-0839-4C49-A6B7-D447EEEC1747}']
    { Property Methods }

    { methods }
    function build(P1: JDataSource; P2: Boolean): JTransition; cdecl;

    { Property }
  end;

  TJTransitionFactory = class(TJavaGenericImport<JTransitionFactoryClass, JTransitionFactory>) end;

  JViewAnimationFactory_ConcreteViewTransitionAnimationFactoryClass = interface(JObjectClass)
  ['{EA785146-B8DC-4F1C-A529-4BEC6AAA29B3}']
    { static Property Methods }

    { static Methods }
    {class} function init(animation: JAnimation): JViewAnimationFactory_ConcreteViewTransitionAnimationFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewAnimationFactory$ConcreteViewTransitionAnimationFactory')]
  JViewAnimationFactory_ConcreteViewTransitionAnimationFactory = interface(JObject)
  ['{3A2A4512-CFD3-4A5E-9132-881E67559239}']
    { Property Methods }

    { methods }
    function build(context: JContext): JAnimation; cdecl;

    { Property }
  end;

  TJViewAnimationFactory_ConcreteViewTransitionAnimationFactory = class(TJavaGenericImport<JViewAnimationFactory_ConcreteViewTransitionAnimationFactoryClass, JViewAnimationFactory_ConcreteViewTransitionAnimationFactory>) end;

  JViewAnimationFactory_ResourceViewTransitionAnimationFactoryClass = interface(JObjectClass)
  ['{4A77E7DB-C53C-46E4-BF95-BA4D61A1E6AB}']
    { static Property Methods }

    { static Methods }
    {class} function init(animationId: Integer): JViewAnimationFactory_ResourceViewTransitionAnimationFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewAnimationFactory$ResourceViewTransitionAnimationFactory')]
  JViewAnimationFactory_ResourceViewTransitionAnimationFactory = interface(JObject)
  ['{517281F9-CCD0-48E2-827B-94BCEEA50F72}']
    { Property Methods }

    { methods }
    function build(context: JContext): JAnimation; cdecl;

    { Property }
  end;

  TJViewAnimationFactory_ResourceViewTransitionAnimationFactory = class(TJavaGenericImport<JViewAnimationFactory_ResourceViewTransitionAnimationFactoryClass, JViewAnimationFactory_ResourceViewTransitionAnimationFactory>) end;

  JViewAnimationFactoryClass = interface(JObjectClass)
  ['{E3944482-4BB1-4582-A3EF-ACA4125EEF4D}']
    { static Property Methods }

    { static Methods }
    {class} function init(animation: JAnimation): JViewAnimationFactory; cdecl; overload;
    {class} function init(animationId: Integer): JViewAnimationFactory; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewAnimationFactory')]
  JViewAnimationFactory = interface(JObject)
  ['{FD5117FC-4591-49DE-A2D6-D0EDF97EEA0E}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl;

    { Property }
  end;

  TJViewAnimationFactory = class(TJavaGenericImport<JViewAnimationFactoryClass, JViewAnimationFactory>) end;

  JViewPropertyAnimationFactoryClass = interface(JObjectClass)
  ['{1B17417A-238B-4A06-B4F7-1562340B3408}']
    { static Property Methods }

    { static Methods }
    {class} function init(animator: JViewPropertyTransition_Animator): JViewPropertyAnimationFactory; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewPropertyAnimationFactory')]
  JViewPropertyAnimationFactory = interface(JObject)
  ['{212E8D61-DF5D-4305-B0BE-8631C986B66E}']
    { Property Methods }

    { methods }
    function build(dataSource: JDataSource; isFirstResource: Boolean): JTransition; cdecl;

    { Property }
  end;

  TJViewPropertyAnimationFactory = class(TJavaGenericImport<JViewPropertyAnimationFactoryClass, JViewPropertyAnimationFactory>) end;

  JViewPropertyTransition_AnimatorClass = interface(JObjectClass)
  ['{1D85594C-7E95-4FEB-B300-43590E20F08A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewPropertyTransition$Animator')]
  JViewPropertyTransition_Animator = interface(IJavaInstance)
  ['{CF22C123-026B-4999-822A-23D2872CD5C5}']
    { Property Methods }

    { methods }
    procedure animate(P1: JView); cdecl;

    { Property }
  end;

  TJViewPropertyTransition_Animator = class(TJavaGenericImport<JViewPropertyTransition_AnimatorClass, JViewPropertyTransition_Animator>) end;

  JViewPropertyTransitionClass = interface(JObjectClass)
  ['{EA25EEC2-1783-456D-9A1C-C1CBA27D21CD}']
    { static Property Methods }

    { static Methods }
    {class} function init(animator: JViewPropertyTransition_Animator): JViewPropertyTransition; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewPropertyTransition')]
  JViewPropertyTransition = interface(JObject)
  ['{1D708BAD-2B98-4E58-88FF-DA93F23F3576}']
    { Property Methods }

    { methods }
    function transition(current: JObject; adapter: JTransition_ViewAdapter): Boolean; cdecl;

    { Property }
  end;

  TJViewPropertyTransition = class(TJavaGenericImport<JViewPropertyTransitionClass, JViewPropertyTransition>) end;

  JViewTransition_ViewTransitionAnimationFactoryClass = interface(JObjectClass)
  ['{6EB2D6F5-1BFA-418A-BE60-3612A9E8C0E8}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewTransition$ViewTransitionAnimationFactory')]
  JViewTransition_ViewTransitionAnimationFactory = interface(IJavaInstance)
  ['{FA0F7AE1-1CB3-4453-B901-867128804D54}']
    { Property Methods }

    { methods }
    function build(P1: JContext): JAnimation; cdecl;

    { Property }
  end;

  TJViewTransition_ViewTransitionAnimationFactory = class(TJavaGenericImport<JViewTransition_ViewTransitionAnimationFactoryClass, JViewTransition_ViewTransitionAnimationFactory>) end;

  JViewTransitionClass = interface(JObjectClass)
  ['{AD0B8693-085C-4EFD-9AC5-AE3D25CA047A}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/request/transition/ViewTransition')]
  JViewTransition = interface(JObject)
  ['{D056306A-447F-4B12-986D-D09D076ECFDC}']
    { Property Methods }

    { methods }
    function transition(current: JObject; adapter: JTransition_ViewAdapter): Boolean; cdecl;

    { Property }
  end;

  TJViewTransition = class(TJavaGenericImport<JViewTransitionClass, JViewTransition>) end;

//  JRequestBuilder_1Class = interface(JObjectClass)
//  ['{CAE42147-9E75-45F9-BB6D-958D0ADBA8ED}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/RequestBuilder$1')]
//  JRequestBuilder_1 = interface(JObject)
//  ['{24ED2D88-FA56-4150-BC2F-26503C949C55}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJRequestBuilder_1 = class(TJavaGenericImport<JRequestBuilder_1Class, JRequestBuilder_1>) end;

//  JRequestBuilder_2Class = interface(JObjectClass)
//  ['{FBB7536F-3455-4106-B09A-63DFD0CCE3F3}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/RequestBuilder$2')]
//  JRequestBuilder_2 = interface(JObject)
//  ['{FFDCC139-1B72-460A-A642-9D675195F693}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJRequestBuilder_2 = class(TJavaGenericImport<JRequestBuilder_2Class, JRequestBuilder_2>) end;

  JRequestBuilderClass = interface(JObjectClass)
  ['{2CBC8A55-9BB7-4FDA-B390-B75B38C68A36}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/RequestBuilder')]
  JRequestBuilder = interface(JObject)
  ['{41E4032E-976E-4FB3-B1A6-F2FE8FD478BD}']
    { Property Methods }

    { methods }
    function apply(requestOptions: JRequestOptions): JRequestBuilder; cdecl;
    function transition(transitionOptions: JTransitionOptions): JRequestBuilder; cdecl;
    function listener(requestListener: JRequestListener): JRequestBuilder; cdecl;
    function thumbnail(thumbnailRequest: JRequestBuilder): JRequestBuilder; cdecl; overload;
    function thumbnail(sizeMultiplier: Single): JRequestBuilder; cdecl; overload;
    function load(model: JObject): JRequestBuilder; cdecl; overload;
    function load(astring: JString): JRequestBuilder; cdecl; overload;
    function load(uri: JUri): JRequestBuilder; cdecl; overload;
    function load(afile: JFile): JRequestBuilder; cdecl; overload;
    function load(resourceId: JInteger): JRequestBuilder; cdecl; overload;
    function load(url: JURL): JRequestBuilder; cdecl; overload; //Deprecated
    function load(model: TJavaArray<Byte>): JRequestBuilder; cdecl; overload;
    function clone: JRequestBuilder; cdecl; overload;
    function into(target: JTarget): JTarget; cdecl; overload;
    function into(view: JImageView): JTarget; cdecl; overload;
    function into(width: Integer; height: Integer): JFutureTarget; cdecl; overload; //Deprecated
    function submit: JFutureTarget; cdecl; overload;
    function submit(width: Integer; height: Integer): JFutureTarget; cdecl; overload;
    function preload(width: Integer; height: Integer): JTarget; cdecl; overload;
    function preload: JTarget; cdecl; overload;
    function downloadOnly(target: JTarget): JTarget; cdecl; overload; //Deprecated
    function downloadOnly(width: Integer; height: Integer): JFutureTarget; cdecl; overload; //Deprecated
//    function clone: JObject; cdecl; overload;

    { Property }
  end;

  TJRequestBuilder = class(TJavaGenericImport<JRequestBuilderClass, JRequestBuilder>) end;

//  JRequestManager_1Class = interface(JObjectClass)
//  ['{541FBD2E-F24E-4C79-9576-5749FC96E554}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/RequestManager$1')]
//  JRequestManager_1 = interface(JObject)
//  ['{78FF2EDE-110E-41EE-992A-7A962AE58447}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJRequestManager_1 = class(TJavaGenericImport<JRequestManager_1Class, JRequestManager_1>) end;

//  JRequestManager_2Class = interface(JObjectClass)
//  ['{97927489-B0FE-43BF-9F2D-1AB029E7648A}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/RequestManager$2')]
//  JRequestManager_2 = interface(JObject)
//  ['{CA7159D8-B7B8-47DA-B1D0-43F6118F95C9}']
//    { Property Methods }
//
//    { methods }
//    procedure run; cdecl;
//
//    { Property }
//  end;
//
//  TJRequestManager_2 = class(TJavaGenericImport<JRequestManager_2Class, JRequestManager_2>) end;

  JRequestManager_ClearTargetClass = interface(JViewTargetClass) // or JObjectClass
  ['{CC126418-8EAC-4DD0-8523-4E01F42DA658}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JView): JRequestManager_ClearTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/RequestManager$ClearTarget')]
  JRequestManager_ClearTarget = interface(JViewTarget) // or JObject
  ['{5AA6F1BF-BED2-4AF3-8ACA-55FE41791E43}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl;

    { Property }
  end;

  TJRequestManager_ClearTarget = class(TJavaGenericImport<JRequestManager_ClearTargetClass, JRequestManager_ClearTarget>) end;

  JRequestManager_RequestManagerConnectivityListenerClass = interface(JObjectClass)
  ['{2DBDF67C-BCA5-424E-A448-59CEBD001E1E}']
    { static Property Methods }

    { static Methods }
    {class} function init(requestTracker: JRequestTracker): JRequestManager_RequestManagerConnectivityListener; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/RequestManager$RequestManagerConnectivityListener')]
  JRequestManager_RequestManagerConnectivityListener = interface(JObject)
  ['{C6618C38-31D6-40C6-85DB-227956E82C7D}']
    { Property Methods }

    { methods }
    procedure onConnectivityChanged(isConnected: Boolean); cdecl;

    { Property }
  end;

  TJRequestManager_RequestManagerConnectivityListener = class(TJavaGenericImport<JRequestManager_RequestManagerConnectivityListenerClass, JRequestManager_RequestManagerConnectivityListener>) end;

  JRequestManagerClass = interface(JObjectClass)
  ['{6D764AAC-7F53-4F23-892F-9E7CF59FBEC5}']
    { static Property Methods }

    { static Methods }
    {class} function init(glide: JGlide; lifecycle: JLifecycle; treeNode: JRequestManagerTreeNode): JRequestManager; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/RequestManager')]
  JRequestManager = interface(JObject)
  ['{12C1343E-DDB1-47EE-AD6C-0A6AC551B5A4}']
    { Property Methods }

    { methods }
    function applyDefaultRequestOptions(requestOptions: JRequestOptions): JRequestManager; cdecl;
    function setDefaultRequestOptions(requestOptions: JRequestOptions): JRequestManager; cdecl;
    procedure onTrimMemory(level: Integer); cdecl;
    procedure onLowMemory; cdecl;
    function isPaused: Boolean; cdecl;
    procedure pauseRequests; cdecl;
    procedure pauseRequestsRecursive; cdecl;
    procedure resumeRequests; cdecl;
    procedure resumeRequestsRecursive; cdecl;
    procedure onStart; cdecl;
    procedure onStop; cdecl;
    procedure onDestroy; cdecl;
    function asBitmap: JRequestBuilder; cdecl;
    function asGif: JRequestBuilder; cdecl;
    function asDrawable: JRequestBuilder; cdecl;
    function load(model: JObject): JRequestBuilder; cdecl;
    function downloadOnly: JRequestBuilder; cdecl;
    function download(model: JObject): JRequestBuilder; cdecl;
    function asFile: JRequestBuilder; cdecl;
//    function &as(resourceClass: JClass): JRequestBuilder; cdecl;
    procedure clear(view: JView); cdecl; overload;
    procedure clear(target: JTarget); cdecl; overload;
    function toString: JString; cdecl;

    { Property }
  end;

  TJRequestManager = class(TJavaGenericImport<JRequestManagerClass, JRequestManager>) end;

  JApplicationVersionSignatureClass = interface(JObjectClass)
  ['{D7A151B8-8290-4DD7-A8B5-F86A3C11938F}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(context: JContext): JKey; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/signature/ApplicationVersionSignature')]
  JApplicationVersionSignature = interface(JObject)
  ['{3E65D569-51B1-4B92-AE90-F8F935AE609C}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJApplicationVersionSignature = class(TJavaGenericImport<JApplicationVersionSignatureClass, JApplicationVersionSignature>) end;

  JEmptySignatureClass = interface(JObjectClass)
  ['{D03C3048-460B-4711-BFD8-8C68E2894489}']
    { static Property Methods }

    { static Methods }
    {class} function obtain: JEmptySignature; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/signature/EmptySignature')]
  JEmptySignature = interface(JObject)
  ['{140FF9B4-11E8-4E66-B797-D36A646E567D}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;
    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJEmptySignature = class(TJavaGenericImport<JEmptySignatureClass, JEmptySignature>) end;

  JMediaStoreSignatureClass = interface(JObjectClass)
  ['{328EC5E0-79DA-4549-8781-261944247F8F}']
    { static Property Methods }

    { static Methods }
    {class} function init(mimeType: JString; dateModified: Int64; P3: Integer): JMediaStoreSignature; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/signature/MediaStoreSignature')]
  JMediaStoreSignature = interface(JObject)
  ['{26829FFD-0A1E-439C-88AC-AB96E5ECF4D8}']
    { Property Methods }

    { methods }
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJMediaStoreSignature = class(TJavaGenericImport<JMediaStoreSignatureClass, JMediaStoreSignature>) end;

  JObjectKeyClass = interface(JObjectClass)
  ['{03278B18-AAC1-4430-BF46-A672624273A4}']
    { static Property Methods }

    { static Methods }
    {class} function init(aobject: JObject): JObjectKey; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/signature/ObjectKey')]
  JObjectKey = interface(JObject)
  ['{74466948-82AE-4002-BE99-7E1B5D94D573}']
    { Property Methods }

    { methods }
    function toString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
    procedure updateDiskCacheKey(messageDigest: JMessageDigest); cdecl;

    { Property }
  end;

  TJObjectKey = class(TJavaGenericImport<JObjectKeyClass, JObjectKey>) end;

  JByteBufferUtil_ByteBufferStreamClass = interface(JInputStreamClass) // or JObjectClass
  ['{3C1CEF88-673C-48CA-8562-283141DB4268}']
    { static Property Methods }

    { static Methods }
    {class} function init(byteBuffer: JByteBuffer): JByteBufferUtil_ByteBufferStream; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ByteBufferUtil$ByteBufferStream')]
  JByteBufferUtil_ByteBufferStream = interface(JInputStream) // or JObject
  ['{F91EE9EB-6EC5-4F8A-8F71-C2B959278345}']
    { Property Methods }

    { methods }
    function available: Integer; cdecl;
    function read: Integer; cdecl; overload;
    procedure mark(readlimit: Integer); cdecl;
    function markSupported: Boolean; cdecl;
    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload;
    procedure reset; cdecl;
    function skip(byteCount: Int64): Int64; cdecl;

    { Property }
  end;

  TJByteBufferUtil_ByteBufferStream = class(TJavaGenericImport<JByteBufferUtil_ByteBufferStreamClass, JByteBufferUtil_ByteBufferStream>) end;

  JByteBufferUtil_SafeArrayClass = interface(JObjectClass)
  ['{EA6B8E80-A574-4C48-9254-AE1052AF8CDD}']
    { static Property Methods }

    { static Methods }
    {class} function init(data: TJavaArray<Byte>; offset: Integer; limit: Integer): JByteBufferUtil_SafeArray; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ByteBufferUtil$SafeArray')]
  JByteBufferUtil_SafeArray = interface(JObject)
  ['{C5F7F413-B63E-49E9-A6BD-EF2778933688}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteBufferUtil_SafeArray = class(TJavaGenericImport<JByteBufferUtil_SafeArrayClass, JByteBufferUtil_SafeArray>) end;

  JByteBufferUtilClass = interface(JObjectClass)
  ['{469BAD23-EB3C-4085-9210-DE4E90DF812E}']
    { static Property Methods }

    { static Methods }
    {class} function fromFile(afile: JFile): JByteBuffer; cdecl;
    {class} procedure toFile(buffer: JByteBuffer; afile: JFile); cdecl;
    {class} procedure toStream(byteBuffer: JByteBuffer; os: JOutputStream); cdecl; overload;
    {class} function toBytes(byteBuffer: JByteBuffer): TJavaArray<Byte>; cdecl;
    {class} function toStream(buffer: JByteBuffer): JInputStream; cdecl; overload;
    {class} function fromStream(stream: JInputStream): JByteBuffer; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ByteBufferUtil')]
  JByteBufferUtil = interface(JObject)
  ['{3A5B5025-CC51-454E-9A52-0D97EC66A726}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJByteBufferUtil = class(TJavaGenericImport<JByteBufferUtilClass, JByteBufferUtil>) end;

//  JContentLengthInputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass
//  ['{E1A6248D-2AF4-4ED8-8FE5-5D288358E7DB}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function obtain(other: JInputStream; contentLengthHeader: JString): JInputStream; cdecl; overload;
//    {class} function obtain(other: JInputStream; contentLength: Int64): JInputStream; cdecl; overload;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/ContentLengthInputStream')]
//  JContentLengthInputStream = interface(JFilterInputStream) // or JObject
//  ['{556F6F0E-A0AF-4F8E-B968-32418565AEB9}']
//    { Property Methods }
//
//    { methods }
//    function available: Integer; cdecl;
//    function read: Integer; cdecl; overload;
//    function read(buffer: TJavaArray<Byte>): Integer; cdecl; overload;
//    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJContentLengthInputStream = class(TJavaGenericImport<JContentLengthInputStreamClass, JContentLengthInputStream>) end;

  JExceptionCatchingInputStreamClass = interface(JInputStreamClass) // or JObjectClass
  ['{CA414E6A-1141-452B-9988-A1603CDBA0C6}']
    { static Property Methods }

    { static Methods }
    {class} function obtain(toWrap: JInputStream): JExceptionCatchingInputStream; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ExceptionCatchingInputStream')]
  JExceptionCatchingInputStream = interface(JInputStream) // or JObject
  ['{C1272B53-34A2-49D2-A85B-3C1865D2A19B}']
    { Property Methods }

    { methods }
    function available: Integer; cdecl;
    procedure close; cdecl;
    procedure mark(readlimit: Integer); cdecl;
    function markSupported: Boolean; cdecl;
    function read(buffer: TJavaArray<Byte>): Integer; cdecl; overload;
    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload;
    procedure reset; cdecl;
    function skip(byteCount: Int64): Int64; cdecl;
    function read: Integer; cdecl; overload;
    function getException: JIOException; cdecl;
    procedure release; cdecl;

    { Property }
  end;

  TJExceptionCatchingInputStream = class(TJavaGenericImport<JExceptionCatchingInputStreamClass, JExceptionCatchingInputStream>) end;

  JFixedPreloadSizeProviderClass = interface(JObjectClass)
  ['{61CB2AF8-7D93-4616-A21E-284F6183AADB}']
    { static Property Methods }

    { static Methods }
    {class} function init(width: Integer; height: Integer): JFixedPreloadSizeProvider; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/FixedPreloadSizeProvider')]
  JFixedPreloadSizeProvider = interface(JObject)
  ['{086033C3-6638-4761-A2DB-008D70C808E1}']
    { Property Methods }

    { methods }
    function getPreloadSize(item: JObject; adapterPosition: Integer; itemPosition: Integer): TJavaArray<Integer>; cdecl;

    { Property }
  end;

  TJFixedPreloadSizeProvider = class(TJavaGenericImport<JFixedPreloadSizeProviderClass, JFixedPreloadSizeProvider>) end;

  JLogTimeClass = interface(JObjectClass)
  ['{1B0565F5-7B9D-4790-B96A-633A290E443C}']
    { static Property Methods }

    { static Methods }
    {class} function getLogTime: Int64; cdecl;
    {class} function getElapsedMillis(logTime: Int64): Double; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/LogTime')]
  JLogTime = interface(JObject)
  ['{E1BF4E41-4FFE-4F3E-9457-02B45C206711}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJLogTime = class(TJavaGenericImport<JLogTimeClass, JLogTime>) end;

//  JMarkEnforcingInputStreamClass = interface(JFilterInputStreamClass) // or JObjectClass
//  ['{2408D137-A243-4500-9D00-D040D81B9ED9}']
//    { static Property Methods }
//
//    { static Methods }
//    {class} function init(ain: JInputStream): JMarkEnforcingInputStream; cdecl;
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/MarkEnforcingInputStream')]
//  JMarkEnforcingInputStream = interface(JFilterInputStream) // or JObject
//  ['{38AB7E57-A08D-4F13-96E2-E7672A300A0B}']
//    { Property Methods }
//
//    { methods }
//    procedure mark(readlimit: Integer); cdecl;
//    function read: Integer; cdecl; overload;
//    function read(buffer: TJavaArray<Byte>; byteOffset: Integer; byteCount: Integer): Integer; cdecl; overload;
//    procedure reset; cdecl;
//    function skip(byteCount: Int64): Int64; cdecl;
//    function available: Integer; cdecl;
//
//    { Property }
//  end;
//
//  TJMarkEnforcingInputStream = class(TJavaGenericImport<JMarkEnforcingInputStreamClass, JMarkEnforcingInputStream>) end;

  JMultiClassKeyClass = interface(JObjectClass)
  ['{C06AFCF9-21B9-4F5B-B222-D68D13F1DC86}']
    { static Property Methods }

    { static Methods }
    {class} function init: JMultiClassKey; cdecl; overload;
//    {class} function init(first: JClass; P2: JClass): JMultiClassKey; cdecl; overload;
//    {class} function init(first: JClass; P2: JClass; second: JClass): JMultiClassKey; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/MultiClassKey')]
  JMultiClassKey = interface(JObject)
  ['{3E2FDEE8-42B3-4F0A-8AA2-611FA79E0691}']
    { Property Methods }

    { methods }
//    procedure &set(first: JClass; P2: JClass); cdecl; overload;
//    procedure &set(first: JClass; P2: JClass; second: JClass); cdecl; overload;
    function toString: JString; cdecl;
    function equals(o: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;

    { Property }
  end;

  TJMultiClassKey = class(TJavaGenericImport<JMultiClassKeyClass, JMultiClassKey>) end;

//  JFactoryPools_1Class = interface(JObjectClass)
//  ['{32371834-5DAD-40A2-8458-3847AD564CE7}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$1')]
//  JFactoryPools_1 = interface(JObject)
//  ['{008BC4FB-3DD1-43C7-8604-34A0F60D5973}']
//    { Property Methods }
//
//    { methods }
//    procedure reset(aobject: JObject); cdecl;
//
//    { Property }
//  end;
//
//  TJFactoryPools_1 = class(TJavaGenericImport<JFactoryPools_1Class, JFactoryPools_1>) end;

//  JFactoryPools_2Class = interface(JObjectClass)
//  ['{0D7D8B77-3D0C-4265-8951-5D613C54D72C}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$2')]
//  JFactoryPools_2 = interface(JObject)
//  ['{09A534DE-06FD-4CD1-8423-8784E7B6B9EF}']
//    { Property Methods }
//
//    { methods }
//    function create: JList; cdecl; overload;
//    function create: JObject; cdecl; overload;
//
//    { Property }
//  end;
//
//  TJFactoryPools_2 = class(TJavaGenericImport<JFactoryPools_2Class, JFactoryPools_2>) end;

//  JFactoryPools_3Class = interface(JObjectClass)
//  ['{0E7194C3-3D73-4F0D-B888-F7DBFD17899B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$3')]
//  JFactoryPools_3 = interface(JObject)
//  ['{FE69AF7E-6F98-478D-ADA7-C5F473A68224}']
//    { Property Methods }
//
//    { methods }
//    procedure reset(aobject: JList); cdecl; overload;
//    procedure reset(this: JObject); cdecl; overload;
//
//    { Property }
//  end;
//
//  TJFactoryPools_3 = class(TJavaGenericImport<JFactoryPools_3Class, JFactoryPools_3>) end;

  JFactoryPools_FactoryClass = interface(JObjectClass)
  ['{E0DC3E4C-0CF5-4C48-A6F0-5A1F8F63A477}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$Factory')]
  JFactoryPools_Factory = interface(IJavaInstance)
  ['{3DB6A6ED-6E65-4CAB-887A-9B1E20A99720}']
    { Property Methods }

    { methods }
    function create: JObject; cdecl;

    { Property }
  end;

  TJFactoryPools_Factory = class(TJavaGenericImport<JFactoryPools_FactoryClass, JFactoryPools_Factory>) end;

  JFactoryPools_FactoryPoolClass = interface(JObjectClass)
  ['{DC00E995-C530-4310-A080-F42FB9C16095}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$FactoryPool')]
  JFactoryPools_FactoryPool = interface(JObject)
  ['{47334741-4045-448B-AAA6-23CC0FA1D39A}']
    { Property Methods }

    { methods }
    function acquire: JObject; cdecl;
    function release(instance: JObject): Boolean; cdecl;

    { Property }
  end;

  TJFactoryPools_FactoryPool = class(TJavaGenericImport<JFactoryPools_FactoryPoolClass, JFactoryPools_FactoryPool>) end;

  JFactoryPools_PoolableClass = interface(JObjectClass)
  ['{9C402573-CB33-4716-8278-411E59E893FE}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$Poolable')]
  JFactoryPools_Poolable = interface(IJavaInstance)
  ['{C6A50479-8462-47A4-9482-A2D91107F76F}']
    { Property Methods }

    { methods }
    function getVerifier: JStateVerifier; cdecl;

    { Property }
  end;

  TJFactoryPools_Poolable = class(TJavaGenericImport<JFactoryPools_PoolableClass, JFactoryPools_Poolable>) end;

  JFactoryPools_ResetterClass = interface(JObjectClass)
  ['{AEBCAC91-885B-4428-8873-B189A21CF9B1}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools$Resetter')]
  JFactoryPools_Resetter = interface(IJavaInstance)
  ['{0258E3CC-DB7A-4EF1-A119-AAEB394AD8AC}']
    { Property Methods }

    { methods }
    procedure reset(P1: JObject); cdecl;

    { Property }
  end;

  TJFactoryPools_Resetter = class(TJavaGenericImport<JFactoryPools_ResetterClass, JFactoryPools_Resetter>) end;

  JFactoryPoolsClass = interface(JObjectClass)
  ['{4330E9F4-8EC8-45AE-B8B6-0A4DD4058B63}']
    { static Property Methods }

    { static Methods }
//    {class} function simple(size: Integer; factory: JFactoryPools_Factory): JPools_Pool; cdecl;
//    {class} function threadSafe(size: Integer; factory: JFactoryPools_Factory): JPools_Pool; cdecl;
//    {class} function threadSafeList: JPools_Pool; cdecl; overload;
//    {class} function threadSafeList(size: Integer): JPools_Pool; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/FactoryPools')]
  JFactoryPools = interface(JObject)
  ['{2D23D620-69DA-4E3E-BDB2-862A575544B1}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJFactoryPools = class(TJavaGenericImport<JFactoryPoolsClass, JFactoryPools>) end;

//  JStateVerifier_1Class = interface(JObjectClass)
//  ['{44A2D44C-1DFA-4AB1-8EB5-A489963CB50B}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/pool/StateVerifier$1')]
//  JStateVerifier_1 = interface(JObject)
//  ['{49FAA14F-E8AB-4F17-AB07-55FD927D03F9}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJStateVerifier_1 = class(TJavaGenericImport<JStateVerifier_1Class, JStateVerifier_1>) end;

  JStateVerifierClass = interface(JObjectClass)
  ['{2DC17FAB-BF74-49FC-BA59-FC83BC8C78DE}']
    { static Property Methods }

    { static Methods }
    {class} function newInstance: JStateVerifier; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/StateVerifier')]
  JStateVerifier = interface(JObject)
  ['{EB0EEAB7-5E5E-4B3F-AB8D-7950C063B95A}']
    { Property Methods }

    { methods }
    procedure throwIfRecycled; cdecl;

    { Property }
  end;

  TJStateVerifier = class(TJavaGenericImport<JStateVerifierClass, JStateVerifier>) end;

  JStateVerifier_DebugStateVerifierClass = interface(JStateVerifierClass) // or JObjectClass
  ['{59139D2C-F4A4-43E1-85A4-F05D6DBBDC74}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/StateVerifier$DebugStateVerifier')]
  JStateVerifier_DebugStateVerifier = interface(JStateVerifier) // or JObject
  ['{646A0E0F-F7A7-4EA2-AE5A-8194C6F07D6B}']
    { Property Methods }

    { methods }
    procedure throwIfRecycled; cdecl;

    { Property }
  end;

  TJStateVerifier_DebugStateVerifier = class(TJavaGenericImport<JStateVerifier_DebugStateVerifierClass, JStateVerifier_DebugStateVerifier>) end;

  JStateVerifier_DefaultStateVerifierClass = interface(JStateVerifierClass) // or JObjectClass
  ['{4FAED8E4-69E5-4585-B66D-CFBC5CE01833}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/pool/StateVerifier$DefaultStateVerifier')]
  JStateVerifier_DefaultStateVerifier = interface(JStateVerifier) // or JObject
  ['{2CE58586-21A0-4CA3-9DCD-4B8A1BCFAA01}']
    { Property Methods }

    { methods }
    procedure throwIfRecycled; cdecl;
    procedure setRecycled(isRecycled: Boolean); cdecl;

    { Property }
  end;

  TJStateVerifier_DefaultStateVerifier = class(TJavaGenericImport<JStateVerifier_DefaultStateVerifierClass, JStateVerifier_DefaultStateVerifier>) end;

  JPreconditionsClass = interface(JObjectClass)
  ['{D7CAE6B0-DB18-4ED5-ABD2-8744D7D6B5C7}']
    { static Property Methods }

    { static Methods }
    {class} procedure checkArgument(expression: Boolean; amessage: JString); cdecl;
    {class} function checkNotNull(arg: JObject): JObject; cdecl; overload;
    {class} function checkNotNull(arg: JObject; amessage: JString): JObject; cdecl; overload;
    {class} function checkNotEmpty(astring: JString): JString; cdecl; overload;
    {class} function checkNotEmpty(collection: JCollection): JCollection; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/Preconditions')]
  JPreconditions = interface(JObject)
  ['{7553E617-B995-464B-9DC0-5DB0C043E955}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJPreconditions = class(TJavaGenericImport<JPreconditionsClass, JPreconditions>) end;

  JSyntheticClass = interface(JObjectClass)
  ['{07839E7E-49B1-4C33-B30B-615DC31B9023}']
    { static Property Methods }

    { static Methods }

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/Synthetic')]
  JSynthetic = interface(IJavaInstance)
  ['{303F5C46-7436-4803-A107-11CF5A75187B}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJSynthetic = class(TJavaGenericImport<JSyntheticClass, JSynthetic>) end;

//  JUtil_1Class = interface(JObjectClass)
//  ['{A6A55814-6F63-45C6-934E-242062BE5DC6}']
//    { static Property Methods }
//
//    { static Methods }
//
//    { static Property }
//  end;
//
//  [JavaSignature('com/bumptech/glide/util/Util$1')]
//  JUtil_1 = interface(JObject)
//  ['{6058ECE5-EFDA-40DA-A1A1-F4C7794C6213}']
//    { Property Methods }
//
//    { methods }
//
//    { Property }
//  end;
//
//  TJUtil_1 = class(TJavaGenericImport<JUtil_1Class, JUtil_1>) end;

  JUtilClass = interface(JObjectClass)
  ['{C459F4AB-6E8A-4FFA-9562-EAE91B78AE57}']
    { static Property Methods }

    { static Methods }
    {class} function sha256BytesToHex(bytes: TJavaArray<Byte>): JString; cdecl;
    {class} function getSize(bitmap: JBitmap): Integer; cdecl; //Deprecated
    {class} function getBitmapByteSize(bitmap: JBitmap): Integer; cdecl; overload;
    {class} function getBitmapByteSize(width: Integer; height: Integer; config: JBitmap_Config): Integer; cdecl; overload;
    {class} function isValidDimensions(width: Integer; height: Integer): Boolean; cdecl;
    {class} procedure assertMainThread; cdecl;
    {class} procedure assertBackgroundThread; cdecl;
    {class} function isOnMainThread: Boolean; cdecl;
    {class} function isOnBackgroundThread: Boolean; cdecl;
    {class} function createQueue(size: Integer): JQueue; cdecl;
    {class} function getSnapshot(other: JCollection): JList; cdecl;
    {class} function bothNullOrEqual(a: JObject; b: JObject): Boolean; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/Util')]
  JUtil = interface(JObject)
  ['{A929C547-2708-460F-A004-BBD16A385EFC}']
    { Property Methods }

    { methods }

    { Property }
  end;

  TJUtil = class(TJavaGenericImport<JUtilClass, JUtil>) end;

  JViewPreloadSizeProvider_SizeViewTargetClass = interface(JViewTargetClass) // or JObjectClass
  ['{3C50240F-D524-419F-8562-0BDDE5A2C5CD}']
    { static Property Methods }

    { static Methods }
    {class} function init(view: JView; callback: JSizeReadyCallback): JViewPreloadSizeProvider_SizeViewTarget; cdecl;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ViewPreloadSizeProvider$SizeViewTarget')]
  JViewPreloadSizeProvider_SizeViewTarget = interface(JViewTarget) // or JObject
  ['{A5C9F780-D591-4A3C-9F94-354B0A3748CB}']
    { Property Methods }

    { methods }
    procedure onResourceReady(resource: JObject; transition: JTransition); cdecl;

    { Property }
  end;

  TJViewPreloadSizeProvider_SizeViewTarget = class(TJavaGenericImport<JViewPreloadSizeProvider_SizeViewTargetClass, JViewPreloadSizeProvider_SizeViewTarget>) end;

  JViewPreloadSizeProviderClass = interface(JObjectClass)
  ['{435781CE-114B-462D-B5E2-83A2F92B78F6}']
    { static Property Methods }

    { static Methods }
    {class} function init: JViewPreloadSizeProvider; cdecl; overload;
    {class} function init(view: JView): JViewPreloadSizeProvider; cdecl; overload;

    { static Property }
  end;

  [JavaSignature('com/bumptech/glide/util/ViewPreloadSizeProvider')]
  JViewPreloadSizeProvider = interface(JObject)
  ['{91212DF5-45BD-462D-9CB3-C2F569FAC30B}']
    { Property Methods }

    { methods }
    function getPreloadSize(item: JObject; adapterPosition: Integer; itemPosition: Integer): TJavaArray<Integer>; cdecl;
    procedure onSizeReady(width: Integer; height: Integer); cdecl;
    procedure setView(view: JView); cdecl;

    { Property }
  end;

  TJViewPreloadSizeProvider = class(TJavaGenericImport<JViewPreloadSizeProviderClass, JViewPreloadSizeProvider>) end;


{$ENDIF}

implementation

end.

