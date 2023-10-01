//
//  ContentView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-02.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    @State var path = NavigationPath()
    @ObservedObject var vm = UserViewModel()
    var body: some View {
        
        if vm.isloggedIn{
            
            DashboardView()
        }
        else{
            
            if (vm.isProcessing){
                LoadingIndicator()
                
            }
            else{
                content
            }
           
        }
    }
    
    
    var content: some View{
        
        NavigationStack{
            VStack(alignment: .leading) {
                
                HStack(spacing: 0){
                    Text("Sign In To Your Account")
                        .fontWeight(Font.Weight.bold)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image("login")
                        .resizable()
                        .frame(width: 200, height: 200)
                }
                
                TextField("Username", text: $email)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(10.0)
                    .padding(.bottom, 20)
                
              
                Button(action: {
                    //path.append("dashboard")

                    Task{
                        await vm.Login(user:ApplicationUser(id: "", firstName: "", lastName: "", email: email, password: password))
                    }
                }, label: {
                    PrimaryButton(btnName: "Login")
                })
                
                NavigationLink(destination: {
                    RegisterView()
                }, label: {
                    
                    Text("Don't have an account? Register here.")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                })
                .padding(.top, 40)
                Spacer()
                
//                Button(action: {
//                    path.append("register")
//                })
//                {
//                    Text("Don't have an account? Register here.")
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                }
//
//                .padding(.top, 40)
//                Spacer()
                
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
            // Set the background color to black
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
