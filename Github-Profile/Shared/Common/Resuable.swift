//
//  Resuable.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation
import UIKit

public protocol Reusable {
    typealias Cell = UITableViewCell & Reusable
    typealias CollectionCell = UICollectionViewCell & Reusable
    typealias View = UITableViewHeaderFooterView & Reusable
    static var reuseIdentifier: String { get }
}

public extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: type(of: self))
    }
}

public extension Reusable where Self: UICollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: type(of: self))
    }
}

public extension Reusable where Self: UITableViewHeaderFooterView {
    static var reuseIdentifier: String {
        return String(describing: type(of: self))
    }
}


public extension UITableView {
    
    func registerCell<C: Reusable.Cell>(_ cellType: C.Type) {
        register(C.self, forCellReuseIdentifier: C.reuseIdentifier)
    }
    
    func registerHeaderFooterView<V: Reusable.View>(_ viewType: V.Type) {
        register(V.self, forHeaderFooterViewReuseIdentifier: V.reuseIdentifier)
    }
}

public extension UICollectionView {
    
    func registerCell<C: Reusable.CollectionCell>(_ cellType: C.Type) {
        self.register(C.self, forCellWithReuseIdentifier: C.reuseIdentifier)
    }
}
