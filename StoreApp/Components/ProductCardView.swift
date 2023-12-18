//
//  ProductCardView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

struct ProductCardView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    var product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.images[0])) { image in
                image
                    .resizable()
                    .frame(height: 150)
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            
            Spacer().frame(height: 15)

            Text(product.title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
                .lineLimit(1)
                .frame(height: 20)

            Text("Price: $\(product.price, specifier: "%.2f")")
                .font(.system(size: 14, weight: .regular))
                .foregroundColor(Color.blue)
                .padding(.top, 5)

            Button(action: {
                viewModel.addToCart(product: product)
            }, label: {
                Text("Add To Cart")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(.white)
                    .foregroundColor(.clear)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.14, green: 0.14, blue: 0.14))
                    .cornerRadius(17)
            })
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 13))
    }
}
