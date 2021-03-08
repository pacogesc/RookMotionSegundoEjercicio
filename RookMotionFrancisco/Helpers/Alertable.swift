//
//  Alertable.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 08/03/21.
//

import Foundation
import UIKit


public protocol Alertable {}
public extension Alertable where Self: UIViewController {
    
    func showAlert(title: String = "", message: String, actions: [UIAlertAction]? = nil, preferredStyle: UIAlertController.Style = .alert, completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        if let actions = actions {
            for action in actions {
                alert.addAction(action)
            }
        } else {
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        }
        self.present(alert, animated: true, completion: completion)
    }
}
