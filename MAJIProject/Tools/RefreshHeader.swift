//
//  RefreshHeader.swift
//  MAJIProject
//
//  Created by Mac on 2020/8/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit


class RefreshHeader: MJRefreshNormalHeader {
    override func prepare() {
        super.prepare()
        self.setTitle("下拉刷新", for: .idle)
        self.setTitle("释放刷新", for: .pulling)
        self.setTitle("正在刷新", for: .refreshing)
        self.arrowView?.image = UIImage()
        self.lastUpdatedTimeLabel?.isHidden = true
        self.stateLabel?.font = UIFont.systemFont(ofSize: 14)
        self.stateLabel?.textColor = UIColor.gray
        self.loadingView?.style = .gray
    }
}
