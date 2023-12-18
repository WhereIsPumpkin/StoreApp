//
//  CardBalanceView.swift
//  StoreApp
//
//  Created by Saba Gogrichiani on 17.12.23.
//

import SwiftUI

struct CardBalanceView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            CardBackgroundView()
            CardContentView()
        }
        .frame(maxHeight: 200)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .foregroundStyle(.white)
    }
}

struct CardBackgroundView: View {
    var body: some View {
        Color(.black)
    }
}

struct CardContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            BalanceHeaderView()
            Spacer()
            BalanceAmountView()
            Spacer()
            TotalSpentView()
            Spacer()
        }
        .padding()
    }
}

struct BalanceHeaderView: View {
    var body: some View {
        Text("Balance")
            .font(.system(size: 17))
    }
}

struct BalanceAmountView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        Text(String(format: "$ %.2f", viewModel.balance))
            .font(.system(size: 35, weight: .semibold))
            .foregroundColor(viewModel.error != nil ? .red : .white)
    }
}

struct TotalSpentView: View {
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("Total Spent:")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.black)
                
                Text(String(format: "$ %.2f", viewModel.totalSpent))
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(.black)
            }
            
            Spacer()

            Button(action: {
                viewModel.checkout()
            }) {
                Text("Check Out")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
                    .padding()
                    .frame(height: 40)
                    .background(viewModel.cartItems.isEmpty ? Color.gray : Color.black)
                    .cornerRadius(10)
            }
            .disabled(viewModel.cartItems.isEmpty)
        }
        .padding()
        .background(Color(red: 250/255, green: 246/255, blue: 240/255))
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct CardImageView: View {
    var body: some View {
        Image("Card")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 50)
    }
}

struct CardOwnerView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("John Doe")
                .font(.system(size: 15))
                .foregroundStyle(.black)
            Text("1234 5678 1234 5678")
                .font(.system(size: 12))
                .foregroundStyle(.gray.opacity(0.8))
        }
    }
}

struct ChangeCardButton: View {
    var body: some View {
        Text("Change")
            .font(.system(size: 16))
            .foregroundStyle(Color("CardColor"))
    }
}

#Preview {
    CardBalanceView()
        .environmentObject(MainViewModel())
}
