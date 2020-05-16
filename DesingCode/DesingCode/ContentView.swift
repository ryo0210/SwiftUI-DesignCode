//
//  ContentView.swift
//  DesingCode
//
//  Created by ryo on 2020/05/16.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            BackCardView()
                .background(Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 10)
                .offset(x: 0, y: show ? -400 : -60)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotation3DEffect(Angle(degrees: 10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                //.animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
                //.animation(.easeInOut(duration: 0.5))
                .animation(.easeOut(duration: 0.3))
            
            BackCardView()
                .background(Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 10)
                .offset(x: 0, y: show ? -200 : -30)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(.degrees(show ? 0 : 5))
                .rotation3DEffect(Angle(degrees: 5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                //.animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
                //.animation(.easeInOut(duration: 0.5))
                .animation(.easeOut(duration: 0.3))
            
            CardView()
                .offset(x: viewState.width, y: viewState.height)
                //.blendMode(.hardLight)
                .animation(.spring())
                .onTapGesture {
                    self.show.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                    self.show = true
                }
                .onEnded { value in
                    self.viewState = .zero
                    self.show = false
                }
            )
            
            ButtomCardView()
                .blur(radius: show ? 20: 0)
                .animation(.default)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
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
        .background(Color(red: 0.3, green: 0.32, blue: 0.38))
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(width: 340, height: 220)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certifivcates")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()
            Image("Background1")
            Spacer()
        }
    }
}

struct ButtomCardView: View {
    var body: some View {
        VStack(spacing: 16) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.3)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .multilineTextAlignment(.leading)
                .font(.subheadline)
                .lineSpacing(7)
            Spacer()
            
        }
            //.padding()
            .padding(.top, 10)
            .padding(.horizontal, 16)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(30)
            .shadow(radius: 20)
            .offset(x: 0, y: 500)
    }
}
