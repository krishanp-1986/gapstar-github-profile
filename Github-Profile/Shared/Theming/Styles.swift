//
//  Styles.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import Foundation
import UIKit

public typealias Style<T> = (T?) -> Void

public struct Styles {
    
    private static var theme: Themable = {
        return DefaultTheme.shared
    }()
    
    public static let background: Style<UIView> = { view in
        view?.backgroundColor = theme.appColors.backgroundColor
    }
    
    public static let roundedCorner: Style<UIView> = { view in
        view?.clipsToBounds = true
        view?.layer.borderColor = theme.appColors.borderColor?.cgColor
        view?.layer.borderWidth = 1
        view?.layer.cornerRadius = 8
    }
    
    public static let label: Style<UILabel> = { label in
        label?.textColor = theme.appColors.textColor
    }
    public static let titleLabel: Style<UILabel> = { label in
        label?.textColor = theme.appColors.textColor
        label?.font = theme.appFonts.title
    }
    
    public static let navigationTitle: Style<UILabel> = { label in
        label?.textColor = theme.appColors.textColor
        label?.font = theme.appFonts.heading1
    }
    
    public static let headlineLable: Style<UILabel> = { label in
        label?.textColor = theme.appColors.textColor
        label?.font = theme.appFonts.heading
    }
    
    public static let body2Label: Style<UILabel> = { label in
        label?.textColor = theme.appColors.textColor
        label?.font = theme.appFonts.body2
    }
    
    public static let body1Label: Style<UILabel> = { label in
        label?.textColor = theme.appColors.textColor
        label?.font = theme.appFonts.body1
    }
    
}
