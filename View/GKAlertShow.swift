//
//  GKAlertShow.swift
//  aoqianProject
//
//  Created by GKiOS on 2017/11/8.
//  Copyright © 2017年 cpf. All rights reserved.
//

import Foundation
import UIKit

fileprivate let kAlertDefaultCancelButtonTitle = "取消"
fileprivate let kAlertDefaultSureButtonTitle = "确认"
fileprivate let kAlertDefaultTitle = "温馨提示"

// MARK: - 扩展几个类方法
extension GKAlertView {
    // MARK: - 类方法
    
    
    /// 便利构造方法
    /// 含有 取消 和确认按钮 默认标题是 温馨提示
    /// - Parameters:
    ///   - message: 消息体
    ///   - completion: 回调
    /// - Returns: 返回一个alert对象
    @discardableResult
    static func showAlert(message: String,
                          textAlignment:NSTextAlignment = .center,
                          completion: @escaping GKAlertViewCallBack) -> GKAlertView {
        
        let alert = GKAlertView.init(title: kAlertDefaultTitle, message: message, cancelTitle: kAlertDefaultCancelButtonTitle, sureTitle: kAlertDefaultSureButtonTitle)
        alert.callBack = completion
        alert.contentLabel.textAlignment = textAlignment
        alert.show()
        return alert
    }
    
    /** 无回调*/
    @discardableResult
    static func showAlert(title:String = kAlertDefaultTitle,
                          message: String ) -> GKAlertView {
        
        let alert = GKAlertView.init(title: title, message: message, cancelTitle: kAlertDefaultCancelButtonTitle, sureTitle: kAlertDefaultSureButtonTitle)
        alert.show()
        return alert
    }
    
    
    /// 便利构造方法
    /// 含有 取消 和确认按钮 标题 和消息内容可自定义
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 消息体
    ///   - completion: 回调闭包
    /// - Returns: alert 对象
    @discardableResult
    static func showAlert(title: String?,
                          message: String?,
                          textAlignment:NSTextAlignment = .center,
                          completion: @escaping GKAlertViewCallBack) -> GKAlertView {
        
        let alert = GKAlertView.init(title: title, message: message, cancelTitle: kAlertDefaultCancelButtonTitle, sureTitle: kAlertDefaultSureButtonTitle)
        alert.callBack = completion
        alert.contentLabel.textAlignment = textAlignment
        alert.show()
        return alert
    }
    
    
    /// 普通弹框 无回调
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 消息体
    ///   - textAlignment: 显示方式，同NSTextAlignment
    /// - Returns: alert 对象
    @discardableResult
    static func showAlert(title: String?,
                          message: String?,
                          textAlignment:NSTextAlignment = .center) -> GKAlertView {
        
        let alert = GKAlertView.init(title: title, message: message, cancelTitle: kAlertDefaultCancelButtonTitle, sureTitle: kAlertDefaultSureButtonTitle)
        alert.show()
        alert.contentLabel.textAlignment = textAlignment
        return alert
    }
    
    
    /// 便利构造方法
    /// 含有 两个按钮 标题 和消息内容可自定义
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 消息内容
    ///   - cancelTitle: 取消按钮的标题
    ///   - sureTitle: 确认按钮的标题
    ///   - completion: 回调闭包
    /// - Returns: alert
    @discardableResult
    static func showAlert(title: String?,
                          message: String?,
                          button1: String?,
                          button2:String?,
                          textAlignment:NSTextAlignment = .center,
                          completion: @escaping GKAlertViewCallBack) -> GKAlertView {
        
        let alert = GKAlertView.init(title: title, message: message, cancelTitle:button1, sureTitle:button2)
        alert.callBack = completion
        alert.contentLabel.textAlignment = textAlignment
        alert.show()
        return alert
    }
    
    /// 便利构造方法
    /// 含有 两个按钮 标题 和消息内容可自定义（无回调）
    /// - Parameters:
    ///   - title: 标题
    ///   - message: 消息内容
    ///   - cancelTitle: 取消按钮的标题
    ///   - sureTitle: 确认按钮的标题
    ///   - completion: 回调闭包
    /// - Returns: alert
    @discardableResult
    static func showAlert(title: String?,
                          message: String?,
                          button1: String?,
                          button2:String?,
                          textAlignment:NSTextAlignment = .center) -> GKAlertView {
        
        let alert = GKAlertView.init(title: title, message: message, cancelTitle:button1, sureTitle:button2)
        alert.contentLabel.textAlignment = textAlignment
        alert.show()
        return alert
    }
    
//    @discardableResult
//    static func showAlertPassword(_ completionBlock: @escaping (Int, GKAlertView, String) -> () ) -> GKAlertView {
//        let customView = GKAlertPasswordView.init()
//        let alert = GKAlertView.init(title: "输入交易密码", contentContainer: customView, cancelTitle: nil, sureTitle: "确定", hidenCloseButton: false)
//        alert.callBack = { (index , alert) in
//            completionBlock(index, alert, customView.passwordContent ?? "")
//        }
//        alert.show()
//        customView.forgetClickCallBack = {
//            alert.dismiss()
//        }
//        return alert
//    }

    

    /// 自定义 alert content
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - contentContainer: 传入需要显示的自定义view
    ///   - button1: 可为nil， 为nil另一个button会居中显示
    ///   - button2: 可为nil， 为nil另一个button会居中显示
    /// - Returns: alert
    @discardableResult
    static func showCustomContainer(title: String?,
                                    contentContainer:UIView,
                                    button1: String?,
                                    button2:String?,
                                    completion: @escaping GKAlertViewCallBack) -> GKAlertView {
        
        let alert = GKAlertView.init(title: title, contentContainer: contentContainer, cancelTitle: button1, sureTitle: button2)
        alert.callBack = completion
        alert.show()
        return alert
    }
    
    /// 自定义 alert content （无回调）
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - contentContainer: 自定义 content
    ///   - button1: button
    ///   - button2: button2
    /// - Returns: alert
    @discardableResult
    static func showCustomContainer(title: String?,
                                    contentContainer:UIView,
                                    button1: String?,
                                    button2:String?) -> GKAlertView {
        
        let alert = GKAlertView.init(title: title, contentContainer: contentContainer, cancelTitle: button1, sureTitle: button2)
        alert.show()
        return alert
    }
    
}

