//
//  GKUIViewBounceAnimal.swift
//  aoqianProject
//
//  Created by GKiOS on 2017/11/8.
//  Copyright © 2017年 cpf. All rights reserved.
//

import Foundation
import UIKit
fileprivate var kTransitionDuration = 0.3
fileprivate var kBegainScale = 1.1
fileprivate var kMiddleScale = 0.6
extension UIView {
    
    func beginAnimationWithBegainScale(begainScale: Double,
                                       middleScale: Double,
                                       duration: Double) {
        bounce0Animation()
        kTransitionDuration = duration
        kBegainScale = begainScale
        kMiddleScale = middleScale
    }
    
    private func bounce0Animation() {
        self.transform = CGAffineTransform.init(scaleX: 0.0001, y: 0.0001)
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(kTransitionDuration / 1.5)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(bounce1AnimationDidStop))
        self.transform = CGAffineTransform.init(scaleX: 0.0001, y: 0.0001)
        UIView.commitAnimations()
    }
    
    @objc private func bounce1AnimationDidStop() {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(kTransitionDuration / 2)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(bounce2AnimationDidStop))
        self.transform = CGAffineTransform.init(scaleX: CGFloat(kMiddleScale), y: CGFloat(kMiddleScale))
        UIView.commitAnimations()
    }
    
    @objc private func bounce2AnimationDidStop() {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(kTransitionDuration / 2.5)
        UIView.setAnimationDelegate(self)
        UIView.setAnimationDidStop(#selector(bounceDidStop))
        self.transform = self.transformForOrientation()
        UIView.commitAnimations()
    }
    
    @objc private func bounceDidStop() {
        
    }
    
    private func transformForOrientation() -> CGAffineTransform {
        let  orientation = UIApplication.shared.statusBarOrientation
        if orientation == UIInterfaceOrientation.landscapeLeft {
            return CGAffineTransform.init(rotationAngle: CGFloat(.pi * 1.5))
        } else if orientation == .landscapeRight {
            return CGAffineTransform.init(rotationAngle: CGFloat(.pi / 2 * 1.5))
        } else if orientation == .portraitUpsideDown {
            return CGAffineTransform.init(rotationAngle: -.pi)
        } else {
            return CGAffineTransform.identity
        }
    }
}
