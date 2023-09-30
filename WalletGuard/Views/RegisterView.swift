//
//  RegisterView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-23.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State private var didFinish = false
    @State private var isloggedIn = false
    
    @ObservedObject var vm = UserViewModel()
    var body: some View {
        if isloggedIn == true{
            DashboardView()
        }
        else{
            content
        }
        
    }
    
    var content: some View{
        VStack(alignment: .leading){
            
            HStack(spacing: 0){
                Text("Create Your Account")
                    .fontWeight(Font.Weight.bold)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                
                Spacer()
                
                Image("register")
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
            HStack{
                TextField("FirstName", text: $firstName)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                
                TextField("LastName", text: $lastName)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
            }
            
            TextField("Email", text: $email)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10.0)
                .padding(.bottom, 20)
            
            Button(action: {
                didFinish = true
                vm.CreateNewAccount(user: ApplicationUser( id: "", firstName: firstName, lastName: lastName, email: email, password: password))
                isloggedIn = true
            }, label: {
                PrimaryButton(btnName: "Sign up")
            })
            
            Spacer()
           
        
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black) // Set the background color to black
        .onAppear{
            Auth.auth().addStateDidChangeListener{auth, user in
                
                if user != nil{
                    isloggedIn = true
                }
                
            }
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
