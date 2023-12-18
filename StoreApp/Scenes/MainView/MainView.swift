//
//  MainView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                HeaderView()
                CardBalanceView()
                CategoryScrollView()
                    .padding(.leading, -10)
                verticalScrollView
            }
            .padding(.horizontal, 22)
            .background(Color("Background"))
        }
    }
        
    private var verticalScrollView: some View {
        ScrollView(.vertical, showsIndicators: false) {
            productsGrid
        }
        .background(Color("Background"))
    }
    
    private var productsGrid: some View {
        LazyVGrid(columns: viewModel.gridLayout, spacing: 15, content: {
            ForEach(viewModel.products) { product in
                productsLink(product)
            }
        })
        .alert(isPresented: $viewModel.isCheckoutSuccessful) {
            Alert(
                title: Text("Success"),
                message: Text("You have successfully bought the items. ✅"),
                dismissButton: .default(Text("OK")) {
                    viewModel.isCheckoutSuccessful = false
                }
            )
        }
    }
    
    private func productsLink(_ product: Product) -> some View {
        NavigationLink(value: product) {
            ProductCardView(product: product)
        }
        .navigationDestination(for: Product.self, destination: { product in
            DetailPageView(product: product)
        })
    }
}

#Preview {
    MainView()
        .environmentObject(MainViewModel())
}

