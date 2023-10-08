//
//  CategoriesView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI
import Charts

struct BudgetView: View {
    @State private var addExpense: Bool = false
    @State private var selection = 0
    @State private var searchText = ""
    @ObservedObject var budgetVm = BudgetViewModel()
    
    var transactionList : [TransactionDto] {
        if searchText.isEmpty {
            return budgetVm.transactions
        }
        
        return budgetVm.transactions.filter { transaction in
            return transaction.title.lowercased().contains(searchText.lowercased())
        }
    }
    
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           //Use this if NavigationBarTitle is with displayMode = .inline
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        
        UISearchBar.appearance().tintColor = UIColor.white
        
        

       }
    
    

    var body: some View {
        NavigationStack{
            VStack{
                
                
                Picker("", selection: $selection){
                    Text("Income").tag(0)
                    Text("Expenses").tag(1)
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                
                
                VStack(alignment: .leading){
                    
                    
                    HStack{
                        
                        
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                            .padding(.leading, 10)
                       
                        Text("\(Date.now, formatter: StringHepler.shared.shortDateFormatter) Balance")
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    
                    ProgressBar(actualWidth: 350, progressPrecentage: $budgetVm.budgetCompletePrecentage)
                        .padding(.horizontal, 10)
                        .padding(.top,10)
                    
                    
                    HStack{
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                            .padding(.leading, 10)
                        
                        Text(String(format: "%.2f", budgetVm.budgetInfo.amount))
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    
                    HStack{
                        
                        Text("Expenses:")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "minus")
                            .foregroundColor(.red)
                            .padding(.leading, 10)
                        
                       
                        
                        Text(String(format: "%.2f", budgetVm.totalExpenses))
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.trailing)

                    }
                    
                    HStack{
                        
                        Text("Income:")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                            .padding(.leading, 10)
                        
                        Text(String(format: "%.2f", budgetVm.totalIncome))
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.trailing)
                        
                    }
                    .padding(.bottom, 10)
            
                }
                .frame(maxWidth: .infinity)
                .background(Color.background)
                .padding()
                
                
                ScrollView(){
                    
                   
                    if selection == 0 {
                        

                        ForEach(transactionList) { transaction in
                            
                            if(transaction.type == .income){
                                TransactionComponent(transaction: transaction)
                            }
                        }
                        
                    }
                    
                    else{
                        
                        ForEach(transactionList) { transaction in
                            
                            if(transaction.type == .expense){
                                TransactionComponent(transaction: transaction)
                            }
                        }
                        
                    }

                }
                .searchable(text: $searchText)
                .textCase(.none)
                .foregroundColor(Color.white)
                
                Spacer()
                
                
            }
            .onAppear{
                Task{
                    await budgetVm.getTransactions()
                    await budgetVm.getBudget()
                }
            }
            .frame(maxWidth: .infinity)
            .background(.black)
            .navigationTitle("Budget")
                .overlay{
//                    Label("No expenses", systemImage: "tray.fill")
//                        .font(.title2)
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            addExpense = true
                        }
                        label:{
                            Image(systemName: "plus.circle.fill")
                                .font(.title3)
                        }
                    }
                }
        }
        .sheet(isPresented: $addExpense){
            AddBudgetView(budgetVM: budgetVm)
//            Label("No expenses", systemImage: "tray.fill")
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}
