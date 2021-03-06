//
//  SearchItemCell.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

final class SearchItemCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: SearchItemCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: SearchItemCell.reuseIdentifier)
        setupThumbnail()
        setupItemNameLabel()
        setupItemPriceLabel()
        setupItemInstallmentsLabel()
        setupItemFreeShippingLabel()
    }
    
    //MARK: Configure cell
    
    func configure(with item: ProductItem) {
        itemNameLabel.text = item.name
        itemPriceLabel.text = item.price
        thumbnailImageView.setImageFrom(url: item.thumbnail)
        itemInstallmentsLabel.text = item.installmentsItemList
        itemFreeShippingLabel.text = item.shipping
    }
    
    //MARK: - Setting up views
    
    private func setupThumbnail() {
        addSubview(thumbnailImageView)
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            thumbnailImageView.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 16),
            thumbnailImageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -16),
            thumbnailImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            thumbnailImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 100),
            thumbnailImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupItemNameLabel() {
        addSubview(itemNameLabel)
        itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            itemNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            itemNameLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 8),
            itemNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupItemPriceLabel() {
        addSubview(itemPriceLabel)
        itemPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            itemPriceLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 4),
            itemPriceLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 8),
            itemPriceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupItemInstallmentsLabel() {
        addSubview(itemInstallmentsLabel)
        itemInstallmentsLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            itemInstallmentsLabel.topAnchor.constraint(equalTo: itemPriceLabel.bottomAnchor, constant: 4),
            itemInstallmentsLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 8),
            itemInstallmentsLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupItemFreeShippingLabel() {
        addSubview(itemFreeShippingLabel)
        itemFreeShippingLabel.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            itemFreeShippingLabel.topAnchor.constraint(equalTo: itemInstallmentsLabel.bottomAnchor, constant: 4),
            itemFreeShippingLabel.leadingAnchor.constraint(equalTo: thumbnailImageView.trailingAnchor, constant: 8),
            itemFreeShippingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -36),
            itemFreeShippingLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    //MARK: - Views Init
    
    private let thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    private let itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    private let itemPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 18)
        
        return label
    }()
    
    private let itemInstallmentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 12)
        
        return label
    }()
    
    private let itemFreeShippingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 12)
        label.textColor = .systemGreen
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
