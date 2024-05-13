/*
 See the LICENSE.txt file for this sample’s licensing information.

 Abstract:
 A view displaying information about a hike, including an elevation graph.
 */

import SwiftUI

extension AnyTransition {
//    static var moveAndFade: AnyTransition {
    ////        AnyTransition.slide
//        AnyTransition.move(edge: .trailing)
//    }
    // 继承和修改动画过程
    static var moveAndFade: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .scale.combined(with: .opacity)
        )
    }
}

struct HikeView: View {
    var hike: Hike
    @State private var showDetail = false

    var body: some View {
        VStack {
            HStack {
                HikeGraph(hike: hike, path: \.elevation)
                    .frame(width: 50, height: 30)

                VStack(alignment: .leading) {
                    Text(hike.name)
                        .font(.headline)
                    Text(hike.distanceText)
                }

                Spacer()

                Button {
                    // 受影响的两个视图，将都会出现动画
                    // withAnimation(.easeInOut(duration: 0.2)) {
                    withAnimation {
                        showDetail.toggle()
                    }
                } label: {
                    Label("Graph", systemImage: "chevron.right.circle")
                        .labelStyle(.iconOnly)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        // 禁用动画
                        // .animation(nil, value: showDetail)
                        // 按钮旋转动画
                        // .animation(.easeInOut, value: showDetail)
                        // .animation(.spring(), value: showDetail)
                        .padding()
                }
            }

            if showDetail {
                HikeDetail(hike: hike)
                    // 定义动画形态
                    // .transition(.slide)
                    .transition(.moveAndFade)
            }
        }
    }
}

#Preview {
    VStack {
        HikeView(hike: ModelData().hikes[0])
            .padding()
        Spacer()
    }
}
