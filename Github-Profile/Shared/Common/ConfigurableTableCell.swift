//
//  ConfigurableTableCell.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation
import UIKit

protocol CellConfigurator {
    static var identifier: String { get }
    func configure(_ cell: UIView)
}

protocol ConfigurableTableCell: Reusable {
    associatedtype Data
    func configureWith(_ data: Data)
}

protocol TableViewSection {
    var header: CellConfigurator? { get }
    var rows: [CellConfigurator] { get set }
    var footer: CellConfigurator? { get }
}

struct BaseTableViewSection: TableViewSection {
    public var header: CellConfigurator?
    public var rows: [CellConfigurator]
    public var footer: CellConfigurator?

    public init(with header: CellConfigurator? = nil,
                rows: [CellConfigurator],
                footer: CellConfigurator? = nil) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}
