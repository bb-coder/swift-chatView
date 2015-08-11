//
//  ViewController.swift
//  基于self_Sizing_Cells的聊天页面
//
//  Created by 毕洪博 on 15-2-8.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var messages:[BHBMessage] = []
    
    func loadData(){
        self.title = "小璐"
        messages.append(BHBMessage(content: "你好在吗？", role: Role.Sender))
        messages.append(BHBMessage(content: "在，怎么了？", role: Role.Receive))
        messages.append(BHBMessage(content: "没事，看你在不在.", role: Role.Sender))
        messages.append(BHBMessage(content: "你好无聊啊...", role: Role.Receive))
        messages.append(BHBMessage(content: "是吗？那我给你讲个笑话吧！", role: Role.Sender))
        messages.append(BHBMessage(content: "好啊", role: Role.Receive))
        messages.append(BHBMessage(content: "我们的作业多，多到什么程度呢?\n“呜呜呜我的诺基亚碎了!”\n“别逗了，怎么可能?”\n“我不小心把他放在寒假作业下面了!”", role: Role.Sender))
        messages.append(BHBMessage(content: "...哈哈", role: Role.Receive))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //加载数据
        self.loadData()
        
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    /*
    tableview delegate and dataSource
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView .dequeueReusableCellWithIdentifier("cell") as! BHBMessageCell
        cell.message = self.messages[indexPath.row]
        return cell
    }
    
    
    
}

