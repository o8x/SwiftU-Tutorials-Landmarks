//
//  Model.swift
//  Landmarks
//
//  Created by 李哲 on 2024/5/6.
//

import Foundation

// 观察者
// 一种在基础数据发生变化时向观察者发出通知的类型
// 仅当可观察属性发生变化并且视图主体直接读取该属性时，SwiftUI才会更新视图。
@Observable
class ModelData {
    // 初始化模型，数据来自文件
    var landmarks: [Landmark] = load("landmarkData.json")
    // 步行步数
    var hikes: [Hike] = load("hikeData.json")

    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }

    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
}

// 读取 JSON 数据
// (_ filename: String) 调用时不需要进行参数名的输入
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
