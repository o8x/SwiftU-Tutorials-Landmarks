//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 30, height: 30)

            Text(landmark.name)
            Spacer()
            // 被分隔到最右侧
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
    }
}

// 当 preview 不止存在视图语句时，需要显示使用 return 进行视图的返回
#Preview {
    let landmarks = ModelData().landmarks

    return Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
    }
}

#Preview("Salmon") {
    let landmarks = ModelData().landmarks

    return LandmarkRow(landmark: landmarks[1])
}
