//
//  DrinkItem.swift
//  myapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//
import SwiftUI

struct imageItem: View {
    var item: myItem
    
    var body: some View {
        ScrollView{
            AsyncImage(url: URL(string: item.media.m.replacingOccurrences(of: "\\", with: ""))!, placeholder: Text("ColdBrew")
                )
            .aspectRatio(contentMode: .fill)
            .frame(width:300,height: 300)
            .cornerRadius(10)
            .shadow(radius: 10)
            
            VStack(alignment: .leading, spacing: 5){
                Text(item.title)
                    .font(.system(size: 25, weight: .bold, design: .default))
                    .foregroundColor(.primary)
                Text(item.description)
                    .font(.system(size: 20, design: .default))
                    .foregroundColor(.primary) .multilineTextAlignment(.leading)
                .lineLimit(2)
                    .frame(height: 40)
            }
        }
        
    }
}

struct DrinkItem_Previews: PreviewProvider {
    static var previews: some View {
        imageItem(item:myItem(title: "hello world", link: "bcd", media: Media(m: "https:\\/\\/live.staticflickr.com\\/65535\\/50058717026_0d1faa1b1e_m.jpg"), dateTaken: "tot", description: "nothing", published: "wat", author: "wat", authorId: "wat", tags: "kitten"))
    }
}
