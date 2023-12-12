//
//  PDAssetManager.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/11.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import Photos

class PDAssetManager: NSObject {

    static func loadImage(with asset:PHAsset, closure:@escaping ((UIImage?)->(Void))) {
        let imageRequest = PHImageRequestOptions()
        imageRequest.resizeMode = .exact
        imageRequest.deliveryMode = .opportunistic
        PHImageManager.default().requestImageData(for: asset, options: imageRequest) { (data, uti, orientation, info) in
            
            guard let tempInfo = info else { return }
            if let isCloud = tempInfo[PHImageResultIsInCloudKey] as? Bool,isCloud {
                let initialRequestOption = PHImageRequestOptions()
                initialRequestOption.resizeMode = .exact
                initialRequestOption.deliveryMode = .opportunistic
                initialRequestOption.isNetworkAccessAllowed = true
                initialRequestOption.progressHandler = { (progress, error, stop, info) in
                    DispatchQueue.main.async {
                        if error == nil {
                            SVProgressHUD.showProgress(Float.init(progress), status: "Loading".localized)
                            if progress == 1 {
                                SVProgressHUD.dismiss()
                            }
                        }else {
                            SVProgressHUD.showError(withStatus: "Loading failed, please check the network".localized)
                        }
                    }
                }
                PHImageManager.default().requestImageData(for: asset, options: initialRequestOption, resultHandler: { (data, uti, orientation, info) in
                    guard let tempData = data else { return }
                    guard let image = UIImage.init(data: tempData) else { return }
                    closure(image)
                })
            }else {
                guard let temp = data else {
                    SVProgressHUD.showError(withStatus: "Get image failed".localized)
                    return
                }
                guard let image = UIImage.init(data: temp) else {
                    SVProgressHUD.showError(withStatus: "Get image failed".localized)
                    return
                }
                closure(image)
            }
        }
    }
}

extension PHImageManager {
    
    func loadIconImage(for asset:PHAsset, targetSize:CGSize, contentMode:PHImageContentMode, handler:((UIImage?)->Void)?) -> Void {
        
        let imageRequestOption = PHImageRequestOptions()
        imageRequestOption.resizeMode = .exact
        imageRequestOption.deliveryMode = .opportunistic
        imageRequestOption.isNetworkAccessAllowed = true
        requestImage(for: asset, targetSize: targetSize, contentMode: contentMode, options: imageRequestOption) { (image, _) in
            handler?(image)
        }
    }
}
