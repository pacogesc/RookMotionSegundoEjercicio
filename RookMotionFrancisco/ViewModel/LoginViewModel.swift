//
//  LoginViewModel.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 06/03/21.
//

import Foundation

protocol LoginViewModelDelegate {
    func success()
    func failure(_ messaege: String)
    func loading()
}

class LoginViewModel: NSObject {
    
    let credentialUser: Credentials
    var loginViewModelDelegate: LoginViewModelDelegate?
    var firebaseManager = FireBaseManager()
    
    init(credentials: Credentials) {
        self.credentialUser = credentials
    }
    
    func checkUser() {
        if credentialUser.email.isEmpty || credentialUser.password.isEmpty {
            loginViewModelDelegate?.failure("Usuario o contraseña invalido")
        } else {
            authenticateUser()
        }
    }
    
    private func authenticateUser() {
        loginViewModelDelegate?.loading()
        firebaseManager.sign(email: credentialUser.email, password: credentialUser.password) { [weak self] (res, err) in
            if let _ = err {
                self?.loginViewModelDelegate?.failure("Usuario o contraseña incorrectos")
            }
            if let _ = res {
                self?.loginViewModelDelegate?.success()
            }
        }
    }
}
