//
//  CoinListVM.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 23/6/22.
//

import Foundation
import SwiftUI

class CoinListVM: ObservableObject {
    
    // MARK: Public properties
    
    @Published var coins: [Coin] = []
    @Published var name: String = "Lista de coins"
    @Published var timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @Published var failCharge: Bool = false
    @Published var isListSorted: Bool = false
    
    /// Alerts
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    
    
    
    // MARK: Private properties
    
    private let coinRepository = CoinRepository()
}


// MARK: - Public functions

extension CoinListVM {
    
    func getCoins() {
        coinRepository.getCoins { response in
            switch response {
                case .success(let coinResponse):
                    self.onGetCoinsSuccess(coinResponse)
                    break
                case .failure:
                    self.onFailure()
                    break
            }
        }
    }
    
    func sortList() {
        self.coins.sort {
            $0.priceUsd < $1.priceUsd
        }
    }

}

// MARK: - Private functions

extension CoinListVM {
    
    private func onGetCoinsSuccess(_ response: CoinResponse) {

        if !response.data.isEmpty {
            coins = response.data
            if isListSorted {
                sortList()
            }
        } else {
            handleError(message: "No hay datos que mostrar")
        }
    }
    
    private func onFailure() {
        failCharge = true
        handleError(message: "Algo ha fallado 😱")
    }
}


// MARK: - Fileprivate functions

extension CoinListVM {
    
    fileprivate func handleError(message: String) {
        showAlert = true
        alertTitle = "Error"
        alertMessage = message
    }
}
