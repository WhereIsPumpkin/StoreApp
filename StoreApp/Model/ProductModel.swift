//
//  ProductModel.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 18.12.23.
//

import Foundation

struct Product: Decodable, Identifiable, Hashable {
    var id: Int
    var title: String
    var description: String
    var price: Double
    var discountPercentage: Double
    var rating: Double
    var stock: Int
    var brand: String
    var category: String
    var thumbnail: String
    var images: [String]
}

struct ProductsContainer: Decodable, Hashable {
    var products: [Product]
}

struct CartItem {
    var product: Product
    var quantity: Int
}

