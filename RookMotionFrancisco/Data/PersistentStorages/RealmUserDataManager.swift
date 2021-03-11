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
}

class MessagesManager: NSObject {
    
    fileprivate let realm = try! Realm()
    fileprivate let firebaseManager = FireBaseManager()
    
    func storeUserData() {
        //firebaseManager.
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
    
}
