//
//  UserRegister.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 07/03/21.
//

import Foundation


struct UserRegister {
    let email: String
    let password: String
    let name: String
    let lastName: String
}

struct UserStore: Codable {
    let email: String
    let name: String
    let lastName: String
}
