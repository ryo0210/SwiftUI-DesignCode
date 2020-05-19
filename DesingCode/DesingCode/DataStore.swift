//
//  DataStore.swift
//  DesingCode
//
//  Created by ryo on 2020/05/19.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI
import Combine

class DataStore: ObservableObject {
    @Published var posts: [Post] = []
    
    init() {
         getPost()
    }
    
    func getPost() {
        Api().getPosts { (posts) in
            self.posts = posts
        }
    }
}
