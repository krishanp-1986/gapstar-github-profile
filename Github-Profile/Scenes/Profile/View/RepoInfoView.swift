//
//  RepoInfoView.swift
//  Github-Profile
//
//  Created by Krishantha on 07/04/2021.
//

import UIKit

class RepoInfoView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    
    private lazy var userNameLabel : UILabel = UILabel()
    private lazy var repositoryNameLabel: UILabel = UILabel()
    private lazy var repositoryDescriptionLabel: UILabel = {
        let label =  UILabel()
        label.numberOfLines = 0
        return label
    }()
    private lazy var following: TagView = TagView()
    private lazy var primaryLanguage: TagView = TagView()
    
    private lazy var repositoryContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [repositoryNameLabel, repositoryDescriptionLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        [repositoryNameLabel, repositoryDescriptionLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarImageView)
        view.addSubview(userNameLabel)
        view.addSubview(repositoryContainer)
        view.addSubview(following)
        view.addSubview(primaryLanguage)
        
        [avatarImageView, userNameLabel, repositoryContainer, following, primaryLanguage].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        Styles.roundedCorner(view)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        buildUI()
        Styles.background(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUI() {
        self.addSubview(container)
        
        container.snp.makeConstraints {
            $0.top.right.left.equalToSuperview().inset(8*2)
            $0.bottom.equalToSuperview()
        }
        
        avatarImageView.snp.makeConstraints {
            $0.left.top.equalToSuperview().offset(8*2)
            $0.width.height.equalTo(8*4)
        }
        
        avatarImageView.makeCirular(8*4/2)
        
        userNameLabel.snp.makeConstraints {
            $0.left.equalTo(avatarImageView.snp.right).offset(8)
            $0.centerY.equalTo(avatarImageView.snp.centerY)
        }
        
        repositoryContainer.snp.makeConstraints {
            $0.left.equalTo(avatarImageView.snp.left)
            $0.top.equalTo(avatarImageView.snp.bottom).offset(8)
            $0.right.equalToSuperview().inset(8)
        }
        
        following.snp.makeConstraints {
            $0.left.equalTo(avatarImageView.snp.left)
            $0.top.equalTo(repositoryContainer.snp.bottom)
            $0.bottom.equalToSuperview()
        }
        
        primaryLanguage.snp.makeConstraints {
            $0.left.equalTo(following.snp.right)
            $0.top.equalTo(following.snp.top)
            $0.bottom.equalTo(following.snp.bottom)
        }
        
        Styles.body1Label(self.repositoryNameLabel)
        Styles.body2Label(self.userNameLabel)
        Styles.body2Label(self.repositoryDescriptionLabel)
    }
    
    func configureWith(_ data: RepositoryInfo) {
        self.avatarImageView.load(url: data.avatarUrl,
                                  placeHolderImage: UIImage())
        self.userNameLabel.text = data.userName
        self.repositoryNameLabel.text = data.repoName
        self.repositoryDescriptionLabel.text = data.repoDescription
        self.following.configureView(with: String(describing: data.starCount))
        self.primaryLanguage.configureView(with: data.primaryLangugage)
    }
    
    func setRepoDescToSingleLine() {
        self.repositoryDescriptionLabel.numberOfLines = 1
    }
}
