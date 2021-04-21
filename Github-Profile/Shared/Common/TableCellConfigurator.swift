//
//  TableCellConfigurator.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation
import UIKit

final class TableCellHeaderConfigurator<CellType: ConfigurableTableCell, Data>: CellConfigurator where CellType.Data == Data {
    private let item: Data
    init(with cellData: Data) {
        self.item = cellData
    }
    
    static var identifier: String {
        return CellType.reuseIdentifier
    }
    
    func configure(_ cell: UIView) {
        (cell as? CellType)?.configureWith(self.item)
    }
}
