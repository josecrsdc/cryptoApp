//
//  Coin.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 23/6/22.
//

import Foundation
import SwiftUI

struct CoinResponse: Codable {
    let data: [Coin]
    let timestamp: Int
    
}

struct Coin: Codable, Identifiable {
    let id: String
    let name: String
    let rank: String
    let priceUsd: String
    let changePercent24Hr: String
    
    
    var changePercentColor: Color {
        var color = Color.green
        if changePercent24Hr.contains("-") {
            color = .red
        }
        return color
    }
    
    var changePercentImage: some View {
        var image = Image(systemName: "arrowtriangle.up.fill")
            .foregroundColor(.green)
        if changePercent24Hr.contains("-") {
            image = Image(systemName: "arrowtriangle.down.fill")
                .foregroundColor(.red)
        }
        return image
    }
    
    var rankStyle: Color {
        var color: Color = Color(Styles.colorOnSurface)
        if rank == "1" {
            color = .yellow
        }
        
        if rank == "2" {
            color = .gray
        }
        
        if rank == "3" {
            color = .orange
        }
        return color
    }
    
    static let mock = Coin(id: "Bitcoin", name: "BitJose", rank: "2", priceUsd: "34.3245323", changePercent24Hr: "-12.342134")
}

