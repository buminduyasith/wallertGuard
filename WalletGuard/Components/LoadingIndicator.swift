//
//  LoadingIndicator.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-10-01.
//

import SwiftUI

struct LoadingIndicator: View {
    @State var isLoading = false
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: 0.8)
                .stroke(AngularGradient(gradient: .init(colors: [.red, .orange]), center: .center), style: StrokeStyle(lineWidth: 8, lineCap: .round))
                .frame(width: 45, height: 45)
                .rotationEffect(.degrees(isLoading ? 360 : 0))
                .onAppear() {
                    withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                        self.isLoading = true
                    }
                }
            
            Text("please wait")
                .foregroundColor(.white)
                .padding(.top, 20)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color.black.ignoresSafeArea())
    }
}

struct LoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
