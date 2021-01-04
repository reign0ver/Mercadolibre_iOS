//
//  SearchItem.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import Foundation

struct SearchResponse: Decodable {
    let results: [SearchItem]
}

struct SearchItem: Decodable {
    let id: String
    let title: String
    let seller: Seller
    let price: Double
    let availableQuantity: Int // ultima disponible
    let soldQuantity: Int
    let condition: String // could be an enum
    let thumbnail: String
    let acceptsMercadopago: Bool
    let installments: Installments
    let address: ItemAddress
    let shipping: Shipping
    
    private enum CodingKeys: CodingKey {
        case id
        case title
        case seller
        case price
        case available_quantity
        case sold_quantity
        case condition
        case thumbnail
        case accepts_mercadopago
        case installments
        case address
        case shipping
    }
    
    init(from decoder: Decoder) throws {
        let container           = try decoder.container(keyedBy: CodingKeys.self)
        self.id                 = try container.decode(String.self, forKey: .id)
        self.title              = try container.decode(String.self, forKey: .title)
        self.seller             = try container.decode(Seller.self, forKey: .seller)
        self.price              = try container.decode(Double.self, forKey: .price)
        self.availableQuantity  = try container.decode(Int.self, forKey: .available_quantity)
        self.soldQuantity       = try container.decode(Int.self, forKey: .sold_quantity)
        self.condition          = try container.decode(String.self, forKey: .condition)
        self.thumbnail          = try container.decode(String.self, forKey: .thumbnail)
        self.acceptsMercadopago = try container.decode(Bool.self, forKey: .accepts_mercadopago)
        self.installments       = try container.decode(Installments.self, forKey: .installments)
        self.address            = try container.decode(ItemAddress.self, forKey: .address)
        self.shipping           = try container.decode(Shipping.self, forKey: .shipping)
    }
    
}

struct Seller: Decodable {
    let id: Double // to define could be an String
}

struct Installments: Decodable {
    let quantity: Int
    let amount: Double
}

struct ItemAddress: Decodable {
    let stateId: String
    let stateName: String
    let cityId: String?
    let cityName: String
    
    private enum CodingKeys: CodingKey {
        case state_id
        case state_name
        case city_id
        case city_name
    }
    
    init(from decoder: Decoder) throws {
        let container  = try decoder.container(keyedBy: CodingKeys.self)
        self.stateId   = try container.decode(String.self, forKey: .state_id)
        self.stateName = try container.decode(String.self, forKey: .state_name)
        self.cityId    = try container.decodeIfPresent(String.self, forKey: .city_id)
        self.cityName  = try container.decode(String.self, forKey: .city_name)
    }
}

struct Shipping: Decodable {
    let freeShipping: Bool
    let mode: String // idk what it is
    let logisticType: String // could be an enum
    let storePickup: Bool
    
    private enum CodingKeys: CodingKey {
        case free_shipping
        case mode
        case logistic_type
        case store_pick_up
    }
    
    init(from decoder: Decoder) throws {
        let container     = try decoder.container(keyedBy: CodingKeys.self)
        self.freeShipping = try container.decode(Bool.self, forKey: .free_shipping)
        self.mode         = try container.decode(String.self, forKey: .mode)
        self.logisticType = try container.decode(String.self, forKey: .logistic_type)
        self.storePickup  = try container.decode(Bool.self, forKey: .store_pick_up)
    }
}
