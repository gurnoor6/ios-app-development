//
//  DrinkItem.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct DrinkItem: View {
    var drink:Drink
    
    var body: some View {
        VStack(alignment: .leading, spacing:16) {
            Image(drink.imageName)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(width:300,height: 300)
            .cornerRadius(10)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 5){
                Text(drink.name)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text(drink.description)
                    .font(.subheadline)
                    .foregroundColor(.primary) .multilineTextAlignment(.leading)
                .lineLimit(2)
                    .frame(height: 40)
            }
        }
        
    }
}

struct DrinkItem_Previews: PreviewProvider {
    static var previews: some View {
        DrinkItem(drink:drinkData[0])
    }
}
