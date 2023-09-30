//
//  Home.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-26.
//

import SwiftUI
import FirebaseAuth

struct Home: View {
    @State var name = ""
    @State var user : ApplicationUser? = nil
    @State private var isAddExpenseSheetOpen: Bool = false
    @State private var isAddIncomeSheetOpen: Bool = false
    @ObservedObject var homeVm = HomeViewModel()
    @ObservedObject var vm = UserViewModel()
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           //Use this if NavigationBarTitle is with displayMode = .inline
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
       }

    var body: some View {
       
        NavigationStack{
            VStack{
                
                HStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.background)
                            .shadow(radius: 10)
                            
                        
                        VStack{
                            Text("Income")
                              //  .foregroundColor(Color(.systemGray2))
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top)
                                .padding(.bottom, 5)
                            
                            HStack(spacing: 10){
                                
                                Image(systemName: "arrow.up.circle")
                                    .foregroundColor(.green)
                                
                                HStack(spacing: 3){
                                    Text(String(format: "%.2f", homeVm.totalIncome))
                                        .foregroundColor(.white)
                                        .bold()
                                    
                                    Text("Rs")
                                        .foregroundColor(Color(.systemGray3))
                                        
                                }
                            }
                            
                            Button(action: {
                                
                                isAddIncomeSheetOpen = true
                                
                            }, label: {
                                PrimaryButton(btnName: "Add Income")
                                    .padding(.top, 3)
                            })
                            
                            Spacer()
                        }
                        .padding()
                        .multilineTextAlignment(.leading)
                        
                    }
                    .frame(width: 180, height: 150)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color.background)
                            .shadow(radius: 10)
                        
                        VStack{
                            Text("Expenses")
                            
                                .font(.title2)
                                .foregroundColor(.white)
                                .bold()
                                .padding(.top)
                                .padding(.bottom, 5)
                            
                            HStack(spacing: 10){
                                
                                Image(systemName: "arrow.down.circle")
                                    .foregroundColor(.red)
                                
                                HStack(spacing: 3){
                                    Text(String(format: "%.2f", homeVm.totalExpenses))
                                        .foregroundColor(.white)
                                        .bold()
                                    
                                    Text("Rs")
                                        .foregroundColor(Color(.systemGray3))
                                        
                                }
                            }
                            
                            Button(action: {
                                
                                isAddExpenseSheetOpen = true
                                
                            }, label: {
                                PrimaryButton(btnName: "Add Expense")
                                    .padding(.top, 3)
                            })
                            
                            
                            Spacer()
                        }
                        .padding()
                        .multilineTextAlignment(.leading)
                        
                    }
                    .frame(width: 180, height: 150)
                }
                .padding()
                
                HStack{
                    Text("Recent Transactions")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.horizontal)
                
                ScrollView(){
                    
                    ForEach(homeVm.transactions) { transaction in
                        TransactionComponent(transaction: transaction)
                    }
                   

                }
                .padding(.top)
                
                Spacer()
                
            }
            .padding(.top, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .navigationTitle("Hi \(name)")
            
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button("Sign out"){
                        
                            do{
                                try Auth.auth().signOut()
                                
                            }
                            catch{
                                print("error")
                            }
                            
                            
                        }
                        .foregroundColor(.white)
                    }
                }
        }
        .onAppear{
            
            Task{
                try? user =  await vm.getUser()
                name = user?.firstName ?? ""
                await homeVm.getTransactions()
            }
        }
        .sheet(isPresented: $isAddIncomeSheetOpen){
            AddIncomeSheetView(homeVm: homeVm)
        }
        .sheet(isPresented: $isAddExpenseSheetOpen){
            AddExpenseSheetView(homeVm: homeVm)
        }
       
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
