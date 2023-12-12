//
//  UIButton+add.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/5.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit

// MARK: 这些方法调用后要确保按钮大小不会再改变，否则位置可能不对
// note: 调整位置前，如果文字显示是截短的，调整后依然是截短的

public extension UIButton {
    // 图片文字垂直排列，并居中
    func layoutImageTitleVerticallyCenter(contentSpace space: CGFloat) -> Void {
        
        guard let imageSize = imageView?.bounds.size else { return }
        guard let titleSize = titleLabel?.bounds.size else { return }
        imageEdgeInsets = UIEdgeInsets.init(top: -(titleSize.height + space)/2, left: titleSize.width/2, bottom: (titleSize.height + space)/2, right: -(titleSize.width)/2)
        titleEdgeInsets = UIEdgeInsets.init(top: (imageSize.height + space)/2, left: -(imageSize.width)/2, bottom: -(imageSize.height + space)/2, right: imageSize.width/2)
    }
    // 图片文字水平排列，并整体居中
    func layoutImageTitleHolizontallyCenter(contentSpace space : CGFloat) -> Void {
        
        imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -space/2, bottom: 0, right: space/2)
        titleEdgeInsets = UIEdgeInsets.init(top: 0, left: space/2, bottom: 0, right: -space/2)
    }
    
    // 图片文字水平排列，并整体居中,图片在左，文字在右，与默认相反
    func layoutImageTitleHolizontallyCenterReverse(contentSpace space : CGFloat) -> Void {
        
        guard let imageSize = imageView?.bounds.size else { return }
        guard let titleSize = titleLabel?.bounds.size else { return }
        imageEdgeInsets = UIEdgeInsets.init(top: 0, left: titleSize.width + space/2, bottom: 0, right: -(titleSize.width + space/2))
        titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -(imageSize.width + space/2), bottom: 0, right: imageSize.width + space/2)
    }
    // 图片文字水平排列，并整体居左
    func layoutImageTitleHolizontallyLeft(contentSpace space : CGFloat) -> Void {
        
        guard let imageSize = imageView?.bounds.size else { return }
        guard let titleSize = titleLabel?.bounds.size else { return }
        imageEdgeInsets = UIEdgeInsets.init(top: 0, left: -(self.bounds.width - imageSize.width - titleSize.width)/2, bottom: 0, right: (self.bounds.width - imageSize.width - titleSize.width)/2)
        titleEdgeInsets = UIEdgeInsets.init(top: 0, left: -(self.bounds.width - imageSize.width - titleSize.width)/2 + space, bottom: 0, right: (self.bounds.width - imageSize.width - titleSize.width)/2 - space)
    }
}

