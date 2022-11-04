//
//  cryptoApp.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 23/6/22.
//

import SwiftUI

@main
struct cryptoApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CoinListView()
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
