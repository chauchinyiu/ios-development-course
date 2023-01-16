//
//  ContentView.swift
//  SwiftUI-Course
//
//  Created by Chinyiu Chau on 31.10.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8.0) {
            Circle()
                .frame(width: 100.0, height: 100.0)
                .foregroundColor(Color.yellow)
            
          
            Text("SwiftUI for iOS 16")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.leading)
                .frame(width: 300.0)
                .hoverEffect(/*@START_MENU_TOKEN@*/.automatic/*@END_MENU_TOKEN@*/)
             
            Text("it-e courses")
            
            
            Button(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/) {
                print("click")
            }
          
        }
        .padding(.all)
        .background(Color.purple)
        .cornerRadius(20.0)
        .opacity(0.9)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
