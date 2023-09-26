//
//  UserAuthModel.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-02.
//

import SwiftUI
import GoogleSignIn

class UserAuthModel: ObservableObject {
    
    @Published var givenName: String = ""
    @Published var profilePicUrl: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String = ""
    
    init(){
        //check()
    }
    
    func checkStatus(){
        if(GIDSignIn.sharedInstance.currentUser != nil){
            let user = GIDSignIn.sharedInstance.currentUser
            guard let user = user else { return }
            let givenName = user.profile?.givenName
            let profilePicUrl = user.profile!.imageURL(withDimension: 100)!.absoluteString
            self.givenName = givenName ?? ""
            self.profilePicUrl = profilePicUrl
            self.isLoggedIn = true
        }else{
            self.isLoggedIn = false
            self.givenName = "Not Logged In"
            self.profilePicUrl =  ""
        }
    }
    
    func handleSignInButton(){
        
        guard let windowSceene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowSceene.windows.first,
              let rootViewController = window.rootViewController else {
            print("there is no root view controller")
            return
        }
        
    
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
        
       
    }
    
   
    
}
