//
//  SectionHeader.swift
//  Github-Profile
//
//  Created by Krishantha on 07/04/2021.
//

import UIKit

typealias OnViewAllClickListener = () -> Void
struct SectionHeaderInfo {
    let title: String
    let onClickListener: OnViewAllClickListener?
}

class SectionHeaderView: UITableViewHeaderFooterView, Reusable {
    private lazy var titleLabel: UILabel = UILabel()
    private lazy var button: UIButton = {
        let button = UIButton()
        button.makeHyperLink("View all")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUI() {
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(button)
        Styles.background(self.contentView)
        
        titleLabel.snp.makeConstraints {
            $0.left.top.equalToSuperview().inset(8*2)
            $0.bottom.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.right.equalToSuperview().inset(8*2)
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.left.equalTo(titleLabel.snp.right)
        }
        
        Styles.headlineLable(titleLabel)
    }
}


extension SectionHeaderView: ConfigurableTableCell {
    func configureWith(_ data: SectionHeaderInfo) {
        self.titleLabel.text = data.title
    }
}
