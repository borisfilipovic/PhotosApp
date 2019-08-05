//
//  UsersView.swift
//  PhotosApp
//
//  Created by Boris Filipovic on 02/08/2019.
//  Copyright © 2019 Boris Filipovic. All rights reserved.
//

import UIKit

final class SelectionView: UIView {
    
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
        tblView.register(cell: AlbumsTableViewCell.self)
        tblView.tableFooterView = UIView()
        tblView.backgroundColor = UIColor.clear
        tblView.separatorStyle = .none
        tblView.alwaysBounceVertical = true
        tblView.rowHeight = 80
        tblView.clipsToBounds = false
        tblView.translatesAutoresizingMaskIntoConstraints = false
        return tblView
    }()

    private var items: [RowViewModel] = [] {
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
extension SelectionView {
    func data(isLoading: Bool) {
        isLoading ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
    }
    
    func tableView(isHidden: Bool) {
        mainTableView.isHidden = isHidden
    }

    func set(users: [RowViewModel]) {
        self.items = users
    }
}

// MARK: - TableView.
extension SelectionView: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellViewMode = getCellViewModel(forIndex: indexPath), let cell = tableView.reuseCell(cellType(for: cellViewMode), for: indexPath) else {
            return UITableViewCell()
        }
        if let cellConfiguration = cell as? CellConfigurable {
            cellConfiguration.setup(viewModel: cellViewMode)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.userSelected(indexPath: indexPath)
    }
}

// MARK: - Private(Helper) methods.
private extension SelectionView {
    private func cellType(for viewModel: RowViewModel) -> UITableViewCell.Type {
        switch viewModel {
        case is UserCellViewModel:
            return UserTableViewCell.self
        case is AlbumsCellViewModel:
            return AlbumsTableViewCell.self
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
    
    func getCellViewModel(forIndex indexPath: IndexPath) -> RowViewModel? {
        guard items.count > indexPath.row else { return nil }
        return items[indexPath.row]
    }
}
