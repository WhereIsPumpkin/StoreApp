//
//  HeaderView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            HStack(alignment: .center) {
                Image(systemName: "apple.logo")
                    .font(.system(size: 23))
                
                Text("iProduct")
                    .font(.system(size: 17, weight: .bold))
            }
            
            Spacer()
            
            Image("profilePic")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 3))
        }
    }
}

#Preview {
    HeaderView()
}
