//
//  PDBaseTableViewCell.swift
//  PrinterDemo
//
//  Created by ios on 2019/9/6.
//  Copyright © 2019 XiamenHY. All rights reserved.
//

import UIKit
import Reusable

class PDBaseTableViewCell: UITableViewCell,Reusable {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        configUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func configUI() {}
}
