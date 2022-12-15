//
//  CartViewModel.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 14.12.2022.
//
import Combine

final class CartViewModel: ObservableObject {
    
    @Published private var innerModel: CartModel?
    @Published var error: EMError?
    
    private let formatter: Formatter
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        self.formatter = Formatter()
        NetworkManager.shared.fetchCart()
            .map { response in
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
                    self.innerModel = $0
                })
            .store(in: &self.cancellableSet)
    }
    
    var delivery: String {
        guard let innerModel = innerModel else {
            return ""
        }
        return innerModel.delivery
    }
    
    var total: String {
        guard let innerModel = innerModel else {
            return ""
        }
        return formatter.formatPrice(innerModel.total)
    }
    
    var cart: [CartItemModel] {
        guard let innerModel = innerModel else {
            return []
        }
        return innerModel.cart
    }
}
