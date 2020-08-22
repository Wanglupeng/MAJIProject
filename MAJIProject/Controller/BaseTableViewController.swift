//
//  BaseTableViewController.swift
//  MAJIProject
//
//  Created by Mac on 2020/8/21.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class BaseTableViewController: UIViewController {

    lazy var tableView: UITableView =  {
        let tableview = UITableView.init(frame: self.view.frame, style: .grouped)
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
}

// MARK: -Action
extension BaseTableViewController {
    @objc func rightItemClicked()  {
        let vc = HistoryViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - TableviewDeledate DataSource
extension BaseTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    @objc func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    @objc func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNonzeroMagnitude
    }
    
    @objc func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
    
    @objc func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    @objc func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    @objc func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    @objc func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @objc func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    @objc func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
// MARK: -UI
extension BaseTableViewController  {
    
    func setUI() {
        createTableView()
        registerCell()
    }
    
    func createTableView() {
        self.view.addSubview(tableView)
        tableView.frame.size.height = self.view.frame.height - NAV_Height
    }
    
    func createRightItem(title: String)  {
        let item = UIBarButtonItem.init(title: title, style: UIBarButtonItem.Style.done, target: self, action: #selector(rightItemClicked))
        self.navigationItem.rightBarButtonItem = item
    }
    
    func registerCell()  {
        tableView.register(UINib.init(nibName: "ShowUrlTableViewCell", bundle: nil), forCellReuseIdentifier: "ShowUrlTableViewCell")
    }
    
}
