//
//  ContentView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-02.
//

import SwiftUI
import GoogleSignIn

struct LoginView: View {
    
    @State var useerName : String = ""
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Create Your \nAccount")
                .fontWeight(Font.Weight.bold)
                .font(.system(size: 48))
                .foregroundColor(.white)
            
            TextField("Username", text: $useerName)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10.0)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $useerName)
                .padding()
                .background(Color.white.opacity(0.9))
                .cornerRadius(10.0)
                .padding(.bottom, 20)
            
            WalletGuardButtonView(title: $useerName, btnSubmit: signin)
            
            
            
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black) // Set the background color to black
        
    }
    func signin(){
        useerName = "bumindu"
        print("sign in")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
