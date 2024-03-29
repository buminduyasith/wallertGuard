//
//  WalletGuardApp.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-02.
//

import SwiftUI
import Firebase

@main
struct WalletGuardApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            
            if Auth.auth().currentUser != nil {
              // User is signed in.
                DashboardView()
              // ...
            } else {
                LoginView()
              // ...
            }

        }
    }
}
