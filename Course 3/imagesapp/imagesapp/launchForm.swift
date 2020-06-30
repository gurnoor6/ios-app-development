//
//  launchForm.swift
//  imagesapp
//
//  Created by Gurnoor Singh Khurana on 30/06/20.
//  Copyright © 2020 Gurnoor Singh Khurana. All rights reserved.
//

import SwiftUI

struct launchForm: View {
    @State var t1=""
    @State var t2=""
    @State var t3=""
    
    @State var number = 1
    var body: some View {
        NavigationView{
            Form{
//                Stepper(value : $number, in: 1...5){
//                    Text("\(number) tag\(number>1 ? "s" : "")")
//                }
//
//                List(0..<number){n in
//                    TextField("hello world", text:self.$email[n])
//                }
                
                TextField("Tag 1", text:self.$t1)
                TextField("Tag 2", text:self.$t2)
                TextField("Tag 3", text:self.$t3)
                
                NavigationLink(destination: HomeView()){
                    Text("Submit")
                }
            }
        }
    }
}

struct launchForm_Previews: PreviewProvider {
    static var previews: some View {
        launchForm()
    }
}
