//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            // 手机机型           状态栏高度    顶部安全区域
            // iPhone 15/14 Pro     54          59
            // iPhone 14/13/12      47          47
            // iPhone 13/12 mini    50          50
            ContentView()
                .environment(modelData)
//                .frame(minWidth: 388, minHeight: 844 - 50)
        }
    }
}
