//
//  Colors.swift
//  Github-Profile
//
//  Created by Krishantha on 17/04/2021.
//

import Foundation
import UIKit

protocol Colors {
    var backgroundColor: UIColor? { get }
    var textColor: UIColor? { get }
    var borderColor: UIColor? { get }
}

struct DefaultAppColors: Colors {
    var backgroundColor: UIColor? = UIColor(red: 0.949,
                                            green: 0.949,
                                            blue: 0.949,
                                            alpha: 1)
    var textColor: UIColor? = .black
    var borderColor: UIColor? = UIColor(red: 0.8,
                                        green: 0.8,
                                        blue: 0.8,
                                        alpha: 1)
}
