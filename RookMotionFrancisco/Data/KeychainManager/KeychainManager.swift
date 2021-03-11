//
//  KeychainManager.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 11/03/21.
//

import Foundation
import KeychainSwift

class KeychainManager {
    
    //MARK: - Properties
    
    let keychain = KeychainSwift()
    
    //MARK: - Helpers
    
    func fetchUser() -> String? {
        let user: String?
        user = keychain.get(Constants.KeychainConstants.user)
        return user
    }
    
    func deleteData() {
        keychain.delete(Constants.KeychainConstants.user)
        keychain.delete(Constants.KeychainConstants.password)
    }
}
