//
//  UIButton+Extension.swift
//  Github-Profile
//
//  Created by Krishantha on 07/04/2021.
//

import Foundation
import UIKit

extension UIButton {
    func makeHyperLink(_ text: String) {
        let hyperLinkAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 16),
            .foregroundColor: UIColor.black,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributeString = NSMutableAttributedString(
            string: text,
            attributes: hyperLinkAttributes
        )
        self.setAttributedTitle(attributeString, for: .normal)
    }
}
