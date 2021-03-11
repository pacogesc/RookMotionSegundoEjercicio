//
//  RealmUserDataManager.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 10/03/21.
//

import Foundation
import RealmSwift

protocol RealmManagerDelegate {
    func dataDeleted()
    func dataStored()
    func error(_ messeage: String)
    func dataUser(user: UserStore)
}

class RealmManager: NSObject {
    
    private let realm = try! Realm()
    private let keychainManager = KeychainManager()
    private let firebaseManager = FireBaseManager()
    var realmManagerDelegate: RealmManagerDelegate?
    
    func storeUserData() {
        if let key = keychainManager.fetchUser() {
            firebaseManager.fetchUserInfo(userString: key) { [weak self] (res, err) in
                if let _ = err {
                    self?.realmManagerDelegate?.error("Algo ocurrió")
                }
                
                guard let res = res else {
                    self?.realmManagerDelegate?.error("Algo ocurrió")
                    return
                }
                self?.storeData(data: res)
            }
        } else {
            
        }
    }
    
    func getUserData() {
        let user = realm.objects(UserRealmModel.self)
        if let user = user.first {
            let userData = UserStore(email: user.email, name: user.name, lastName: user.lastName)
            realmManagerDelegate?.dataUser(user: userData)
        } else {
            realmManagerDelegate?.error("Error al recuperar la información del usurio")
        }
    }
    
    func deleteUserData() {
        do {
            try realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Error al borrar la basede datos")
        }
    }
    
    private func storeData(data: UserStore) {
        do {
            try realm.write {
                let userModel = UserRealmModel()
                userModel.name = data.name
                userModel.lastName = data.lastName
                userModel.email = data.email
                realm.add(userModel)
            }
        } catch {
            realmManagerDelegate?.error("Error al guardar la infomación del usuario")
        }
    }
    
}
