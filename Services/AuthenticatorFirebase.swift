//
//  AuthenticatorFirebase.swift
//  EasySmile
//
//  Created by Pedro Henrique on 21/08/23.
//

import Foundation


import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AuthenticatorFirebase {
    static var auth = Auth.auth()
    static var firestore = Firestore.firestore()
}
