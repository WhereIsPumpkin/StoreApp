  //
//  DetailPageView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 18.12.23.
//

import SwiftUI

struct DetailPageView: View {
    @EnvironmentObject var viewModel: MainViewModel
    @State private var quantity: Int = 0
    var product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .padding(.horizontal)

                Text(product.title)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.black)

                HStack {
                    Text(product.brand)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)

                    Spacer()

                    Text(product.category)
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                }

                HStack {
                    ForEach(0..<5, id: \.self) { index in
                        Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
                            .foregroundColor(index < Int(product.rating) ? .black : .gray)
                    }
                }

                Text("Price: \(product.price, specifier: "%.2f")$")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)

                Spacer()
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}


