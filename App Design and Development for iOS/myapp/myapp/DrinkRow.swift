//
//  DrinkRow.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct DrinkRow: View {
    var categoryName:String
    var drinks:[Drink]
    var body: some View {

            VStack(alignment: .leading) {
                    Text(self.categoryName)
                        .font(.title)
                        .foregroundColor(.primary)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top) {
                            ForEach(self.drinks, id: \.name){
                                drink in
                                
                                NavigationLink(destination: DrinkDetail(drink : drink)){
                                    DrinkItem(drink:drink)
                                        .frame(width:300)
                                        .padding(.trailing,30)
                                    }
                            }
                                    
                                
                                
                        }
                    }
            }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow(categoryName: "Hot Drinks", drinks: drinkData)
    }
}
