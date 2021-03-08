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
    
    func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.locations = [0.0, 1.0]
        gradient.colors = [#colorLiteral(red: 0.2690247297, green: 0.4241275191, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.1681487262, green: 0.2643073797, blue: 0.6318634748, alpha: 1).cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
}
