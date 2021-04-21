//
//  Theme.swift
//  Github-Profile
//
//  Created by Krishantha on 17/04/2021.
//

import Foundation
import UIKit

protocol Themable {
    var appColors: Colors { get }
    var appFonts: Fonts { get }
}

struct DefaultTheme: Themable {
    static let shared: Themable = DefaultTheme()
    let appColors: Colors
    let appFonts: Fonts
    
    private init() {
        self.appColors = DefaultAppColors()
        self.appFonts = DefaultAppFonts()
    }
}
