//
//  ViewController.swift
//  自定义表情键盘
//
//  Created by 冯垚杰 on 2017/1/7.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate lazy var emoticonVC : EmoticonViewController = EmoticonViewController()
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.inputView = emoticonVC.view
        
        emoticonVC.emoticonCallBack = { [weak self] (emoticon) in
            self?.textView.insertEmoticon(emoticon)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textView.becomeFirstResponder()
    }

    @IBAction func sendBarButtonItemClick(_ sender: UIBarButtonItem) {
                print(textView.getContentString())
    }
}

