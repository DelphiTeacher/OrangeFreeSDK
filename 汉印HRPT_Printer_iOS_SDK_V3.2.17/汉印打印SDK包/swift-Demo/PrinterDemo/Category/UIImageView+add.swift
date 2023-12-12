//
//  UIImageView+add.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/11.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import Foundation
import Photos

extension UIImageView {
    
    func loadImage(with asset:PHAsset) {
        self.loadImage(with: asset, targetSize: CGSize.init(width: self.bounds.width, height: self.bounds.height))
    }
    
    func loadImage(with asset:PHAsset,targetSize:CGSize) {
        let imageRequest = PHImageRequestOptions()
        imageRequest.isSynchronous = false
        imageRequest.resizeMode = .exact
        imageRequest.deliveryMode = .highQualityFormat
        PHImageManager.default().requestImage(for: asset, targetSize: CGSize.init(width: targetSize.width * kMainScreenScale, height: targetSize.height * kMainScreenScale), contentMode: .aspectFill, options: imageRequest) { (requestImage, info) in
            self.image = requestImage
        }
    }
    
}
