//
//  Emoticon.swift
//  自定义表情键盘
//
//  Created by 冯垚杰 on 2017/1/8.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

class Emoticon: NSObject {
    var code : String? {
        didSet {
            guard let code = code else {
                return
            }
            
            //emoji表情（★）对应的十六进制
            //从字符串中取出十六进制的数
            //创建一个扫描器, 扫描器可以从字符串中提取我们想要的数据
            let scanner = Scanner(string: code)
            //将十六进制转换为字符串
            var result:UInt32 = 0
            scanner.scanHexInt32(&result)
            //将十六进制转换为emoji字符串
            guard let scalar = UnicodeScalar(result) else {
                return
            }
            let emojiString = Character(scalar)
            // 3.显示
            emoji = String(emojiString)
        }
    }
    var png : String? {
        didSet {
            guard let png = png else {
                return
            }
            pngPath = Bundle.main.bundlePath + "/Emoticons.bundle/" + png
        }
    }
    var chs : String?
    
    var pngPath : String?
    
    var emoji : String?
    
    var isRemove : Bool = false
    
    var isEmpty : Bool = false
    
    init(dict : [String : AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    init(isRemove : Bool) {
        super.init()
        self.isRemove = isRemove
    }
    
    init(isEmpty : Bool) {
        super.init()
        self.isEmpty = isEmpty
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
    
    override var description: String {
        return dictionaryWithValues(forKeys: ["emoji","pngPath","chs"]).description
    }
}
