//
//  RealmUserDataManager.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 10/03/21.
//

import Foundation
import RealmSwift

enum StateMessages {
    case update
    case create
}

class MessagesManager: NSObject {
    
    fileprivate let realm = try! Realm()
    
}
