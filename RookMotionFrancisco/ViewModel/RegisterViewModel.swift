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
    
    let userRegister: UserRegister
    var registerViewModelDelegate: RegisterViewModelDelegate?
    var firebaseManager = FireBaseManager()
    
    
    
    init(userRegister: UserRegister) {
        self.userRegister = userRegister
    }
    
    func validateUser() {
        if userRegister.email.isEmpty || userRegister.name.isEmpty || userRegister.lastName.isEmpty {
            registerViewModelDelegate?.failure("Faltan campos por llenar")
        } else {
            registerViewModelDelegate?.loading()
            firebaseManager.register(email: userRegister.email, password: userRegister.password) { [weak self] (res, err) in
                if let _ = err {
                    self?.registerViewModelDelegate?.failure("Usuario o contraseña incorrectos")
                }
                if let _ = res {
                    self?.registerViewModelDelegate?.success()
                }
            }
        }
    }
    
}
