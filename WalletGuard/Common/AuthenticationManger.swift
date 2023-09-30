//
//  AuthenticationManger.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-30.
//

import Foundation
import FirebaseAuth



class AuthenticationManger{
    
    static let shared = AuthenticationManger()
    private init() {}
    
    func getAuthenticatedUser() throws -> ApplicationUser{
        
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        let appUser = ApplicationUser(id: user.uid, firstName: "", lastName: "", email: user.email ?? "", password: "")
        
        return appUser
    }
}
