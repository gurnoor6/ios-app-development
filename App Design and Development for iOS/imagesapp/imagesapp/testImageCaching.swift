//
//  testView.swift
//  imagesapp
//
//  Created by Gurnoor Singh Khurana on 30/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct testView: View {
    var body: some View {
        NavigationView{
            VStack {
                AsyncImage(url: URL(string: "https:\\/\\/live.staticflickr.com\\/65535\\/50058717026_0d1faa1b1e_m.jpg".replacingOccurrences(of: "\\", with: ""))!, placeholder: Text("Loading..").frame(width:300, height:300)
                )
                    .aspectRatio(contentMode: .fit)
                NavigationLink(destination: Text("hiiii")){
                    Text("go from heer")
                }
            }
            
            
        }
        
    }
}

struct testView_Previews: PreviewProvider {
    static var previews: some View {
        testView()
    }
}
