//
//  ProgressBar.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-10-01.
//

import SwiftUI

struct ProgressBar: View {
    
    @State var actualWidth: CGFloat = 300
    @Binding var progressPrecentage : CGFloat
    var body: some View {
        
        let multiplier = actualWidth / 100
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(maxWidth: actualWidth, maxHeight: 20)
            .foregroundColor(Color.black.opacity(0.4))
            
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: progressPrecentage * multiplier, height: 20)
            .foregroundColor(Color.btnPrimary)
        }
    }
}

//struct ProgressBar_Previews: PreviewProvider {
//    static var previews: some View {
//     //   ProgressBar()
//    }
//}
