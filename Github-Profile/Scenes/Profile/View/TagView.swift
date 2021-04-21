//
//  TagView.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import UIKit

class TagView: UIView {
    
    private lazy var label: UILabel = UILabel()
    
    // TODO add view ( Star, Bullet Point )
    init() {
        super.init(frame: .zero)
        buildUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func buildUI() {
        self.addSubview(label)
        
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(8)
        }
        
        label.textAlignment = .left
        Styles.body2Label(self.label)
    }
    
    func configureView(with description: String) {
        self.label.text = description
    }
}
