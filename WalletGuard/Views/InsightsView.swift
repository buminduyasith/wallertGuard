//
//  ExpensesView.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-24.
//

import SwiftUI
import Charts 

struct InsightsView: View {
    @State private var isAddExpenseOpen: Bool = false
    @State private var title: String = ""
    @ObservedObject var insightVM = InsightViewModel()
    
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           //Use this if NavigationBarTitle is with displayMode = .inline
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
       }
        
    var body: some View {
        NavigationStack{
            
            VStack{
                if(!insightVM.chartExpensesData.isEmpty){
                    VStack{
                        
                        HStack{
                            Text("Daily Spending")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.top, 50)
                        
                        Chart{
                            ForEach(insightVM.chartExpensesData) { item in
                                BarMark(x: .value("date", item.date, unit: .day), y: .value("amount", item.amount))
                                    .foregroundStyle(Color.btnPrimary)
                                    
                            }
                        }
                        .frame(height: 150)
                        .padding(.top)
                        .chartYAxis {
                            AxisMarks(
                               
                            ) {
                                AxisValueLabel()
                                    .foregroundStyle(.white)
                            }
                        }
                        .chartXAxis {
                            AxisMarks(
                               
                            ) {
                                AxisValueLabel()
                                    .foregroundStyle(.white)
                            }
                        }
                        .padding(.top)
                        
                        HStack{
                            Text("Total Spending by Category")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.white)
                        }
                        .padding(.top, 50)
                        
                        Chart{
                            ForEach(insightVM.categoryTotals) { item in
                                BarMark(x: .value("category", item.category), y: .value("amount", item.totalAmount))
                                    .foregroundStyle(Color.btnPrimary)
                                    .annotation(
                                        position: .top,
                                        alignment: .center
                                    ){
                                        Text("\(item.category)")
                                            .rotationEffect(.degrees(90))
                                            .foregroundColor(.white)
                                            .padding(.bottom, 20)
                                    }
                                    
                            }
                        }
                        .frame(height: 150)
                       
                        .chartYAxis {
                            AxisMarks(
                               
                            ) {
                                AxisValueLabel()
                                    .foregroundStyle(.white)
                            }
                        }
                        .chartXAxis {
                            
                        }
                        .padding(.top, 100)
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.black)
                    //.navigationTitle("Insights")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .onAppear{
                Task{
                    
                   await insightVM.getTransactions()
                }
            }
            .overlay{
                if(insightVM.chartExpensesData.isEmpty){
                    Text("No data found")
                        .foregroundColor(.white)
                }
            }
        }

    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
    }
}
