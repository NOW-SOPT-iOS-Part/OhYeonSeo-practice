//
//  ItemModel.swift
//  34th-Sopt-Seminar
//
//  Created by 오연서 on 4/20/24.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "오양서", price: "22000원", heartIsSelected: false)
        ]
    }
}


