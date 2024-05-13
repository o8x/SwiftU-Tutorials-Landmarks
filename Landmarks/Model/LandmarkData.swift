//
//  Landmark.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import CoreLocation
import Foundation
import SwiftUI

// 添加Codable一致性可以更轻松地在结构和数据文件之间移动数据
// 依靠Codable协议Decodable组件从文件中读取数据
// 属性名称与 json key 一致
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    var isFeatured: Bool


    // 首页大图
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }

    // 图像视图
    private var imageName: String
    var image: Image {
        Image(imageName)
    }

    // 经纬度
    private var coordinates: Coordinates
    // 对于和MapKit框架交互很有用
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
