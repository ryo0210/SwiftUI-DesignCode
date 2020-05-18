//
//  Home.swift
//  DesingCode
//
//  Created by ryo on 2020/05/17.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    @State var showContent = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            HomeView(showProfile: $showProfile, showContent: $showContent)
                .padding(.top, 20)
                .background(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8392156863, green: 0.8431372549, blue: 0.8901960784, alpha: 1)), Color.white]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                        Spacer()
                    }
                    .background(Color.white)
                )
                
                .clipShape(RoundedRectangle(cornerRadius: showProfile ? 30 : 0, style: .continuous))
                //.clipShape(BottomCardView(bottom: 30))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                }
                .onEnded { value in
                    if self.viewState.height > 100 {
                        self.showProfile = false
                    }
                    self.viewState = .zero
                }
            )
            
            if showContent {
                Color.white.edgesIgnoringSafeArea(.all)
                
                ContentView()
                
                VStack {
                    HStack {
                        Spacer()
                        Image(systemName: "xmark")
                            .frame(width: 36, height: 36)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    .padding(.top, 16)
                    .padding(.trailing, 16)
                    
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                .onTapGesture {
                    self.showContent = false
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: { self.showProfile.toggle() }) {
            Image("kirby")
                .renderingMode(.original)
                .resizable()
                //.aspectRatio(contentMode: .fill)
                .frame(width: 38, height: 38)
                .clipShape(Circle())
        }
    }
}

let screen = UIScreen.main.bounds
