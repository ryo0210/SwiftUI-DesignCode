//
//  UpdateStore.swift
//  DesingCode
//
//  Created by ryo on 2020/05/17.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    // @Published: ObservableObjectプロトコルを使い定義して変更が必要な変数には
    @Published var updates: [Update] = updateData
}
