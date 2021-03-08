//
//  MainCoordinator.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 06/03/21.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = LoginController()
        navigationController.pushViewController(vc, animated: false)
    }
    
}
