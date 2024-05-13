//
//  LandmarksList.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import SwiftUI

struct LandmarkList: View {
    // @Environment 包装器允许您读取当前视图的模型数据
    @Environment(ModelData.self) var modelData
    @State private var showFavoritesOnly = false

    // 判断是否只显示收藏项目
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            !showFavoritesOnly || landmark.isFavorite
        }
    }

    var body: some View {
        NavigationSplitView {
            // 自定义的 List 样式
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites only")
                }

                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            // 数据增减动画
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")

            // 遍历
            // 如果 landmarks 没有实现 Identifiable，则需要增加 id: \.id 参数
            // 实现之后将会直接变为集合
            // 标准 List
            // List(landmarks) { landmark in
            // List(filteredLandmarks) { landmark in
            //    // 在 NavigationLink 循环 List
            //    // 点击 Label 时将会自动渲染 Detail
            //    // 大括号实质上是一种闭包
            //    NavigationLink {
            //        LandmarkDetail(landmark: landmark)
            //    } label: {
            //        LandmarkRow(landmark: landmark)
            //    }
            // }
            // .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    // 传递环境数据
    LandmarkList()
        .environment(ModelData())
        .frame(width: 388, height: 844)
}
