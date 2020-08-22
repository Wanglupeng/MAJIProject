//
//  TableViewSectionView.swift
//  MAJIProject
//
//  Created by Mac on 2020/8/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class TableViewSectionView: UIView {
    var timeLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        timeLabel = UILabel.init(frame: CGRect.init(x: 15, y: 0, width: frame.width - 15, height: frame.height))
        self.addSubview(timeLabel)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
}
