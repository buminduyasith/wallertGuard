//
//  Home.swift
//  WalletGuard
//
//  Created by bumindu yasith on 2023-09-26.
//

import SwiftUI
import FirebaseAuth

struct Home: View {
    @ObservedObject var vm = UserViewModel()
    @State var name = "red"
    @State var user : User? = nil
    init() {
           //Use this if NavigationBarTitle is with Large Font
           UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           //Use this if NavigationBarTitle is with displayMode = .inline
           UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
       }

    var body: some View {
       
        NavigationStack{
            VStack{
                
                
            }
            .onAppear{
                Task{
                    try? user =  await vm.getUser()
                    name = user?.firstName ?? ""
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.background)
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
       
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
