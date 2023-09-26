//
//  AddExpensesView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI

struct AddExpensesView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var amount: Double = 0
    @State private var date: Date = .init()
    @State private var category: Category?
    let categories : [Category]
  
    
    init() {
        
        categories = ApplicationDataManger.shared.getAllCategories()
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           //Use this if NavigationBarTitle is with displayMode = .inline
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
       }
    var body: some View {
        NavigationStack{
            List{
                
                Section("Title"){
                    TextField("title of the expense", text: $title)
                        .foregroundColor(.black)
                }
                
                Section("Amount spent"){
                    HStack(){
                        
                        TextField("0.0", value: $amount, format: .currency(code: "LK"))
                            .foregroundColor(.black)
                            .keyboardType(.decimalPad)
                        
                        
                       
                        Text("LK")
                            .foregroundColor(.black)
                            .fontWeight(.semibold)
                    }
                        
                }
                
                Section("Date"){
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.wheel)
                        .labelsHidden()
                }
                
                Section{
                   
                    HStack{
                        
                        Text("Category")
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Picker("", selection: $category){
                            ForEach(categories) { item in
                                Text(item.name)
                                    .foregroundColor(Color.red)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                }
                
                
              
                
            }
            .background(Color.background)
            .scrollContentBackground(.hidden)
            .foregroundColor(.white)
            .font(.system(size: 16.0))
            .navigationTitle("Add Expense")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        dismiss()
                    }
                    .tint(.red)
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add"){
                        dismiss()
                    }
                    .tint(Color.btnPrimary)
                }
                
            }
        }
    }
}

struct AddExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpensesView()
    }
}
