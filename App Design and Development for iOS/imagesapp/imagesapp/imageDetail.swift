//
//  imageDetail.swift
//  imagesapp
//
//  Created by Gurnoor Singh Khurana on 30/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct imageDetail: View {
    var item : myItem
    var body: some View {
        List{
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: item.media.m.replacingOccurrences(of: "\\", with: ""))!, placeholder: Text("Loading..").frame(width:300, height:300)
                )
                .aspectRatio(contentMode: .fit)
                Rectangle()
                    .frame(height:80)
                    .opacity(0.35)
                .blur(radius: 10)
                HStack{
                    VStack(alignment: .leading, spacing: 8){
                        Text(item.title)
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
                Text(item.description)
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
        imageDetail(item:myItem(title: "hello world", link: "bcd", media: Media(m: "https:\\/\\/live.staticflickr.com\\/65535\\/50058717026_0d1faa1b1e_m.jpg"), dateTaken: "tot", description: "nothing", published: "wat", author: "wat", authorId: "wat", tags: "kitten"))
    }
}
