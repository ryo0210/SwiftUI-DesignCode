//
//  HomeView.swift
//  DesingCode
//
//  Created by ryo on 2020/05/17.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 38, weight: .bold))
                        //.modifier(CustomFontModifier(size: 38))
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .foregroundColor(Color.primary)
                            .font(.system(size: 20, weight: .medium))
                            .frame(width: 38, height: 38)
                            .background(Color("background3"))
                            .clipShape(Circle())
                            .modifier(ShadowModifier())
                    }
                    .sheet(isPresented: $showUpdate) {
                        UpdateList()
                    }
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    WatchRingsView()
                        .padding(.horizontal, 30)
                        .padding(.bottom, 10)
                        .onTapGesture {
                            self.showContent = true
                    }
                }
                .offset(y: -20)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(sectionData) { item in
                            // GeometryReaderはビューの位置やサイズを検出するのに最適
                            // スクロールするとカードのminX(左端)の値が変わる。
                            // minXは急激に値が変化するので20で割って、変化量を抑えている。-30はパディング用
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20
                                    ), axis: (x: 10.0, y: 10.0, z: 10.0))
                            }
                            .frame(width: 275, height: 275)
                        }
                    }
                    .padding(30)
                    //.padding(.horizontal, 30)
                    .padding(.bottom, 30)
                }
                .offset(y: -60)
                
                HStack {
                    Text("Courses")
                        .font(.title).bold()
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -70)
                
                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
                .offset(y: -70)
                
                Spacer()
            }
            .frame(width: screen.width)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showProfile: .constant(false), showContent: .constant(false))
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 275
    var height: CGFloat = 275
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.5), radius: 20, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let sectionData = [
    Section(title: "Prototype", text: "18 section", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card2")), color: Color("card1")),
    Section(title: "Prototype", text: "18 section", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Section(title: "Prototype", text: "18 section", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))),
    Section(title: "Prototype", text: "18 section", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Card4")), color: Color(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1))),
    
]


struct WatchRingsView: View {
    var body: some View {
        HStack(spacing: 30) {
            HStack {
                RingView(color1: #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1), color2: #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), circleWidth: 50, circleHeight: 50, percent: 68, show: .constant(true))
                VStack(alignment: .leading, spacing: 4.0) {
                    Text("6 minutes left").bold().modifier(FontModifier(style: .subheadline))
                    Text("Watched 10 mins today").font(.caption).modifier(FontModifier(style: .caption))
                }
                .padding(.horizontal, 8)
                .modifier(FontModifier())
            }
            .padding(14)
            .background(Color("background3"))
            .cornerRadius(50)
            .frame(width: 250, height: 100.0)
            .modifier(ShadowModifier())
            
            HStack {
                RingView(color1: #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1), color2: #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), circleWidth: 50, circleHeight: 50, percent: 88, show: .constant(true))
            }
            .padding(14)
            .background(Color("background3"))
            .cornerRadius(50)
            .frame(height: 100.0)
            .modifier(ShadowModifier())
            
            HStack {
                RingView(color1: #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1), color2: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), circleWidth: 50, circleHeight: 50, percent: 58, show: .constant(true))
            }
            .padding(14)
            .background(Color("background3"))
            .cornerRadius(50)
            .frame(height: 100.0)
            .modifier(ShadowModifier())
        }
    }
}
