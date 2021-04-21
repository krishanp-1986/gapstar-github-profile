//
//  ProfileView.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import Foundation

protocol ProfileView: AnyObject {
    func populateTable(with tableSections: [TableViewSection])
    func failedToLoadProfile(with error: Error)
}
