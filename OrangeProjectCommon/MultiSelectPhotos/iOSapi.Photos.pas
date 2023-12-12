//convert pas to utf8 by ¥
{ *********************************************************** }
{ }
{ CodeGear Delphi Runtime Library }
{ }
{ Copyright(c) 2012-2014 Embarcadero Technologies, Inc. }
{ }
{ *********************************************************** }

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework Photos
//

unit iOSapi.Photos;

interface

{$IFDEF IOS}
uses
  Macapi.CoreFoundation,
  Macapi.Dispatch,
  Macapi.Mach,
  Macapi.ObjCRuntime,
  Macapi.ObjectiveC,
  iOSapi.QuartzCore,
  iOSapi.AVFoundation,
  iOSapi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSapi.CoreImage,
  iOSapi.CoreLocation,
  iOSapi.CoreMedia,
  iOSapi.Foundation,
  iOSapi.UIKit;

const
  PHImageContentModeAspectFit = 0;
  PHImageContentModeAspectFill = 1;
  PHImageContentModeDefault = PHImageContentModeAspectFit;
  PHCollectionListTypeMomentList = 1;
  PHCollectionListTypeFolder = 2;
  PHCollectionListTypeSmartFolder = 3;
  PHCollectionListSubtypeMomentListCluster = 1;
  PHCollectionListSubtypeMomentListYear = 2;
  PHCollectionListSubtypeRegularFolder = 100;
  PHCollectionListSubtypeSmartFolderEvents = 200;
  PHCollectionListSubtypeSmartFolderFaces = 201;
  PHCollectionListSubtypeAny = 2147483647;
  PHCollectionEditOperationDeleteContent = 1;
  PHCollectionEditOperationRemoveContent = 2;
  PHCollectionEditOperationAddContent = 3;
  PHCollectionEditOperationCreateContent = 4;
  PHCollectionEditOperationRearrangeContent = 5;
  PHCollectionEditOperationDelete = 6;
  PHCollectionEditOperationRename = 7;
  PHAssetCollectionTypeAlbum = 1;
  PHAssetCollectionTypeSmartAlbum = 2;
  PHAssetCollectionTypeMoment = 3;
  PHAssetCollectionSubtypeAlbumRegular = 2;
  PHAssetCollectionSubtypeAlbumSyncedEvent = 3;
  PHAssetCollectionSubtypeAlbumSyncedFaces = 4;
  PHAssetCollectionSubtypeAlbumSyncedAlbum = 5;
  PHAssetCollectionSubtypeAlbumImported = 6;
  PHAssetCollectionSubtypeAlbumMyPhotoStream = 100;
  PHAssetCollectionSubtypeAlbumCloudShared = 101;
  PHAssetCollectionSubtypeSmartAlbumGeneric = 200;
  PHAssetCollectionSubtypeSmartAlbumPanoramas = 201;
  PHAssetCollectionSubtypeSmartAlbumVideos = 202;
  PHAssetCollectionSubtypeSmartAlbumFavorites = 203;
  PHAssetCollectionSubtypeSmartAlbumTimelapses = 204;
  PHAssetCollectionSubtypeSmartAlbumAllHidden = 205;
  PHAssetCollectionSubtypeSmartAlbumRecentlyAdded = 206;
  PHAssetCollectionSubtypeSmartAlbumBursts = 207;
  PHAssetCollectionSubtypeSmartAlbumSlomoVideos = 208;
  PHAssetCollectionSubtypeSmartAlbumUserLibrary = 209;
  PHAssetCollectionSubtypeSmartAlbumSelfPortraits = 210;
  PHAssetCollectionSubtypeSmartAlbumScreenshots = 211;
  PHAssetCollectionSubtypeSmartAlbumDepthEffect = 212;
  PHAssetCollectionSubtypeAny = 2147483647;
  PHAssetEditOperationDelete = 1;
  PHAssetEditOperationContent = 2;
  PHAssetEditOperationProperties = 3;
  PHAssetMediaTypeUnknown = 0;
  PHAssetMediaTypeImage = 1;
  PHAssetMediaTypeVideo = 2;
  PHAssetMediaTypeAudio = 3;
  PHAssetMediaSubtypeNone = 0;
  PHAssetMediaSubtypePhotoPanorama = (1 shl 0);
  PHAssetMediaSubtypePhotoHDR = (1 shl 1);
  PHAssetMediaSubtypePhotoScreenshot = (1 shl 2);
  PHAssetMediaSubtypePhotoLive = (1 shl 3);
  PHAssetMediaSubtypePhotoDepthEffect = (1 shl 4);
  PHAssetMediaSubtypeVideoStreamed = (1 shl 16);
  PHAssetMediaSubtypeVideoHighFrameRate = (1 shl 17);
  PHAssetMediaSubtypeVideoTimelapse = (1 shl 18);
  PHAssetBurstSelectionTypeNone = 0;
  PHAssetBurstSelectionTypeAutoPick = (1 shl 0);
  PHAssetBurstSelectionTypeUserPick = (1 shl 1);
  PHAssetSourceTypeNone = 0;
  PHAssetSourceTypeUserLibrary = (1 shl 0);
  PHAssetSourceTypeCloudShared = (1 shl 1);
  PHAssetSourceTypeiTunesSynced = (1 shl 2);
  PHAssetResourceTypePhoto = 1;
  PHAssetResourceTypeVideo = 2;
  PHAssetResourceTypeAudio = 3;
  PHAssetResourceTypeAlternatePhoto = 4;
  PHAssetResourceTypeFullSizePhoto = 5;
  PHAssetResourceTypeFullSizeVideo = 6;
  PHAssetResourceTypeAdjustmentData = 7;
  PHAssetResourceTypeAdjustmentBasePhoto = 8;
  PHAssetResourceTypePairedVideo = 9;
  PHAssetResourceTypeFullSizePairedVideo = 10;
  PHAssetResourceTypeAdjustmentBasePairedVideo = 11;
  PHAuthorizationStatusNotDetermined = 0;
  PHAuthorizationStatusRestricted = 1;
  PHAuthorizationStatusDenied = 2;
  PHAuthorizationStatusAuthorized = 3;
  PHImageRequestOptionsVersionCurrent = 0;
  PHImageRequestOptionsVersionUnadjusted = 1;
  PHImageRequestOptionsVersionOriginal = 2;
  PHImageRequestOptionsDeliveryModeOpportunistic = 0;
  PHImageRequestOptionsDeliveryModeHighQualityFormat = 1;
  PHImageRequestOptionsDeliveryModeFastFormat = 2;
  PHImageRequestOptionsResizeModeNone = 0;
  PHImageRequestOptionsResizeModeFast = 1;
  PHImageRequestOptionsResizeModeExact = 2;
  PHVideoRequestOptionsVersionCurrent = 0;
  PHVideoRequestOptionsVersionOriginal = 1;
  PHVideoRequestOptionsDeliveryModeAutomatic = 0;
  PHVideoRequestOptionsDeliveryModeHighQualityFormat = 1;
  PHVideoRequestOptionsDeliveryModeMediumQualityFormat = 2;
  PHVideoRequestOptionsDeliveryModeFastFormat = 3;
  PHLivePhotoFrameTypePhoto = 0;
  PHLivePhotoFrameTypeVideo = 1;


type

  // ===== Forward declarations =====
{$M+}
  PHAdjustmentData = interface;
  PHPhotoLibrary = interface;
  PHObject = interface;
  PHObjectPlaceholder = interface;
  PHFetchResult = interface;
  PHChange = interface;
  PHPhotoLibraryChangeObserver = interface;
  PHFetchOptions = interface;
  PHAssetCollection = interface;
  PHAsset = interface;
  PHContentEditingInput = interface;
  PHContentEditingOutput = interface;
  PHAssetResource = interface;
  PHContentEditingInputRequestOptions = interface;
  PHAssetChangeRequest = interface;
  PHAssetCollectionChangeRequest = interface;
  PHAssetResourceCreationOptions = interface;
  PHAssetCreationRequest = interface;
  PHLivePhoto = interface;
  PHAssetResourceRequestOptions = interface;
  PHAssetResourceManager = interface;
  PHObjectChangeDetails = interface;
  PHFetchResultChangeDetails = interface;
  PHCollectionList = interface;
  PHCollection = interface;
  PHCollectionListChangeRequest = interface;
  PHImageRequestOptions = interface;
  PHLivePhotoRequestOptions = interface;
  PHVideoRequestOptions = interface;
  PHImageManager = interface;
  PHCachingImageManager = interface;
  PHLivePhotoFrame = interface;
  PHLivePhotoEditingContext = interface;

  // ===== Framework typedefs =====
{$M+}
  //NSInteger = Integer;
  PHImageContentMode = NSInteger;
  PHCollectionListType = NSInteger;
  PHCollectionListSubtype = NSInteger;
  PHCollectionEditOperation = NSInteger;
  PHAssetCollectionType = NSInteger;
  PHAssetCollectionSubtype = NSInteger;
  PHAssetEditOperation = NSInteger;
  PHAssetMediaType = NSInteger;
  NSUInteger = Cardinal;
  PHAssetMediaSubtype = NSUInteger;
  PHAssetBurstSelectionType = NSUInteger;
  PHAssetSourceType = NSUInteger;
  PHAssetResourceType = NSInteger;
  ObjectType = Pointer;

  _NSRange = record
    location: NSUInteger;
    length: NSUInteger;
  end;

  NSRange = _NSRange;
  P_NSRange = ^_NSRange;
  TPhotosBlock = procedure(param1: ObjectType; param2: NSUInteger;
    param3: PBoolean) of object;
  NSEnumerationOptions = NSUInteger;
  PHAuthorizationStatus = NSInteger;
  TPhotosHandler = procedure(param1: PHAuthorizationStatus) of object;
  TPhotosCompletionHandler = procedure(param1: Boolean; param2: NSError)
    of object;
  NSTimeInterval = Double;
  PHContentEditingInputRequestID = NSUInteger;
  TPhotosCanHandleAdjustmentData = function(param1: PHAdjustmentData)
    : Boolean; cdecl;
  TPhotosProgressHandler = procedure(param1: Double; param2: PBoolean)
    of object;
  TPhotosCompletionHandler1 = procedure(param1: PHContentEditingInput;
    param2: NSDictionary) of object;
  PHAssetResourceDataRequestID = Int32;
  PHAssetResourceProgressHandler = procedure(param1: Double) of object;
  TPhotosDataReceivedHandler = procedure(param1: NSData) of object;
  TPhotosCompletionHandler2 = procedure(param1: NSError) of object;
  TPhotosHandler1 = procedure(param1: NSUInteger; param2: NSUInteger) of object;
  PHImageRequestOptionsVersion = NSInteger;
  PHImageRequestOptionsDeliveryMode = NSInteger;
  PHImageRequestOptionsResizeMode = NSInteger;
  PHAssetImageProgressHandler = procedure(param1: Double; param2: NSError;
    param3: PBoolean; param4: NSDictionary) of object;

  PHVideoRequestOptionsVersion = NSInteger;
  PHVideoRequestOptionsDeliveryMode = NSInteger;
  PHAssetVideoProgressHandler = procedure(param1: Double; param2: NSError;
    param3: PBoolean; param4: NSDictionary) of object;
  PHImageRequestID = Int32;
  TPhotosResultHandler = procedure(param1: UIImage; param2: NSDictionary)
    of object;
  UIImageOrientation = NSInteger;
  TPhotosResultHandler1 = procedure(param1: NSData; param2: NSString;
    param3: UIImageOrientation; param4: NSDictionary) of object;
  TPhotosResultHandler2 = procedure(param1: PHLivePhoto; param2: NSDictionary)
    of object;
  TPhotosResultHandler3 = procedure(param1: AVPlayerItem; param2: NSDictionary)
    of object;
  TPhotosResultHandler4 = procedure(param1: AVAssetExportSession;
    param2: NSDictionary) of object;
  TPhotosResultHandler5 = procedure(param1: AVAsset; param2: AVAudioMix;
    param3: NSDictionary) of object;
  PHLivePhotoRequestID = Int32;
  PHLivePhotoFrameProcessingBlock = function(param1: Pointer; param2: NSError)
    : CIImage; cdecl;

  TPhotosCompletionHandler3 = procedure(param1: PHLivePhoto; param2: NSError)
    of object;
  PHLivePhotoFrameType = NSInteger;
  // ===== Interface declarations =====

  PHAdjustmentDataClass = interface(NSObjectClass)
    ['{9BE5A5C0-AD8B-4DFA-ABA2-35B3424E0A26}']
  end;

  PHAdjustmentData = interface(NSObject)
    ['{9F722AB2-75B7-4124-AFCB-C621E3BC08A9}']
    function initWithFormatIdentifier(formatIdentifier: NSString;
      formatVersion: NSString; data: NSData): Pointer { instancetype }; cdecl;

    function formatIdentifier: NSString; cdecl;
    function formatVersion: NSString; cdecl;
    function data: NSData; cdecl;
  end;

  TPHAdjustmentData = class(TOCGenericImport<PHAdjustmentDataClass,
    PHAdjustmentData>)
  end;

  PPHAdjustmentData = Pointer;

  PHPhotoLibraryClass = interface(NSObjectClass)
    ['{C1E726FD-3D84-431D-A14A-59882495AB13}']
    { class } function sharedPhotoLibrary: PHPhotoLibrary; cdecl;

    { class } function authorizationStatus: PHAuthorizationStatus; cdecl;
    { class } procedure requestAuthorization(handler: TPhotosHandler); cdecl;
  end;

  PHPhotoLibrary = interface(NSObject)
    ['{1C210A62-0B25-4F09-9EBF-7F3E2F77B87A}']
    procedure performChanges(changeBlock: Pointer { dispatch_block_t };
      completionHandler: TPhotosCompletionHandler); cdecl;

    function performChangesAndWait(changeBlock: Pointer { dispatch_block_t };
      error: NSError): Boolean; cdecl;
    procedure registerChangeObserver(observer: Pointer); cdecl;
    procedure unregisterChangeObserver(observer: Pointer); cdecl;
  end;

  TPHPhotoLibrary = class(TOCGenericImport<PHPhotoLibraryClass, PHPhotoLibrary>)
  end;

  PPHPhotoLibrary = Pointer;

  PHObjectClass = interface(NSObjectClass)
    ['{0D363751-D2A9-4A05-9AAA-8BF79CE0374C}']
  end;

  PHObject = interface(NSObject)
    ['{6B812DE3-C271-45E2-BD4D-5559DB97C2DD}']
    function localIdentifier: NSString; cdecl;
  end;

  TPHObject = class(TOCGenericImport<PHObjectClass, PHObject>)
  end;

  PPHObject = Pointer;

  PHObjectPlaceholderClass = interface(PHObjectClass)
    ['{DBB656F2-E232-49E8-83B0-E56A16373A71}']
  end;

  PHObjectPlaceholder = interface(PHObject)
    ['{862F5224-66C0-4210-AE58-A89F47D1717E}']
  end;

  TPHObjectPlaceholder = class(TOCGenericImport<PHObjectPlaceholderClass,
    PHObjectPlaceholder>)
  end;

  PPHObjectPlaceholder = Pointer;

  PHFetchResultClass = interface(NSObjectClass)
    ['{1867855F-4786-407E-9026-B1D1B878D19D}']
  end;

  PHFetchResult = interface(NSObject)
    ['{8DD13DE8-4CA2-40C9-B7D9-F8036639CB40}']
    function count: NSUInteger; cdecl;

    function objectAtIndex(index: NSUInteger): ObjectType; cdecl;
    function objectAtIndexedSubscript(idx: NSUInteger): ObjectType; cdecl;
    function containsObject(anObject: ObjectType): Boolean; cdecl;
    [MethodName('indexOfObject:')]
    function indexOfObject(anObject: ObjectType): NSUInteger; cdecl;
    [MethodName('indexOfObject:inRange:')]
    function indexOfObjectInRange(anObject: ObjectType; inRange: NSRange)
      : NSUInteger; cdecl;
    function firstObject: ObjectType; cdecl;
    function lastObject: ObjectType; cdecl;
    function objectsAtIndexes(indexes: NSIndexSet): NSArray; cdecl;
    procedure enumerateObjectsUsingBlock(block: TPhotosBlock); cdecl;
    procedure enumerateObjectsWithOptions(opts: NSEnumerationOptions;
      usingBlock: TPhotosBlock); cdecl;
    procedure enumerateObjectsAtIndexes(s: NSIndexSet;
      options: NSEnumerationOptions; usingBlock: TPhotosBlock); cdecl;
    function countOfAssetsWithMediaType(mediaType: PHAssetMediaType)
      : NSUInteger; cdecl;
  end;

  TPHFetchResult = class(TOCGenericImport<PHFetchResultClass, PHFetchResult>)
  end;

  PPHFetchResult = Pointer;

  PHChangeClass = interface(NSObjectClass)
    ['{E811EAC7-82F4-4F66-87B5-7E984D437718}']
  end;

  PHChange = interface(NSObject)
    ['{C4B79218-14FC-439F-AA2D-3597D7F179DC}']
    function changeDetailsForObject(&object: PHObject)
      : PHObjectChangeDetails; cdecl;
    function changeDetailsForFetchResult(&object: PHFetchResult)
      : PHFetchResultChangeDetails; cdecl;
  end;

  TPHChange = class(TOCGenericImport<PHChangeClass, PHChange>)
  end;

  PPHChange = Pointer;

  PHFetchOptionsClass = interface(NSObjectClass)
    ['{A0CB3A24-2143-4837-8B53-A40F74640B5E}']
  end;

  PHFetchOptions = interface(NSObject)
    ['{42D335F7-9B6C-4E3D-BF8F-7828461FAB06}']
    procedure setPredicate(predicate: NSPredicate); cdecl;
    function predicate: NSPredicate; cdecl;
    procedure setSortDescriptors(sortDescriptors: NSArray); cdecl;
    function sortDescriptors: NSArray; cdecl;
    procedure setIncludeHiddenAssets(includeHiddenAssets: Boolean); cdecl;
    function includeHiddenAssets: Boolean; cdecl;
    procedure setIncludeAllBurstAssets(includeAllBurstAssets: Boolean); cdecl;
    function includeAllBurstAssets: Boolean; cdecl;
    procedure setIncludeAssetSourceTypes(includeAssetSourceTypes
      : PHAssetSourceType); cdecl;
    function includeAssetSourceTypes: PHAssetSourceType; cdecl;
    procedure setFetchLimit(fetchLimit: NSUInteger); cdecl;
    function fetchLimit: NSUInteger; cdecl;
    procedure setWantsIncrementalChangeDetails(wantsIncrementalChangeDetails
      : Boolean); cdecl;
    function wantsIncrementalChangeDetails: Boolean; cdecl;
  end;

  TPHFetchOptions = class(TOCGenericImport<PHFetchOptionsClass, PHFetchOptions>)
  end;

  PPHFetchOptions = Pointer;

  PHCollectionClass = interface(PHObjectClass)
    ['{31019E6D-7D48-4031-B0A0-9BA6AFCC7FE8}']
    { class } function fetchCollectionsInCollectionList(collectionList
      : PHCollectionList; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchTopLevelUserCollectionsWithOptions
      (options: PHFetchOptions): PHFetchResult; cdecl;
  end;

  PHCollection = interface(PHObject)
    ['{6DE21789-FA05-43C4-A572-5EE17D9B1866}']
    function canContainAssets: Boolean; cdecl;
    function canContainCollections: Boolean; cdecl;
    function localizedTitle: NSString; cdecl;
    function canPerformEditOperation(anOperation: PHCollectionEditOperation)
      : Boolean; cdecl;
  end;

  TPHCollection = class(TOCGenericImport<PHCollectionClass, PHCollection>)
  end;

  PPHCollection = Pointer;

  PHAssetCollectionClass = interface(PHCollectionClass)
    ['{D39E3C3A-3C76-4292-9B79-8B08BC4AFF0E}']
    { class } function fetchAssetCollectionsWithLocalIdentifiers
      (identifiers: NSArray; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetCollectionsWithType
      (&type: PHAssetCollectionType; subtype: PHAssetCollectionSubtype;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetCollectionsContainingAsset(asset: PHAsset;
      withType: PHAssetCollectionType; options: PHFetchOptions)
      : PHFetchResult; cdecl;
    { class } function fetchAssetCollectionsWithALAssetGroupURLs
      (assetGroupURLs: NSArray; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchMomentsInMomentList(momentList: PHCollectionList;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchMomentsWithOptions(options: PHFetchOptions)
      : PHFetchResult; cdecl;
    { class } function transientAssetCollectionWithAssets(assets: NSArray;
      title: NSString): PHAssetCollection; cdecl;
    { class } function transientAssetCollectionWithAssetFetchResult
      (fetchResult: PHFetchResult; title: NSString): PHAssetCollection; cdecl;
  end;

  PHAssetCollection = interface(PHCollection)
    ['{0C424CE7-C393-4314-9677-F7205362280F}']
    function assetCollectionType: PHAssetCollectionType; cdecl;
    function assetCollectionSubtype: PHAssetCollectionSubtype; cdecl;
    function estimatedAssetCount: NSUInteger; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function approximateLocation: CLLocation; cdecl;
    function localizedLocationNames: NSArray; cdecl;
  end;

  TPHAssetCollection = class(TOCGenericImport<PHAssetCollectionClass,
    PHAssetCollection>)
  end;

  PPHAssetCollection = Pointer;

  PHAssetClass = interface(PHObjectClass)
    ['{7A09CE85-96C0-4DA4-A7BD-B9C7D8AC78B9}']
    { class } function fetchAssetsInAssetCollection(assetCollection
      : PHAssetCollection; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetsWithLocalIdentifiers(identifiers: NSArray;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchKeyAssetsInAssetCollection(assetCollection
      : PHAssetCollection; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetsWithBurstIdentifier(burstIdentifier: NSString;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetsWithOptions(options: PHFetchOptions)
      : PHFetchResult; cdecl;
    { class } function fetchAssetsWithMediaType(mediaType: PHAssetMediaType;
      options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchAssetsWithALAssetURLs(assetURLs: NSArray;
      options: PHFetchOptions): PHFetchResult; cdecl;
  end;

  PHAsset = interface(PHObject)
    ['{E0C778F6-23F8-470D-B0DC-8321AB4F8A01}']
    function mediaType: PHAssetMediaType; cdecl;
    function mediaSubtypes: PHAssetMediaSubtype; cdecl;
    function pixelWidth: NSUInteger; cdecl;
    function pixelHeight: NSUInteger; cdecl;
    function creationDate: NSDate; cdecl;
    function modificationDate: NSDate; cdecl;
    function location: CLLocation; cdecl;
    function duration: NSTimeInterval; cdecl;
    function isHidden: Boolean; cdecl;
    function isFavorite: Boolean; cdecl;
    function burstIdentifier: NSString; cdecl;
    function burstSelectionTypes: PHAssetBurstSelectionType; cdecl;
    function representsBurst: Boolean; cdecl;
    function sourceType: PHAssetSourceType; cdecl;
    function canPerformEditOperation(editOperation: PHAssetEditOperation)
      : Boolean; cdecl;
    function requestContentEditingInputWithOptions
      (options: PHContentEditingInputRequestOptions;
      completionHandler: TPhotosCompletionHandler1)
      : PHContentEditingInputRequestID; cdecl;
    procedure cancelContentEditingInputRequest
      (requestID: PHContentEditingInputRequestID); cdecl;
  end;

  TPHAsset = class(TOCGenericImport<PHAssetClass, PHAsset>)
  end;

  PPHAsset = Pointer;

  PHContentEditingInputClass = interface(NSObjectClass)
    ['{CE26CB9D-AA61-4925-BDFF-6E3460D0A489}']
  end;

  PHContentEditingInput = interface(NSObject)
    ['{6C64CBCA-C72B-4903-B7BA-AD8BBE1F54F5}']
    function mediaType: PHAssetMediaType; cdecl;
    function mediaSubtypes: PHAssetMediaSubtype; cdecl;
    function creationDate: NSDate; cdecl;
    function location: CLLocation; cdecl;
    function uniformTypeIdentifier: NSString; cdecl;
    function adjustmentData: PHAdjustmentData; cdecl;
    function displaySizeImage: UIImage; cdecl;
    function fullSizeImageURL: NSURL; cdecl;
    function fullSizeImageOrientation: Integer; cdecl;
    function AVAsset: AVAsset; cdecl;
    function audiovisualAsset: AVAsset; cdecl;
    function livePhoto: PHLivePhoto; cdecl;
  end;

  TPHContentEditingInput = class(TOCGenericImport<PHContentEditingInputClass,
    PHContentEditingInput>)
  end;

  PPHContentEditingInput = Pointer;

  PHContentEditingOutputClass = interface(NSObjectClass)
    ['{E073E75E-0645-4DA5-9B61-2B01CE7CB155}']
  end;

  PHContentEditingOutput = interface(NSObject)
    ['{ECB46166-73D3-40EF-BC4D-42255BE3C090}']
    function initWithContentEditingInput(contentEditingInput
      : PHContentEditingInput): Pointer { instancetype }; cdecl;
    procedure setAdjustmentData(adjustmentData: PHAdjustmentData); cdecl;
    function adjustmentData: PHAdjustmentData; cdecl;
    function renderedContentURL: NSURL; cdecl;
    function initWithPlaceholderForCreatedAsset(placeholderForCreatedAsset
      : PHObjectPlaceholder): Pointer { instancetype }; cdecl;
  end;

  TPHContentEditingOutput = class(TOCGenericImport<PHContentEditingOutputClass,
    PHContentEditingOutput>)
  end;

  PPHContentEditingOutput = Pointer;

  PHAssetResourceClass = interface(NSObjectClass)
    ['{20A56347-BC5F-487C-98F8-833E369C6174}']
    { class } function assetResourcesForAsset(asset: PHAsset): NSArray; cdecl;
    { class } function assetResourcesForLivePhoto(livePhoto: PHLivePhoto)
      : NSArray; cdecl;
  end;

  PHAssetResource = interface(NSObject)
    ['{5C46D199-3185-4776-9704-4F29FEB52F13}']
    function &type: PHAssetResourceType; cdecl;
    function assetLocalIdentifier: NSString; cdecl;
    function uniformTypeIdentifier: NSString; cdecl;
    function originalFilename: NSString; cdecl;
  end;

  TPHAssetResource = class(TOCGenericImport<PHAssetResourceClass,
    PHAssetResource>)
  end;

  PPHAssetResource = Pointer;

  PHContentEditingInputRequestOptionsClass = interface(NSObjectClass)
    ['{5B16ECD1-0F8D-4B1A-846A-D42AD69FFACC}']
  end;

  PHContentEditingInputRequestOptions = interface(NSObject)
    ['{CDD00B5D-1F91-45E1-9A46-0B1D2067A11C}']
    procedure setCanHandleAdjustmentData(canHandleAdjustmentData
      : TPhotosCanHandleAdjustmentData); cdecl;
    function canHandleAdjustmentData: TPhotosCanHandleAdjustmentData; cdecl;
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setProgressHandler(progressHandler
      : TPhotosProgressHandler); cdecl;
    function progressHandler: TPhotosProgressHandler; cdecl;
  end;

  TPHContentEditingInputRequestOptions = class
    (TOCGenericImport<PHContentEditingInputRequestOptionsClass,
    PHContentEditingInputRequestOptions>)
  end;

  PPHContentEditingInputRequestOptions = Pointer;

  PHAssetChangeRequestClass = interface(NSObjectClass)
    ['{6DF3F89B-7C15-428E-B933-7B6CC9A35CBF}']
    { class } function creationRequestForAssetFromImage(image: UIImage)
      : Pointer { instancetype }; cdecl;
    { class } function creationRequestForAssetFromImageAtFileURL(fileURL: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } function creationRequestForAssetFromVideoAtFileURL(fileURL: NSURL)
      : Pointer { instancetype }; cdecl;
    { class } procedure deleteAssets(assets: Pointer); cdecl;
    { class } function changeRequestForAsset(asset: PHAsset)
      : Pointer { instancetype }; cdecl;
  end;

  PHAssetChangeRequest = interface(NSObject)
    ['{01697679-1D9A-4279-BC72-5F8334DE3CB7}']
    function placeholderForCreatedAsset: PHObjectPlaceholder; cdecl;
    procedure setCreationDate(creationDate: NSDate); cdecl;
    function creationDate: NSDate; cdecl;
    procedure setLocation(location: CLLocation); cdecl;
    function location: CLLocation; cdecl;
    procedure setFavorite(favorite: Boolean); cdecl;
    function isFavorite: Boolean; cdecl;
    procedure setHidden(hidden: Boolean); cdecl;
    function isHidden: Boolean; cdecl;
    procedure setContentEditingOutput(contentEditingOutput
      : PHContentEditingOutput); cdecl;
    function contentEditingOutput: PHContentEditingOutput; cdecl;
    procedure revertAssetContentToOriginal; cdecl;
  end;

  TPHAssetChangeRequest = class(TOCGenericImport<PHAssetChangeRequestClass,
    PHAssetChangeRequest>)
  end;

  PPHAssetChangeRequest = Pointer;

  PHAssetCollectionChangeRequestClass = interface(NSObjectClass)
    ['{77A47F3A-4916-4B86-81A4-00385D3990D9}']
    { class } function creationRequestForAssetCollectionWithTitle
      (title: NSString): Pointer { instancetype }; cdecl;
    { class } procedure deleteAssetCollections(assetCollections
      : Pointer); cdecl;
    [MethodName('changeRequestForAssetCollection:')]
    { class } function changeRequestForAssetCollection(assetCollection
      : PHAssetCollection): Pointer { instancetype }; cdecl;
    [MethodName('changeRequestForAssetCollection:assets:')
      ]
    { class } function changeRequestForAssetCollectionAssets(assetCollection
      : PHAssetCollection; assets: PHFetchResult)
      : Pointer { instancetype }; cdecl;
  end;

  PHAssetCollectionChangeRequest = interface(NSObject)
    ['{8574FB7B-787C-446B-8254-627AE894062D}']
    function placeholderForCreatedAssetCollection: PHObjectPlaceholder; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure addAssets(assets: Pointer); cdecl;
    procedure insertAssets(assets: Pointer; atIndexes: NSIndexSet); cdecl;
    procedure removeAssets(assets: Pointer); cdecl;
    procedure removeAssetsAtIndexes(indexes: NSIndexSet); cdecl;
    procedure replaceAssetsAtIndexes(indexes: NSIndexSet;
      withAssets: Pointer); cdecl;
    procedure moveAssetsAtIndexes(fromIndexes: NSIndexSet;
      toIndex: NSUInteger); cdecl;
  end;

  TPHAssetCollectionChangeRequest = class
    (TOCGenericImport<PHAssetCollectionChangeRequestClass,
    PHAssetCollectionChangeRequest>)
  end;

  PPHAssetCollectionChangeRequest = Pointer;

  PHAssetResourceCreationOptionsClass = interface(NSObjectClass)
    ['{666EC9D8-F1A7-4F6D-A661-26B871FC35F7}']
  end;

  PHAssetResourceCreationOptions = interface(NSObject)
    ['{37D419AD-FD6E-4838-A92B-21B9897C8D8A}']
    procedure setOriginalFilename(originalFilename: NSString); cdecl;
    function originalFilename: NSString; cdecl;
    procedure setUniformTypeIdentifier(uniformTypeIdentifier: NSString); cdecl;
    function uniformTypeIdentifier: NSString; cdecl;
    procedure setShouldMoveFile(shouldMoveFile: Boolean); cdecl;
    function shouldMoveFile: Boolean; cdecl;
  end;

  TPHAssetResourceCreationOptions = class
    (TOCGenericImport<PHAssetResourceCreationOptionsClass,
    PHAssetResourceCreationOptions>)
  end;

  PPHAssetResourceCreationOptions = Pointer;

  PHAssetCreationRequestClass = interface(PHAssetChangeRequestClass)
    ['{38E1402B-0DDA-4DE8-840D-736830F5E137}']
    { class } function creationRequestForAsset: Pointer { instancetype }; cdecl;
    { class } function supportsAssetResourceTypes(types: NSArray)
      : Boolean; cdecl;
  end;

  PHAssetCreationRequest = interface(PHAssetChangeRequest)
    ['{69D58A47-AF5D-4AFD-97B8-5BCCCBAABCC6}']
    [MethodName('addResourceWithType:fileURL:options:')
      ]
    procedure addResourceWithTypeFileURLOptions(&type: PHAssetResourceType;
      fileURL: NSURL; options: PHAssetResourceCreationOptions); cdecl;
    [MethodName('addResourceWithType:data:options:')]
    procedure addResourceWithTypeDataOptions(&type: PHAssetResourceType;
      data: NSData; options: PHAssetResourceCreationOptions); cdecl;
  end;

  TPHAssetCreationRequest = class(TOCGenericImport<PHAssetCreationRequestClass,
    PHAssetCreationRequest>)
  end;

  PPHAssetCreationRequest = Pointer;

  PHLivePhotoClass = interface(NSObjectClass)
    ['{3DE07FCB-2AA7-49FE-A620-FD92BB9EFDF9}']
    { class } function requestLivePhotoWithResourceFileURLs(fileURLs: NSArray;
      placeholderImage: UIImage; targetSize: CGSize;
      contentMode: PHImageContentMode; resultHandler: TPhotosResultHandler2)
      : PHLivePhotoRequestID; cdecl;
    { class } procedure cancelLivePhotoRequestWithRequestID
      (requestID: PHLivePhotoRequestID); cdecl;
  end;

  PHLivePhoto = interface(NSObject)
    ['{77ADD36A-C853-418D-9CF3-8D2CD959D28B}']
    function size: CGSize; cdecl;
  end;

  TPHLivePhoto = class(TOCGenericImport<PHLivePhotoClass, PHLivePhoto>)
  end;

  PPHLivePhoto = Pointer;

  PHAssetResourceRequestOptionsClass = interface(NSObjectClass)
    ['{674B4CFE-C3B6-4D74-8CD6-CFBCA5A309CA}']
  end;

  PHAssetResourceRequestOptions = interface(NSObject)
    ['{A4E8C8D3-300C-4870-B51F-307E1F88ED47}']
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setProgressHandler(progressHandler
      : PHAssetResourceProgressHandler); cdecl;
    function progressHandler: PHAssetResourceProgressHandler; cdecl;
  end;

  TPHAssetResourceRequestOptions = class
    (TOCGenericImport<PHAssetResourceRequestOptionsClass,
    PHAssetResourceRequestOptions>)
  end;

  PPHAssetResourceRequestOptions = Pointer;

  PHAssetResourceManagerClass = interface(NSObjectClass)
    ['{55D008FE-E7C1-43DE-9EBE-06C497EB865F}']
    { class } function defaultManager: PHAssetResourceManager; cdecl;
  end;

  PHAssetResourceManager = interface(NSObject)
    ['{E2323EC4-8AF3-46C0-B790-37CABE6556DD}']
    function requestDataForAssetResource(resource: PHAssetResource;
      options: PHAssetResourceRequestOptions;
      dataReceivedHandler: TPhotosDataReceivedHandler;
      completionHandler: TPhotosCompletionHandler2)
      : PHAssetResourceDataRequestID; cdecl;
    procedure writeDataForAssetResource(resource: PHAssetResource;
      toFile: NSURL; options: PHAssetResourceRequestOptions;
      completionHandler: TPhotosCompletionHandler2); cdecl;
    procedure cancelDataRequest(requestID: PHAssetResourceDataRequestID); cdecl;
  end;

  TPHAssetResourceManager = class(TOCGenericImport<PHAssetResourceManagerClass,
    PHAssetResourceManager>)
  end;

  PPHAssetResourceManager = Pointer;

  PHObjectChangeDetailsClass = interface(NSObjectClass)
    ['{6949749C-BFDF-4005-BBCB-238A4910F98D}']
  end;

  PHObjectChangeDetails = interface(NSObject)
    ['{C485A227-2111-428D-AEB7-05332E344FE0}']
    function objectBeforeChanges: PHObject; cdecl;
    function objectAfterChanges: PHObject; cdecl;
    function assetContentChanged: Boolean; cdecl;
    function objectWasDeleted: Boolean; cdecl;
  end;

  TPHObjectChangeDetails = class(TOCGenericImport<PHObjectChangeDetailsClass,
    PHObjectChangeDetails>)
  end;

  PPHObjectChangeDetails = Pointer;

  PHFetchResultChangeDetailsClass = interface(NSObjectClass)
    ['{20AD7F08-2993-4B7C-97D7-13762C12E9AC}']
    { class } function changeDetailsFromFetchResult(fromResult: PHFetchResult;
      toFetchResult: PHFetchResult; changedObjects: NSArray)
      : Pointer { instancetype }; cdecl;
  end;

  PHFetchResultChangeDetails = interface(NSObject)
    ['{06C2A8DB-A239-486D-8B85-618AA7E95160}']
    function fetchResultBeforeChanges: PHFetchResult; cdecl;
    function fetchResultAfterChanges: PHFetchResult; cdecl;
    function hasIncrementalChanges: Boolean; cdecl;
    function removedIndexes: NSIndexSet; cdecl;
    function removedObjects: NSArray; cdecl;
    function insertedIndexes: NSIndexSet; cdecl;
    function insertedObjects: NSArray; cdecl;
    function changedIndexes: NSIndexSet; cdecl;
    function changedObjects: NSArray; cdecl;
    procedure enumerateMovesWithBlock(handler: TPhotosHandler1); cdecl;
    function hasMoves: Boolean; cdecl;
  end;

  TPHFetchResultChangeDetails = class
    (TOCGenericImport<PHFetchResultChangeDetailsClass,
    PHFetchResultChangeDetails>)
  end;

  PPHFetchResultChangeDetails = Pointer;

  PHCollectionListClass = interface(PHCollectionClass)
    ['{94C78E4D-6695-44C2-9B9A-76DFBF1B4577}']
    { class } function fetchCollectionListsContainingCollection
      (collection: PHCollection; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchCollectionListsWithLocalIdentifiers
      (identifiers: NSArray; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function fetchCollectionListsWithType(collectionListType
      : PHCollectionListType; subtype: PHCollectionListSubtype;
      options: PHFetchOptions): PHFetchResult; cdecl;
    [MethodName('fetchMomentListsWithSubtype:containingMoment:options:')
      ]
    { class } function fetchMomentListsWithSubtypeContainingMomentOptions
      (momentListSubtype: PHCollectionListSubtype;
      containingMoment: PHAssetCollection; options: PHFetchOptions)
      : PHFetchResult; cdecl;
    [MethodName('fetchMomentListsWithSubtype:options:')
      ]
    { class } function fetchMomentListsWithSubtypeOptions(momentListSubtype
      : PHCollectionListSubtype; options: PHFetchOptions): PHFetchResult; cdecl;
    { class } function transientCollectionListWithCollections
      (collections: NSArray; title: NSString): PHCollectionList; cdecl;
    { class } function transientCollectionListWithCollectionsFetchResult
      (fetchResult: PHFetchResult; title: NSString): PHCollectionList; cdecl;
  end;

  PHCollectionList = interface(PHCollection)
    ['{1085AF4C-BDC5-4A58-B717-6FD428A8D789}']
    function collectionListType: PHCollectionListType; cdecl;
    function collectionListSubtype: PHCollectionListSubtype; cdecl;
    function startDate: NSDate; cdecl;
    function endDate: NSDate; cdecl;
    function localizedLocationNames: NSArray; cdecl;
  end;

  TPHCollectionList = class(TOCGenericImport<PHCollectionListClass,
    PHCollectionList>)
  end;

  PPHCollectionList = Pointer;

  PHCollectionListChangeRequestClass = interface(NSObjectClass)
    ['{A800F471-BBFD-4014-A5A9-9B430B5F648C}']
    { class } function creationRequestForCollectionListWithTitle
      (title: NSString): Pointer { instancetype }; cdecl;
    { class } procedure deleteCollectionLists(collectionLists: Pointer); cdecl;
    [MethodName('changeRequestForCollectionList:')]
    { class } function changeRequestForCollectionList(collectionList
      : PHCollectionList): Pointer { instancetype }; cdecl;
    [MethodName('changeRequestForCollectionList:childCollections:')
      ]
    { class } function changeRequestForCollectionListChildCollections
      (collectionList: PHCollectionList; childCollections: PHFetchResult)
      : Pointer { instancetype }; cdecl;
  end;

  PHCollectionListChangeRequest = interface(NSObject)
    ['{2DA226A4-D7D7-4B41-A401-9C8A8EFA7587}']
    function placeholderForCreatedCollectionList: PHObjectPlaceholder; cdecl;
    procedure setTitle(title: NSString); cdecl;
    function title: NSString; cdecl;
    procedure addChildCollections(collections: Pointer); cdecl;
    procedure insertChildCollections(collections: Pointer;
      atIndexes: NSIndexSet); cdecl;
    procedure removeChildCollections(collections: Pointer); cdecl;
    procedure removeChildCollectionsAtIndexes(indexes: NSIndexSet); cdecl;
    procedure replaceChildCollectionsAtIndexes(indexes: NSIndexSet;
      withChildCollections: Pointer); cdecl;
    procedure moveChildCollectionsAtIndexes(indexes: NSIndexSet;
      toIndex: NSUInteger); cdecl;
  end;

  TPHCollectionListChangeRequest = class
    (TOCGenericImport<PHCollectionListChangeRequestClass,
    PHCollectionListChangeRequest>)
  end;

  PPHCollectionListChangeRequest = Pointer;

  PHImageRequestOptionsClass = interface(NSObjectClass)
    ['{95F3C373-0007-4339-B0BA-A1C539AE398D}']
  end;

  PHImageRequestOptions = interface(NSObject)
    ['{E200EE82-D378-48E0-B9BC-F0E25FC99E7B}']
    procedure setVersion(version: PHImageRequestOptionsVersion); cdecl;
    function version: PHImageRequestOptionsVersion; cdecl;
    procedure setDeliveryMode(deliveryMode
      : PHImageRequestOptionsDeliveryMode); cdecl;
    function deliveryMode: PHImageRequestOptionsDeliveryMode; cdecl;
    procedure setResizeMode(resizeMode: PHImageRequestOptionsResizeMode); cdecl;
    function resizeMode: PHImageRequestOptionsResizeMode; cdecl;
    procedure setNormalizedCropRect(normalizedCropRect: CGRect); cdecl;
    function normalizedCropRect: CGRect; cdecl;
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setSynchronous(synchronous: Boolean); cdecl;
    function isSynchronous: Boolean; cdecl;
    procedure setProgressHandler(progressHandler
      : PHAssetImageProgressHandler); cdecl;
    function progressHandler: PHAssetImageProgressHandler; cdecl;
  end;

  TPHImageRequestOptions = class(TOCGenericImport<PHImageRequestOptionsClass,
    PHImageRequestOptions>)
  end;

  PPHImageRequestOptions = Pointer;

  PHLivePhotoRequestOptionsClass = interface(NSObjectClass)
    ['{DAFDA789-64F5-4A3D-A078-F56C12F2411D}']
  end;

  PHLivePhotoRequestOptions = interface(NSObject)
    ['{EAFA1657-AF6B-44BE-A435-D8D85964982F}']
    procedure setVersion(version: PHImageRequestOptionsVersion); cdecl;
    function version: PHImageRequestOptionsVersion; cdecl;
    procedure setDeliveryMode(deliveryMode
      : PHImageRequestOptionsDeliveryMode); cdecl;
    function deliveryMode: PHImageRequestOptionsDeliveryMode; cdecl;
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setProgressHandler(progressHandler
      : PHAssetImageProgressHandler); cdecl;
    function progressHandler: PHAssetImageProgressHandler; cdecl;
  end;

  TPHLivePhotoRequestOptions = class
    (TOCGenericImport<PHLivePhotoRequestOptionsClass,
    PHLivePhotoRequestOptions>)
  end;

  PPHLivePhotoRequestOptions = Pointer;

  PHVideoRequestOptionsClass = interface(NSObjectClass)
    ['{5503A7B7-8D18-445B-9C17-C018C67380D0}']
  end;

  PHVideoRequestOptions = interface(NSObject)
    ['{F025BB96-4134-49C8-B940-FC71D34898A7}']
    procedure setNetworkAccessAllowed(networkAccessAllowed: Boolean); cdecl;
    function isNetworkAccessAllowed: Boolean; cdecl;
    procedure setVersion(version: PHVideoRequestOptionsVersion); cdecl;
    function version: PHVideoRequestOptionsVersion; cdecl;
    procedure setDeliveryMode(deliveryMode
      : PHVideoRequestOptionsDeliveryMode); cdecl;
    function deliveryMode: PHVideoRequestOptionsDeliveryMode; cdecl;
    procedure setProgressHandler(progressHandler
      : PHAssetVideoProgressHandler); cdecl;
    function progressHandler: PHAssetVideoProgressHandler; cdecl;
  end;

  TPHVideoRequestOptions = class(TOCGenericImport<PHVideoRequestOptionsClass,
    PHVideoRequestOptions>)
  end;

  PPHVideoRequestOptions = Pointer;

  PHImageManagerClass = interface(NSObjectClass)
    ['{F396E3F8-88D2-4378-801E-E6C338E97F7D}']
    { class } function defaultManager: PHImageManager; cdecl;
  end;

  PHImageManager = interface(NSObject)
    ['{E57BE22B-B240-47FD-9628-7923CD05E4D3}']
    function requestImageForAsset(asset: PHAsset; targetSize: CGSize;
      contentMode: PHImageContentMode; options: PHImageRequestOptions;
      resultHandler: TPhotosResultHandler): PHImageRequestID; cdecl;
    function requestImageDataForAsset(asset: PHAsset;
      options: PHImageRequestOptions; resultHandler: TPhotosResultHandler1)
      : PHImageRequestID; cdecl;
    procedure cancelImageRequest(requestID: PHImageRequestID); cdecl;
    function requestLivePhotoForAsset(asset: PHAsset; targetSize: CGSize;
      contentMode: PHImageContentMode; options: PHLivePhotoRequestOptions;
      resultHandler: TPhotosResultHandler2): PHImageRequestID; cdecl;
    function requestPlayerItemForVideo(asset: PHAsset;
      options: PHVideoRequestOptions; resultHandler: TPhotosResultHandler3)
      : PHImageRequestID; cdecl;
    function requestExportSessionForVideo(asset: PHAsset;
      options: PHVideoRequestOptions; exportPreset: NSString;
      resultHandler: TPhotosResultHandler4): PHImageRequestID; cdecl;
    function requestAVAssetForVideo(asset: PHAsset;
      options: PHVideoRequestOptions; resultHandler: TPhotosResultHandler5)
      : PHImageRequestID; cdecl;
  end;

  TPHImageManager = class(TOCGenericImport<PHImageManagerClass, PHImageManager>)
  end;

  PPHImageManager = Pointer;

  PHCachingImageManagerClass = interface(PHImageManagerClass)
    ['{678EE9B6-9E1E-432F-9728-69ACEC6C4FE7}']
  end;

  PHCachingImageManager = interface(PHImageManager)
    ['{814A61CB-2425-468E-B733-465ECE25B852}']
    procedure setAllowsCachingHighQualityImages(allowsCachingHighQualityImages
      : Boolean); cdecl;
    function allowsCachingHighQualityImages: Boolean; cdecl;
    procedure startCachingImagesForAssets(assets: NSArray; targetSize: CGSize;
      contentMode: PHImageContentMode; options: PHImageRequestOptions); cdecl;
    procedure stopCachingImagesForAssets(assets: NSArray; targetSize: CGSize;
      contentMode: PHImageContentMode; options: PHImageRequestOptions); cdecl;
    procedure stopCachingImagesForAllAssets; cdecl;
  end;

  TPHCachingImageManager = class(TOCGenericImport<PHCachingImageManagerClass,
    PHCachingImageManager>)
  end;

  PPHCachingImageManager = Pointer;

  PHLivePhotoEditingContextClass = interface(NSObjectClass)
    ['{B655894C-A104-46BF-8A57-0C71E2B5F823}']
  end;

  PHLivePhotoEditingContext = interface(NSObject)
    ['{76F5655F-35C1-436A-9EBC-AFB31D098E9D}']
    function initWithLivePhotoEditingInput(livePhotoInput
      : PHContentEditingInput): Pointer { instancetype }; cdecl;
    function fullSizeImage: CIImage; cdecl;
    function duration: CMTime; cdecl;
    function photoTime: CMTime; cdecl;
    procedure setFrameProcessor(frameProcessor
      : PHLivePhotoFrameProcessingBlock); cdecl;
    function frameProcessor: PHLivePhotoFrameProcessingBlock; cdecl;
    procedure setAudioVolume(audioVolume: Single); cdecl;
    function audioVolume: Single; cdecl;
    function orientation: Integer; cdecl;
    procedure prepareLivePhotoForPlaybackWithTargetSize(targetSize: CGSize;
      options: NSDictionary;
      completionHandler: TPhotosCompletionHandler3); cdecl;
    procedure saveLivePhotoToOutput(output: PHContentEditingOutput;
      options: NSDictionary;
      completionHandler: TPhotosCompletionHandler); cdecl;
    procedure cancel; cdecl;
  end;

  TPHLivePhotoEditingContext = class
    (TOCGenericImport<PHLivePhotoEditingContextClass,
    PHLivePhotoEditingContext>)
  end;

  PPHLivePhotoEditingContext = Pointer;

  // ===== Protocol declarations =====

  PHPhotoLibraryChangeObserver = interface(IObjectiveC)
    ['{A93B7EE8-9572-4853-AF75-E860026203A7}']
    procedure photoLibraryDidChange(changeInstance: PHChange); cdecl;
  end;

  PHLivePhotoFrame = interface(IObjectiveC)
    ['{250FAD9A-1D6A-4583-B9F0-19B7236D0ECF}']
    function image: CIImage; cdecl;
    function time: CMTime; cdecl;
    function &type: PHLivePhotoFrameType; cdecl;
    function renderScale: CGFloat; cdecl;
  end;

  // ===== Exported string consts =====

function PHContentEditingInputResultIsInCloudKey: NSString;
function PHContentEditingInputCancelledKey: NSString;
function PHContentEditingInputErrorKey: NSString;
function PHImageManagerMaximumSize: Pointer;
function PHImageResultIsInCloudKey: NSString;
function PHImageResultIsDegradedKey: NSString;
function PHImageResultRequestIDKey: NSString;
function PHImageCancelledKey: NSString;
function PHImageErrorKey: NSString;
function PHLivePhotoInfoErrorKey: NSString;
function PHLivePhotoInfoIsDegradedKey: NSString;
function PHLivePhotoInfoCancelledKey: NSString;
function PHLivePhotoShouldRenderAtPlaybackTime: Pointer;

{$ENDIF IOS}

// ===== External functions =====

const
  libPhotos = '/System/Library/Frameworks/Photos.framework/Photos';

implementation

{$IF defined(IOS) and NOT defined(CPUARM)}

uses
  Posix.Dlfcn;

var
  PhotosModule: THandle;

{$ENDIF IOS}


{$IFDEF IOS}

function PHContentEditingInputResultIsInCloudKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos,
    'PHContentEditingInputResultIsInCloudKey');
end;

function PHContentEditingInputCancelledKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHContentEditingInputCancelledKey');
end;

function PHContentEditingInputErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHContentEditingInputErrorKey');
end;

function PHImageResultIsInCloudKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageResultIsInCloudKey');
end;

function PHImageResultIsDegradedKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageResultIsDegradedKey');
end;

function PHImageResultRequestIDKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageResultRequestIDKey');
end;

function PHImageCancelledKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageCancelledKey');
end;

function PHImageErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHImageErrorKey');
end;

function PHLivePhotoInfoErrorKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHLivePhotoInfoErrorKey');
end;

function PHLivePhotoInfoIsDegradedKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHLivePhotoInfoIsDegradedKey');
end;

function PHLivePhotoInfoCancelledKey: NSString;
begin
  Result := CocoaNSStringConst(libPhotos, 'PHLivePhotoInfoCancelledKey');
end;

function PHImageManagerMaximumSize: Pointer;
begin
  Result := CocoaPointerConst(libPhotos, 'PHImageManagerMaximumSize');
end;

function PHLivePhotoShouldRenderAtPlaybackTime: Pointer;
begin
  Result := CocoaPointerConst(libPhotos,
    'PHLivePhotoShouldRenderAtPlaybackTime');
end;
{$ENDIF IOS}



{$IF defined(IOS) and defined(CPUARM)}
procedure libPhotosLoader; cdecl; external libPhotos;
{$ENDIF IOS}

{$IF defined(IOS) and NOT defined(CPUARM)}

initialization

PhotosModule := dlopen(MarshaledAString(libPhotos), RTLD_LAZY);

finalization

dlclose(PhotosModule);
{$ENDIF IOS}

end.
