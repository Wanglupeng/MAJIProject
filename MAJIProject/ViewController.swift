//
//  ViewController.swift
//  MAJIProject
//
//  Created by Mac on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    lazy var httpService: MAJIService = {
        return MAJIService.init(del: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
   
    }

    func requestData()  {
        httpService.requestHomeData()
    }
}
extension ViewController: MAJIServiceDelegate {
    func requestHomeDataResponse(isSuc: Bool, message: String, successData: [HomeModel]?) {
        if isSuc {
            
        }
    }
    
}

