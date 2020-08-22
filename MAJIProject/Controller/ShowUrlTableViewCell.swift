//
//  ShowUrlTableViewCell.swift
//  MAJIProject
//
//  Created by Mac on 2020/8/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ShowUrlTableViewCell: UITableViewCell {
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        titlelabel.lineBreakMode = .byTruncatingMiddle
        valueLabel.lineBreakMode = .byTruncatingMiddle
    }
    
    func configData(model:HomeModel, indexpathSection: Int = -1)  {
        titlelabel.text = model.urlName
        valueLabel.text = model.urlStr
        if indexpathSection == 0 { //对于历史记录  最新数据 放到了最上层 所以第一组 就是最新的数据
            self.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        }else {
            self.backgroundColor = UIColor.white
        }
    }
}
