//
//  NetworkManager.swift
//  Sample
//
//  Created by Moni on 04/09/25.
//

import Combine
import Foundation
import NetworkLibrary

protocol NetworkManager {
    func makeRequest<T: Codable>(with builder: RequestBuilder, type: T.Type) -> AnyPublisher<T, APIError>
}

class NetworkManagerImpl: NetworkManager {
    private let network: NetworkProtocol

    init(network: NetworkProtocol) {
        self.network = network
    }

    func makeRequest<T: Codable>(with builder: RequestBuilder, type: T.Type) -> AnyPublisher<T, APIError> {
        network.makeRequest(with: builder, type: type)
    }
}
