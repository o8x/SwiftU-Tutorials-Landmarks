//
//  CircleImage.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        // clipShape 裁剪成圆形
        // Circle 类型是一种形状，可以用作遮罩也可以用作视图
        image
            .clipShape(Circle())
            .overlay {
                // 将一个白色，宽度4的圆环视图覆盖在上面
                Circle().stroke(.white, lineWidth: 4)
            }
            // 阴影，半径
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image("turtlerock"))
        .frame(width: 388, height: 844)
}
