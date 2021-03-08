//
//  FireBaseManager.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 07/03/21.
//

import Foundation
import Firebase

class FireBaseManager {
    
    let db = Firestore.firestore()
    
    func sign(email: String?, password: String?, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void)) {
        Auth.auth().signIn(withEmail: email ?? "", password: password ?? "") { (user, error) in
            completion(user, error)
        }
    }
    
    func signOut(completion: @escaping(() -> Void), failure: @escaping((_ error: String) -> Void)){
        do {
            try Auth.auth().signOut()
            completion()
        } catch {
            failure(error.localizedDescription)
        }
    }
    
    func register(email: String?, password: String?, completion: @escaping((_ authResult: AuthDataResult?, _ error: Error?) -> Void)){
        Auth.auth().createUser(withEmail: email ?? "", password: password ?? "") { (authResult, error) in
            completion(authResult, error)
        }
    }
    
    func storeUserInfo(userStore: UserStore, completion: @escaping(() -> Void), failure: @escaping((_ error: String) -> Void)) {
        db.collection(Constants.FStore.collectionName).addDocument(data: userStore.dictionary) { err in
            if let err = err {
                failure(err.localizedDescription)
            } else {
                completion()
            }
        }
    }
}
