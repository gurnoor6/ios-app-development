//
//  DrinkItem.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct DrinkItem: View {
    var kitten:Item
    
    var body: some View {
        VStack(alignment: .leading, spacing:16) {
            Image(kitten.media.m)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(width:300,height: 300)
            .cornerRadius(10)
                .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 5){
                Text(kitten.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                Text("no description available for this kitten")
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
        DrinkItem(kitten:kittenData[0])
    }
}
