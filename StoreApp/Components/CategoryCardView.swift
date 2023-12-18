//
//  CategoryCardView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

struct CategoryCardView: View {
    var categoryName: String
    var categoryIcon: String
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: categoryIcon)
                .font(.system(size: 18))
            
            Spacer().frame(height: 4)
            
            Text(categoryName)
                .font(.system(size: 12))
                .foregroundColor(Color(red: 0.14, green: 0.14, blue: 0.14))
            
            Spacer()
        }
        .padding(.vertical, 20)
        .foregroundStyle(.black)
        .foregroundColor(.clear)
        .frame(width: 88, height: 88)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 13))
    }
}

struct CategoryScrollView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                CategoryCardView(categoryName: "All", categoryIcon: "tray.2.fill")
                    .onTapGesture {
                        viewModel.selectCategory(.all)
                    }
                CategoryCardView(categoryName: "Smartphones", categoryIcon: "phone.fill")
                    .onTapGesture {
                        viewModel.selectCategory(.smartphones)
                    }
                CategoryCardView(categoryName: "Laptops", categoryIcon: "laptopcomputer")
                    .onTapGesture {
                        viewModel.selectCategory(.laptops)
                    }
                CategoryCardView(categoryName: "Fragrances", categoryIcon: "flame.fill")
                    .onTapGesture {
                        viewModel.selectCategory(.fragrances)
                    }
                CategoryCardView(categoryName: "Skincare", categoryIcon: "leaf.fill")
                    .onTapGesture {
                        viewModel.selectCategory(.skincare)
                    }
                CategoryCardView(categoryName: "Groceries", categoryIcon: "cart.fill")
                    .onTapGesture {
                        viewModel.selectCategory(.groceries)
                    }
                CategoryCardView(categoryName: "Decor", categoryIcon: "house.fill")
                    .onTapGesture {
                        viewModel.selectCategory(.homeDecoration)
                    }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    CategoryScrollView()
}
