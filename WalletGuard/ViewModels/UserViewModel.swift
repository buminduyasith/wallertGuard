//
//  UserViewModel.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-23.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore

class UserViewModel: ObservableObject {
    
    func CreateNewAccount(user : User){
        let db = Firestore.firestore()
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            else{
                print(result?.user.email!)
                db.collection("users").document((result?.user.uid)!).setData([
                    "firstName": user.firstName,
                    "lastName": user.lastName
                ])
                {err in
                   if let err = err {
                       print("Error writing document: \(err)")
                   } else {
                       print("Document successfully written!")
                   }
               }
                
            }
        }
        print("created")
    }
}
