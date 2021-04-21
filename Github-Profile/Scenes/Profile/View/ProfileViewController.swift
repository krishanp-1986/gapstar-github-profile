//
//  ViewController.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController, PresentableType {
    var presenter: ProfileViewPresenter!
    private lazy var tableViewDataAdapter: TableViewAdapter = {
        let adapter = TableViewAdapter(with: self.tableView)
        return adapter
    }()
    
    lazy var titleLable: UILabel = {
        let label = UILabel()
        label.text = "Profile"
        label.translatesAutoresizingMaskIntoConstraints = false
        Styles.navigationTitle(label)
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        Styles.background(tableView)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
       
        return tableView
    }()
    
    override func loadView() {
        super.loadView()
        buildUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerCell(HorizontalScrollingTableViewCell.self)
        tableView.registerCell(RepositoryTableViewCell.self)
        tableView.registerHeaderFooterView(SectionHeaderView.self)
        tableView.registerCell(ProfileTableViewHeader.self)
        self.presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func buildUI() {
        self.view.addSubview(titleLable)
        self.view.addSubview(self.tableView)
        titleLable.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
        }
        tableView.snp.makeConstraints {
            $0.left.right.bottom.equalToSuperview()
            $0.top.equalTo(titleLable.snp.bottom).offset(8)
        }
        Styles.background(self.view)
    }
}

extension ProfileViewController: ProfileView {    
    func populateTable(with tableSections: [TableViewSection]) {
        self.tableViewDataAdapter.setTableViewData(tableSections)
    }
    
    func failedToLoadProfile(with error: Error) {
        let alertController = UIAlertController(title: "Error",
                                                message: error.localizedDescription,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok",
                                                style: .default,
                                                handler: nil))
        
        self.present(alertController,
                     animated: true,
                     completion: nil)
    }
}

