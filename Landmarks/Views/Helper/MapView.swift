//
//  MapView.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import MapKit
import SwiftUI

struct MapView: View {
    var coordinate: CLLocationCoordinate2D

    var body: some View {
        // position 绑定到.constant()接受位置的更改并自动重新渲染
        // initialPosition 仅在初始化时更新位置
        // Map(initialPosition: .region(region))
        Map(position: .constant(.region(region)))
    }

    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: coordinate,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868))
}
