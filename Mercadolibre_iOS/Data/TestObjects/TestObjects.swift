//
//  TestObjects.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 4/01/21.
//

import Foundation

struct TestObjects {
    static let searchAPIResponse = APISearchResponse(
        results: [
            searchAPIItem_New,
            searchAPIItem_Used
        ])
    
    static let searchAPIItem_New = APISearchItem(id: "123",
                                                title: "Teclado Gamer Logitech",
                                                seller: Seller(id: 123),
                                                price: 50000,
                                                availableQuantity: 1,
                                                soldQuantity: 20,
                                                condition: "new",
                                                thumbnail: "photo.com/photo",
                                                acceptsMercadopago: true,
                                                installments: Installments(quantity: 123, amount: 36),
                                                address: ItemAddress(stateId: "12abc34", stateName: "Antioquía", cityId: "acc344", cityName: "Medellín"),
                                                shipping: Shipping(freeShipping: true, storePickup: false))
    
    static let searchAPIItem_Used = APISearchItem(id: "456",
                                                 title: "Logitech G29 Racing Wheel",
                                                 seller: Seller(id: 456),
                                                 price: 1200000,
                                                 availableQuantity: 50,
                                                 soldQuantity: 20,
                                                 condition: "used",
                                                 thumbnail: "photo.com/logitechg29",
                                                 acceptsMercadopago: true,
                                                 installments: Installments(quantity: 25000, amount: 36),
                                                 address: ItemAddress(stateId: "12abc34", stateName: "Antioquía", cityId: "acc344", cityName: "Medellín"),
                                                 shipping: Shipping(freeShipping: false, storePickup: false))
    
    static let searchAPIItem_StockOne = APISearchItem(id: "456",
                                                     title: "Logitech G29 Racing Wheel",
                                                     seller: Seller(id: 456),
                                                     price: 1200000,
                                                     availableQuantity: 1,
                                                     soldQuantity: 20,
                                                     condition: "used",
                                                     thumbnail: "photo.com/logitechg29",
                                                     acceptsMercadopago: true,
                                                     installments: Installments(quantity: 25000, amount: 36),
                                                     address: ItemAddress(stateId: "12abc34", stateName: "Antioquía", cityId: "acc344", cityName: "Medellín"),
                                                     shipping: Shipping(freeShipping: true, storePickup: false))
    
    static let searchAPIItem_Stock25 = APISearchItem(id: "456",
                                                                title: "Logitech G29 Racing Wheel",
                                                                seller: Seller(id: 456),
                                                                price: 1200000,
                                                                availableQuantity: 25,
                                                                soldQuantity: 20,
                                                                condition: "used",
                                                                thumbnail: "photo.com/logitechg29",
                                                                acceptsMercadopago: true,
                                                                installments: Installments(quantity: 25000, amount: 36),
                                                                address: ItemAddress(stateId: "12abc34", stateName: "Antioquía", cityId: "acc344", cityName: "Medellín"),
                                                                shipping: Shipping(freeShipping: true, storePickup: false))
}
