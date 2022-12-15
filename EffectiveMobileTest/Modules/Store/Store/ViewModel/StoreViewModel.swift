//
//  StoreViewModel.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 09.12.2022.
//

import Foundation
import Combine

final class StoreViewModel: ObservableObject {
    
    @Published private var innerModel: StoreModel?
    @Published var error: EMError?
    
    @Published private var cart: Int?
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        fetchStore()
        fetchCart()
    }
    
    var hotSaleModels: [HotSaleModel] {
        guard let innerModel = innerModel else {
            return []
        }
        return innerModel.hotSales
    }
    
    var bestSellerModels: [BestSellerModel] {
        guard let innerModel = innerModel else {
            return []
        }
        return innerModel.bestSellers
    }
    
    var cartCount: String {
        guard let cart = cart else {
            return ""
        }
        return String(cart)

    }
    
    private func fetchStore() {
        NetworkManager.shared.fetchStore()
            .map { response in
                let hotSaleModels = response.hotSales.map {
                    hotSale -> HotSaleModel in
                    if let isNew = hotSale.isNew {
                        return HotSaleModel(id: hotSale.id, isNew: isNew, title: hotSale.title, subtitle: hotSale.subtitle, imageUrl: hotSale.picture, isBuy: hotSale.isBuy)
                    } else {
                        return HotSaleModel(id: hotSale.id, isNew: false, title: hotSale.title, subtitle: hotSale.subtitle, imageUrl: hotSale.picture, isBuy: hotSale.isBuy)
                    }
                }
                let bestSellerModels = response.bestSellers.map {
                    BestSellerModel(id: $0.id, isFavorite: $0.isFavorite, title: $0.title, priceWithoutDiscount: $0.priceWithoutDiscount, discountPrice: $0.discountPrice, imageUrl: $0.picture)
                }
                
                return StoreModel(hotSales: hotSaleModels, bestSellers: bestSellerModels)
            }
            .sink(
                receiveCompletion: {[unowned self] (completion) in
                    if case let .failure(error) = completion {
                        self.error = error
                    }
                },
                receiveValue: { [unowned self] in
                    self.innerModel = $0
                })
            .store(in: &self.cancellableSet)
    }
    
    private func fetchCart() {
        NetworkManager.shared.fetchCart()
            .map { response  ->  CartModel in
                let cartItemModels = response.cart.map {
                    CartItemModel(id: $0.id, image: $0.image, price: $0.price, title: $0.title, count: 1)
                }
                return CartModel(cart: cartItemModels, delivery: response.delivery, id: response.id, total: response.total)
            }
            .sink(
                receiveCompletion: {[unowned self] (completion) in
                    if case let .failure(error) = completion {
                        self.error = error
                    }
                },
                receiveValue: { [unowned self] in
                    self.cart = $0.cart.count
                })
            .store(in: &self.cancellableSet)
    }
}
