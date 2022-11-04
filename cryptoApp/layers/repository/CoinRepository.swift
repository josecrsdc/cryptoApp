//
//  CoinRepository.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 23/6/22.
//

import Foundation
import Alamofire

struct CoinRepository {
    
    /// Calls to GET:  assets
    /// - Parameters:
    ///   - completion: Assets response or error.
    func getCoins(completion: @escaping (Result<CoinResponse, AFError>) -> ()) {

        guard let url = APIURL(api: .assects).url else { return }
        
        AF.request(url, method: .get).validate()
            .responseDecodable(of: CoinResponse.self) { response in
                switch response.result {
                    case .success(let coinsResponse):
                        completion(.success(coinsResponse))
                    case .failure(let error):
                        completion(.failure(error))
                }
        }
    }
}
