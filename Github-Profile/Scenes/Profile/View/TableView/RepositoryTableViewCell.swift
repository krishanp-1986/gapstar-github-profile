//
//  RepositoryTableViewCell.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import UIKit

struct RepositoryInfo {    
    let avatarUrl: String
    let userName: String
    let repoName: String
    let repoDescription: String
    let starCount: Int
    let primaryLangugage: String
}

class RepositoryTableViewCell: UITableViewCell, Reusable {
    
    private lazy var repoInfoView: RepoInfoView = RepoInfoView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    private func buildUI() {
        self.contentView.addSubview(self.repoInfoView)
        
        self.repoInfoView.snp.makeConstraints { $0.edges.equalToSuperview()
        }
    }
    
}

extension RepositoryTableViewCell: ConfigurableTableCell {
    func configureWith(_ data: RepositoryInfo) {
        self.repoInfoView.configureWith(data)
    }
}
