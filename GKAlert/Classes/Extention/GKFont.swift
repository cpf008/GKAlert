//
//  GKFont.swift
//  aoqianProject
//
//  Created by GKiOS on 2017/10/31.
//  Copyright © 2017年 cpf. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    enum GKDefaultFontStyle: String {
        case gkFontRegular = "PingFangSC-Regular"
        case gkFontMedium = "PingFangSC-Medium"
        case gkFontBold = "PingFangSC-Semibold"
        case gkFontLight = "PingFangSC-Light"
    }
    
    /// 常用文本字体 默认的是常规体 Regular
    ///
    /// - Parameter size: 字体大小
    /// - Returns: 字体
    static func gk_textFont(ofSize size:CGFloat) -> UIFont {
        return gk_font(ofName: GKDefaultFontStyle.gkFontRegular.rawValue, size: size) ?? UIFont.systemFont(ofSize:size)
    }
    
    ///文本粗体
    static func gk_textBoldFont(ofSize size:CGFloat) -> UIFont {
        return gk_font(ofName: GKDefaultFontStyle.gkFontBold.rawValue, size: size) ?? UIFont.boldSystemFont(ofSize:size)
    }
    
    ///文本中体
    static func gk_textMediumFont(ofSize size:CGFloat) -> UIFont {
        return gk_font(ofName: GKDefaultFontStyle.gkFontMedium.rawValue, size: size) ?? UIFont.boldSystemFont(ofSize:size)
    }
    
    ///文本细体
    static func gk_textlLightFont(ofSize size:CGFloat) -> UIFont {
        return gk_font(ofName: GKDefaultFontStyle.gkFontLight.rawValue, size: size) ?? UIFont.systemFont(ofSize:size)
    }
    
    
    /// 扩张的基类方法
    ///
    /// - Parameters:
    ///   - fontName: 字体名字+ 样式
    ///   - size: 字体大小
    /// - Returns: 字体
    static func gk_font(ofName fontName:String, size:CGFloat) -> UIFont? {
        return UIFont.init(name: fontName, size: size)
    }
}


