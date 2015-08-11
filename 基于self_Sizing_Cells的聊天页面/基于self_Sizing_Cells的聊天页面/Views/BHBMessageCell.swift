//
//  BHBMessageCell.swift
//  基于self_Sizing_Cells的聊天页面
//
//  Created by 毕洪博 on 15-2-10.
//  Copyright (c) 2015年 毕洪博. All rights reserved.
//

import UIKit

class BHBMessageCell: UITableViewCell {
    //头像
    let headerImgView:UIImageView = UIImageView()
    //内容
    let contentLbl:UILabel = UILabel()
    //气泡
    let bubbleImgView:UIImageView = UIImageView()
    
    var message:BHBMessage?{//根据消息模型构建cell布局
        
        didSet{
            //当message传入时初始化视图，先移除，再添加，避免cell复用时候重复添加视图
            self.headerImgView.removeFromSuperview()
            self.contentLbl.removeFromSuperview()
            self.bubbleImgView.removeFromSuperview()
            self.contentView.addSubview(self.headerImgView)
            self.contentView.addSubview(self.bubbleImgView)
            self.bubbleImgView.addSubview(self.contentLbl)
            
            //将message模型中的数据给头像、内容、气泡视图
            self.headerImgView.image = message?.role == Role.Sender ? UIImage(named: "icon01") : UIImage(named: "icon02")
            self.bubbleImgView.image = message?.role != Role.Sender ? UIImage(named: "chatto_bg_normal") : UIImage(named: "chatfrom_bg_normal")
            self.contentLbl.text = message?.content
            
            //布局位置
            //1.去掉系统添加默认的autolayout，防止冲突,并设置label的对齐
            self.headerImgView.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.contentLbl.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.bubbleImgView.setTranslatesAutoresizingMaskIntoConstraints(false)
            self.contentLbl.textAlignment = message?.role != Role.Sender ? NSTextAlignment.Right : NSTextAlignment.Left
            self.contentLbl.numberOfLines = 0
            
            
            //2.设置约束
            let viewsDictionary = ["header": self.headerImgView, "content": self.contentLbl, "bubble": self.bubbleImgView]
            var header_constraint_H_Format = ""
            var header_constraint_V_Format = ""
            var bubble_constraint_H_Format = ""
            var bubble_constraint_V_Format = ""
            var content_constraint_H_Format = ""
            var content_constraint_V_Format = ""
            
            
            if message?.role == Role.Receive {
                header_constraint_H_Format =  "[header(50)]-5-|"
                header_constraint_V_Format =  "V:|-5-[header(50)]"
                bubble_constraint_H_Format  =  "|-(>=5)-[bubble]-10-[header]"
                bubble_constraint_V_Format  =  "V:|-5-[bubble(>=50)]-5-|"
                content_constraint_H_Format  =  "|-(>=5)-[content]-25-|"
                content_constraint_V_Format  =  "V:|[content]-5-|"
            } else {
                header_constraint_H_Format =  "|-5-[header(50)]"
                header_constraint_V_Format =  "V:|-5-[header(50)]"
                bubble_constraint_H_Format  =  "[header]-10-[bubble]-(>=5)-|"
                bubble_constraint_V_Format  =  "V:|-5-[bubble(>=50)]-5-|"
                content_constraint_H_Format  =  "|-25-[content]-(>=5)-|"
                content_constraint_V_Format  =  "V:|[content]-5-|"
            }
            
            
            let header_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(header_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            let header_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(header_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            
            let bubble_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(bubble_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            let bubble_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(bubble_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            
            let content_constraint_H:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(content_constraint_H_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            let content_constraint_V:NSArray = NSLayoutConstraint.constraintsWithVisualFormat(content_constraint_V_Format, options: NSLayoutFormatOptions(0), metrics: nil, views: viewsDictionary)
            
            self.contentView.addConstraints(header_constraint_H as [AnyObject])
            self.contentView.addConstraints(header_constraint_V as [AnyObject])
            self.contentView.addConstraints(bubble_constraint_H as [AnyObject])
            self.contentView.addConstraints(bubble_constraint_V as [AnyObject])
            self.bubbleImgView.addConstraints(content_constraint_H as [AnyObject])
            self.bubbleImgView.addConstraints(content_constraint_V as [AnyObject])
        }
    }

}
