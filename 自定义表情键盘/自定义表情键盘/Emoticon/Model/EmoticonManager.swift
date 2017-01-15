//
//  EmoticonManager.swift
//  自定义表情键盘
//
//  Created by 冯垚杰 on 2017/1/8.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

class EmoticonManager: NSObject {

    var packages : [EmoticonPackage] = [EmoticonPackage]()
    
      override init() {
       super.init()
        
        
        guard let path = Bundle.main.path(forResource: "emoticons.plist", ofType: nil, inDirectory: "Emoticons.bundle") else {
            return
        }
        
        guard let dict = NSDictionary(contentsOfFile: path) else {
            return
        }
        
        guard let pac = dict["packages"] as? [[String : AnyObject]] else {
            return
        }
        
//        packages.append(EmoticonPackage())
        
        for d in pac {
            
            guard let id = d["id"] as? String else {
                continue
            }
            
            packages.append(EmoticonPackage(fileName: id))
        }
    }
    
}
