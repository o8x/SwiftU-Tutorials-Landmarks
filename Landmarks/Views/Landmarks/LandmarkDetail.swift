//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import SwiftUI

struct LandmarkDetail: View {
    @Environment(ModelData.self) var modelData
    var landmark: Landmark

    // 比较获取索引
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }

    var body: some View {
        @Bindable var modelData = modelData

        // ScrollView 是可以滚动的 VStack
        // Spacer 在此处无效
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)

            // 偏移 130 像素
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    // 横向布局，自动切换收藏状态
                    Text(landmark.name).font(.title)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }

                HStack {
                    Text(landmark.park).font(.subheadline)
                    // Spacer 展开以使其包含视图使用其父视图的所有空间
                    // 而不是仅由其内容定义其大小
                    Spacer()
                    Text(landmark.state).font(.subheadline)
                }

                Divider()

                Text("关于 \(landmark.name)").font(.title2)
                Text(landmark.description)
            }.padding()
        }
        .navigationTitle(landmark.name)
        #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
        #endif
    }
}

#Preview {
    let modelData = ModelData()

    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
}
