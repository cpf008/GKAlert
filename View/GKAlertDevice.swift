//
//  GKAlertDevice.swift
//  GKAlert
//
//  Created by GKiOS on 2018/1/19.
//  Copyright © 2018年 GKiOS. All rights reserved.
//

import UIKit

class GKDeviceItem: UIView {
    
    lazy var titleLabel: UILabel = {
        let item = UILabel.init()
        item.textColor = UIColor.textLessLow
        item.font = UIFont.gk_textFont(ofSize: 14)
        return item
    }()
    
    lazy var valueLabel: UILabel = {
        let item = UILabel.init()
        item.textColor = UIColor.textLow
        item.font = UIFont.gk_textFont(ofSize: 14)
//        item.backgroundColor = .red
        return item
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        gk_AddSubViews()
        gk_CreateConstraints()
    }
    
    convenience init(_ title:String) {
        self.init(frame: .zero)
        titleLabel.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 约束 布局
    
    func gk_AddSubViews() {
        addSubview(titleLabel)
        addSubview(valueLabel)
    }
    
    func gk_CreateConstraints() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.top.bottom.equalToSuperview()
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.right).offset(8)
            make.centerY.equalToSuperview()
            make.right.equalToSuperview()
        }
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
}

class GKAlertDevice: UIView {

    private lazy var containter: UIView = {
        let item = UIView.init()
        return item
    }()
    
    lazy var deviceTypeItem: GKDeviceItem = {
        let item = GKDeviceItem.init("型号")
        return item
    }()
    
    lazy var storageItem: GKDeviceItem = {
        let item = GKDeviceItem.init("内存")
        return item
    }()
    
    lazy var versionItem: GKDeviceItem = {
        let item = GKDeviceItem.init("版本")
        return item
    }()
    
    lazy var deviceIcon: UIImageView = {
        let item = UIImageView.init()
        return item
    }()
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        gk_AddSubViews()
        gk_CreateConstraints()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 约束 布局
    
    func gk_AddSubViews() {
        addSubview(containter)
        containter.addSubview(deviceIcon)
        containter.addSubview(deviceTypeItem)
        containter.addSubview(storageItem)
        containter.addSubview(versionItem)
    }
    
    func gk_CreateConstraints() {
        containter.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }
        
        deviceIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.top.bottom.equalToSuperview()
            make.width.equalTo(64)
            make.height.equalTo(98)
        }
        
        deviceTypeItem.snp.makeConstraints { (make) in
            make.left.equalTo(deviceIcon.snp.right).offset(10)
            make.right.equalToSuperview()
            make.top.equalTo(deviceIcon)
        }
        
        
        storageItem.snp.makeConstraints { (make) in
            make.centerY.equalTo(deviceIcon)
            make.left.right.equalTo(deviceTypeItem)
        }
        
        versionItem.snp.makeConstraints { (make) in
            make.bottom.equalTo(deviceIcon.snp.bottom)
            make.left.right.equalTo(deviceTypeItem)
        }
    }

}
