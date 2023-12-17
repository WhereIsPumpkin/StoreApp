//
//  CategoryCardView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

struct CategoryCardView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "laptopcomputer")
                .font(.system(size: 18))
            
            Spacer()
                .frame(height: 4)
            Text("Laptops")
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

#Preview {
    CategoryCardView()
}
