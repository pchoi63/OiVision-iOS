//
//  aboutView.swift
//  OiVision
//
//  Created by Patrick Choi on 9/5/23.
//

import SwiftUI

struct aboutView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                
                Text("**README**")
                    .font(.system(size: 30))
                    .padding()
                    .background(Color.customOrange)
                    .cornerRadius(20)
                
                Image("justlogo") // Replace "yourImageAssetName" with the actual name of your image asset
                    .resizable() // Allows the image to be
                    .aspectRatio(contentMode: .fit) //
                    .frame(width: 350, height: 350) //
                
                Text("**Oi Vision**\nDeveloped by Oi Creation combining cutting-edge text recognition technology.Oi Vision**\nDeveloped by Oi Creation combining cutting-edge text recognition technology")
                    .padding()
                    .background(Color.customOrange)
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity)
                
                Text("**Recognize Text**\nOi Vision take image either from capturing or uploading images from users. With ***Apple Vision*** technology, Oi Vision is able to recognize texts from the given image")
                    .padding()
                    .background(Color.customOrange)
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity)
                
                
                Text("**Oi Vision** empowers you to understand and interact with text in various ways, making travel, business, and everyday life more accessible and enjoyable.")
                    .padding()
                    .background(Color.customOrange)
                    .cornerRadius(20)
                    .frame(maxWidth: .infinity)
            }
        }
        
    }
}

struct aboutView_Previews: PreviewProvider {
    static var previews: some View {
        aboutView()
    }
}
