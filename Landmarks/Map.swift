//
//  Map.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import MapKit
import SwiftUI

struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }

    // 计算变量
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 34.011286, longitude: -116.166868),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}

#Preview {
    MapView()
}
