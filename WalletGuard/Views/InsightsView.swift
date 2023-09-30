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
    
    
    
    let dummyData: [CategeoryExpensesDto] = [
        CategeoryExpensesDto(category: "Food", amount: 3000.0, date: Date.from(year: 2023, month: 8, date: 20)),
        CategeoryExpensesDto(category: "Transportation", amount: 1500.0, date:  Date.from(year: 2023, month: 9, date: 1)),
        CategeoryExpensesDto(category: "Entertainment", amount: 2000.0, date: Date.from(year: 2023, month: 9, date: 15)),
        CategeoryExpensesDto(category: "Utilities", amount: 120.0, date: Date.from(year: 2023, month: 9, date: 21)),
        CategeoryExpensesDto(category: "Healthcare", amount: 705.0, date: Date.from(year: 2023, month: 9, date: 22)),
        CategeoryExpensesDto(category: "Shopping", amount: 2500.0, date: Date.from(year: 2023, month: 9, date: 23)),
    ]

    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           //Use this if NavigationBarTitle is with displayMode = .inline
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
       }

    var body: some View {
        NavigationStack{
            VStack{
                
                
                Chart{
                    ForEach(dummyData) { item in
                        BarMark(x: .value("date", item.date), y: .value("amount", item.amount))
                            .foregroundStyle(Color.btnPrimary)
                            
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
                    AxisMarks(
                       
                    ) {
                        AxisValueLabel()
                            .foregroundStyle(.white)
                    }
                }
                .padding(.top,50)
                
                
                Chart{
                    ForEach(dummyData) { item in
                        BarMark(x: .value("category", item.category), y: .value("amount", item.amount))
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
                .padding(.top,50)
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
            .navigationTitle("Insights")
        }
    }
}

struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        InsightsView()
    }
}
