//
//  NetworkManager.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 09.12.2022.
//

import Foundation
import Combine

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    private var subscriptions = Set<AnyCancellable>()
    
    func fetchStore() -> AnyPublisher <HomeStoreResponse, EMError> {
        Future<HomeStoreResponse, EMError> { [unowned self] promise in
            guard let url = Components(endPoint: .store).getUrl() else {
                return promise(.failure(.unableToGetUrl))
            }
            self.fetch(url: url)
                .tryMap { (result: HomeStoreResponse) in result }
                .sink(
                    receiveCompletion: { (completion) in
                        if case let .failure(error) = completion {
                            switch error {
                            case let urlError as URLError:
                                promise(.failure(.urlError(urlError)))
                            case let decodingError as DecodingError:
                                promise(.failure(.decodingError(decodingError)))
                            case let apiError as EMError:
                                promise(.failure(apiError))
                            default:
                                promise(.failure(.unknown))
                            }
                        }
                },
                    receiveValue: {
                        promise(.success($0))
                    })
                .store(in: &self.subscriptions)
        }
        .eraseToAnyPublisher()
    }
    
    func fetchDetail() -> AnyPublisher <DetailResponse, EMError> {
        Future<DetailResponse, EMError> { [unowned self] promise in
            guard let url = Components(endPoint: .detail).getUrl() else {
                return promise(.failure(.unableToGetUrl))
            }
            self.fetch(url: url)
                .tryMap { (result: DetailResponse) in result }
                .sink(
                    receiveCompletion: { (completion) in
                        if case let .failure(error) = completion {
                            switch error {
                            case let urlError as URLError:
                                promise(.failure(.urlError(urlError)))
                            case let decodingError as DecodingError:
                                promise(.failure(.decodingError(decodingError)))
                            case let apiError as EMError:
                                promise(.failure(apiError))
                            default:
                                promise(.failure(.unknown))
                            }
                        }
                },
                    receiveValue: {
                        promise(.success($0))
                    })
                .store(in: &self.subscriptions)
        }
        .eraseToAnyPublisher()
    }
    
    func fetchCart() -> AnyPublisher <CartResponse, EMError> {
        Future<CartResponse, EMError> { [unowned self] promise in
            guard let url = Components(endPoint: .cart).getUrl() else {
                return promise(.failure(.unableToGetUrl))
            }
            self.fetch(url: url)
                .tryMap { (result: CartResponse) in result }
                .sink(
                    receiveCompletion: { (completion) in
                        if case let .failure(error) = completion {
                            switch error {
                            case let urlError as URLError:
                                promise(.failure(.urlError(urlError)))
                            case let decodingError as DecodingError:
                                promise(.failure(.decodingError(decodingError)))
                            case let apiError as EMError:
                                promise(.failure(apiError))
                            default:
                                promise(.failure(.unknown))
                            }
                        }
                },
                    receiveValue: {
                        promise(.success($0))
                    })
                .store(in: &self.subscriptions)
        }
        .eraseToAnyPublisher()
    }
    
    private func fetch<T: Codable>(url: URL) -> AnyPublisher<T, Error> {
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,
                      200...299 ~= httpResponse.statusCode else {
                          throw EMError.responseError((response as? HTTPURLResponse)?.statusCode ?? 500)
                      }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
