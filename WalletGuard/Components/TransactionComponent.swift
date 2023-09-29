//
//  TransactionComponent.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import SwiftUI

struct TransactionComponent: View {
    var transaction: TransactionDto
    var body: some View {
        HStack{
            
            
            Image(systemName: transaction.type == .income ? "arrow.up.circle" : "arrow.down.circle")
                .foregroundColor(transaction.type == .income ? .green : .red)
                .padding(.leading, 10)
            
            VStack(alignment: .leading, spacing: 4){
                Text(transaction.title)
                    .font(.title2)
                    .foregroundColor(.white)
                
                Text("\(transaction.date, formatter: StringHepler.shared.shortDateFormatter)")
                    .font(.caption)
                    .foregroundColor(Color(.systemGray3))
                
            }
            
            Spacer()
            
            
            Image(systemName: transaction.type == .income ? "plus" : "minus")
                .foregroundColor(transaction.type == .income ? .green : .red)
                .padding(.leading, 10)
            
            HStack(spacing: 5){
                Text(String(format: "%.2f", transaction.price))
                    .font(.title3)
                    .foregroundColor(.white)
                
                Text("Rs")
                    .font(.caption)
                    .foregroundColor(Color(.systemGray3))
                    .padding(.trailing, 10)
            }
            
        }
        .frame(height: 80)
        
        .background(Color.background)
        .cornerRadius(10.0)
        .padding(.horizontal)
    }
}

//struct TransactionComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        TransactionComponent()
//    }
//}
