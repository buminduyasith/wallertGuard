//
//  WalletGuardButton.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-23.
//

import SwiftUI

struct WalletGuardButtonView: View {
    
    @State var useerName : String = ""
   // let title: String
    @Binding var title : String
    
    var btnSubmit: () -> Void
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
                .fontWeight(Font.Weight.bold)
                .font(.system(size: 48))
                .foregroundColor(.white)
            
            Button("Sign in"){
                btnSubmit()
            }
            .foregroundColor(.white)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black) // Set the background color to black
        
    }
    func signin(){
        print("sign in")
    }
}

struct WalletGuardButtonView_Previews: PreviewProvider {
    @State static var title = "Sample Title"
    
    static func signIn(){
        print("hi")
    }
    static var previews: some View {
        WalletGuardButtonView(title: $title, btnSubmit: signIn)
    }
}
