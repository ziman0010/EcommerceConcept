//
//  DetailViewModel.swift
//  EffectiveMobileTest
//
//  Created by Алексей Черанёв on 13.12.2022.
//

import Foundation
import Combine
import UIKit

final class DetailViewModel: ObservableObject {
    
    @Published private var innerModel: DetailModel?
    @Published var error: EMError?
    
    private let formatter: Formatter
    
    private var cancellableSet: Set<AnyCancellable> = []
    
    init() {
        
        self.formatter = Formatter()
        
        NetworkManager.shared.fetchDetail()
            .map { response  in
                return DetailModel(cpu: response.cpu, camera: response.camera, capacity: response.capacity, colors: response.colors, id: response.id, images: response.images, isFavorite: response.isFavorite, price: response.price, rating: response.rating, memory: response.memory, ram: response.ram, title: response.title)
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
    
    var price: String {
        guard let innerModel = innerModel else {
            return ""
        }
        return formatter.formatPrice(innerModel.price)
    }
    
    var title: String {
        guard let innerModel = innerModel else {
            return ""
        }
        return innerModel.title
    }
    
    var ram: String {
        guard let innerModel = innerModel else {
            return ""
        }
        return innerModel.ram
    }
    
    var memory: String {
        guard let innerModel = innerModel else {
            return ""
        }
        return innerModel.memory
    }
    
    var camera: String {
        guard let innerModel = innerModel else {
            return ""
        }
        return innerModel.camera
    }
    
    var rating: Decimal {
        guard let innerModel = innerModel else {
            return 0
        }
        return Decimal(innerModel.rating)
    }
    
    var capacity: [String] {
        guard let innerModel = innerModel else {
            return []
        }
        return innerModel.capacity
    }
    
    var isFavorite: Bool {
        guard let innerModel = innerModel else {
            return false
        }
        return innerModel.isFavorite
    }
    
    var imagesUrlString: [String] {
        guard let innerModel = innerModel else {
            return []
        }
        return innerModel.images
    }
    
    var colors: [String] {
        guard let innerModel = innerModel else {
            return []
        }
        return innerModel.colors
    }
    
    var cpu: String {
        guard let innerModel = innerModel else {
            return ""
        }
        return innerModel.cpu
    }
}
