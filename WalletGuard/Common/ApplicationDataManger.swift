//
//  ApplicationData.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-26.
//

import Foundation

class ApplicationDataManger {
    
    private var categories: [Category] = []

    // MARK: - Properties

    static let shared = ApplicationDataManger()

    // MARK: -

    // Initialization

    private init() {
    }
    
    func getAllCategories() -> [Category]  {
        
        categories.append(Category(name: "shopping"))
        categories.append(Category(name: "education"))
        
        return categories
        
    }

}
