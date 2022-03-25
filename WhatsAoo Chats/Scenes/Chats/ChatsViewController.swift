//
//  ViewController.swift
//  WhatsAoo Chats
//
//  Created by Felipe Brigagão de Almeida on 25/03/22.
//

import UIKit

class ChatsViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: ContactsTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()

    override func viewWillAppear(_ animated: Bool) {        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        let newButton = UIBarButtonItem(image: UIImage.init(systemName: "square.and.pencil"), style: .plain, target: self, action: #selector(callNewView))
        
        navigationItem.leftBarButtonItem = editButton
        navigationItem.rightBarButtonItem = newButton
        
    }
    
    @objc func callNewView() {
        let newVC = NewViewController()
        
        navigationController?.present(newVC, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController(searchResultsController: nil)
        search.delegate = self
        search.searchBar.delegate = self
        self.navigationItem.searchController = search
        
        title = "Chats"
        
        view.addSubview(tableView)
        delegates()
        setupConstraints()
    }

    private func delegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ChatsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ContactsTableViewCell.identifier, for: indexPath) as? ContactsTableViewCell else { return UITableViewCell() }
        
        return cell
    }
}

extension ChatsViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
}
