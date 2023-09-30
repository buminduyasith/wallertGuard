//
//  Budget.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-30.
//

import Foundation


struct Budget: Identifiable{
    
    let id : UUID = UUID()
    var title : String
    var amount: Double
    var year : Int
    var month : Int
    
    
}
