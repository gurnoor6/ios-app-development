//
//  ContentView.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct HomeView: View {
@State var kittenData:[Item] = []
    init(){
        UITableView.appearance().separatorColor = .clear
        Api().getPosts(completion: {
            posts in
            self.kittenData = posts
        })
    }
    
    
    var categories:[String:[Drink]]{
        .init(
            grouping: drinkData, by: {$0.category.rawValue}
        )
    }
    
    
    var body: some View {
        NavigationView{
            
        DrinkRow(categoryName: "Kittens".uppercased(), kittens: kittenData)
        .frame(height:450)
        .padding(.top)
        .padding(.bottom)
            
        .navigationBarTitle(Text("COFFEE DB"))
        }.accentColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
