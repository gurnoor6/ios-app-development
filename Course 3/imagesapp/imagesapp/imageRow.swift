//
//  imageRow.swift
//  imagesapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct imageRow: View {
    var category:String
    @State var items:[myItem] = []
    var body: some View {
            VStack(alignment: .leading) {
                Text(self.category.uppercased())
                    .font(.system(size: 40, weight: .heavy, design: .default))
                            .foregroundColor(.primary)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(alignment: .top) {
                                ForEach(self.items, id: \.id){
                                    item in
                                    
                                    NavigationLink(destination: imageDetail(item:item)){
                                        imageItem(item:item)
                                            .frame(width:300)
                                            .padding(.trailing,30)
                                        }
                                }
                            }.onAppear{
                                Api().getPosts(url:"https://api.flickr.com/services/feeds/photos_public.gne?tags=\(self.category)&format=json&nojsoncallback=1",completion: {
                                    (posts) in self.items = posts
                                })
                            }
                        }
            }.padding(.leading, 20)
    }
}

struct imageRow_Previews: PreviewProvider {
    static var previews: some View {
        imageRow(category: "kitten")
    }
}
