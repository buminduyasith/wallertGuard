//
//  AddBudgetView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-28.
//

import SwiftUI

struct AddBudgetView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var amount: Double = 0
    @State private var year: Int = .init()
    @State private var selectedMonthIndex = 0
        let months = ["Jan - 1", "Feb - 2", "Mar - 3", "Apr - 4", "May - 5", "Jun - 6", "Jul - 7", "Aug - 8", "Sep - 9", "Oct - 10", "Nov - 11", "Dec - 12"]
    
    @ObservedObject var budgetVm :BudgetViewModel
    
    init(budgetVM : BudgetViewModel) {
        
        self.budgetVm = budgetVM
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
                
                Section("Year"){
                    
                    Picker("", selection: $year) {
                              ForEach(2023...2060, id: \.self) {
                                  Text(String($0))
                              }
                          }
                    .frame(width: 180, alignment: .leading)
                    .pickerStyle(.menu)
                    .accentColor(.black)
                }
                
                Section("Month"){
                    
                    Picker("Select a Month", selection: $selectedMonthIndex) {
                        ForEach(0..<months.count, id: \.self) { index in
                            
                            Text(months[index]).tag(index + 1)
                        }
                    }
                    .frame(width: 180, alignment: .leading)
                    .pickerStyle(.menu)
                    .accentColor(.black)
                }
                

            }
            .background(.black)
            .scrollContentBackground(.hidden)
            .foregroundColor(.white)
            .font(.system(size: 16.0))
            .navigationTitle("Add Budget")
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
                                try await budgetVm.createBudget(budget:Budget(title: title, amount: amount, year: year, month: selectedMonthIndex ))
                                
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

struct AddBudgetView_Previews: PreviewProvider {
    static var previews: some View {
        AddBudgetView(budgetVM: BudgetViewModel())
    }
}
