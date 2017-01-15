//
//  EmoticonPackage.swift
//  自定义表情键盘
//
//  Created by 冯垚杰 on 2017/1/8.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

class EmoticonPackage: NSObject {

    var emoticons : [Emoticon] = [Emoticon]()
    
    override init() {
       super.init()
    }
    
     init(fileName : String) {
        super.init()
        
        if fileName == "" {
            addEmptyEmoticon(isLately: true)
            return
        }
        
        guard let filePath = Bundle.main.path(forResource: "\(fileName)/info.plist", ofType: nil, inDirectory: "Emoticons.bundle") else {
            return
        }
        guard let dict = NSDictionary(contentsOfFile: filePath) else {
            return
        }
        guard let emoticonArray = dict["emoticons"] as? [[String : AnyObject]] else {
            return
        }
    
        var index = 0
        
        for var  d in emoticonArray {
            
            if let png = d["png"] as? String  {
                d["png"] = (fileName + "/" + png) as AnyObject?
            }
            
            emoticons.append(Emoticon(dict: d))
            index += 1
            
            if index == 23 {
                index = 0
                emoticons.append(Emoticon(isRemove : true))
            }
        }
        
        addEmptyEmoticon(isLately: false)
    }
    
    // 添加空白表情
    func addEmptyEmoticon(isLately : Bool) {
        let count = emoticons.count % 24
        if !isLately , count == 0 {
            return
        }
        for _ in count..<23 {
            emoticons.append(Emoticon(isEmpty: true))
        }
        emoticons.append(Emoticon(isRemove: true))
    }
}
