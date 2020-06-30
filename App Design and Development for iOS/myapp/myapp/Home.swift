//
//  ContentView.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    init(){
        UITableView.appearance().separatorColor = .clear
    }
    
    
    var categories:[String:[Drink]]{
        .init(
            grouping: drinkData, by: {$0.category.rawValue}
        )
    }
    
    
    var body: some View {
        NavigationView{
        List(categories.keys.sorted(), id:\String.self){
                key in
                DrinkRow(categoryName: "\(key)Drinks".uppercased(), drinks: self.categories[key]!)
                    .frame(height:450)
                    .padding(.top)
                    .padding(.bottom)
                
            }
        .navigationBarTitle(Text("COFFEE DB"))
        }.accentColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
