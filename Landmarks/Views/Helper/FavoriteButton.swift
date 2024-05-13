//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/7.
//

import SwiftUI

struct FavoriteButton: View {
    // Binding 包装器允许存储数据的属性，并在显示和更改数据的视图之间进行读取和写入
    // 由于您使用绑定，在此视图中所做的更改会传播回数据源。
    @Binding var isSet: Bool

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite", systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundStyle(isSet ? .yellow : .gray)
        }
    }
}

#Preview {
    FavoriteButton(isSet: .constant(true))
}
