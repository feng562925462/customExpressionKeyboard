//
//  UITextView-Extension.swift
//  自定义表情键盘
//
//  Created by 冯垚杰 on 2017/1/8.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

extension UITextView {
    
    // 插入表情
    func insertEmoticon(_ emoticon : Emoticon) {
        // 点击删除按钮
        guard !emoticon.isRemove else {
            deleteBackward()
            return
        }
        // 点击emoji表情
        guard emoticon.emoji == nil else {
            replace((selectedTextRange)!, withText: emoticon.emoji!)
            return
        }
        
        // 点击普通表情
        let attachment = EmoticonAttachment()
        attachment.chs = emoticon.chs
        attachment.image = UIImage(contentsOfFile: emoticon.pngPath!)
        let font = self.font!
        // 处理图标的宽高
        attachment.bounds = CGRect(x: 0, y: -4, width: font.lineHeight, height: font.lineHeight)
        
        // 创建可变属性字符串
        let muAttStr = NSMutableAttributedString(attributedString: (attributedText)!)
        
        // 光标所在的位置
        let range = selectedRange
        muAttStr.replaceCharacters(in: range, with: NSAttributedString(attachment: attachment))
        
        attributedText = muAttStr
        
        // 字体自动改变需要重置字体
        self.font = font
        
        // 光标重置回原来的位置
        selectedRange = NSRange(location: range.location + 1, length: 0)
    }
    
    func getContentString() -> String {
        let muAttStr = NSMutableAttributedString(attributedString: attributedText)
        
        let range = NSRange(location: 0, length: muAttStr.length)
        
        muAttStr.enumerateAttributes(in: range, options: []) { (dict, range, _) in
            
            
            if let attachment = dict["NSAttachment"] as? EmoticonAttachment {
                muAttStr.replaceCharacters(in: range, with: attachment.chs!)
            }
        }
        
        return muAttStr.string
    }
}
