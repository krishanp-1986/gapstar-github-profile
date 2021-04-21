//
//  PresentableType.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import Foundation
import UIKit

protocol PresentableType: AnyObject {
    associatedtype Presenter
    var presenter: Presenter! { get set }
}

extension PresentableType where Self: UIViewController {
    func bindPresenter(to presenter: Self.Presenter) {
        self.presenter = presenter
    }
}
