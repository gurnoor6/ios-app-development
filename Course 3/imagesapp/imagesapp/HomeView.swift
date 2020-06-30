//
//  HomeView.swift
//  imagesapp
//
//  Created by Gurnoor Singh Khurana on 30/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var tags:[String]
    init(tags: [String]){
        self.tags = tags
        UITableView.appearance().separatorColor = .clear
    }

    
//    var categories:[String:[Drink]]{
//        .init(
//            grouping: drinkData, by: {$0.category.rawValue}
//        )
//    }
    var body: some View {
//        NavigationView{
            List(tags, id:\.self){tag in
                imageRow(category:tag)
                .frame(height:450)
                    .padding(.top)
                    .padding(.bottom)
            }
        
            
            .navigationBarTitle(Text("COFFEE DB"))
//        }.accentColor(.white)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(tags: ["puppy","bike"])
    }
}
