//
//  RepositoryCollectionViewCell.swift
//  Github-Profile
//
//  Created by Krishantha on 07/04/2021.
//

import UIKit
import SnapKit

class RepositoryCollectionViewCell: UICollectionViewCell, Reusable {
    private lazy var repoInfoView: RepoInfoView  = {
        let repoInfo = RepoInfoView()
        repoInfo.setRepoDescToSingleLine()
        repoInfo.translatesAutoresizingMaskIntoConstraints = false
        return repoInfo
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUI() {
        self.repoInfoView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.repoInfoView)

        self.repoInfoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configureWith(_ data: RepositoryInfo) {
        self.repoInfoView.configureWith(data)
    }
}
