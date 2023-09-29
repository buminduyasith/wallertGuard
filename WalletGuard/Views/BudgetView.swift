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
    @ObservedObject var budgetVm = BudgetViewModel()
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           //Use this if NavigationBarTitle is with displayMode = .inline
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]

       }
    
    

    var body: some View {
        NavigationStack{
            VStack{
                
                
                Picker("", selection: $selection){
                    Text("Income").tag(0)
                    Text("Expenses").tag(1)
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                
                
                VStack(alignment: .leading){
                    
                    
                    HStack{
                        
                        
                        Image(systemName: "calendar")
                            .foregroundColor(.blue)
                            .padding(.leading, 10)
                        Text("2023-09 Balance")
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    
                    HStack{
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                            .padding(.leading, 10)
                        
                        Text("49, 500 Rs")
                            .font(.title)
                            .foregroundColor(.white)
                        
                        Spacer()
                    }
                    .padding(.top, 5)
                    
                    HStack{
                        
                        Text("Expenses:")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "minus")
                            .foregroundColor(.red)
                            .padding(.leading, 10)
                        
                       
                        
                        Text("500")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.trailing)

                    }
                    .padding(.top, 5)
                    
                    HStack{
                        
                        Text("Income:")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.leading)
                        
                        Spacer()
                        
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                            .padding(.leading, 10)
                        
                        Text("500")
                            .font(.title3)
                            .foregroundColor(.white)
                            .padding(.trailing)
                        
                    }
                    .padding(.top, 5)
                    .padding(.bottom, 10)
            
                }
                .frame(maxWidth: .infinity)
                .background(Color.background)
                .padding()
                
                
                ScrollView(){
                    
                   
                    if selection == 0 {
                        

                        ForEach(budgetVm.transactions) { transaction in
                            
                            if(transaction.type == .income){
                                TransactionComponent(transaction: transaction)
                            }
                        }
                        
                    }
                    
                    else{
                        
                        ForEach(budgetVm.transactions) { transaction in
                            
                            if(transaction.type == .expense){
                                TransactionComponent(transaction: transaction)
                            }
                        }
                        
                    }

                }
                
                
                Spacer()
                
                
            }
            .onAppear{
                budgetVm.getTransactions()
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
            AddBudgetView()
//            Label("No expenses", systemImage: "tray.fill")
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}
