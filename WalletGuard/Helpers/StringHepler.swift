//
//  DateHelper.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import Foundation



class StringHepler{
    
    
    static let shared = StringHepler()
    
    private init() {
    }
    
    
    public let shortDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    
    private func formatPrice(_ price: Double) -> String {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.minimumFractionDigits = 2
            formatter.maximumFractionDigits = 2
            return formatter.string(from: NSNumber(value: price)) ?? ""
        }
}
