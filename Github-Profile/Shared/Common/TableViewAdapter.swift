//
//  TableViewAdapter.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation
import UIKit

final class TableViewAdapter: NSObject {
    unowned var tableView: UITableView!
    private var tableSectionData: [TableViewSection] = []
    
    init(with tableView: UITableView) {
        self.tableView = tableView
        super.init()
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.delegate = self
    }
    
    public func setTableViewData(_ sections: [TableViewSection]) {
         self.tableSectionData = sections
         self.tableView.reloadData()
     }
}

extension TableViewAdapter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        tableSectionData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableSectionData[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellVM = self.tableSectionData[indexPath.section].rows[indexPath.row]
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: type(of: cellVM).identifier,
                                                  for: indexPath)
        
        cellVM.configure(cell)
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerVM = self.tableSectionData[section].header else {
            return UIView(frame: .zero)
        }
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: type(of: headerVM).identifier)
       
        headerVM.configure(header ?? UIView())
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard (self.tableSectionData[section].header) != nil else {
            return 0
        }
        
        return UITableView.automaticDimension
    }
}

extension TableViewAdapter: UITableViewDelegate {}
