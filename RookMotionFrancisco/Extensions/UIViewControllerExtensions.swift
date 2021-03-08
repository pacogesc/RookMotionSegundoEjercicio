//
//  UIViewControllerExtensions.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 06/03/21.
//

import Foundation
import UIKit

//MARK: - UIViewController

extension UIViewController {
    func setupNavBar(title: String, color: UIColor = .black, largeTitle: Bool = true) {
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: color]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: color]
        navigationController?.navigationBar.tintColor = color
        
        navigationItem.title = title
        
        navigationController?.navigationBar.prefersLargeTitles = largeTitle
        
        navigationController?.setNavigationBarHidden(false, animated: false)
        
        let backItem = UIBarButtonItem()
            backItem.title = " "
            navigationItem.backBarButtonItem = backItem
    }
}
