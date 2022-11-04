//
//  CoinRowView.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 23/6/22.
//

import SwiftUI

struct CoinRowView: View {
    
    @ObservedObject var viewModel = CoinListVM()
    @State var showAllPrice: Bool = false
    
    let coin: Coin
    
    var body: some View {
        VStack {
            HStack{
                Text("\(coin.rank)-")
                    .font(.title2)
                    .foregroundColor(coin.rankStyle)
                
                Text(coin.name)
                    .font(.body)
                    .foregroundColor(Color(Styles.colorOnSurface))
                
                Spacer()
                
                VStack (alignment: .trailing){
                    Text("$ \(decimalFormat(coin.priceUsd))")
                        .foregroundColor(Color(Styles.colorOnSurface))
                    
                    HStack (spacing: 0){
                        coin.changePercentImage
                        Text("\(decimalFormat(coin.changePercent24Hr))%")
                            .foregroundColor(coin.changePercentColor)
                    }
                }
            }
            
            if showAllPrice {
                HStack {
                    Spacer()
                    Text("$ \(coin.priceUsd)")
                        .foregroundColor(Color(Styles.colorOnSurface))
                }
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                showAllPrice.toggle()
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: showAllPrice ? 90 : 70)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color(Styles.colorSurface))
                .shadow(color: Color(UIColor(red: 0.42, green: 0.07, blue: 0.46, alpha: 1.00)), radius: 5, x: 0, y: 0))
        .padding(.horizontal)
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: Coin.mock)
    }
}
