//
//  EmoticonCollectionViewCell.swift
//  自定义表情键盘
//
//  Created by 冯垚杰 on 2017/1/8.
//  Copyright © 2017年 冯垚杰. All rights reserved.
//

import UIKit

class EmoticonCollectionViewCell: UICollectionViewCell {
    var emoticon : Emoticon? {
        didSet {
            guard let emoticon = emoticon else {
                return
            }
            emoticonButton.setImage(UIImage(contentsOfFile: emoticon.pngPath ?? ""), for: .normal)
            emoticonButton.setTitle(emoticon.emoji, for: .normal)
            
            if emoticon.isRemove {
                
                emoticonButton.setImage(UIImage(named: "compose_emotion_delete"), for: .normal)
                return
            }
            
            if emoticon.isEmpty {
                
                emoticonButton.setImage(nil, for: .normal)
                return
            }
        }
    }
    
    fileprivate lazy var emoticonButton : UIButton = {
        
        let emoticonButton = UIButton()
        emoticonButton.isUserInteractionEnabled = false
        emoticonButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        return emoticonButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(emoticonButton)
        emoticonButton.frame = contentView.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
