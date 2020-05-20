//
//  CourseStore.swift
//  DesingCode
//
//  Created by ryo on 2020/05/20.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI
import Contentful

let client = Client(spaceId: "h6vewqcaogor", accessToken: "LdGjhuQLt1aa3DiYEq3sdO3zp_HSlLKgmP28Jj8GFUE")

func getArray() {
    let query = Query.where(contentTypeId: "course")
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        print(result)
    }
}
