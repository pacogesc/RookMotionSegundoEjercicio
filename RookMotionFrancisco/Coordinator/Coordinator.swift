//
//  Coordinator.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 06/03/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
