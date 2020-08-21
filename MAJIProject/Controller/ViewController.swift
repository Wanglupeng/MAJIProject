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
    override func viewDidLoad() {
        super.viewDidLoad()
//        initTimer()
        readSqlData()
        requestData()
        createRightItem(title: "History")
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
    }
    
    func requestHomeDataResponse(isSuc: Bool, message: String, successData: [HomeModel]?) {
        if isSuc {
            dataArray = successData!
            self.tableView.reloadData()
            postNoti()
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

