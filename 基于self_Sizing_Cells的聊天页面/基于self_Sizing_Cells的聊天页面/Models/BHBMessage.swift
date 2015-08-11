//
//  BHBMessage.swift
//  基于self_Sizing_Cells的聊天页面
//
//  Created by 毕洪博 on 15-2-8.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

import UIKit
/**
角色枚举
*/
enum Role{
    case Sender //发送者
    case Receive  //接收者
}


class BHBMessage: NSObject {
   
    var content:String = ""
    var role:Role = Role.Sender
    
    init(content:String,role:Role) {
        self.content = content
        self.role = role
    }
    
}
