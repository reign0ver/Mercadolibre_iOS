//
//  ItemDetailViewController.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 4/01/21.
//

import UIKit

final class ItemDetailViewController: UITableViewController {
    
    private let item: ProductItem
    
    init(item: ProductItem) {
        self.item = item
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupTableView() {
        tableView.register(ItemDetailCell.self, forCellReuseIdentifier: ItemDetailCell.reuseIdentifier)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - TableView Delegate and DataSource

extension ItemDetailViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemDetailCell.reuseIdentifier) as! ItemDetailCell
        cell.configure(with: item)
        return cell
    }
}
