//
//  ViewController.swift
//  Mercadolibre_iOS
//
//  Created by Andres Carrillo on 3/01/21.
//

import UIKit

final class SearchItemsViewController: UITableViewController {
    
    weak var coordinator: SearchItemsFlow?
    private let presenter: SearchItemsPresenter
    private let searchController: UISearchController
    
    init(presenter: SearchItemsPresenter) {
        self.presenter = presenter
        self.searchController = UISearchController()
        super.init(nibName: nil, bundle: nil)
        self.presenter.view = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.delegate = self
        setupTableView()
        setupSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        self.navigationItem.title = presenter.navigationTitle
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemYellow
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.compactAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupSearchController () {
        searchController.searchBar.delegate = self
        
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = presenter.searchBarPlaceholder
        navigationItem.searchController = searchController
        definesPresentationContext = true
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
        let currentItem = presenter.items[indexPath.row]
        coordinator?.coordinateToItemDetails(item: currentItem)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Presenter Delegate: Updates the View when the request to the API Finishes

extension SearchItemsViewController: SearchItemsPresenterDelegate {
    func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

// MARK: - SearchController Delegate

extension SearchItemsViewController: UISearchBarDelegate {
    
    // func called when a user press the search button in the keyboard.
    // execute the request to search items if there's text in the searchBar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let searchText = searchBar.text {
            presenter.executeSearch(with: searchText)
        }
    }
}
