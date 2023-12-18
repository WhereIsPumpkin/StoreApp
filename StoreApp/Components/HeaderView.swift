//
//  HeaderView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var viewmodel: MainViewModel
    
    var body: some View {
        HStack {
            HStack(alignment: .center) {
                Image(systemName: "apple.logo")
                    .font(.system(size: 23))
                
                Text("iProduct")
                    .font(.system(size: 17, weight: .bold))
            }
            
            Spacer()
            
            HStack{
                
                ZStack {
                    Color(.white)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                    
                    Image(systemName: "cart")
                        .font(.system(size: 20))
                        .foregroundStyle(.black)
                }
                .overlay(alignment: .bottomTrailing) {
                    Circle()
                        .frame(width: 20)
                        .foregroundStyle(.red)
                        .offset(x: 5,y: 5)
                    
                    Text("\(viewmodel.cartItems.count)")
                        .font(.system(size: 12))
                        .foregroundStyle(.white)
                        .offset(x: 5,y: 5)
                }
                
                Image("profilePic")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 3))
            }
        }
    }
}

#Preview {
    HeaderView()
        .environmentObject(MainViewModel())
}
