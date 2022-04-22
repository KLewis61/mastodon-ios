//
//  UIView.swift
//  
//
//  Created by MainasuK on 2022-1-17.
//

import UIKit

extension UIView {
    public static var isZoomedMode: Bool {
        return UIScreen.main.scale != UIScreen.main.nativeScale
    }
}

extension UIView {
    @discardableResult
    public func applyCornerRadius(radius: CGFloat) -> Self {
        layer.masksToBounds = true
        layer.cornerRadius = radius
        layer.cornerCurve = .continuous
        return self
    }
    
    @discardableResult
    public func applyShadow(
        color: UIColor,
        alpha: Float,
        x: CGFloat,
        y: CGFloat,
        blur: CGFloat,
        spread: CGFloat = 0
    ) -> Self {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = alpha
        layer.shadowOffset = CGSize(width: x, height: y)
        layer.shadowRadius = blur / 2.0
        if spread == 0 {
            layer.shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            layer.shadowPath = UIBezierPath(rect: rect).cgPath
        }
        return self
    }
}
