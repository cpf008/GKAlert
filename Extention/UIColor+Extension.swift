//
//  UIColor+Extension.swift
//  BestProject
//
//  Created by mbApple on 2017/12/4.
//  Copyright © 2017年 mbApple. All rights reserved.
//

import UIKit

struct GKColorHexString {
    /// 分割线的颜色
    static let colorLine = "ededed"
    /// 背景色
    static let colorBackground = "ffffff"
    /// 部分背景色
    static let colorBackgroundLess = "f7f7f7"
    /// 主题色
    static let colorTheme = "FFD323"
    /// button不可点击色
    static let unableColor = "FFE9A2"
    /// 警告色
    static let warnColor = "E23232"
    /// 客服
    static let serviceColor = "4A90E2"
    /// 大标题色
    static let colorTextHigh = "111111"
    /// 文本普通级别信息 正文
    static let colorTextMiddle = "333333"
    /// 文本辅助级别次要信息
    static let colorTextLow = "666666"
    /// 用于 和未输入状态
    static let colorTextLessLow = "999999"
    /// 少数提示
    static let colorStatus1 = "bbbbbb"
    /** 阴影色 */
    static let colorShadow = "000000"
}

extension UIColor {
    
    /// 分割线的颜色
    static var line:UIColor {
        return  UIColor.hexColor(GKColorHexString.colorLine)
    }
    /// 背景色
    static var background :UIColor  {
        return  UIColor.hexColor(GKColorHexString.colorBackground)
    }
    /// 部分背景色
    static var backgroundLess :UIColor  {
        return  UIColor.hexColor(GKColorHexString.colorBackgroundLess)
    }
    /// 主题相近色
    static var theme:UIColor {
        return  UIColor.hexColor(GKColorHexString.colorTheme)
    }
    
    /// 警告色
    static var status1:UIColor {
        return  UIColor.hexColor(GKColorHexString.colorStatus1)
    }
    /// 少数装态提示1
    static var warn:UIColor {
        return  UIColor.hexColor(GKColorHexString.warnColor)
    }

    /// 文本色 重要文字 正文 输入状态
    static var textHigh:UIColor {
        return  UIColor.hexColor(GKColorHexString.colorTextHigh)
    }
    /// 文本普通级别信息 正文
    static var textMiddle :UIColor {
        return  UIColor.hexColor(GKColorHexString.colorTextMiddle)
    }
    /// 文本辅助级别次要信息
    static var textLow :UIColor {
        return  UIColor.hexColor(GKColorHexString.colorTextLow)
    }
    /// 用于提示语 和未输入状态
    static var textLessLow :UIColor {
        return  UIColor.hexColor(GKColorHexString.colorTextLessLow)
    }
    
    /// 阴影
    static var shadow:UIColor {
        return UIColor.hexColor(GKColorHexString.colorShadow)
    }
    
    // MARK: - RGB
    class func rgb_Color(red: CGFloat,
                         green: CGFloat,
                         blue: CGFloat,
                         alpha: CGFloat) -> UIColor {
        return UIColor(red:red / 255.0, green:green / 255.0, blue:blue / 255.0, alpha: alpha)
    }
    
    /// 用十六进制颜色创建UIColor
    ///
    /// - Parameter hexColor: 十六进制颜色 (0F0F0F)
    convenience init(hexString: String) {
        var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        let length = (cString as NSString).length
        //错误处理
        if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
            //返回whiteColor
            self.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
            return
        }
        
        if cString.hasPrefix("#"){
            cString = (cString as NSString).substring(from: 1)
        }
        
        //字符chuan截取
        var range = NSRange(location: 0, length: 2)
        
        let rString = (cString as NSString).substring(with: range)
        
        range.location = 2
        let gString = (cString as NSString).substring(with: range)
        
        range.location = 4
        let bString = (cString as NSString).substring(with: range)
        
        //存储转换后的数值
        var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
        //进行转换
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        //根据颜色值创建UIColor
        self.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    static func hexColor(_ hexString:String) -> UIColor {
        return UIColor.init(hexString: hexString)
    }

}
