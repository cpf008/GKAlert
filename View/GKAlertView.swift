//
//  GKAlertView.swift
//  aoqianProject
//
//  Created by GKiOS on 2017/11/8.
//  Copyright © 2017年 cpf. All rights reserved.
//

import UIKit
import SnapKit

fileprivate let kAlertTitleFontSize:CGFloat = 16.0
fileprivate let kAlertContentFontSize:CGFloat = 14.0
fileprivate let kAlertButtonFontSize:CGFloat = 14.0
fileprivate let kAlertContentContainerMarginTop = 24.0
fileprivate let kAlertContentContainerMarginLeft = 24.0
fileprivate let KAlertContentContainerMarginRight = 24.0
fileprivate let kAlertContentContainerMarginBottom = 24.0
fileprivate let kAlertVerticalMargin = 24.0
fileprivate let kAlertContentViewLeftRightMargin = 32
fileprivate let kAlertContentLabelgreaterThanOrEqualTo = 20


typealias GKAlertViewCallBack = (Int, GKAlertView) ->()

enum GKAlertStyle:Int {
    case defaultStyle = 0
    case customStyle = 1
}

class GKAlertView: UIView {
    
    // MARK: - lazy
    // 弹窗的 整个弹窗中间的内容视图
    private lazy var contentView: UIView = {
        let view = UIView.init()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    // 包含 标题  按钮 和 contentLabel 或者 自定义view 的 容器
    private lazy var container: UIView = {
        let view = UIView.init()
        view.backgroundColor = .clear
        return view
    }()
    
    // 整个背景视图
    private lazy var bacgroundView: UIButton = {
        let button = UIButton.init(type: .custom)
        return button
    }()
    
    // 标题
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.textMiddle
        label.font = UIFont.gk_textFont(ofSize: kAlertTitleFontSize)
        label.textAlignment = .center
        return label
    }()
    
    // 默认样式 的 contentLabel  用于展示 提示的message 内容
    lazy var contentLabel: UILabel = {
        let label = UILabel.init()
        label.textColor = UIColor.textMiddle
        label.font = UIFont.gk_textFont(ofSize: kAlertContentFontSize)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    // 主要承接 自定义View 的容器的 一个载体 在默认样式中 contentLabel 会 指向它, 自定义样式 customContentainer 指向它
    var contentContainer:UIView?
    
    // 取消按钮 默认的样式是 含有边框的按钮 背景是白色
    lazy var cancelButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitleColor(UIColor.textMiddle, for: .normal)
        button.titleLabel?.font = UIFont.gk_textFont(ofSize: kAlertButtonFontSize)
        button.layer.borderColor = UIColor.hexColor("#FFD523").cgColor
        button.layer.borderWidth = 1
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        return button
    }()
    
    // 确认按钮  默认的样式 是 含有全被景色的 图片的 按钮
    lazy var sureButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setTitleColor(UIColor.textMiddle, for: .normal)
        button.titleLabel?.font = UIFont.gk_textFont(ofSize: kAlertButtonFontSize)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor.hexColor("#FFD523")
        button.addTarget(self, action: #selector(sureButtonAction), for: .touchUpInside)
        return button
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage.init(named: "password_off"), for: .normal)
        button.addTarget(self, action: #selector(cancelButtonAction), for: .touchUpInside)
        return button
    }()
    
    // alert 回调
    var callBack:GKAlertViewCallBack?
    
    var alertStyle: GKAlertStyle = .defaultStyle
    
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.3)
        addNotification()
    }
    
    
    /// 便利构造方法
    /// 默认样式 是  标题  内容 按钮 样式
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 消息体
    ///   - cancelTitle: 取消按钮 不需要为空
    ///   - sureTitle: 确定按钮 不需要为空
    convenience init(title: String?,
                     message: String?,
                     cancelTitle: String?,
                     sureTitle: String?,
                     hidenCloseButton:Bool = true) {
        
        self.init(frame: UIScreen.main.bounds)
        contentLabel.text = message
//        contentLabel.setLineSpace(4)
        self.contentContainer = contentLabel
        alert_add(title:title, cancelTitle: cancelTitle, sureTitle: sureTitle)
        createConstraints()
        closeButton.isHidden = hidenCloseButton
    }
    
    
    /// 便利构造初始化方法
    /// 样式 是标题 自定义content  按钮
    /// - Parameters:
    ///   - title: 标题
    ///   - contentContainer: 自定义 View
    ///   - cancelTitle: 取消按钮 不需要为空
    ///   - sureTitle: 确认按钮 不需要 为空
    convenience init(title: String?,
                     contentContainer:UIView,
                     cancelTitle: String?,
                     sureTitle: String?,
                     hidenCloseButton:Bool = true) {
        
        self.init(frame: UIScreen.main.bounds)
        self.alertStyle = .customStyle
        self.contentContainer = contentContainer
        alert_add(title: title, cancelTitle: cancelTitle, sureTitle: sureTitle)
        createConstraints()
        closeButton.isHidden = hidenCloseButton
    }
    
    
    // MARK: - 展示show方法
    func show() {
        
        let window = UIApplication.shared.keyWindow
        contentView.beginAnimationWithBegainScale(begainScale: 1.2, middleScale: 1.0, duration: 0.2)
        window?.addSubview(self)
        layoutIfNeeded()
    }
    
    func dismiss() {
        self.removeFromSuperview()
    }
    
    
    // MARK: - action
    @objc func cancelButtonAction() {
        guard let _ = callBack else {
            print("GKAlertView callback is none completion")
            dismiss()
            return
        }
        callBack!(0, self)
        dismiss()
    }
    
    @objc func sureButtonAction() {
        guard let _ = callBack else {
            print("GKAlertView callback is none completion")
            dismiss()
            return
        }
        callBack!(1, self)
        dismiss()
    }
    
    
    // MARK: - 约束
    
    func alert_add(title:String?,
                   cancelTitle: String?,
                   sureTitle: String?) {
        
        addSubview(bacgroundView)
        bacgroundView.addSubview(contentView)
        contentView.addSubview(container)
        titleLabel.text = title
        if title != nil {
            container.addSubview(titleLabel)
        }
        
        if cancelTitle != nil {
            if (cancelTitle?.isEmpty)! == false {
                container.addSubview(cancelButton)
                cancelButton.setTitle(cancelTitle, for: .normal)
            }
        }
        if sureTitle != nil {
            if sureTitle?.isEmpty == false {
                container.addSubview(sureButton)
                sureButton.setTitle(sureTitle, for: .normal)
            }
        }
        container.addSubview(closeButton)
        container.addSubview(self.contentContainer!)
    }
    
    
    func createConstraints() {
        
        bacgroundView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(kAlertContentViewLeftRightMargin.scale)
            make.right.equalToSuperview().offset(-kAlertContentViewLeftRightMargin.scale)
        }
        
        container.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(kAlertContentContainerMarginLeft)
            make.right.equalToSuperview().offset(-KAlertContentContainerMarginRight)
            make.top.equalToSuperview().offset(kAlertContentContainerMarginTop)
            make.bottom.equalToSuperview().offset(-kAlertContentContainerMarginBottom)
        }
        
        var isHasTitleLabel = false
        if container.subviews.contains(titleLabel) {
            titleLabel.snp.makeConstraints { (make) in
                make.centerX.equalToSuperview()
                make.left.greaterThanOrEqualToSuperview()
                make.right.lessThanOrEqualToSuperview()
                make.top.equalToSuperview()
            }
            isHasTitleLabel = true
        }
        
       
        
        closeButton.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        contentContainer!.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            if isHasTitleLabel {
                 make.top.equalTo(titleLabel.snp.lastBaseline).offset(kAlertVerticalMargin)
            } else {
                 make.top.equalToSuperview()
            }
           
            if self.alertStyle == .defaultStyle {
                 make.height.greaterThanOrEqualTo(kAlertContentLabelgreaterThanOrEqualTo)
            }
        }
        
        if container.subviews.contains(cancelButton) && container.subviews.contains(sureButton) {
            cancelButton.snp.makeConstraints({ (make) in
                make.left.equalToSuperview()
                make.top.equalTo(self.contentContainer!.snp.bottom).offset(kAlertVerticalMargin)
                make.bottom.equalToSuperview()
                make.width.equalTo(120.scale)
                make.height.equalTo(32)
            })
            
            sureButton.snp.makeConstraints({ (make) in
                make.centerY.width.height.equalTo(cancelButton)
                make.right.equalToSuperview()
            })
        }
        
        if container.subviews.contains(cancelButton) && !container.subviews.contains(sureButton) {
            cancelButton.snp.makeConstraints({ (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(self.contentContainer!.snp.bottom).offset(kAlertVerticalMargin)
                make.bottom.equalToSuperview()
                make.width.equalTo(160.scale)
                make.height.equalTo(32)
            })
        }
        if !container.subviews.contains(cancelButton) && container.subviews.contains(sureButton) {
            sureButton.snp.makeConstraints({ (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(self.contentContainer!.snp.bottom).offset(kAlertVerticalMargin)
                make.bottom.equalToSuperview()
                make.width.equalTo(160.scale)
                make.height.equalTo(32)
            })
        }
    }
    
    // MARK: - 键盘监听
    func addNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name:NSNotification.Name.UIKeyboardDidShow , object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    @objc func keyboardWillShow(notification:NSNotification) {
        
        let keyboardFrame = notification.userInfo!["UIKeyboardFrameEndUserInfoKey"] as! CGRect
        let passwordViewFrame = contentView.frame
        let passwordViewFrameMaxY = passwordViewFrame.maxY
        let keyboardViewFrameMinY = keyboardFrame.minY
        if passwordViewFrameMaxY - keyboardViewFrameMinY > 0 {
            let offset = passwordViewFrameMaxY - keyboardViewFrameMinY
            self.frame = CGRect(x: 0, y: -offset, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }
        
    }
    
    @objc func keyboardWillHide(notification:NSNotification){
        self.frame = UIScreen.main.bounds
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
}


