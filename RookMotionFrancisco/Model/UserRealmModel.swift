//
//  UserRealmModel.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 10/03/21.
//

import Foundation
import RealmSwift

class UserRealmModel: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var email: String = ""
}
