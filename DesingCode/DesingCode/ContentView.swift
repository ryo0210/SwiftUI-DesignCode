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
    @State var showCard = false
    @State var bottomState = CGSize.zero
    @State var showFull = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
                .opacity(showCard ? 0.4 : 1)
                .offset(y: showCard ? -200 : 0)
                .animation(
                    Animation
                        .default
                        .delay(0.1)
//                        .speed(2)
//                        .repeatForever(autoreverses: true)
            )
            
            BackCardView()
                .frame(width: showCard ? 300 : 340, height: 220)
                .background(show ? Color("card3") : Color("card4"))
                .cornerRadius(20)
                .shadow(radius: 10)
                .offset(x: 0, y: show ? -400 : -60)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -180 : 0)
                .scaleEffect(showCard ? 1 : 0.9)
                .rotationEffect(.degrees(show ? 0 : 10))
                .rotationEffect(Angle(degrees: showCard ? -10 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 10), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                //.animation(.spring(response: 0.5, dampingFraction: 0.8, blendDuration: 0))
                //.animation(.easeInOut(duration: 0.5))
                .animation(.easeOut(duration: 0.3))
            
            BackCardView()
                .frame(width: 340, height: 220)
                .background(show ? Color("card4") : Color("card3"))
                .cornerRadius(20)
                .shadow(radius: 10)
                .offset(x: 0, y: show ? -200 : -30)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -140 : 0)
                .scaleEffect(showCard ? 1 : 0.95)
                .rotationEffect(Angle.degrees(show ? 0 : 5))
                .rotationEffect(Angle(degrees: showCard ? -5 : 0))
                .rotation3DEffect(Angle(degrees: showCard ? 0 : 5), axis: (x: 10.0, y: 0, z: 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.3))
            
            CardView()
                .frame(width: showCard ? 375 : 340.0, height: 220.0)
                .background(Color(red: 0.3, green: 0.32, blue: 0.38))
                //.cornerRadius(20)
                .clipShape(RoundedRectangle(cornerRadius: showCard ? 30 : 20, style: .continuous))
                .shadow(radius: 10)
                .offset(x: viewState.width, y: viewState.height)
                .offset(y: showCard ? -100 : 0)
                //.blendMode(.hardLight)
                .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showCard.toggle()
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
            
            //Text("\(self.bottomState.height / 1000)value").offset(y: -300)
            
            BottomCardView()
                .offset(x: 0, y: showCard ? 360 : 1000)
                .offset(y: bottomState.height)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.1, 1, 0.1, 1, duration: 1))
            .gesture(
                DragGesture().onChanged { value in
                    self.bottomState = value.translation
                    
                    // BottomCardをshowFullの状態でドラッグした時に、bottomState.heightが戻らないように
                    if self.showFull {
                        self.bottomState.height += -300
                    }
                    if self.bottomState.height < -300 {
                        self.bottomState.height = ((self.bottomState.height / 20)  - 300)
                    }
                }
                .onEnded { value in
                    if self.bottomState.height > 50 {
                        self.showCard = false
                    }
                    if (self.bottomState.height < -30 && !self.showFull) || (self.bottomState.height < -270 && self.showFull) {
                        self.bottomState.height = -300
                        self.showFull = true
                    } else {
                        self.bottomState = .zero
                        self.showFull = false
                    }
                }
            )
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
                    Text("UI Design")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
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
    }
}

struct BackCardView: View {
    var body: some View {
        VStack {
            Spacer()
        }
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
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

struct BottomCardView: View {
    var body: some View {
        VStack(spacing: 16) {
            Rectangle()
                .frame(width: 40, height: 5)
                .cornerRadius(3)
                .opacity(0.3)
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
                .font(.system(size: 18))
                .fontWeight(.medium)
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
            .cornerRadius(15)
            .shadow(radius: 20)
    }
}
