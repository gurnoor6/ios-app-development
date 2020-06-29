//
//  ContentView.swift
//  imagesapp
//
//  Created by Gurnoor Singh Khurana on 29/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    let url = URL(string: "https://live.staticflickr.com/65535/50058717026_0d1faa1b1e_m.jpg")!
//    @State var posts:[myItem] = []
    var body: some View {
//        List(posts, id:\.id){post in
//            Text(post.title)
//            AsyncImage(
//                url: self.url,
//                placeholder: Text("Loading ...")
//            ).aspectRatio(contentMode: .fit)
//        }
//
//
//        .onAppear{
//            Api().getPosts{
//                (posts) in self.posts = posts
//            }
//        }
        
         HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
