//
//  ProductItem.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 4/01/21.
//

import Foundation

struct ProductItem {
    enum Condition: String {
        case new = "Nuevo"
        case used = "Usado"
    }
    
    private(set) var id: String = ""
    private(set) var name: String = ""
    private(set) var price: String = ""
    private(set) var availableQuantity: String = ""
    private(set) var soldQuantity: String = ""
    private(set) var condition: Condition = .used
    private(set) var thumbnail: String = ""
    private(set) var installmentsItemList: String = ""
    private(set) var installmentsItemDetail: String = ""
    private(set) var address: String = ""
    private(set) var shipping: String = ""
    
    init(apiItem: APISearchItem) {
        self.id = apiItem.id
        self.name = apiItem.title
        self.price = formatPriceWithCountryCurrency(value: apiItem.price)
        self.availableQuantity = getAvailableQuantityText(value: apiItem.availableQuantity)
        self.soldQuantity = getSoldQuantityText(value: apiItem.soldQuantity)
        self.condition = getCondition(condition: apiItem.condition)
        self.thumbnail = getThumbnailWithHttpsProtocol(thumbnail: apiItem.thumbnail)
        self.installmentsItemList = getInstallmentsInListFormat(installments: apiItem.installments)
        self.installmentsItemDetail = getInstallmentsInDetailFormat(installments: apiItem.installments)
        self.address = getFormattedAddress(address: apiItem.address)
        self.shipping = getTextIfItsFreeShipping(shipping: apiItem.shipping)
    }
    
    // This function takes a Double or Int value and returns
    // a String with the value formatted in COP starting with $ symbol
    // i.e: valueEntered = 90000.0 - String returned -> $90.000
    
    private func formatPriceWithCountryCurrency(value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = "$"
        formatter.locale = Locale(identifier: "es_CO")
        
        return formatter.string(from: value as NSNumber) ?? ""
    }
    
    private func getAvailableQuantityText(value: Int) -> String {
        return value > 1 ? "\(value) disponibles" : "¡Última disponible!"
    }
    
    private func getSoldQuantityText(value: Int) -> String {
        return "\(value) vendidos"
    }
    
    private func getCondition(condition: String) -> Condition {
        switch condition {
        case "new":
            return .new
        case "used":
            return .used
        default:
            return .used
        }
    }
    
    private func getThumbnailWithHttpsProtocol(thumbnail: String) -> String {
        return thumbnail.replacingOccurrences(of: "http", with: "https")
    }
    
    private func getInstallmentsInListFormat(installments: Installments) -> String {
        return "en \(installments.quantity)x \(formatPriceWithCountryCurrency(value: installments.amount))"
    }
    
    private func getInstallmentsInDetailFormat(installments: Installments) -> String {
        return "o en \(installments.quantity) cuotas de \(formatPriceWithCountryCurrency(value: installments.amount))"
    }
    
    private func getFormattedAddress(address: ItemAddress) -> String {
        return "\(address.cityName), \(address.stateName)"
    }
    
    private func getTextIfItsFreeShipping(shipping: Shipping) -> String {
        return shipping.freeShipping ? "Envío gratis" : ""
    }
    
}
