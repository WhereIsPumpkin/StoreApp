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
        Color("CardColor")
    }
}

struct CardContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            BalanceHeaderView()
            Spacer()
            BalanceAmountView()
            Spacer()
            CardInfoView()
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
    var body: some View {
        Text("$ 625.00")
            .font(.system(size: 35, weight: .semibold))
    }
}

struct CardInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Card")
                .font(.system(size: 17))
            CardDetailView()
        }
    }
}

struct CardDetailView: View {
    var body: some View {
        HStack {
            CardImageView()
            CardOwnerView()
            Spacer()
            ChangeCardButton()
        }
        .background(Color("Background"))
        .clipShape(RoundedRectangle(cornerRadius: 5))
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
            .padding()
    }
}

#Preview {
    CardBalanceView()
}
