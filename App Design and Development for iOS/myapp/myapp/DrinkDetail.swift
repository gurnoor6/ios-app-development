//
//  DrinkDetail.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct DrinkDetail: View {
    var drink : Drink
    var body: some View {
        List{
            ZStack(alignment: .bottom) {
                Image(drink.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height:80)
                    .opacity(0.35)
                .blur(radius: 10)
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text(drink.name)
                        .font(.largeTitle)
                    .foregroundColor(.white)
                    }
                    .padding(.leading)
                    .padding(.bottom)
                    Spacer()
                }
            }
            
            .listRowInsets(EdgeInsets())
            
            VStack {
                Text(drink.description)
                .foregroundColor(.primary)
                .font(.body)
                .lineLimit(nil)
                    .lineSpacing(12)
                
                HStack{
                    Spacer()
                    OrderButton()
                    Spacer()
                }.padding(.top,25)
            }.padding(.top)
                .padding(.bottom)
        }
       
        .edgesIgnoringSafeArea(.top)
    .navigationBarHidden(true)
        
    }
}

struct OrderButton: View{
    var body: some View{
        Button(action:{}){
            Text("Order Now")
            .frame(width:200,height:50)
            .font(.headline)
            .foregroundColor(.white)
            .background(Color.black)
            }
    .buttonStyle(PlainButtonStyle())
        .cornerRadius(10)
    }
}

struct DrinkDetail_Previews: PreviewProvider {
    static var previews: some View {
        DrinkDetail(drink: drinkData[3])
    }
}
