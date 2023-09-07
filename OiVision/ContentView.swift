//
//  ContentView.swift
//  OiVision
//
//  Created by Patrick Choi on 9/5/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAboutView = false
    @State private var isShowingActionView = false
    var body: some View {
            VStack {
            Text("**OI VISION**")
            NavigationView{
                VStack{
                    Spacer()
                    Image("recLogo") // Replace "yourImageAssetName" with the actual name of your image asset
                        .resizable() // Allows the image to be
                        .aspectRatio(contentMode: .fit) //
                        .frame(width: 370, height: 370) //
                    
                    NavigationLink("",destination: ActionView(), isActive: $isShowingActionView)
                    NavigationLink("",destination: aboutView(), isActive: $isShowingAboutView)
                    
                    Button(action: {isShowingActionView = true}) {
                        Text("START")
                            .font(.system(size: 30))
                            .padding()
                            .padding(.horizontal,46)
                            .background(Color.customOrange
                            .cornerRadius(20))
                            .foregroundColor(Color.black)
                    }
                    
                    Button(action: {isShowingAboutView = true}) {
                        Text("README")
                            .font(.system(size: 30))
                            .padding()
                            .padding(.horizontal,40)
                            .background(Color.customOrange
                            .cornerRadius(20))
                            .foregroundColor(Color.black)
                    }
                    
                    Spacer()
                    Text("Developed by Oi Creation")
                }
            }
        }.background(Color.customOrange)
    }
}

extension Color {
    static let customOrange = Color(
        red: Double(255) / 255.0,
        green: Double(144) / 255.0,
        blue: Double(0) / 255.0
    )
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
