//
//  imageRow.swift
//  imagesapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct DrinkRow: View {
//    var categoryName:String
    @State var items:[myItem] = []
    var body: some View {

        VStack(alignment: .leading) {
                    Text("self.categoryName")
                        .font(.title)
                        .foregroundColor(.primary)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(alignment: .top) {
                            ForEach(self.items, id: \.id){
                                item in
                                
//                                NavigationLink(destination: DrinkDetail(item : item)){
                                    imageItem(item:item)
                                        .frame(width:300)
                                        .padding(.trailing,30)
//                                    }
                            }
                        }.onAppear{
                            Api().getPosts(completion: {
                                (posts) in self.items = posts
                            })
                        }
                    }
            }
    }
}

struct DrinkRow_Previews: PreviewProvider {
    static var previews: some View {
        DrinkRow()
    }
}
