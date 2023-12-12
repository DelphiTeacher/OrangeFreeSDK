//
//  PDBaseCollectionReusableView.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/6.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import Reusable

class PDBaseCollectionReusableView: UICollectionReusableView, Reusable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}
