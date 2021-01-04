//
//  ViewController.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

final class SearchItemsViewController: UITableViewController {
    
    weak var coordinator: Coordinator?
    private let presenter: SearchItemsPresenter
    
    init(_ presenter: SearchItemsPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        setupTableView()
        presenter.executeSearch(with: "Audifonos")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = presenter.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    private func setupTableView() {
        tableView.register(SearchItemCell.self, forCellReuseIdentifier: SearchItemCell.reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - TableView Delegate and DataSource
extension SearchItemsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchItemCell.reuseIdentifier) as! SearchItemCell
        let currentItem = presenter.items[indexPath.row]
        cell.configure(with: currentItem)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let currentItem = presenter.items[indexPath.row]
//        coordinator?.showBreedDetails(breed: currentBreed)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Presenter Delegate

extension SearchItemsViewController: SearchItemsPresenterDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
