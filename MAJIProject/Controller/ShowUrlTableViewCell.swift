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
    
    func configData(model:HomeModel)  {
        titlelabel.text = model.urlName
        valueLabel.text = model.urlStr
    }
}
