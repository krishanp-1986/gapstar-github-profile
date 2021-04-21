//
//  Fonts.swift
//  Github-Profile
//
//  Created by Krishantha on 17/04/2021.
//

import Foundation
import UIKit

private let sansProBold = "SourceSansPro-Bold"
private let sansProSemiBold = "SourceSansPro-SemiBold"
private let sansProRegular = "SourceSansPro-Regular"

extension UIFont {
    struct Dimension {
        static var title: CGFloat = 32
        static var heading: CGFloat = 24
        static var heading1: CGFloat = 20
        static var body: CGFloat = 16
    }
}

protocol Fonts {
    var title: UIFont? { get }
    var heading: UIFont? { get }
    var heading1: UIFont? { get }
    var body1: UIFont? { get }
    var body2: UIFont? { get }
}


struct DefaultAppFonts: Fonts {
    var title: UIFont? = UIFont(name: sansProBold,
                                size: UIFont.Dimension.title)
    var heading: UIFont? = UIFont(name: sansProBold,
                                size: UIFont.Dimension.heading)
    var heading1: UIFont? = UIFont(name: sansProBold,
                                size: UIFont.Dimension.heading1)
    var body1: UIFont? = UIFont(name: sansProSemiBold,
                                size: UIFont.Dimension.body)
    var body2: UIFont? = UIFont(name: sansProRegular,
                                size: UIFont.Dimension.body)
}
