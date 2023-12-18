//
//  MainViewModel.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI
import NetSwift

// MARK: - Enum

enum Category: String, CaseIterable {
    case all = "All"
    case smartphones = "smartphones"
    case laptops = "laptops"
    case fragrances = "fragrances"
    case skincare = "skincare"
    case groceries = "groceries"
    case homeDecoration = "home-decoration"
}

class MainViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var balance = 5234.50
    @Published var error: String?
    @Published var allProducts: [Product] = []
    @Published var products: [Product] = []
    @Published var cartItems: [CartItem] = []
    @Published var totalSpent: Double = 0
    @Published var isCheckoutSuccessful = false
    @Published var selectedCategory: Category = .all
    
    let gridLayout = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    // MARK: - Initializers
    
    init() {
        fetchDestinations()
    }
    
    // MARK: - Category Selection
    
    func selectCategory(_ category: Category) {
        selectedCategory = category
        if category == .all {
            products = allProducts
        } else {
            products = allProducts.filter { $0.category == category.rawValue }
        }
    }
    
    // MARK: - Methods
    
    func addToCart(product: Product) {
        
        if error != nil {
            error = nil
        }
        
        let productCost = product.price
        
        if balance >= productCost {
            if let index = cartItems.firstIndex(where: { $0.product.id == product.id }) {
                totalSpent += product.price
                cartItems[index].quantity += 1
                balance -= productCost
            } else {
                let newItem = CartItem(product: product, quantity: 1)
                cartItems.append(newItem)
                totalSpent += product.price
                balance -= productCost
            }
        } else {
            error = "Insufficient balance to add \(product.title)."
        }
    }
    
    func checkout() {
        totalSpent = 0
        cartItems = []
        error = nil
        isCheckoutSuccessful = true
    }
    
    func fetchDestinations() {
        let urlString = "https://dummyjson.com/products"
        guard let URL = URL(string: urlString) else { return }
        
        NetworkManager.shared.fetchDecodableData(from: URL, responseType: ProductsContainer.self, completion: { result in
            switch result {
            case .success(let data):
                self.products = data.products
                self.allProducts = data.products
            case .failure(let error):
                self.error = error.localizedDescription
            }
        })
    }
}
