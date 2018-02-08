//
//  GKScale.swift
//  aoqianProject
//
//  Created by GKiOS on 2017/11/8.
//  Copyright © 2017年 cpf. All rights reserved.
//

import Foundation
import UIKit
fileprivate let width = UIScreen.main.bounds.size.width
fileprivate let scalePlus = 1.104
fileprivate let scale5s = 0.85333
extension Int {
    
    var scale: Int {
        get {
            if width == 414 {
                return lround(Double(self) * scalePlus)
            } else if width == 375 {
                return self
            } else {
                return lround(Double(self) * scale5s)
            }
        }
    }
}

extension Double {
    
    /** 取整的原因：高精度的数值在Snapkit里会出现约束冲突的情况 */
    var scale: Int {
        get {
            if width == 414 {
                return lround(self * scalePlus)
            } else if width == 375 {
                return lround(self)
            } else {
                return lround(self * scale5s)
            }
        }
    }
    
}

extension Float {
    
    var scale: Int {
        get {
            if width == 414 {
                return lround(Double(self) * scalePlus)
            } else if width == 375 {
                return lroundf(self)
            } else {
                return lround(Double(self) * scale5s )
            }
        }
    }
}

extension CGFloat {
    
    var scale: CGFloat {
        get {
            if width == 414 {
                return CGFloat(Double(self) * scalePlus)
            } else if width == 375 {
                return self
            } else {
                return CGFloat(Double(self) * scale5s)
            }
        }
    }
}


