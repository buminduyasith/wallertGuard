//
//  AddExpensesView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI

struct AddExpenseSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var amount: Double = 0
    @State private var date: Date = .init()
    @State private var category: String = "shopping"
    var categories : [String] = []
    
    @ObservedObject private var homeVm: HomeViewModel
  
    
    init(homeVm : HomeViewModel) {
        
          self.homeVm = homeVm
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
                            ForEach(categories, id: \.self) { item in
                                Text(item.lowercased())
                                    .foregroundColor(Color.red)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                }
                
                
              
                
            }
            .background(.black)
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
                        
                        Task{
                            do{
                                try await homeVm.AddExpense(expense:Expense(subTitle: title, amount: amount, date: date, category: category))
                                
                                dismiss()
                                
                            }catch{
                                
                                print(error)
                                dismiss()
                                
                            }
                        }
                    }
                    .tint(Color.btnPrimary)
                }
                
            }
        }
    }
}

struct AddExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        AddExpenseSheetView(homeVm: HomeViewModel())
    }
}
