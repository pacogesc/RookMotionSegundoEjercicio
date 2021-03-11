//
//  MenuViewModel.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 10/03/21.
//

import Foundation

protocol MenuViewModelDelegate {
    func sessionClosed()
}

class MenuViewModel {
    
    //MARK: - Properties
    
    let realmManager = RealmManager()
    let keychainManager = KeychainManager()
    var menuDelegate: MenuViewModelDelegate?
    
    //MARK: - Helpers
    
    func deleteData() {
        realmManager.deleteUserData()
        keychainManager.deleteData()
        UserDefaults.standard.removeObject(forKey: Constants.DefaultsConstants.loggedIn)
        menuDelegate?.sessionClosed()
    }
    
}
