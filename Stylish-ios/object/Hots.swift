//
//  Hots.swift
//  Stylish-ios
//
//  Created by 黃瓘閎 on 2019/11/3.
//  Copyright © 2019 黃瓘閎. All rights reserved.
//

import Foundation

struct Hots: Codable {

    var hotList = [Hot]()
}

struct Hot: Codable  {
    var title :String
    var productList = [Product]()
}

struct Product: Codable  {
    var id: Int
    var category: String
    var title: String
    var description: String
    var price: String
    var texture: String
    var wash: String
    var place: String
    var note: String
    var story: String
    var colorList = [Color]()
    var sizeList = [String]()
    var variants = [Variant]()
    var mainImage : String
    var imageList = [String]()
}

struct Variant: Codable {
    var colorCode: String
    var size: String
    var stock: String
}

struct Color: Codable  {
    var code: String
    var name: String
}
