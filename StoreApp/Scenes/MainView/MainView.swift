//
//  MainView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack(spacing: 20) {
            HeaderView()
            CardBalanceView()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack{
                    CategoryCardView()
                    CategoryCardView()
                    CategoryCardView()
                    CategoryCardView()
                    CategoryCardView()
                    CategoryCardView()
                }
            }
            Spacer()
        }
        .padding(.horizontal, 22)
        .background(Color("Background"))
        
    }
    
}

#Preview {
    MainView()
}

