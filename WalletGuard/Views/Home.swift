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
    @State var user : User? = nil
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
                                    Text("1000.23")
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
                                    Text("1000.23")
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
                        HStack{
                           
                          
                            Image(systemName: transaction.type == .income ? "arrow.up.circle" : "arrow.down.circle")
                                .foregroundColor(transaction.type == .income ? .green : .red)
                                .padding(.leading, 10)
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text(transaction.title)
                                    .font(.title2)
                                    .foregroundColor(.white)
                                
                                Text("\(transaction.date, formatter: StringHepler.shared.shortDateFormatter)")
                                    .font(.caption)
                                    .foregroundColor(Color(.systemGray3))
                                
                            }
                            
                            Spacer()
                            
                            
                            Image(systemName: transaction.type == .income ? "plus" : "minus")
                                .foregroundColor(transaction.type == .income ? .green : .red)
                                .padding(.leading, 10)
                            
                            HStack(spacing: 5){
                                Text(String(format: "%.2f", transaction.price))
                                    .font(.title3)
                                    .foregroundColor(.white)
                                
                                Text("Rs")
                                    .font(.caption)
                                    .foregroundColor(Color(.systemGray3))
                                    .padding(.trailing, 10)
                            }

                        }
                        .frame(height: 80)
                       
                        .background(Color.background)
                        .cornerRadius(10.0)
                        .padding(.horizontal)
                    }
                   

                }
                .padding(.top)
                
                Spacer()
                
            }
            .padding(.top, 20)
            .onAppear{
                Task{
                    try? user =  await vm.getUser()
                    name = user?.firstName ?? ""
                }
            }
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
            
            homeVm.getTransactions()
        }
        .sheet(isPresented: $isAddIncomeSheetOpen){
            AddIncomeSheetView()
        }
        .sheet(isPresented: $isAddExpenseSheetOpen){
            AddExpenseSheetView()
        }
       
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
