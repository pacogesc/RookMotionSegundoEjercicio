//
//  MenuViewModel.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 10/03/21.
//

import Foundation

protocol MenuViewModelDelegate {
    func sessionClosed()
    func dataUser(_ user: UserStore)
}

class MenuViewModel {
    
    //MARK: - Properties
    
    let realmManager = RealmManager()
    let keychainManager = KeychainManager()
    var menuDelegate: MenuViewModelDelegate?
    
    //MARK: - Init
    init() {
        realmManager.realmManagerDelegate = self
    }
    
    //MARK: - Helpers
    
    func deleteData() {
        realmManager.deleteUserData()
        keychainManager.deleteData()
        UserDefaults.standard.removeObject(forKey: Constants.DefaultsConstants.loggedIn)
        menuDelegate?.sessionClosed()
    }
    
    func getUserData() {
        realmManager.getUserData()
    }
    
}

extension MenuViewModel: RealmManagerDelegate {
    func dataDeleted() {
    }
    
    func dataStored() {
    }
    
    func error(_ messeage: String) {
    }
    
    func dataUser(user: UserStore) {
        menuDelegate?.dataUser(user)
    }
    
    
}
