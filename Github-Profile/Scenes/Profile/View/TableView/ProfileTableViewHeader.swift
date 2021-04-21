//
//  ProfileHeaderTableViewCell.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import UIKit

struct ProfileHeader {
    let avatarUrl: String
    let name: String
    let username: String
    let email: String
    let noOfFollers: Int
    let noOfFollowing: Int
}

final class ProfileTableViewHeader: UITableViewCell, Reusable  {
    
    private lazy var avatarImageView: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var nameLabel : UILabel = UILabel()
    private lazy var userNameLabel: UILabel = UILabel()
    private lazy var emailLabel: UILabel = UILabel()
    private lazy var followersLabel: UILabel = UILabel()
    private lazy var followingLabel: UILabel = UILabel()
    
    private lazy var labelContainer: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, userNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildUI()
        Styles.background(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    private func buildUI() {
        self.contentView.addSubview(avatarImageView)
        self.contentView.addSubview(labelContainer)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(followersLabel)
        self.contentView.addSubview(followingLabel)

        avatarImageView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(8*2)
            $0.top.equalToSuperview().offset(8*3)
            $0.width.height.equalTo(88)
        }
                
        labelContainer.snp.makeConstraints {
            $0.centerY.equalTo(avatarImageView.snp.centerY)
            $0.left.equalTo(avatarImageView.snp.right).offset(8)
            $0.right.equalToSuperview().inset(8*2)
        }

        emailLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(8*2)
            $0.top.equalTo(self.avatarImageView.snp.bottom).offset(8*3)
        }

        followersLabel.snp.makeConstraints {
            $0.left.equalTo(self.emailLabel.snp.left)
            $0.top.equalTo(self.emailLabel.snp.bottom).offset(8*2)
            $0.bottom.equalToSuperview()
        }

        followingLabel.snp.makeConstraints {
            $0.left.equalTo(self.followersLabel.snp.right).offset(8)
            $0.top.equalTo(self.followersLabel.snp.top)
            $0.bottom.equalToSuperview()
        }

        avatarImageView.makeCirular(44)

        [emailLabel, nameLabel, userNameLabel, followingLabel, followersLabel].forEach(Styles.label)

        Styles.titleLabel(self.nameLabel)
        Styles.body2Label(self.userNameLabel)
        Styles.body1Label(self.emailLabel)
        Styles.body2Label(self.followersLabel)
        Styles.body2Label(self.followingLabel)
    }

}

extension ProfileTableViewHeader: ConfigurableTableCell {
    func configureWith(_ data: ProfileHeader) {
        self.avatarImageView.load(url: data.avatarUrl, placeHolderImage: UIImage())
        self.nameLabel.text = data.name
        self.userNameLabel.text = data.username
        self.emailLabel.text = data.email
        self.followersLabel.text = "\(data.noOfFollers) Followers"
        self.followingLabel.text = "\(data.noOfFollowing) Following"
    }
}


