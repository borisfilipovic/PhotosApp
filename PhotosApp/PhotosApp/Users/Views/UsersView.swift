//
//  UsersView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class UsersView: UIView {
    
    // MARK: - Properties.
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .whiteLarge)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.color = .black
        indicator.startAnimating()
        indicator.hidesWhenStopped = true
        return indicator
    }()
    
    private let mainTableView: UITableView = {
        let tblView: UITableView = UITableView()
        tblView.register(cell: UserTableViewCell.self)
        tblView.tableFooterView = UIView()
        tblView.backgroundColor = UIColor.clear
        tblView.separatorStyle = .none
        tblView.alwaysBounceVertical = true
        tblView.rowHeight = 80
        tblView.clipsToBounds = false
        tblView.translatesAutoresizingMaskIntoConstraints = false
        return tblView
    }()
    
    private var users: [UserItem] = [] {
        didSet {
            mainTableView.reloadData()
        }
    }
    
    weak var delegate: TouchSelectionDelegate?
    
    // MARK: - Init.
    
    init() {
        super.init(frame: CGRect.zero)
        setup()
        setupConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup.
    
    private func setup() {
        /// Colors.
        backgroundColor = .white
        
        /// Set data source and delegate.
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        /// Add subviews and layers.
        addSubview(mainTableView)
        addSubview(activityIndicator)
    }
    
    // MARK: - Setup constrains.
    
    private func setupConstraints() {
        /// Activity indicator.
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        /// Table view.
        mainTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        mainTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        mainTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        mainTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}

// MARK: - Public methods.
extension UsersView {
    func data(isLoading: Bool) {
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func tableView(isHidden: Bool) {
        mainTableView.isHidden = isHidden
    }
    
    func set(users: [UserItem]) {
        self.users = users
    }
}

// MARK: - TableView.
extension UsersView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.reuseCell(UserTableViewCell.self, for: indexPath) else {
            return UITableViewCell()
        }
        cell.viewModel = UserCellViewModel(user: safeGetUser(forIndexPath: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = safeGetUser(forIndexPath: indexPath) else {return}
        delegate?.userSelected(data: user)
    }
}

// MARK: - Private(Helper) methods.
private extension UsersView {
    func safeGetUser(forIndexPath index: IndexPath) -> UserItem? {
        guard users.count > index.row else { return nil }
        return users[index.row]
    }
}
