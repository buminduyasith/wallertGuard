//
//  RegisterView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-23.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State private var didFinish = false
    
    @ObservedObject var vm = UserViewModel()
    var body: some View {
        VStack(alignment: .leading){
            Text("Create Your \nAccount")
                .fontWeight(Font.Weight.bold)
                .font(.system(size: 48))
                .foregroundColor(.white)
            
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
//                vm.CreateNewAccount(user: User( id: "", firstName: firstName, lastName: lastName, email: email, password: password))
            }, label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                   // .padding(.top,20)
                   // .padding(.leading, 150)
                    .cornerRadius(10.0)
            })
            .frame(width: 150, height: 60)
            .background(.blue)
            .cornerRadius(10.5)
            Spacer()
           
        
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black) // Set the background color to black
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
