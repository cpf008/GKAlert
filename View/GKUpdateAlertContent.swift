//
//  GKUpdateAlertContent.swift
//  GKAlert
//
//  Created by GKiOS on 2018/1/19.
//  Copyright © 2018年 GKiOS. All rights reserved.
//

import UIKit

class GKUpdateAlertContent: UIView {
    
    private lazy var titleIcon: UIImageView = {
        let img = UIImageView.init(image: UIImage.init(named: "home_update_pic"))
        return img
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel.init()
        label.text = "新版本说明："
        label.font = UIFont.gk_textFont(ofSize: 14)
        label.textColor = UIColor.textLessLow
        return label
    }()
    
    private lazy var contentLabel: UITextView = {
        let textView = UITextView.init()
        textView.textColor = UIColor.textLessLow
        textView.font = UIFont.gk_textFont(ofSize: 14)
        textView.isEditable = false
        return textView
    }()
    
    init(_ update:String?) {
        super.init(frame: .zero)
        gk_layout()
        contentLabel.text = update
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 布局
    func gk_layout() {
        gk_addSubView()
        gk_createConstrains()
    }
    
    func gk_addSubView() {
        addSubview(titleIcon)
        addSubview(subTitleLabel)
        addSubview(contentLabel)
    }
    
    func gk_createConstrains() {
        titleIcon.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(titleIcon.snp.bottom).offset(24)
        }
        
        contentLabel.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(subTitleLabel.snp.bottom)
            make.bottom.equalToSuperview()
            make.height.equalTo(123)
        }
    }
    
}
