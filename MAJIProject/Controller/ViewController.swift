//
//  ViewController.swift
//  MAJIProject
//
//  Created by Mac on 2020/8/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit


class ViewController: BaseTableViewController {
    
    lazy var httpService: MAJIService = {
        return MAJIService.init(del: self)
    }()
    
    lazy var dataArray = {
        return [HomeModel]()
    }()

    var timer: Timer?
    //间隔时间
    var timerInterVal = 5
    
    lazy var activityview: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        view.backgroundColor = UIColor.gray
        view.style = .whiteLarge
        view.color = UIColor.white
        view.hidesWhenStopped = true
        return view
    }()
    
    override func viewDidLoad() {
        self.title = "Home ViewController"
        super.viewDidLoad()
        initTimer()
        readSqlData()
        createRightItem(title: "History")
        createActivityIndicatorView()
    }
}

// MARK: -Action
extension ViewController {
    func initTimer()  {
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(timerInterVal), repeats: true, block: { (timer) in
            self.requestData()
        })
        RunLoop.current.add(timer!, forMode: .common)
    }
    func postNoti()  {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ReceiveRefreshData), object: nil)
    }
}

// MARK: -HTTP and DB datas
extension ViewController: MAJIServiceDelegate {
    func readSqlData()  {
        FMDBManager.manager.readLeastedData { (datas) in
            self.dataArray = datas
            self.tableView.reloadData()
        }
    }
    
    func requestData()  {
        httpService.requestHomeData()
        activityview.startAnimating()
    }
    
    func requestHomeDataResponse(isSuc: Bool, message: String, successData: [HomeModel]?) {
        activityview.stopAnimating()
        if isSuc {
            dataArray = successData!
            self.tableView.reloadData()
            postNoti()
        }else {
            showErrorView()
        }
    }
}

// MARK: -tableViewDelegate and dataSource
extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowUrlTableViewCell", for: indexPath) as! ShowUrlTableViewCell
        cell.configData(model: dataArray[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TableViewSectionView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 40))
        if let time = dataArray.first?.currentTime {
            view.timeLabel.text = timeStampToString(timeStamp: time, dataFormat: "yyyy/MM/dd HH:mm:ss")
        }
        return view
    }
}

// MARK: -UI
extension ViewController {
    func createActivityIndicatorView() {
        self.view.addSubview(activityview)
        activityview.center = self.view.center
    }
  
    func showErrorView()  {
        let view = UIAlertController.init(title: "", message: "can not get api data", preferredStyle: .alert)
        view.addAction(UIAlertAction.init(title: "ok", style: UIAlertAction.Style.default, handler: { (action) in
        }))
        self.present(view, animated: true, completion: nil)
    }
}
