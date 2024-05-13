//
//  ContentView.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import SwiftUI

struct ContentView: View {
    enum Tab {
        case featured
        case list
    }

    @State private var selection: Tab = .featured

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

#Preview {
    // 注入环境，使任何预览都可用
    ContentView()
        .environment(ModelData())
}
