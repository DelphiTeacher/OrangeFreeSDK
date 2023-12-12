//
//  PDPhotoAssetCell.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/11.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit

class PDPhotoAssetCell: PDBaseCollectionViewCell {

    var representedAssetIdentifier: String!
    
    var thumbnailImage: UIImage! {
        didSet {
            iconView.image = thumbnailImage
        }
    }
    
    lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFill
        return iw
    }()
    
    override func configUI() {
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }

}
