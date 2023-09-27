//
//  PrimaryButton.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-26.
//

import SwiftUI

struct PrimaryButton: View {
    
    @State var btnName : String = ""
    var body: some View {
        Text(btnName)
            .foregroundColor(Color.white)
            .font(.headline)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.btnPrimary)
            .cornerRadius(15.0)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(btnName: "st")
    }
}
