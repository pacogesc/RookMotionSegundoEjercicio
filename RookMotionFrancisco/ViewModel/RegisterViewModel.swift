//
//  RegisterViewModel.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 07/03/21.
//

import Foundation


protocol RegisterViewModelDelegate {
    func success()
    func failure(_ messaege: String)
    func loading()
}

class RegisterViewModel {
    
    //MARK: - Properties
    
    var registerViewModelDelegate: RegisterViewModelDelegate?
    let firebaseManager = FireBaseManager()
    
    init() {
    }
    
    //MARK: - Methods
    
    func validateUser(email: String?, password: String?, name: String?, lastName: String?) {
        registerViewModelDelegate?.loading()
        if let email = email, let password = password, let name = name, let lastName = lastName, !email.isEmpty && !password.isEmpty && !name.isEmpty && !lastName.isEmpty {
            let userStore = UserStore(email: email, name: name, lastName: lastName)
            registerUser(userStore: userStore, password: password)
        } else {
            registerViewModelDelegate?.failure("Faltan campos por llenar")
        }
    }
    
    private func registerUser(userStore: UserStore, password: String) {
        firebaseManager.register(email: userStore.email, password: password) { [weak self] (res, err) in
            if let _ = err {
                self?.registerViewModelDelegate?.failure("Usuario o contraseña incorrectos")
            }
            if let _ = res {
                self?.registerUserInfo(userStore: userStore)
            }
        }
    }
    
    private func registerUserInfo(userStore: UserStore) {
        firebaseManager.storeUserInfo(userStore: userStore, completion:{ [weak self] in
            self?.registerViewModelDelegate?.success()
        }, failure: { [weak self] (error) in
            self?.registerViewModelDelegate?.failure("Erro al registrar la información del usuario")
        })
    }
}
