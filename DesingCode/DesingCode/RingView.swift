//
//  RingView.swift
//  DesingCode
//
//  Created by ryo on 2020/05/17.
//  Copyright © 2020 ryo. All rights reserved.
//

import SwiftUI

struct RingView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5))
                .frame(width: 44, height: 44)
            Circle()
                .trim(from: 0.2, to: 1)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)), Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0)
            )
            // 3時の方向からfrom: 0.2だけ欠けた状態で描画される。なので90度回転させることで6時から8時まで欠けている状態にする。
            //そして、degrees: 180で表裏をひっくり返し、円形のプログレスバーを描画している。
            .rotationEffect(Angle(degrees: 90))
            .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
            .frame(width: 44, height: 44)
                .shadow(color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)).opacity(0.1), radius: 3, x: 0, y: 3)
            
            Text("80%")
                .font(.subheadline)
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView()
    }
}
