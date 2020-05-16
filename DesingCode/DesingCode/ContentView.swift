//
//  ContentView.swift
//  DesingCode
//
//  Created by ryo on 2020/05/16.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
            }
            .frame(width: 340, height: 220)
            .background(Color.blue)
            .cornerRadius(20)
            .shadow(radius: 10)
            .offset(x: 0, y: -20)
            
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("UI Desing")
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(Color.white)
                        Text("Certificate")
                            .foregroundColor(Color("accent"))
                    }
                    Spacer()
                    Image("Logo1")
                }
                .padding(.horizontal)
                .padding(.top)
                Spacer()
                Image("Card1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 110, alignment: .top)
            }
            .frame(width: 340.0, height: 220.0)
            .background(Color(red: 0.33, green: 0.33, blue: 0.34))
            .cornerRadius(20)
            .shadow(radius: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
