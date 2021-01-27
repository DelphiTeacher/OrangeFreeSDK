{*******************************************************}
{                                                       }
{           CodeGear Delphi Runtime Library             }
{                                                       }
{ Copyright(c) 2010-2015 Embarcadero Technologies, Inc. }
{                                                       }
{*******************************************************}

//
// Delphi-Objective-C Bridge
// Interfaces for Cocoa framework ImageIO
//
unit iOSApi.ImageIO;

{$WEAKPACKAGEUNIT}

interface


{$IFDEF IOS}
uses
  Posix.StdDef,
  Macapi.CoreFoundation,
  iOSApi.CocoaTypes,
  iOSapi.CoreGraphics,
  iOSApi.Foundation;

//const
//  kCGImageMetadataTypeInvalid = -1;
//  {$EXTERNALSYM kCGImageMetadataTypeInvalid}
//  kCGImageMetadataTypeDefault = 0;
//  {$EXTERNALSYM kCGImageMetadataTypeDefault}
//  kCGImageMetadataTypeString = 1;
//  {$EXTERNALSYM kCGImageMetadataTypeString}
//  kCGImageMetadataTypeArrayUnordered = 2;
//  {$EXTERNALSYM kCGImageMetadataTypeArrayUnordered}
//  kCGImageMetadataTypeArrayOrdered = 3;
//  {$EXTERNALSYM kCGImageMetadataTypeArrayOrdered}
//  kCGImageMetadataTypeAlternateArray = 4;
//  {$EXTERNALSYM kCGImageMetadataTypeAlternateArray}
//  kCGImageMetadataTypeAlternateText = 5;
//  {$EXTERNALSYM kCGImageMetadataTypeAlternateText}
//  kCGImageMetadataTypeStructure = 6;
//  {$EXTERNALSYM kCGImageMetadataTypeStructure}
//  kCGImageMetadataErrorUnknown = 0;
//  {$EXTERNALSYM kCGImageMetadataErrorUnknown}
//  kCGImageMetadataErrorUnsupportedFormat = 1;
//  {$EXTERNALSYM kCGImageMetadataErrorUnsupportedFormat}
//  kCGImageMetadataErrorBadArgument = 2;
//  {$EXTERNALSYM kCGImageMetadataErrorBadArgument}
//  kCGImageMetadataErrorConflictingArguments = 3;
//  {$EXTERNALSYM kCGImageMetadataErrorConflictingArguments}
//  kCGImageMetadataErrorPrefixConflict = 4;
//  {$EXTERNALSYM kCGImageMetadataErrorPrefixConflict}
//  kCGImageStatusUnexpectedEOF = -5;
//  {$EXTERNALSYM kCGImageStatusUnexpectedEOF}
//  kCGImageStatusInvalidData = -4;
//  {$EXTERNALSYM kCGImageStatusInvalidData}
//  kCGImageStatusUnknownType = -3;
//  {$EXTERNALSYM kCGImageStatusUnknownType}
//  kCGImageStatusReadingHeader = -2;
//  {$EXTERNALSYM kCGImageStatusReadingHeader}
//  kCGImageStatusIncomplete = -1;
//  {$EXTERNALSYM kCGImageStatusIncomplete}
//  kCGImageStatusComplete = 0;
//  {$EXTERNALSYM kCGImageStatusComplete}
//
type
  // ===== Framework typedefs =====
  {$M+}
  CGImageDestinationRef = Pointer;
  {$EXTERNALSYM CGImageDestinationRef}
  CGImageSourceRef = Pointer;
  {$EXTERNALSYM CGImageSourceRef}
  CGImageMetadataRef = Pointer;
  {$EXTERNALSYM CGImageMetadataRef}
  CGMutableImageMetadataRef = Pointer;
  {$EXTERNALSYM CGMutableImageMetadataRef}
  CGImageMetadataTagRef = Pointer;
  {$EXTERNALSYM CGImageMetadataTagRef}
  CGImageMetadataType = Integer;
  {$EXTERNALSYM CGImageMetadataType}
//  CGImageMetadataTagBlock = function(param1: CFStringRef; param2: CGImageMetadataTagRef): Integer; cdecl;
//  {$EXTERNALSYM CGImageMetadataTagBlock}
//  CGImageMetadataErrors = Cardinal;
//  {$EXTERNALSYM CGImageMetadataErrors}
//  CGImageSourceStatus = Integer;
//  {$EXTERNALSYM CGImageSourceStatus}
//
  // ===== Exported string consts =====

//function kCGImageMetadataNamespaceExif: Pointer;
//function kCGImageMetadataNamespaceExifAux: Pointer;
//function kCGImageMetadataNamespaceExifEX: Pointer;
//function kCGImageMetadataNamespaceDublinCore: Pointer;
//function kCGImageMetadataNamespaceIPTCCore: Pointer;
//function kCGImageMetadataNamespacePhotoshop: Pointer;
//function kCGImageMetadataNamespaceTIFF: Pointer;
//function kCGImageMetadataNamespaceXMPBasic: Pointer;
//function kCGImageMetadataNamespaceXMPRights: Pointer;
//function kCGImageMetadataPrefixExif: Pointer;
//function kCGImageMetadataPrefixExifAux: Pointer;
//function kCGImageMetadataPrefixExifEX: Pointer;
//function kCGImageMetadataPrefixDublinCore: Pointer;
//function kCGImageMetadataPrefixIPTCCore: Pointer;
//function kCGImageMetadataPrefixPhotoshop: Pointer;
//function kCGImageMetadataPrefixTIFF: Pointer;
//function kCGImageMetadataPrefixXMPBasic: Pointer;
//function kCGImageMetadataPrefixXMPRights: Pointer;
//function kCGImageMetadataEnumerateRecursively: Pointer;
//function kCFErrorDomainCGImageMetadata: Pointer;
//function kCGImageSourceTypeIdentifierHint: Pointer;
//function kCGImageSourceShouldCache: Pointer;
//function kCGImageSourceShouldCacheImmediately: Pointer;
//function kCGImageSourceShouldAllowFloat: Pointer;
//function kCGImageSourceCreateThumbnailFromImageIfAbsent: Pointer;
//function kCGImageSourceCreateThumbnailFromImageAlways: Pointer;
//function kCGImageSourceThumbnailMaxPixelSize: Pointer;
//function kCGImageSourceCreateThumbnailWithTransform: Pointer;
//function kCGImageDestinationLossyCompressionQuality: Pointer;
//function kCGImageDestinationBackgroundColor: Pointer;
//function kCGImageDestinationMetadata: Pointer;
//function kCGImageDestinationMergeMetadata: Pointer;
//function kCGImageMetadataShouldExcludeXMP: Pointer;
//function kCGImageDestinationDateTime: Pointer;
//function kCGImageDestinationOrientation: Pointer;
//function kCGImagePropertyTIFFDictionary: Pointer;
//function kCGImagePropertyGIFDictionary: Pointer;
//function kCGImagePropertyJFIFDictionary: Pointer;
//function kCGImagePropertyExifDictionary: Pointer;
//function kCGImagePropertyPNGDictionary: Pointer;
//function kCGImagePropertyIPTCDictionary: Pointer;
//function kCGImagePropertyGPSDictionary: Pointer;
//function kCGImagePropertyRawDictionary: Pointer;
//function kCGImagePropertyCIFFDictionary: Pointer;
//function kCGImagePropertyMakerCanonDictionary: Pointer;
//function kCGImagePropertyMakerNikonDictionary: Pointer;
//function kCGImagePropertyMakerMinoltaDictionary: Pointer;
//function kCGImagePropertyMakerFujiDictionary: Pointer;
//function kCGImagePropertyMakerOlympusDictionary: Pointer;
//function kCGImagePropertyMakerPentaxDictionary: Pointer;
//function kCGImageProperty8BIMDictionary: Pointer;
//function kCGImagePropertyDNGDictionary: Pointer;
//function kCGImagePropertyExifAuxDictionary: Pointer;
//function kCGImagePropertyOpenEXRDictionary: Pointer;
//function kCGImagePropertyFileSize: Pointer;
//function kCGImagePropertyPixelHeight: Pointer;
//function kCGImagePropertyPixelWidth: Pointer;
//function kCGImagePropertyDPIHeight: Pointer;
//function kCGImagePropertyDPIWidth: Pointer;
//function kCGImagePropertyDepth: Pointer;
//function kCGImagePropertyOrientation: Pointer;
//function kCGImagePropertyIsFloat: Pointer;
//function kCGImagePropertyIsIndexed: Pointer;
//function kCGImagePropertyHasAlpha: Pointer;
//function kCGImagePropertyColorModel: Pointer;
//function kCGImagePropertyProfileName: Pointer;
//function kCGImagePropertyColorModelRGB: Pointer;
//function kCGImagePropertyColorModelGray: Pointer;
//function kCGImagePropertyColorModelCMYK: Pointer;
//function kCGImagePropertyColorModelLab: Pointer;
//function kCGImagePropertyTIFFCompression: Pointer;
//function kCGImagePropertyTIFFPhotometricInterpretation: Pointer;
//function kCGImagePropertyTIFFDocumentName: Pointer;
//function kCGImagePropertyTIFFImageDescription: Pointer;
//function kCGImagePropertyTIFFMake: Pointer;
//function kCGImagePropertyTIFFModel: Pointer;
//function kCGImagePropertyTIFFOrientation: Pointer;
//function kCGImagePropertyTIFFXResolution: Pointer;
//function kCGImagePropertyTIFFYResolution: Pointer;
//function kCGImagePropertyTIFFResolutionUnit: Pointer;
//function kCGImagePropertyTIFFSoftware: Pointer;
//function kCGImagePropertyTIFFTransferFunction: Pointer;
//function kCGImagePropertyTIFFDateTime: Pointer;
//function kCGImagePropertyTIFFArtist: Pointer;
//function kCGImagePropertyTIFFHostComputer: Pointer;
//function kCGImagePropertyTIFFCopyright: Pointer;
//function kCGImagePropertyTIFFWhitePoint: Pointer;
//function kCGImagePropertyTIFFPrimaryChromaticities: Pointer;
//function kCGImagePropertyJFIFVersion: Pointer;
//function kCGImagePropertyJFIFXDensity: Pointer;
//function kCGImagePropertyJFIFYDensity: Pointer;
//function kCGImagePropertyJFIFDensityUnit: Pointer;
//function kCGImagePropertyJFIFIsProgressive: Pointer;
//function kCGImagePropertyExifExposureTime: Pointer;
//function kCGImagePropertyExifFNumber: Pointer;
//function kCGImagePropertyExifExposureProgram: Pointer;
//function kCGImagePropertyExifSpectralSensitivity: Pointer;
//function kCGImagePropertyExifISOSpeedRatings: Pointer;
//function kCGImagePropertyExifOECF: Pointer;
//function kCGImagePropertyExifSensitivityType: Pointer;
//function kCGImagePropertyExifStandardOutputSensitivity: Pointer;
//function kCGImagePropertyExifRecommendedExposureIndex: Pointer;
//function kCGImagePropertyExifISOSpeed: Pointer;
//function kCGImagePropertyExifISOSpeedLatitudeyyy: Pointer;
//function kCGImagePropertyExifISOSpeedLatitudezzz: Pointer;
//function kCGImagePropertyExifVersion: Pointer;
//function kCGImagePropertyExifDateTimeOriginal: Pointer;
//function kCGImagePropertyExifDateTimeDigitized: Pointer;
//function kCGImagePropertyExifComponentsConfiguration: Pointer;
//function kCGImagePropertyExifCompressedBitsPerPixel: Pointer;
//function kCGImagePropertyExifShutterSpeedValue: Pointer;
//function kCGImagePropertyExifApertureValue: Pointer;
//function kCGImagePropertyExifBrightnessValue: Pointer;
//function kCGImagePropertyExifExposureBiasValue: Pointer;
//function kCGImagePropertyExifMaxApertureValue: Pointer;
//function kCGImagePropertyExifSubjectDistance: Pointer;
//function kCGImagePropertyExifMeteringMode: Pointer;
//function kCGImagePropertyExifLightSource: Pointer;
//function kCGImagePropertyExifFlash: Pointer;
//function kCGImagePropertyExifFocalLength: Pointer;
//function kCGImagePropertyExifSubjectArea: Pointer;
//function kCGImagePropertyExifMakerNote: Pointer;
//function kCGImagePropertyExifUserComment: Pointer;
//function kCGImagePropertyExifSubsecTime: Pointer;
//function kCGImagePropertyExifSubsecTimeOrginal: Pointer;
//function kCGImagePropertyExifSubsecTimeDigitized: Pointer;
//function kCGImagePropertyExifFlashPixVersion: Pointer;
//function kCGImagePropertyExifColorSpace: Pointer;
//function kCGImagePropertyExifPixelXDimension: Pointer;
//function kCGImagePropertyExifPixelYDimension: Pointer;
//function kCGImagePropertyExifRelatedSoundFile: Pointer;
//function kCGImagePropertyExifFlashEnergy: Pointer;
//function kCGImagePropertyExifSpatialFrequencyResponse: Pointer;
//function kCGImagePropertyExifFocalPlaneXResolution: Pointer;
//function kCGImagePropertyExifFocalPlaneYResolution: Pointer;
//function kCGImagePropertyExifFocalPlaneResolutionUnit: Pointer;
//function kCGImagePropertyExifSubjectLocation: Pointer;
//function kCGImagePropertyExifExposureIndex: Pointer;
//function kCGImagePropertyExifSensingMethod: Pointer;
//function kCGImagePropertyExifFileSource: Pointer;
//function kCGImagePropertyExifSceneType: Pointer;
//function kCGImagePropertyExifCFAPattern: Pointer;
//function kCGImagePropertyExifCustomRendered: Pointer;
//function kCGImagePropertyExifExposureMode: Pointer;
//function kCGImagePropertyExifWhiteBalance: Pointer;
//function kCGImagePropertyExifDigitalZoomRatio: Pointer;
//function kCGImagePropertyExifFocalLenIn35mmFilm: Pointer;
//function kCGImagePropertyExifSceneCaptureType: Pointer;
//function kCGImagePropertyExifGainControl: Pointer;
//function kCGImagePropertyExifContrast: Pointer;
//function kCGImagePropertyExifSaturation: Pointer;
//function kCGImagePropertyExifSharpness: Pointer;
//function kCGImagePropertyExifDeviceSettingDescription: Pointer;
//function kCGImagePropertyExifSubjectDistRange: Pointer;
//function kCGImagePropertyExifImageUniqueID: Pointer;
//function kCGImagePropertyExifCameraOwnerName: Pointer;
//function kCGImagePropertyExifBodySerialNumber: Pointer;
//function kCGImagePropertyExifLensSpecification: Pointer;
//function kCGImagePropertyExifLensMake: Pointer;
//function kCGImagePropertyExifLensModel: Pointer;
//function kCGImagePropertyExifLensSerialNumber: Pointer;
//function kCGImagePropertyExifGamma: Pointer;
//function kCGImagePropertyExifAuxLensInfo: Pointer;
//function kCGImagePropertyExifAuxLensModel: Pointer;
//function kCGImagePropertyExifAuxSerialNumber: Pointer;
//function kCGImagePropertyExifAuxLensID: Pointer;
//function kCGImagePropertyExifAuxLensSerialNumber: Pointer;
//function kCGImagePropertyExifAuxImageNumber: Pointer;
//function kCGImagePropertyExifAuxFlashCompensation: Pointer;
//function kCGImagePropertyExifAuxOwnerName: Pointer;
//function kCGImagePropertyExifAuxFirmware: Pointer;
//function kCGImagePropertyGIFLoopCount: Pointer;
//function kCGImagePropertyGIFDelayTime: Pointer;
//function kCGImagePropertyGIFImageColorMap: Pointer;
//function kCGImagePropertyGIFHasGlobalColorMap: Pointer;
//function kCGImagePropertyGIFUnclampedDelayTime: Pointer;
//function kCGImagePropertyPNGGamma: Pointer;
//function kCGImagePropertyPNGInterlaceType: Pointer;
//function kCGImagePropertyPNGXPixelsPerMeter: Pointer;
//function kCGImagePropertyPNGYPixelsPerMeter: Pointer;
//function kCGImagePropertyPNGsRGBIntent: Pointer;
//function kCGImagePropertyPNGChromaticities: Pointer;
//function kCGImagePropertyPNGAuthor: Pointer;
//function kCGImagePropertyPNGCopyright: Pointer;
//function kCGImagePropertyPNGCreationTime: Pointer;
//function kCGImagePropertyPNGDescription: Pointer;
//function kCGImagePropertyPNGModificationTime: Pointer;
//function kCGImagePropertyPNGSoftware: Pointer;
//function kCGImagePropertyPNGTitle: Pointer;
//function kCGImagePropertyGPSVersion: Pointer;
//function kCGImagePropertyGPSLatitudeRef: Pointer;
//function kCGImagePropertyGPSLatitude: Pointer;
//function kCGImagePropertyGPSLongitudeRef: Pointer;
//function kCGImagePropertyGPSLongitude: Pointer;
//function kCGImagePropertyGPSAltitudeRef: Pointer;
//function kCGImagePropertyGPSAltitude: Pointer;
//function kCGImagePropertyGPSTimeStamp: Pointer;
//function kCGImagePropertyGPSSatellites: Pointer;
//function kCGImagePropertyGPSStatus: Pointer;
//function kCGImagePropertyGPSMeasureMode: Pointer;
//function kCGImagePropertyGPSDOP: Pointer;
//function kCGImagePropertyGPSSpeedRef: Pointer;
//function kCGImagePropertyGPSSpeed: Pointer;
//function kCGImagePropertyGPSTrackRef: Pointer;
//function kCGImagePropertyGPSTrack: Pointer;
//function kCGImagePropertyGPSImgDirectionRef: Pointer;
//function kCGImagePropertyGPSImgDirection: Pointer;
//function kCGImagePropertyGPSMapDatum: Pointer;
//function kCGImagePropertyGPSDestLatitudeRef: Pointer;
//function kCGImagePropertyGPSDestLatitude: Pointer;
//function kCGImagePropertyGPSDestLongitudeRef: Pointer;
//function kCGImagePropertyGPSDestLongitude: Pointer;
//function kCGImagePropertyGPSDestBearingRef: Pointer;
//function kCGImagePropertyGPSDestBearing: Pointer;
//function kCGImagePropertyGPSDestDistanceRef: Pointer;
//function kCGImagePropertyGPSDestDistance: Pointer;
//function kCGImagePropertyGPSProcessingMethod: Pointer;
//function kCGImagePropertyGPSAreaInformation: Pointer;
//function kCGImagePropertyGPSDateStamp: Pointer;
//function kCGImagePropertyGPSDifferental: Pointer;
//function kCGImagePropertyIPTCObjectTypeReference: Pointer;
//function kCGImagePropertyIPTCObjectAttributeReference: Pointer;
//function kCGImagePropertyIPTCObjectName: Pointer;
//function kCGImagePropertyIPTCEditStatus: Pointer;
//function kCGImagePropertyIPTCEditorialUpdate: Pointer;
//function kCGImagePropertyIPTCUrgency: Pointer;
//function kCGImagePropertyIPTCSubjectReference: Pointer;
//function kCGImagePropertyIPTCCategory: Pointer;
//function kCGImagePropertyIPTCSupplementalCategory: Pointer;
//function kCGImagePropertyIPTCFixtureIdentifier: Pointer;
//function kCGImagePropertyIPTCKeywords: Pointer;
//function kCGImagePropertyIPTCContentLocationCode: Pointer;
//function kCGImagePropertyIPTCContentLocationName: Pointer;
//function kCGImagePropertyIPTCReleaseDate: Pointer;
//function kCGImagePropertyIPTCReleaseTime: Pointer;
//function kCGImagePropertyIPTCExpirationDate: Pointer;
//function kCGImagePropertyIPTCExpirationTime: Pointer;
//function kCGImagePropertyIPTCSpecialInstructions: Pointer;
//function kCGImagePropertyIPTCActionAdvised: Pointer;
//function kCGImagePropertyIPTCReferenceService: Pointer;
//function kCGImagePropertyIPTCReferenceDate: Pointer;
//function kCGImagePropertyIPTCReferenceNumber: Pointer;
//function kCGImagePropertyIPTCDateCreated: Pointer;
//function kCGImagePropertyIPTCTimeCreated: Pointer;
//function kCGImagePropertyIPTCDigitalCreationDate: Pointer;
//function kCGImagePropertyIPTCDigitalCreationTime: Pointer;
//function kCGImagePropertyIPTCOriginatingProgram: Pointer;
//function kCGImagePropertyIPTCProgramVersion: Pointer;
//function kCGImagePropertyIPTCObjectCycle: Pointer;
//function kCGImagePropertyIPTCByline: Pointer;
//function kCGImagePropertyIPTCBylineTitle: Pointer;
//function kCGImagePropertyIPTCCity: Pointer;
//function kCGImagePropertyIPTCSubLocation: Pointer;
//function kCGImagePropertyIPTCProvinceState: Pointer;
//function kCGImagePropertyIPTCCountryPrimaryLocationCode: Pointer;
//function kCGImagePropertyIPTCCountryPrimaryLocationName: Pointer;
//function kCGImagePropertyIPTCOriginalTransmissionReference: Pointer;
//function kCGImagePropertyIPTCHeadline: Pointer;
//function kCGImagePropertyIPTCCredit: Pointer;
//function kCGImagePropertyIPTCSource: Pointer;
//function kCGImagePropertyIPTCCopyrightNotice: Pointer;
//function kCGImagePropertyIPTCContact: Pointer;
//function kCGImagePropertyIPTCCaptionAbstract: Pointer;
//function kCGImagePropertyIPTCWriterEditor: Pointer;
//function kCGImagePropertyIPTCImageType: Pointer;
//function kCGImagePropertyIPTCImageOrientation: Pointer;
//function kCGImagePropertyIPTCLanguageIdentifier: Pointer;
//function kCGImagePropertyIPTCStarRating: Pointer;
//function kCGImagePropertyIPTCCreatorContactInfo: Pointer;
//function kCGImagePropertyIPTCRightsUsageTerms: Pointer;
//function kCGImagePropertyIPTCScene: Pointer;
//function kCGImagePropertyIPTCContactInfoCity: Pointer;
//function kCGImagePropertyIPTCContactInfoCountry: Pointer;
//function kCGImagePropertyIPTCContactInfoAddress: Pointer;
//function kCGImagePropertyIPTCContactInfoPostalCode: Pointer;
//function kCGImagePropertyIPTCContactInfoStateProvince: Pointer;
//function kCGImagePropertyIPTCContactInfoEmails: Pointer;
//function kCGImagePropertyIPTCContactInfoPhones: Pointer;
//function kCGImagePropertyIPTCContactInfoWebURLs: Pointer;
//function kCGImageProperty8BIMLayerNames: Pointer;
//function kCGImagePropertyDNGVersion: Pointer;
//function kCGImagePropertyDNGBackwardVersion: Pointer;
//function kCGImagePropertyDNGUniqueCameraModel: Pointer;
//function kCGImagePropertyDNGLocalizedCameraModel: Pointer;
//function kCGImagePropertyDNGCameraSerialNumber: Pointer;
//function kCGImagePropertyDNGLensInfo: Pointer;
//function kCGImagePropertyCIFFDescription: Pointer;
//function kCGImagePropertyCIFFFirmware: Pointer;
//function kCGImagePropertyCIFFOwnerName: Pointer;
//function kCGImagePropertyCIFFImageName: Pointer;
//function kCGImagePropertyCIFFImageFileName: Pointer;
//function kCGImagePropertyCIFFReleaseMethod: Pointer;
//function kCGImagePropertyCIFFReleaseTiming: Pointer;
//function kCGImagePropertyCIFFRecordID: Pointer;
//function kCGImagePropertyCIFFSelfTimingTime: Pointer;
//function kCGImagePropertyCIFFCameraSerialNumber: Pointer;
//function kCGImagePropertyCIFFImageSerialNumber: Pointer;
//function kCGImagePropertyCIFFContinuousDrive: Pointer;
//function kCGImagePropertyCIFFFocusMode: Pointer;
//function kCGImagePropertyCIFFMeteringMode: Pointer;
//function kCGImagePropertyCIFFShootingMode: Pointer;
//function kCGImagePropertyCIFFLensModel: Pointer;
//function kCGImagePropertyCIFFLensMaxMM: Pointer;
//function kCGImagePropertyCIFFLensMinMM: Pointer;
//function kCGImagePropertyCIFFWhiteBalanceIndex: Pointer;
//function kCGImagePropertyCIFFFlashExposureComp: Pointer;
//function kCGImagePropertyCIFFMeasuredEV: Pointer;
//function kCGImagePropertyMakerNikonISOSetting: Pointer;
//function kCGImagePropertyMakerNikonColorMode: Pointer;
//function kCGImagePropertyMakerNikonQuality: Pointer;
//function kCGImagePropertyMakerNikonWhiteBalanceMode: Pointer;
//function kCGImagePropertyMakerNikonSharpenMode: Pointer;
//function kCGImagePropertyMakerNikonFocusMode: Pointer;
//function kCGImagePropertyMakerNikonFlashSetting: Pointer;
//function kCGImagePropertyMakerNikonISOSelection: Pointer;
//function kCGImagePropertyMakerNikonFlashExposureComp: Pointer;
//function kCGImagePropertyMakerNikonImageAdjustment: Pointer;
//function kCGImagePropertyMakerNikonLensAdapter: Pointer;
//function kCGImagePropertyMakerNikonLensType: Pointer;
//function kCGImagePropertyMakerNikonLensInfo: Pointer;
//function kCGImagePropertyMakerNikonFocusDistance: Pointer;
//function kCGImagePropertyMakerNikonDigitalZoom: Pointer;
//function kCGImagePropertyMakerNikonShootingMode: Pointer;
//function kCGImagePropertyMakerNikonCameraSerialNumber: Pointer;
//function kCGImagePropertyMakerNikonShutterCount: Pointer;
//function kCGImagePropertyMakerCanonOwnerName: Pointer;
//function kCGImagePropertyMakerCanonCameraSerialNumber: Pointer;
//function kCGImagePropertyMakerCanonImageSerialNumber: Pointer;
//function kCGImagePropertyMakerCanonFlashExposureComp: Pointer;
//function kCGImagePropertyMakerCanonContinuousDrive: Pointer;
//function kCGImagePropertyMakerCanonLensModel: Pointer;
//function kCGImagePropertyMakerCanonFirmware: Pointer;
//function kCGImagePropertyMakerCanonAspectRatioInfo: Pointer;
//function kCGImagePropertyOpenEXRAspectRatio: Pointer;

// ===== External functions =====

const
  libImageIO = '/System/Library/Frameworks/ImageIO.framework/ImageIO';

//function CGImageMetadataGetTypeID: CFTypeID; cdecl; external libImageIO name _PU + 'CGImageMetadataGetTypeID';
//{$EXTERNALSYM CGImageMetadataGetTypeID}
//function CGImageMetadataCreateMutable: CGMutableImageMetadataRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataCreateMutable';
//{$EXTERNALSYM CGImageMetadataCreateMutable}
//function CGImageMetadataCreateMutableCopy(metadata: CGImageMetadataRef): CGMutableImageMetadataRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataCreateMutableCopy';
//{$EXTERNALSYM CGImageMetadataCreateMutableCopy}
//function CGImageMetadataTagGetTypeID: CFTypeID; cdecl; external libImageIO name _PU + 'CGImageMetadataTagGetTypeID';
//{$EXTERNALSYM CGImageMetadataTagGetTypeID}
//function CGImageMetadataTagCreate(xmlns: CFStringRef; prefix: CFStringRef; name: CFStringRef;
//  &type: CGImageMetadataType; value: CFTypeRef): CGImageMetadataTagRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataTagCreate';
//{$EXTERNALSYM CGImageMetadataTagCreate}
//function CGImageMetadataTagCopyNamespace(tag: CGImageMetadataTagRef): CFStringRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataTagCopyNamespace';
//{$EXTERNALSYM CGImageMetadataTagCopyNamespace}
//function CGImageMetadataTagCopyPrefix(tag: CGImageMetadataTagRef): CFStringRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataTagCopyPrefix';
//{$EXTERNALSYM CGImageMetadataTagCopyPrefix}
//function CGImageMetadataTagCopyName(tag: CGImageMetadataTagRef): CFStringRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataTagCopyName';
//{$EXTERNALSYM CGImageMetadataTagCopyName}
//function CGImageMetadataTagCopyValue(tag: CGImageMetadataTagRef): CFTypeRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataTagCopyValue';
//{$EXTERNALSYM CGImageMetadataTagCopyValue}
//function CGImageMetadataTagGetType(tag: CGImageMetadataTagRef): CGImageMetadataType; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataTagGetType';
//{$EXTERNALSYM CGImageMetadataTagGetType}
//function CGImageMetadataTagCopyQualifiers(tag: CGImageMetadataTagRef): CFArrayRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataTagCopyQualifiers';
//{$EXTERNALSYM CGImageMetadataTagCopyQualifiers}
//function CGImageMetadataCopyTags(metadata: CGImageMetadataRef): CFArrayRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataCopyTags';
//{$EXTERNALSYM CGImageMetadataCopyTags}
//function CGImageMetadataCopyTagWithPath(metadata: CGImageMetadataRef; parent: CGImageMetadataTagRef; path: CFStringRef)
//  : CGImageMetadataTagRef; cdecl; external libImageIO name _PU + 'CGImageMetadataCopyTagWithPath';
//{$EXTERNALSYM CGImageMetadataCopyTagWithPath}
//function CGImageMetadataCopyStringValueWithPath(metadata: CGImageMetadataRef; parent: CGImageMetadataTagRef;
//  path: CFStringRef): CFStringRef; cdecl; external libImageIO name _PU + 'CGImageMetadataCopyStringValueWithPath';
//{$EXTERNALSYM CGImageMetadataCopyStringValueWithPath}
//function CGImageMetadataRegisterNamespaceForPrefix(metadata: CGMutableImageMetadataRef; xmlns: CFStringRef;
//  prefix: CFStringRef; err: CFErrorRef): Integer; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataRegisterNamespaceForPrefix';
//{$EXTERNALSYM CGImageMetadataRegisterNamespaceForPrefix}
//function CGImageMetadataSetTagWithPath(metadata: CGMutableImageMetadataRef; parent: CGImageMetadataTagRef;
//  path: CFStringRef; tag: CGImageMetadataTagRef): Integer; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataSetTagWithPath';
//{$EXTERNALSYM CGImageMetadataSetTagWithPath}
//function CGImageMetadataSetValueWithPath(metadata: CGMutableImageMetadataRef; parent: CGImageMetadataTagRef;
//  path: CFStringRef; value: CFTypeRef): Integer; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataSetValueWithPath';
//{$EXTERNALSYM CGImageMetadataSetValueWithPath}
//function CGImageMetadataRemoveTagWithPath(metadata: CGMutableImageMetadataRef; parent: CGImageMetadataTagRef;
//  path: CFStringRef): Integer; cdecl; external libImageIO name _PU + 'CGImageMetadataRemoveTagWithPath';
//{$EXTERNALSYM CGImageMetadataRemoveTagWithPath}
//procedure CGImageMetadataEnumerateTagsUsingBlock(metadata: CGImageMetadataRef; rootPath: CFStringRef;
//  options: CFDictionaryRef; block: CGImageMetadataTagBlock); cdecl;
//  external libImageIO name _PU + 'CGImageMetadataEnumerateTagsUsingBlock';
//{$EXTERNALSYM CGImageMetadataEnumerateTagsUsingBlock}
//function CGImageMetadataCopyTagMatchingImageProperty(metadata: CGImageMetadataRef; dictionaryName: CFStringRef;
//  propertyName: CFStringRef): CGImageMetadataTagRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataCopyTagMatchingImageProperty';
//{$EXTERNALSYM CGImageMetadataCopyTagMatchingImageProperty}
//function CGImageMetadataSetValueMatchingImageProperty(metadata: CGMutableImageMetadataRef; dictionaryName: CFStringRef;
//  propertyName: CFStringRef; value: CFTypeRef): Integer; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataSetValueMatchingImageProperty';
//{$EXTERNALSYM CGImageMetadataSetValueMatchingImageProperty}
//function CGImageMetadataCreateXMPData(metadata: CGImageMetadataRef; options: CFDictionaryRef): CFDataRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataCreateXMPData';
//{$EXTERNALSYM CGImageMetadataCreateXMPData}
//function CGImageMetadataCreateFromXMPData(data: CFDataRef): CGImageMetadataRef; cdecl;
//  external libImageIO name _PU + 'CGImageMetadataCreateFromXMPData';
//{$EXTERNALSYM CGImageMetadataCreateFromXMPData}
//function CGImageSourceGetTypeID: CFTypeID; cdecl; external libImageIO name _PU + 'CGImageSourceGetTypeID';
//{$EXTERNALSYM CGImageSourceGetTypeID}
//function CGImageSourceCopyTypeIdentifiers: CFArrayRef; cdecl;
//  external libImageIO name _PU + 'CGImageSourceCopyTypeIdentifiers';
//{$EXTERNALSYM CGImageSourceCopyTypeIdentifiers}
//function CGImageSourceCreateWithDataProvider(provider: CGDataProviderRef; options: CFDictionaryRef): CGImageSourceRef;
//  cdecl; external libImageIO name _PU + 'CGImageSourceCreateWithDataProvider';
//{$EXTERNALSYM CGImageSourceCreateWithDataProvider}
//function CGImageSourceCreateWithData(data: CFDataRef; options: CFDictionaryRef): CGImageSourceRef; cdecl;
//  external libImageIO name _PU + 'CGImageSourceCreateWithData';
//{$EXTERNALSYM CGImageSourceCreateWithData}
//function CGImageSourceCreateWithURL(url: CFURLRef; options: CFDictionaryRef): CGImageSourceRef; cdecl;
//  external libImageIO name _PU + 'CGImageSourceCreateWithURL';
//{$EXTERNALSYM CGImageSourceCreateWithURL}
//function CGImageSourceGetType(isrc: CGImageSourceRef): CFStringRef; cdecl;
//  external libImageIO name _PU + 'CGImageSourceGetType';
//{$EXTERNALSYM CGImageSourceGetType}
//function CGImageSourceGetCount(isrc: CGImageSourceRef): size_t; cdecl;
//  external libImageIO name _PU + 'CGImageSourceGetCount';
//{$EXTERNALSYM CGImageSourceGetCount}
//function CGImageSourceCopyProperties(isrc: CGImageSourceRef; options: CFDictionaryRef): CFDictionaryRef; cdecl;
//  external libImageIO name _PU + 'CGImageSourceCopyProperties';
//{$EXTERNALSYM CGImageSourceCopyProperties}
//function CGImageSourceCopyPropertiesAtIndex(isrc: CGImageSourceRef; index: size_t; options: CFDictionaryRef)
//  : CFDictionaryRef; cdecl; external libImageIO name _PU + 'CGImageSourceCopyPropertiesAtIndex';
//{$EXTERNALSYM CGImageSourceCopyPropertiesAtIndex}
//function CGImageSourceCopyMetadataAtIndex(isrc: CGImageSourceRef; index: size_t; options: CFDictionaryRef)
//  : CGImageMetadataRef; cdecl; external libImageIO name _PU + 'CGImageSourceCopyMetadataAtIndex';
//{$EXTERNALSYM CGImageSourceCopyMetadataAtIndex}
function CGImageSourceCreateImageAtIndex(isrc: CGImageSourceRef; index: size_t; options: CFDictionaryRef): CGImageRef;
  cdecl; external libImageIO name _PU + 'CGImageSourceCreateImageAtIndex';
{$EXTERNALSYM CGImageSourceCreateImageAtIndex}
//procedure CGImageSourceRemoveCacheAtIndex(isrc: CGImageSourceRef; index: size_t); cdecl;
//  external libImageIO name _PU + 'CGImageSourceRemoveCacheAtIndex';
//{$EXTERNALSYM CGImageSourceRemoveCacheAtIndex}
//function CGImageSourceCreateThumbnailAtIndex(isrc: CGImageSourceRef; index: size_t; options: CFDictionaryRef)
//  : CGImageRef; cdecl; external libImageIO name _PU + 'CGImageSourceCreateThumbnailAtIndex';
//{$EXTERNALSYM CGImageSourceCreateThumbnailAtIndex}
//function CGImageSourceCreateIncremental(options: CFDictionaryRef): CGImageSourceRef; cdecl;
//  external libImageIO name _PU + 'CGImageSourceCreateIncremental';
//{$EXTERNALSYM CGImageSourceCreateIncremental}
//procedure CGImageSourceUpdateData(isrc: CGImageSourceRef; data: CFDataRef; final: Integer); cdecl;
//  external libImageIO name _PU + 'CGImageSourceUpdateData';
//{$EXTERNALSYM CGImageSourceUpdateData}
//procedure CGImageSourceUpdateDataProvider(isrc: CGImageSourceRef; provider: CGDataProviderRef; final: Integer); cdecl;
//  external libImageIO name _PU + 'CGImageSourceUpdateDataProvider';
//{$EXTERNALSYM CGImageSourceUpdateDataProvider}
//function CGImageSourceGetStatus(isrc: CGImageSourceRef): CGImageSourceStatus; cdecl;
//  external libImageIO name _PU + 'CGImageSourceGetStatus';
//{$EXTERNALSYM CGImageSourceGetStatus}
//function CGImageSourceGetStatusAtIndex(isrc: CGImageSourceRef; index: size_t): CGImageSourceStatus; cdecl;
//  external libImageIO name _PU + 'CGImageSourceGetStatusAtIndex';
//{$EXTERNALSYM CGImageSourceGetStatusAtIndex}
//function CGImageDestinationGetTypeID: CFTypeID; cdecl; external libImageIO name _PU + 'CGImageDestinationGetTypeID';
//{$EXTERNALSYM CGImageDestinationGetTypeID}
//function CGImageDestinationCopyTypeIdentifiers: CFArrayRef; cdecl;
//  external libImageIO name _PU + 'CGImageDestinationCopyTypeIdentifiers';
//{$EXTERNALSYM CGImageDestinationCopyTypeIdentifiers}
//function CGImageDestinationCreateWithDataConsumer(consumer: CGDataConsumerRef; &type: CFStringRef; count: size_t;
//  options: CFDictionaryRef): CGImageDestinationRef; cdecl;
//  external libImageIO name _PU + 'CGImageDestinationCreateWithDataConsumer';
//{$EXTERNALSYM CGImageDestinationCreateWithDataConsumer}
//function CGImageDestinationCreateWithData(data: CFMutableDataRef; &type: CFStringRef; count: size_t;
//  options: CFDictionaryRef): CGImageDestinationRef; cdecl;
//  external libImageIO name _PU + 'CGImageDestinationCreateWithData';
//{$EXTERNALSYM CGImageDestinationCreateWithData}
//function CGImageDestinationCreateWithURL(url: CFURLRef; &type: CFStringRef; count: size_t; options: CFDictionaryRef)
//  : CGImageDestinationRef; cdecl; external libImageIO name _PU + 'CGImageDestinationCreateWithURL';
//{$EXTERNALSYM CGImageDestinationCreateWithURL}
//procedure CGImageDestinationSetProperties(idst: CGImageDestinationRef; properties: CFDictionaryRef); cdecl;
//  external libImageIO name _PU + 'CGImageDestinationSetProperties';
//{$EXTERNALSYM CGImageDestinationSetProperties}
//procedure CGImageDestinationAddImage(idst: CGImageDestinationRef; image: CGImageRef; properties: CFDictionaryRef);
//  cdecl; external libImageIO name _PU + 'CGImageDestinationAddImage';
//{$EXTERNALSYM CGImageDestinationAddImage}
//procedure CGImageDestinationAddImageFromSource(idst: CGImageDestinationRef; isrc: CGImageSourceRef; index: size_t;
//  properties: CFDictionaryRef); cdecl; external libImageIO name _PU + 'CGImageDestinationAddImageFromSource';
//{$EXTERNALSYM CGImageDestinationAddImageFromSource}
//function CGImageDestinationFinalize(idst: CGImageDestinationRef): Integer; cdecl;
//  external libImageIO name _PU + 'CGImageDestinationFinalize';
//{$EXTERNALSYM CGImageDestinationFinalize}
//procedure CGImageDestinationAddImageAndMetadata(idst: CGImageDestinationRef; image: CGImageRef;
//  metadata: CGImageMetadataRef; options: CFDictionaryRef); cdecl;
//  external libImageIO name _PU + 'CGImageDestinationAddImageAndMetadata';
//{$EXTERNALSYM CGImageDestinationAddImageAndMetadata}
//function CGImageDestinationCopyImageSource(idst: CGImageDestinationRef; isrc: CGImageSourceRef;
//  options: CFDictionaryRef; err: CFErrorRef): Integer; cdecl;
//  external libImageIO name _PU + 'CGImageDestinationCopyImageSource';
//{$EXTERNALSYM CGImageDestinationCopyImageSource}


{$ENDIF}

implementation




{$IFDEF IOS}

//function kCGImageMetadataNamespaceExif: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceExif');
//end;
//
//function kCGImageMetadataNamespaceExifAux: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceExifAux');
//end;
//
//function kCGImageMetadataNamespaceExifEX: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceExifEX');
//end;
//
//function kCGImageMetadataNamespaceDublinCore: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceDublinCore');
//end;
//
//function kCGImageMetadataNamespaceIPTCCore: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceIPTCCore');
//end;
//
//function kCGImageMetadataNamespacePhotoshop: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespacePhotoshop');
//end;
//
//function kCGImageMetadataNamespaceTIFF: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceTIFF');
//end;
//
//function kCGImageMetadataNamespaceXMPBasic: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceXMPBasic');
//end;
//
//function kCGImageMetadataNamespaceXMPRights: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataNamespaceXMPRights');
//end;
//
//function kCGImageMetadataPrefixExif: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixExif');
//end;
//
//function kCGImageMetadataPrefixExifAux: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixExifAux');
//end;
//
//function kCGImageMetadataPrefixExifEX: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixExifEX');
//end;
//
//function kCGImageMetadataPrefixDublinCore: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixDublinCore');
//end;
//
//function kCGImageMetadataPrefixIPTCCore: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixIPTCCore');
//end;
//
//function kCGImageMetadataPrefixPhotoshop: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixPhotoshop');
//end;
//
//function kCGImageMetadataPrefixTIFF: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixTIFF');
//end;
//
//function kCGImageMetadataPrefixXMPBasic: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixXMPBasic');
//end;
//
//function kCGImageMetadataPrefixXMPRights: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataPrefixXMPRights');
//end;
//
//function kCGImageMetadataEnumerateRecursively: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataEnumerateRecursively');
//end;
//
//function kCFErrorDomainCGImageMetadata: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCFErrorDomainCGImageMetadata');
//end;
//
//function kCGImageSourceTypeIdentifierHint: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceTypeIdentifierHint');
//end;
//
//function kCGImageSourceShouldCache: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceShouldCache');
//end;
//
//function kCGImageSourceShouldCacheImmediately: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceShouldCacheImmediately');
//end;
//
//function kCGImageSourceShouldAllowFloat: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceShouldAllowFloat');
//end;
//
//function kCGImageSourceCreateThumbnailFromImageIfAbsent: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceCreateThumbnailFromImageIfAbsent');
//end;
//
//function kCGImageSourceCreateThumbnailFromImageAlways: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceCreateThumbnailFromImageAlways');
//end;
//
//function kCGImageSourceThumbnailMaxPixelSize: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceThumbnailMaxPixelSize');
//end;
//
//function kCGImageSourceCreateThumbnailWithTransform: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageSourceCreateThumbnailWithTransform');
//end;
//
//function kCGImageDestinationLossyCompressionQuality: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationLossyCompressionQuality');
//end;
//
//function kCGImageDestinationBackgroundColor: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationBackgroundColor');
//end;
//
//function kCGImageDestinationMetadata: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationMetadata');
//end;
//
//function kCGImageDestinationMergeMetadata: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationMergeMetadata');
//end;
//
//function kCGImageMetadataShouldExcludeXMP: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageMetadataShouldExcludeXMP');
//end;
//
//function kCGImageDestinationDateTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationDateTime');
//end;
//
//function kCGImageDestinationOrientation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageDestinationOrientation');
//end;
//
//function kCGImagePropertyTIFFDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFDictionary');
//end;
//
//function kCGImagePropertyGIFDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFDictionary');
//end;
//
//function kCGImagePropertyJFIFDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFDictionary');
//end;
//
//function kCGImagePropertyExifDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifDictionary');
//end;
//
//function kCGImagePropertyPNGDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGDictionary');
//end;
//
//function kCGImagePropertyIPTCDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCDictionary');
//end;
//
//function kCGImagePropertyGPSDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDictionary');
//end;
//
//function kCGImagePropertyRawDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyRawDictionary');
//end;
//
//function kCGImagePropertyCIFFDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFDictionary');
//end;
//
//function kCGImagePropertyMakerCanonDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonDictionary');
//end;
//
//function kCGImagePropertyMakerNikonDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonDictionary');
//end;
//
//function kCGImagePropertyMakerMinoltaDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerMinoltaDictionary');
//end;
//
//function kCGImagePropertyMakerFujiDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerFujiDictionary');
//end;
//
//function kCGImagePropertyMakerOlympusDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerOlympusDictionary');
//end;
//
//function kCGImagePropertyMakerPentaxDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerPentaxDictionary');
//end;
//
//function kCGImageProperty8BIMDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageProperty8BIMDictionary');
//end;
//
//function kCGImagePropertyDNGDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGDictionary');
//end;
//
//function kCGImagePropertyExifAuxDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxDictionary');
//end;
//
//function kCGImagePropertyOpenEXRDictionary: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyOpenEXRDictionary');
//end;
//
//function kCGImagePropertyFileSize: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyFileSize');
//end;
//
//function kCGImagePropertyPixelHeight: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPixelHeight');
//end;
//
//function kCGImagePropertyPixelWidth: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPixelWidth');
//end;
//
//function kCGImagePropertyDPIHeight: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDPIHeight');
//end;
//
//function kCGImagePropertyDPIWidth: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDPIWidth');
//end;
//
//function kCGImagePropertyDepth: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDepth');
//end;
//
//function kCGImagePropertyOrientation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyOrientation');
//end;
//
//function kCGImagePropertyIsFloat: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIsFloat');
//end;
//
//function kCGImagePropertyIsIndexed: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIsIndexed');
//end;
//
//function kCGImagePropertyHasAlpha: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyHasAlpha');
//end;
//
//function kCGImagePropertyColorModel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModel');
//end;
//
//function kCGImagePropertyProfileName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyProfileName');
//end;
//
//function kCGImagePropertyColorModelRGB: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModelRGB');
//end;
//
//function kCGImagePropertyColorModelGray: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModelGray');
//end;
//
//function kCGImagePropertyColorModelCMYK: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModelCMYK');
//end;
//
//function kCGImagePropertyColorModelLab: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyColorModelLab');
//end;
//
//function kCGImagePropertyTIFFCompression: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFCompression');
//end;
//
//function kCGImagePropertyTIFFPhotometricInterpretation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFPhotometricInterpretation');
//end;
//
//function kCGImagePropertyTIFFDocumentName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFDocumentName');
//end;
//
//function kCGImagePropertyTIFFImageDescription: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFImageDescription');
//end;
//
//function kCGImagePropertyTIFFMake: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFMake');
//end;
//
//function kCGImagePropertyTIFFModel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFModel');
//end;
//
//function kCGImagePropertyTIFFOrientation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFOrientation');
//end;
//
//function kCGImagePropertyTIFFXResolution: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFXResolution');
//end;
//
//function kCGImagePropertyTIFFYResolution: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFYResolution');
//end;
//
//function kCGImagePropertyTIFFResolutionUnit: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFResolutionUnit');
//end;
//
//function kCGImagePropertyTIFFSoftware: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFSoftware');
//end;
//
//function kCGImagePropertyTIFFTransferFunction: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFTransferFunction');
//end;
//
//function kCGImagePropertyTIFFDateTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFDateTime');
//end;
//
//function kCGImagePropertyTIFFArtist: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFArtist');
//end;
//
//function kCGImagePropertyTIFFHostComputer: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFHostComputer');
//end;
//
//function kCGImagePropertyTIFFCopyright: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFCopyright');
//end;
//
//function kCGImagePropertyTIFFWhitePoint: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFWhitePoint');
//end;
//
//function kCGImagePropertyTIFFPrimaryChromaticities: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyTIFFPrimaryChromaticities');
//end;
//
//function kCGImagePropertyJFIFVersion: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFVersion');
//end;
//
//function kCGImagePropertyJFIFXDensity: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFXDensity');
//end;
//
//function kCGImagePropertyJFIFYDensity: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFYDensity');
//end;
//
//function kCGImagePropertyJFIFDensityUnit: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFDensityUnit');
//end;
//
//function kCGImagePropertyJFIFIsProgressive: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyJFIFIsProgressive');
//end;
//
//function kCGImagePropertyExifExposureTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifExposureTime');
//end;
//
//function kCGImagePropertyExifFNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFNumber');
//end;
//
//function kCGImagePropertyExifExposureProgram: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifExposureProgram');
//end;
//
//function kCGImagePropertyExifSpectralSensitivity: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSpectralSensitivity');
//end;
//
//function kCGImagePropertyExifISOSpeedRatings: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifISOSpeedRatings');
//end;
//
//function kCGImagePropertyExifOECF: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifOECF');
//end;
//
//function kCGImagePropertyExifSensitivityType: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSensitivityType');
//end;
//
//function kCGImagePropertyExifStandardOutputSensitivity: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifStandardOutputSensitivity');
//end;
//
//function kCGImagePropertyExifRecommendedExposureIndex: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifRecommendedExposureIndex');
//end;
//
//function kCGImagePropertyExifISOSpeed: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifISOSpeed');
//end;
//
//function kCGImagePropertyExifISOSpeedLatitudeyyy: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifISOSpeedLatitudeyyy');
//end;
//
//function kCGImagePropertyExifISOSpeedLatitudezzz: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifISOSpeedLatitudezzz');
//end;
//
//function kCGImagePropertyExifVersion: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifVersion');
//end;
//
//function kCGImagePropertyExifDateTimeOriginal: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifDateTimeOriginal');
//end;
//
//function kCGImagePropertyExifDateTimeDigitized: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifDateTimeDigitized');
//end;
//
//function kCGImagePropertyExifComponentsConfiguration: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifComponentsConfiguration');
//end;
//
//function kCGImagePropertyExifCompressedBitsPerPixel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifCompressedBitsPerPixel');
//end;
//
//function kCGImagePropertyExifShutterSpeedValue: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifShutterSpeedValue');
//end;
//
//function kCGImagePropertyExifApertureValue: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifApertureValue');
//end;
//
//function kCGImagePropertyExifBrightnessValue: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifBrightnessValue');
//end;
//
//function kCGImagePropertyExifExposureBiasValue: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifExposureBiasValue');
//end;
//
//function kCGImagePropertyExifMaxApertureValue: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifMaxApertureValue');
//end;
//
//function kCGImagePropertyExifSubjectDistance: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubjectDistance');
//end;
//
//function kCGImagePropertyExifMeteringMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifMeteringMode');
//end;
//
//function kCGImagePropertyExifLightSource: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifLightSource');
//end;
//
//function kCGImagePropertyExifFlash: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFlash');
//end;
//
//function kCGImagePropertyExifFocalLength: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFocalLength');
//end;
//
//function kCGImagePropertyExifSubjectArea: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubjectArea');
//end;
//
//function kCGImagePropertyExifMakerNote: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifMakerNote');
//end;
//
//function kCGImagePropertyExifUserComment: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifUserComment');
//end;
//
//function kCGImagePropertyExifSubsecTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubsecTime');
//end;
//
//function kCGImagePropertyExifSubsecTimeOrginal: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubsecTimeOrginal');
//end;
//
//function kCGImagePropertyExifSubsecTimeDigitized: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubsecTimeDigitized');
//end;
//
//function kCGImagePropertyExifFlashPixVersion: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFlashPixVersion');
//end;
//
//function kCGImagePropertyExifColorSpace: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifColorSpace');
//end;
//
//function kCGImagePropertyExifPixelXDimension: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifPixelXDimension');
//end;
//
//function kCGImagePropertyExifPixelYDimension: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifPixelYDimension');
//end;
//
//function kCGImagePropertyExifRelatedSoundFile: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifRelatedSoundFile');
//end;
//
//function kCGImagePropertyExifFlashEnergy: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFlashEnergy');
//end;
//
//function kCGImagePropertyExifSpatialFrequencyResponse: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSpatialFrequencyResponse');
//end;
//
//function kCGImagePropertyExifFocalPlaneXResolution: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFocalPlaneXResolution');
//end;
//
//function kCGImagePropertyExifFocalPlaneYResolution: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFocalPlaneYResolution');
//end;
//
//function kCGImagePropertyExifFocalPlaneResolutionUnit: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFocalPlaneResolutionUnit');
//end;
//
//function kCGImagePropertyExifSubjectLocation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubjectLocation');
//end;
//
//function kCGImagePropertyExifExposureIndex: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifExposureIndex');
//end;
//
//function kCGImagePropertyExifSensingMethod: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSensingMethod');
//end;
//
//function kCGImagePropertyExifFileSource: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFileSource');
//end;
//
//function kCGImagePropertyExifSceneType: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSceneType');
//end;
//
//function kCGImagePropertyExifCFAPattern: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifCFAPattern');
//end;
//
//function kCGImagePropertyExifCustomRendered: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifCustomRendered');
//end;
//
//function kCGImagePropertyExifExposureMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifExposureMode');
//end;
//
//function kCGImagePropertyExifWhiteBalance: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifWhiteBalance');
//end;
//
//function kCGImagePropertyExifDigitalZoomRatio: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifDigitalZoomRatio');
//end;
//
//function kCGImagePropertyExifFocalLenIn35mmFilm: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifFocalLenIn35mmFilm');
//end;
//
//function kCGImagePropertyExifSceneCaptureType: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSceneCaptureType');
//end;
//
//function kCGImagePropertyExifGainControl: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifGainControl');
//end;
//
//function kCGImagePropertyExifContrast: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifContrast');
//end;
//
//function kCGImagePropertyExifSaturation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSaturation');
//end;
//
//function kCGImagePropertyExifSharpness: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSharpness');
//end;
//
//function kCGImagePropertyExifDeviceSettingDescription: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifDeviceSettingDescription');
//end;
//
//function kCGImagePropertyExifSubjectDistRange: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifSubjectDistRange');
//end;
//
//function kCGImagePropertyExifImageUniqueID: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifImageUniqueID');
//end;
//
//function kCGImagePropertyExifCameraOwnerName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifCameraOwnerName');
//end;
//
//function kCGImagePropertyExifBodySerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifBodySerialNumber');
//end;
//
//function kCGImagePropertyExifLensSpecification: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifLensSpecification');
//end;
//
//function kCGImagePropertyExifLensMake: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifLensMake');
//end;
//
//function kCGImagePropertyExifLensModel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifLensModel');
//end;
//
//function kCGImagePropertyExifLensSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifLensSerialNumber');
//end;
//
//function kCGImagePropertyExifGamma: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifGamma');
//end;
//
//function kCGImagePropertyExifAuxLensInfo: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxLensInfo');
//end;
//
//function kCGImagePropertyExifAuxLensModel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxLensModel');
//end;
//
//function kCGImagePropertyExifAuxSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxSerialNumber');
//end;
//
//function kCGImagePropertyExifAuxLensID: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxLensID');
//end;
//
//function kCGImagePropertyExifAuxLensSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxLensSerialNumber');
//end;
//
//function kCGImagePropertyExifAuxImageNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxImageNumber');
//end;
//
//function kCGImagePropertyExifAuxFlashCompensation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxFlashCompensation');
//end;
//
//function kCGImagePropertyExifAuxOwnerName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxOwnerName');
//end;
//
//function kCGImagePropertyExifAuxFirmware: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyExifAuxFirmware');
//end;
//
//function kCGImagePropertyGIFLoopCount: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFLoopCount');
//end;
//
//function kCGImagePropertyGIFDelayTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFDelayTime');
//end;
//
//function kCGImagePropertyGIFImageColorMap: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFImageColorMap');
//end;
//
//function kCGImagePropertyGIFHasGlobalColorMap: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFHasGlobalColorMap');
//end;
//
//function kCGImagePropertyGIFUnclampedDelayTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGIFUnclampedDelayTime');
//end;
//
//function kCGImagePropertyPNGGamma: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGGamma');
//end;
//
//function kCGImagePropertyPNGInterlaceType: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGInterlaceType');
//end;
//
//function kCGImagePropertyPNGXPixelsPerMeter: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGXPixelsPerMeter');
//end;
//
//function kCGImagePropertyPNGYPixelsPerMeter: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGYPixelsPerMeter');
//end;
//
//function kCGImagePropertyPNGsRGBIntent: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGsRGBIntent');
//end;
//
//function kCGImagePropertyPNGChromaticities: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGChromaticities');
//end;
//
//function kCGImagePropertyPNGAuthor: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGAuthor');
//end;
//
//function kCGImagePropertyPNGCopyright: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGCopyright');
//end;
//
//function kCGImagePropertyPNGCreationTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGCreationTime');
//end;
//
//function kCGImagePropertyPNGDescription: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGDescription');
//end;
//
//function kCGImagePropertyPNGModificationTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGModificationTime');
//end;
//
//function kCGImagePropertyPNGSoftware: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGSoftware');
//end;
//
//function kCGImagePropertyPNGTitle: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyPNGTitle');
//end;
//
//function kCGImagePropertyGPSVersion: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSVersion');
//end;
//
//function kCGImagePropertyGPSLatitudeRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSLatitudeRef');
//end;
//
//function kCGImagePropertyGPSLatitude: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSLatitude');
//end;
//
//function kCGImagePropertyGPSLongitudeRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSLongitudeRef');
//end;
//
//function kCGImagePropertyGPSLongitude: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSLongitude');
//end;
//
//function kCGImagePropertyGPSAltitudeRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSAltitudeRef');
//end;
//
//function kCGImagePropertyGPSAltitude: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSAltitude');
//end;
//
//function kCGImagePropertyGPSTimeStamp: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSTimeStamp');
//end;
//
//function kCGImagePropertyGPSSatellites: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSSatellites');
//end;
//
//function kCGImagePropertyGPSStatus: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSStatus');
//end;
//
//function kCGImagePropertyGPSMeasureMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSMeasureMode');
//end;
//
//function kCGImagePropertyGPSDOP: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDOP');
//end;
//
//function kCGImagePropertyGPSSpeedRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSSpeedRef');
//end;
//
//function kCGImagePropertyGPSSpeed: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSSpeed');
//end;
//
//function kCGImagePropertyGPSTrackRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSTrackRef');
//end;
//
//function kCGImagePropertyGPSTrack: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSTrack');
//end;
//
//function kCGImagePropertyGPSImgDirectionRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSImgDirectionRef');
//end;
//
//function kCGImagePropertyGPSImgDirection: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSImgDirection');
//end;
//
//function kCGImagePropertyGPSMapDatum: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSMapDatum');
//end;
//
//function kCGImagePropertyGPSDestLatitudeRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestLatitudeRef');
//end;
//
//function kCGImagePropertyGPSDestLatitude: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestLatitude');
//end;
//
//function kCGImagePropertyGPSDestLongitudeRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestLongitudeRef');
//end;
//
//function kCGImagePropertyGPSDestLongitude: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestLongitude');
//end;
//
//function kCGImagePropertyGPSDestBearingRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestBearingRef');
//end;
//
//function kCGImagePropertyGPSDestBearing: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestBearing');
//end;
//
//function kCGImagePropertyGPSDestDistanceRef: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestDistanceRef');
//end;
//
//function kCGImagePropertyGPSDestDistance: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDestDistance');
//end;
//
//function kCGImagePropertyGPSProcessingMethod: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSProcessingMethod');
//end;
//
//function kCGImagePropertyGPSAreaInformation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSAreaInformation');
//end;
//
//function kCGImagePropertyGPSDateStamp: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDateStamp');
//end;
//
//function kCGImagePropertyGPSDifferental: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyGPSDifferental');
//end;
//
//function kCGImagePropertyIPTCObjectTypeReference: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCObjectTypeReference');
//end;
//
//function kCGImagePropertyIPTCObjectAttributeReference: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCObjectAttributeReference');
//end;
//
//function kCGImagePropertyIPTCObjectName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCObjectName');
//end;
//
//function kCGImagePropertyIPTCEditStatus: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCEditStatus');
//end;
//
//function kCGImagePropertyIPTCEditorialUpdate: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCEditorialUpdate');
//end;
//
//function kCGImagePropertyIPTCUrgency: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCUrgency');
//end;
//
//function kCGImagePropertyIPTCSubjectReference: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCSubjectReference');
//end;
//
//function kCGImagePropertyIPTCCategory: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCategory');
//end;
//
//function kCGImagePropertyIPTCSupplementalCategory: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCSupplementalCategory');
//end;
//
//function kCGImagePropertyIPTCFixtureIdentifier: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCFixtureIdentifier');
//end;
//
//function kCGImagePropertyIPTCKeywords: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCKeywords');
//end;
//
//function kCGImagePropertyIPTCContentLocationCode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContentLocationCode');
//end;
//
//function kCGImagePropertyIPTCContentLocationName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContentLocationName');
//end;
//
//function kCGImagePropertyIPTCReleaseDate: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCReleaseDate');
//end;
//
//function kCGImagePropertyIPTCReleaseTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCReleaseTime');
//end;
//
//function kCGImagePropertyIPTCExpirationDate: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExpirationDate');
//end;
//
//function kCGImagePropertyIPTCExpirationTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCExpirationTime');
//end;
//
//function kCGImagePropertyIPTCSpecialInstructions: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCSpecialInstructions');
//end;
//
//function kCGImagePropertyIPTCActionAdvised: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCActionAdvised');
//end;
//
//function kCGImagePropertyIPTCReferenceService: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCReferenceService');
//end;
//
//function kCGImagePropertyIPTCReferenceDate: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCReferenceDate');
//end;
//
//function kCGImagePropertyIPTCReferenceNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCReferenceNumber');
//end;
//
//function kCGImagePropertyIPTCDateCreated: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCDateCreated');
//end;
//
//function kCGImagePropertyIPTCTimeCreated: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCTimeCreated');
//end;
//
//function kCGImagePropertyIPTCDigitalCreationDate: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCDigitalCreationDate');
//end;
//
//function kCGImagePropertyIPTCDigitalCreationTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCDigitalCreationTime');
//end;
//
//function kCGImagePropertyIPTCOriginatingProgram: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCOriginatingProgram');
//end;
//
//function kCGImagePropertyIPTCProgramVersion: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCProgramVersion');
//end;
//
//function kCGImagePropertyIPTCObjectCycle: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCObjectCycle');
//end;
//
//function kCGImagePropertyIPTCByline: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCByline');
//end;
//
//function kCGImagePropertyIPTCBylineTitle: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCBylineTitle');
//end;
//
//function kCGImagePropertyIPTCCity: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCity');
//end;
//
//function kCGImagePropertyIPTCSubLocation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCSubLocation');
//end;
//
//function kCGImagePropertyIPTCProvinceState: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCProvinceState');
//end;
//
//function kCGImagePropertyIPTCCountryPrimaryLocationCode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCountryPrimaryLocationCode');
//end;
//
//function kCGImagePropertyIPTCCountryPrimaryLocationName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCountryPrimaryLocationName');
//end;
//
//function kCGImagePropertyIPTCOriginalTransmissionReference: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCOriginalTransmissionReference');
//end;
//
//function kCGImagePropertyIPTCHeadline: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCHeadline');
//end;
//
//function kCGImagePropertyIPTCCredit: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCredit');
//end;
//
//function kCGImagePropertyIPTCSource: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCSource');
//end;
//
//function kCGImagePropertyIPTCCopyrightNotice: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCopyrightNotice');
//end;
//
//function kCGImagePropertyIPTCContact: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContact');
//end;
//
//function kCGImagePropertyIPTCCaptionAbstract: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCaptionAbstract');
//end;
//
//function kCGImagePropertyIPTCWriterEditor: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCWriterEditor');
//end;
//
//function kCGImagePropertyIPTCImageType: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCImageType');
//end;
//
//function kCGImagePropertyIPTCImageOrientation: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCImageOrientation');
//end;
//
//function kCGImagePropertyIPTCLanguageIdentifier: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCLanguageIdentifier');
//end;
//
//function kCGImagePropertyIPTCStarRating: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCStarRating');
//end;
//
//function kCGImagePropertyIPTCCreatorContactInfo: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCCreatorContactInfo');
//end;
//
//function kCGImagePropertyIPTCRightsUsageTerms: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCRightsUsageTerms');
//end;
//
//function kCGImagePropertyIPTCScene: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCScene');
//end;
//
//function kCGImagePropertyIPTCContactInfoCity: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContactInfoCity');
//end;
//
//function kCGImagePropertyIPTCContactInfoCountry: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContactInfoCountry');
//end;
//
//function kCGImagePropertyIPTCContactInfoAddress: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContactInfoAddress');
//end;
//
//function kCGImagePropertyIPTCContactInfoPostalCode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContactInfoPostalCode');
//end;
//
//function kCGImagePropertyIPTCContactInfoStateProvince: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContactInfoStateProvince');
//end;
//
//function kCGImagePropertyIPTCContactInfoEmails: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContactInfoEmails');
//end;
//
//function kCGImagePropertyIPTCContactInfoPhones: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContactInfoPhones');
//end;
//
//function kCGImagePropertyIPTCContactInfoWebURLs: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyIPTCContactInfoWebURLs');
//end;
//
//function kCGImageProperty8BIMLayerNames: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImageProperty8BIMLayerNames');
//end;
//
//function kCGImagePropertyDNGVersion: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGVersion');
//end;
//
//function kCGImagePropertyDNGBackwardVersion: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGBackwardVersion');
//end;
//
//function kCGImagePropertyDNGUniqueCameraModel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGUniqueCameraModel');
//end;
//
//function kCGImagePropertyDNGLocalizedCameraModel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGLocalizedCameraModel');
//end;
//
//function kCGImagePropertyDNGCameraSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGCameraSerialNumber');
//end;
//
//function kCGImagePropertyDNGLensInfo: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyDNGLensInfo');
//end;
//
//function kCGImagePropertyCIFFDescription: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFDescription');
//end;
//
//function kCGImagePropertyCIFFFirmware: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFFirmware');
//end;
//
//function kCGImagePropertyCIFFOwnerName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFOwnerName');
//end;
//
//function kCGImagePropertyCIFFImageName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFImageName');
//end;
//
//function kCGImagePropertyCIFFImageFileName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFImageFileName');
//end;
//
//function kCGImagePropertyCIFFReleaseMethod: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFReleaseMethod');
//end;
//
//function kCGImagePropertyCIFFReleaseTiming: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFReleaseTiming');
//end;
//
//function kCGImagePropertyCIFFRecordID: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFRecordID');
//end;
//
//function kCGImagePropertyCIFFSelfTimingTime: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFSelfTimingTime');
//end;
//
//function kCGImagePropertyCIFFCameraSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFCameraSerialNumber');
//end;
//
//function kCGImagePropertyCIFFImageSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFImageSerialNumber');
//end;
//
//function kCGImagePropertyCIFFContinuousDrive: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFContinuousDrive');
//end;
//
//function kCGImagePropertyCIFFFocusMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFFocusMode');
//end;
//
//function kCGImagePropertyCIFFMeteringMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFMeteringMode');
//end;
//
//function kCGImagePropertyCIFFShootingMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFShootingMode');
//end;
//
//function kCGImagePropertyCIFFLensModel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFLensModel');
//end;
//
//function kCGImagePropertyCIFFLensMaxMM: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFLensMaxMM');
//end;
//
//function kCGImagePropertyCIFFLensMinMM: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFLensMinMM');
//end;
//
//function kCGImagePropertyCIFFWhiteBalanceIndex: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFWhiteBalanceIndex');
//end;
//
//function kCGImagePropertyCIFFFlashExposureComp: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFFlashExposureComp');
//end;
//
//function kCGImagePropertyCIFFMeasuredEV: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyCIFFMeasuredEV');
//end;
//
//function kCGImagePropertyMakerNikonISOSetting: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonISOSetting');
//end;
//
//function kCGImagePropertyMakerNikonColorMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonColorMode');
//end;
//
//function kCGImagePropertyMakerNikonQuality: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonQuality');
//end;
//
//function kCGImagePropertyMakerNikonWhiteBalanceMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonWhiteBalanceMode');
//end;
//
//function kCGImagePropertyMakerNikonSharpenMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonSharpenMode');
//end;
//
//function kCGImagePropertyMakerNikonFocusMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonFocusMode');
//end;
//
//function kCGImagePropertyMakerNikonFlashSetting: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonFlashSetting');
//end;
//
//function kCGImagePropertyMakerNikonISOSelection: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonISOSelection');
//end;
//
//function kCGImagePropertyMakerNikonFlashExposureComp: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonFlashExposureComp');
//end;
//
//function kCGImagePropertyMakerNikonImageAdjustment: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonImageAdjustment');
//end;
//
//function kCGImagePropertyMakerNikonLensAdapter: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonLensAdapter');
//end;
//
//function kCGImagePropertyMakerNikonLensType: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonLensType');
//end;
//
//function kCGImagePropertyMakerNikonLensInfo: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonLensInfo');
//end;
//
//function kCGImagePropertyMakerNikonFocusDistance: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonFocusDistance');
//end;
//
//function kCGImagePropertyMakerNikonDigitalZoom: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonDigitalZoom');
//end;
//
//function kCGImagePropertyMakerNikonShootingMode: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonShootingMode');
//end;
//
//function kCGImagePropertyMakerNikonCameraSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonCameraSerialNumber');
//end;
//
//function kCGImagePropertyMakerNikonShutterCount: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerNikonShutterCount');
//end;
//
//function kCGImagePropertyMakerCanonOwnerName: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonOwnerName');
//end;
//
//function kCGImagePropertyMakerCanonCameraSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonCameraSerialNumber');
//end;
//
//function kCGImagePropertyMakerCanonImageSerialNumber: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonImageSerialNumber');
//end;
//
//function kCGImagePropertyMakerCanonFlashExposureComp: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonFlashExposureComp');
//end;
//
//function kCGImagePropertyMakerCanonContinuousDrive: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonContinuousDrive');
//end;
//
//function kCGImagePropertyMakerCanonLensModel: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonLensModel');
//end;
//
//function kCGImagePropertyMakerCanonFirmware: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonFirmware');
//end;
//
//function kCGImagePropertyMakerCanonAspectRatioInfo: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyMakerCanonAspectRatioInfo');
//end;
//
//function kCGImagePropertyOpenEXRAspectRatio: Pointer;
//begin
//  Result := CocoaPointerConst(libImageIO, 'kCGImagePropertyOpenEXRAspectRatio');
//end;


{$ENDIF}



end.
