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
import Combine
import SwiftUI

class UserViewModel: ObservableObject {
    
    @Published var isProcessing = false
    @Published var isloggedIn = false
    @Published var path = NavigationPath()
    
    func CreateNewAccount(user : ApplicationUser){
        let db = Firestore.firestore()
        Auth.auth().createUser(withEmail: user.email, password: user.password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
            else{
                print(result?.user.email!)
                print("user name is \(user.firstName)")
                // let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                //                changeRequest?.displayName = user.firstName
                //                changeRequest?.commitChanges { error in
                //                    print("display user name failed")
                //                  print(error)
                //                }
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
    
    @MainActor
    func Login(user: ApplicationUser) async{
        
        do{
            print(user.email)
            print(user.password)
            let authResult = try await Auth.auth().signIn(withEmail: user.email, password: user.password)
            isloggedIn = true;
            //path.append("dashboard")
            
        }
        catch{
            print(error)
        }
        
    }
    
    
    func GetUserInfo(completion: @escaping (ApplicationUser?) -> Void) {
        if let userId = Auth.auth().currentUser?.uid {
            let db = Firestore.firestore()
            let docRef = db.collection("users").document(userId)

            docRef.getDocument { (document, error) in
                guard let document = document, document.exists, let documentData = document.data() else {
                    print("Document does not exist or data is missing")
                    completion(nil)
                    return
                }

                let firstName = documentData["firstName"] as? String ?? ""
                let lastName = documentData["lastName"] as? String ?? ""
                
                // Assuming you have access to the email and password as well
                let email = documentData["email"] as? String ?? ""
                let password = documentData["password"] as? String ?? ""

                let user = ApplicationUser(id: userId, firstName: firstName, lastName: lastName, email: email, password: password)
                completion(user)
            }
        } else {
            completion(nil)
        }
    }
    
    func getUser() async throws -> ApplicationUser {
        
        let db = Firestore.firestore()
      
        guard let userId = Auth.auth().currentUser?.uid else {
            throw AuthErrorCode(.appNotAuthorized)
        }
        
        let snapshort =  try await db.collection("users").document(userId).getDocument()
        
        guard let documentData = snapshort.data() else {
            throw URLError(.badServerResponse)
        }
        
        let firstName = documentData["firstName"] as? String ?? ""
        let lastName = documentData["lastName"] as? String ?? ""
        
        return ApplicationUser(id: userId, firstName: firstName, lastName: lastName, email: "", password: "")
    }
    
    
}
