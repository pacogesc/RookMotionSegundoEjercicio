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
    
    //MARK: - Properties
    
    var loginViewModelDelegate: LoginViewModelDelegate?
    var firebaseManager = FireBaseManager()
    
    //MARK: - Methods
    
    func checkUser(email: String?, password: String?) {
        if let email = email, let password = password, !email.isEmpty || !password.isEmpty {
            authenticateUser(email: email, password: password)
        } else {
            loginViewModelDelegate?.failure("Usuario o contraseña invalido")
        }
    }
    
    private func authenticateUser(email: String, password: String) {
        loginViewModelDelegate?.loading()
        firebaseManager.sign(email: email, password: password) { [weak self] (res, err) in
            if let _ = err {
                self?.loginViewModelDelegate?.failure("Usuario o contraseña incorrectos")
            }
            if let _ = res {
                self?.loginViewModelDelegate?.success()
            }
        }
    }
}
