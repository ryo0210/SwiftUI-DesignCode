//
//  CourseStore.swift
//  DesingCode
//
//  Created by ryo on 2020/05/20.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI
import Contentful
import Combine

let client = Client(spaceId: "h6vewqcaogor", accessToken: "LdGjhuQLt1aa3DiYEq3sdO3zp_HSlLKgmP28Jj8GFUE")

func getArray(id: String, completion: @escaping([Entry]) -> ()) {
    let query = Query.where(contentTypeId: id)
    
    client.fetchArray(of: Entry.self, matching: query) { result in
        switch result {
        case .success(let array):
            DispatchQueue.main.async {
                completion(array.items)
            }
        case .error(let error):
            print(error)
        }
    }
}

class CourseStore: ObservableObject {
    @Published var courses: [Course] = courseData
    
    init() {
        let colors = [#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1), #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)]
        
        getArray(id: "course") { (items) in
            items.forEach { (item) in
                self.courses.append(Course(
                    title: item.fields["title"] as! String,
                    subtitle: item.fields["subtitle"] as! String,
                    image: item.fields.linkedAsset(at: "image")?.url ?? URL(string: "")!,
                    logo: #imageLiteral(resourceName: "Logo1"),
                    color: colors.randomElement()!,
                    show: false))
            }
        }
    }
}
