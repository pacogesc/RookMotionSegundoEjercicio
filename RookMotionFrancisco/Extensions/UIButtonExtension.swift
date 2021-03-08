//
//  UIButtonExtension.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 06/03/21.
//

import Foundation
import UIKit

extension UIButton {
    /// Custom initializer for buttons with underlined text
    /// - Parameters:
    ///   - title: The text that the button will display
    ///   - titleColor: The color of the text and the underline
    ///   - target: The current target for the button
    ///   - action: The current action for the button
    convenience init(title: String, titleColor: UIColor, target: Any? = nil, action: Selector? = nil) {
        self.init(type: .system)
        let attributedString = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16),
                                                                              NSAttributedString.Key.foregroundColor: titleColor,
                                                                              NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                                                                              NSAttributedString.Key.underlineColor: titleColor])
        setAttributedTitle(attributedString, for: .normal)
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    convenience init(title: String, target: Any? = nil, action: Selector? = nil) {
        self.init(type: .system)
        
        setImage(UIImage(named: "down_arrow"), for: .normal)
        imageEdgeInsets = .init(top: 4, left: 200, bottom: 6, right: 34)
        titleEdgeInsets = .init(top: 0, left: -30, bottom: 0, right: 34)
        setTitle(title, for: .normal)
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        tintColor = .lightGray
        
        if let action = action {
            addTarget(target, action: action, for: .touchUpInside)
        }
    }
    
    func roundedButton(cornerRadius: CGFloat, color: UIColor, borderWidth: CGFloat = 1, contentAlignment: ContentHorizontalAlignment = .center, padding: CGFloat = 0) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
        self.contentHorizontalAlignment = contentAlignment
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
    }
}
