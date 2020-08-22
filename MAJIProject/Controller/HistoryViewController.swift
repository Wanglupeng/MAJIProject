//
//  HistoryViewController.swift
//  MAJIProject
//
//  Created by Mac on 2020/8/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class HistoryViewController: BaseTableViewController {
    
    lazy var dataArray: [GroupModel] = {
        return [GroupModel]()
    }()
    
    //show receiveData Count
    lazy var receiveDataLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.frame = CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 30)
        label.backgroundColor = UIColor.red.withAlphaComponent(0.1)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.text = "you have receive 0"
        return label
    }()
    var receiveDataCount = 0
    
    override func viewDidLoad() {
        self.title = "History ViewController"
        super.viewDidLoad()
        loadHistoryData()
        addObverve()
        addHeadRefresh()
        createReceiveDataLabel()
    }
}

// MARK: -Action
extension HistoryViewController {
    
    func addObverve()  {
        NotificationCenter.default.addObserver(self, selector: #selector(receiveData), name: NSNotification.Name(rawValue: ReceiveRefreshData), object: nil)
    }
    
    @objc func receiveData()  {
        receiveDataCount += 1
        receiveDataLabel.text = "you have receive \(receiveDataCount)"
    }
    
    // pull to refresh
    func refreshData()  {
        receiveDataCount = 0
        receiveDataLabel.text = "you have receive 0"
        loadHistoryData()
    }
}

// MARK: -HTTP and DB datas
extension HistoryViewController {
    
    func loadHistoryData()  {
        FMDBManager.manager.readAllData { (readDatas) in
            self.resoveSqlData(datas: readDatas)
        }
    }
    
    func resoveSqlData(datas: [HomeModel])  {
        tableView.mj_header?.endRefreshing()
        if datas.count == 0 {return}
        // 以分组的形式存放 每个组内数据是每次HTTP 获取的数据
        // 用时间戳区分，每个相同的时间戳 就是同一次请求
        var resultArray = [GroupModel]()
        var sectionModel:GroupModel?
        for item in datas {
            let time = item.currentTime
            if sectionModel?.time == time {
                sectionModel?.datas.append(item)
            }else {
                sectionModel = GroupModel()
                sectionModel?.time = time ?? ""
                sectionModel?.datas.append(item)
                resultArray.append(sectionModel!)
            }
        }
        self.dataArray = resultArray
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: -TableViewDelegate and dataSource
extension HistoryViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].datas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowUrlTableViewCell", for: indexPath) as! ShowUrlTableViewCell
        cell.configData(model: dataArray[indexPath.section].datas[indexPath.row], indexpathSection: indexPath.section)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = TableViewSectionView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: 40))
        if let time = dataArray.first?.datas.first?.currentTime {
            var timeStr = timeStampToString(timeStamp: time, dataFormat: "yyyy/MM/dd HH:mm:ss")
            if section == 0 {
                timeStr = "\(timeStr) thease are leasted data"
            }
            view.timeLabel.text = timeStr
        }
        return view
    }
 
}

// MARK: -UI
extension HistoryViewController {
    
    func addHeadRefresh()  {
        tableView.mj_header = RefreshHeader.init(refreshingBlock: { [weak self] in
            self?.refreshData()
        })
    }
    
    func createReceiveDataLabel()  {
        self.tableView.tableHeaderView = receiveDataLabel
    }
   
}
