//
//  UpdateList.swift
//  DesingCode
//
//  Created by ryo on 2020/05/17.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @ObservedObject var store = UpdateStore()
    func addUpdate() {
        store.updates.append(Update(image: "Card6", title: "React Native for Designers", text: "Build your own iOS and Android app with custom animations, Redux and API data.", date: "FEB 14"))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.updates) { update in
                    NavigationLink(destination: UpdateDetail(update: update)) {
                        HStack {
                            Image(update.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80, height: 80)
                                .background(Color.black)
                                .cornerRadius(18)
                                .padding(.trailing, 4)
                            
                            VStack(alignment: .leading, spacing: 8.0) {
                                Text(update.title)
                                    .font(.system(size: 20, weight: .bold))
                                    .multilineTextAlignment(.leading)
                                
                                
                                Text(update.text)
                                    .lineLimit(2)
                                    .font(.subheadline)
                                    .foregroundColor(Color(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)))
                                
                                Text(update.date)
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .onDelete { index in
                    self.store.updates.remove(at: index.first!)
                }
                .onMove { (source: IndexSet, destination: Int) in
                    self.store.updates.move(fromOffsets: source, toOffset: destination)
                }
            }
            .navigationBarTitle(Text("Updataes"))
            .navigationBarItems(
                leading: Button(action: addUpdate) { Text("Add Update") },
                trailing: EditButton()
            )
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}

struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateData = [
    Update(image: "Card1", title: "SwiftUI 1", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "Jan 1"),
    Update(image: "Card2", title: "SwiftUI 2", text: "Want to test concepts using real techniques? This is the perfect course to learn design using SwiftUI.", date: "Jan 2"),
    Update(image: "Card3", title: "SwiftUI 3", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "Jan 3"),
    Update(image: "Card4", title: "SwiftUI 4", text: "Want to test concepts using real techniques? This is the perfect course to learn design using SwiftUI.", date: "Jan 4"),
    Update(image: "Card5", title: "SwiftUI 5", text: "Take your SwiftUI app to the App Store with advanced techniques like API data, packages and CMS.", date: "Jan 5")
]
