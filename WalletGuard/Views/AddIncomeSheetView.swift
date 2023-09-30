//
//  AddIncomeSheetView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import SwiftUI

struct AddIncomeSheetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var amount: Double = 0
    @State private var date: Date = .init()
  
    @ObservedObject private var homeVm  = HomeViewModel()

    
    init() {
        
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
                
                Section("Amount"){
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

            }
            .background(.black)
            .scrollContentBackground(.hidden)
            .foregroundColor(.white)
            .font(.system(size: 16.0))
            .navigationTitle("Add Income")
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
                                try await homeVm.AddIncome(income: Income(title: title, amount: amount, date: date))
                                
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

struct AddIncomeSheetView_Previews: PreviewProvider {
    static var previews: some View {
        AddIncomeSheetView()
    }
}
