//
//  PDPhotoListCell.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/11.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit

class PDPhotoListCell: PDBaseTableViewCell {

    lazy var iconView: UIImageView = {
        let iw = UIImageView()
        iw.contentMode = .scaleAspectFill
        return iw
    }()
    
    lazy var photoNameLabel: UILabel = {
        let tl = UILabel()
        tl.textColor = UIColor.black
        tl.font = UIFont.systemFont(ofSize: 18)
        return tl
    }()
    
    lazy var photoCountLabel: UILabel = {
        let dl = UILabel()
        dl.textColor = UIColor.gray
        dl.font = UIFont.systemFont(ofSize: 14)
        return dl
    }()

    override func configUI() {
        
        let line = UIView().then{
            $0.backgroundColor = UIColor.darkDividing
        }
        contentView.addSubview(line)
        line.snp.makeConstraints{
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-1)
            $0.height.equalTo(1)
        }
        
        contentView.addSubview(iconView)
        iconView.snp.makeConstraints {
            $0.left.equalToSuperview().offset(10)
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.equalTo(60)
        }
        
        contentView.addSubview(photoNameLabel)
        photoNameLabel.snp.makeConstraints {
            $0.left.equalTo(iconView.snp.right).offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalToSuperview().offset(10)
            $0.height.equalTo(30)
            
        }
        
        contentView.addSubview(photoCountLabel)
        photoCountLabel.snp.makeConstraints {
            $0.left.equalTo(iconView.snp.right).offset(10)
            $0.right.equalToSuperview().offset(-10)
            $0.top.equalTo(photoNameLabel.snp.bottom).offset(10)
            $0.bottom.equalTo(iconView)
        }
        
    }
}
