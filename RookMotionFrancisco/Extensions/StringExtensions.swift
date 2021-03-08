//
//  StringExtensions.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 07/03/21.
//

import Foundation


extension String {
    
    enum ValidityType {
        case email
        case password
        case canjeCodigo
    }
    
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#-_])[A-Za-z\\d$@$!%*?&#]{6,25}"
        case canjeCodigo = "[A-Z0-9a-z]{4}+-[A-Z0-9a-z]{4}+-[A-Z0-9a-z]{4}"
    }
    
    func isValid(_ validityType: ValidityType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validityType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        case .canjeCodigo:
            regex = Regex.canjeCodigo.rawValue
        }
        
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
