//
//  RepositoryBase.swift
//  cryptoApp
//
//  Created by Jose carlos Rodriguez on 23/6/22.
//

import Foundation

// MARK: API URL

struct APIURL {
    
    static var currentScheme: URLScheme { .secure }
    static var currentHost: URLHost { .prod }
    
    enum URLScheme: String {
        case `default` = "http"
        case secure = "https"
    }
    
    enum URLHost: String {
        case prod = "api.coincap.io"
        case dev = "api.coincap.io-dev"
    }
    
    enum API: String {
        case assects = "assets"
    }
    
    private let path = "/v2"
    
    let url: URL?
    
    init(_ scheme: URLScheme = APIURL.currentScheme, host: URLHost = APIURL.currentHost, api: API) {
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = host.rawValue
        components.path = path.appending("/\(api.rawValue)")
        self.url = components.url
    }
}
