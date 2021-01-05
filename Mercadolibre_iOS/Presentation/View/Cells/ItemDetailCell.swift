//
//  ItemDetailCell.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 4/01/21.
//

import UIKit

final class ItemDetailCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: ItemDetailCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SearchItemCell.reuseIdentifier)
        setupConditionAndNameStackView()
        setupConditionAndSoldItemLabel()
        setupThumbnail()
        setupPriceAndInstallmentsStackView()
        setupStockProductStackView()
        setupSellerInformationStackView()
        setupSellerInformationTitleLabel()
    }
    
    //MARK: Configure cell
    
    func configure(with item: ProductItem) {
        //Header title
        conditionAndSoldItemsLabel.text = "\(item.condition.rawValue) | \(item.soldQuantity)"
        itemNameLabel.text = item.name
        
        //Product Image
        thumbnailImageView.setImageFrom(url: item.thumbnail)
        
        //Price and installments
        itemPriceLabel.text = item.price
        itemInstallmentsLabel.text = item.installmentsItemDetail
        
        //Available Stock
        itemAvailableQuantityLabel.text = item.availableQuantity
        
        //Seller information
        sellerLocationLabel.text = item.address
        
    }
    
    //MARK: - Setting up views and constraints
    
    private func setupConditionAndNameStackView() {
        addSubview(conditionAndNameStackView)
        conditionAndNameStackView.translatesAutoresizingMaskIntoConstraints = false
        conditionAndNameStackView.addArrangedSubview(conditionAndSoldItemsLabel)
        conditionAndNameStackView.addArrangedSubview(itemNameLabel)
        let constraints = [
            conditionAndNameStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            conditionAndNameStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            conditionAndNameStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupConditionAndSoldItemLabel() {
        conditionAndSoldItemsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            conditionAndSoldItemsLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setupThumbnail() {
        addSubview(thumbnailImageView)
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            thumbnailImageView.topAnchor.constraint(equalTo: conditionAndNameStackView.bottomAnchor, constant: 16),
            thumbnailImageView.leadingAnchor.constraint(greaterThanOrEqualTo: self.leadingAnchor, constant: 16),
            thumbnailImageView.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -16),
            thumbnailImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 150),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 150)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupPriceAndInstallmentsStackView() {
        addSubview(priceAndInstallmentsStackView)
        priceAndInstallmentsStackView.translatesAutoresizingMaskIntoConstraints = false
        priceAndInstallmentsStackView.addArrangedSubview(itemPriceLabel)
        priceAndInstallmentsStackView.addArrangedSubview(itemInstallmentsLabel)
        let constraints = [
            priceAndInstallmentsStackView.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 12),
            priceAndInstallmentsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            priceAndInstallmentsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupStockProductStackView() {
        addSubview(stockProductStackView)
        stockProductStackView.translatesAutoresizingMaskIntoConstraints = false
        stockProductStackView.addArrangedSubview(availableStockTitleLabel)
        stockProductStackView.addArrangedSubview(itemAvailableQuantityLabel)
        let constraints = [
            stockProductStackView.topAnchor.constraint(equalTo: priceAndInstallmentsStackView.bottomAnchor, constant: 12),
            stockProductStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stockProductStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupSellerInformationStackView() {
        addSubview(sellerInformationStackView)
        sellerInformationStackView.translatesAutoresizingMaskIntoConstraints = false
        sellerInformationStackView.addArrangedSubview(sellerInformationTitleLabel)
        sellerInformationStackView.addArrangedSubview(itemTitleLocationLabel)
        sellerInformationStackView.addArrangedSubview(sellerLocationLabel)
        let constraints = [
            sellerInformationStackView.topAnchor.constraint(equalTo: stockProductStackView.bottomAnchor, constant: 18),
            sellerInformationStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            sellerInformationStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            sellerInformationStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupSellerInformationTitleLabel() {
        sellerInformationTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sellerInformationTitleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    //MARK: - StackViews Init
    
    private let conditionAndNameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    private let priceAndInstallmentsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    private let stockProductStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    private let sellerInformationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        return stackView
    }()
    
    //MARK: - Views Init
    
    private let conditionAndSoldItemsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 12)
        label.textColor = .lightGray
        return label
    }()
        
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 32)
        return label
    }()
    
    private let itemInstallmentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        return label
    }()
    
    private let availableStockTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Stock disponible"
        label.font = UIFont(name: "Avenir-Black", size: 16)
        return label
    }()
    
    private let itemAvailableQuantityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    private let sellerInformationTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 20)
        label.numberOfLines = 0
        label.text = "Información sobre el vendedor"
        return label
    }()
    
    private let itemTitleLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 16)
        label.text = "Ubicación"
        return label
    }()
    
    private let sellerLocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 16)
        label.textColor = .lightGray
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

