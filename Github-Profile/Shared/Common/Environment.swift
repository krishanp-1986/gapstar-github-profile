//
//  Environment.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import Foundation

struct Environment {
    private static let mockKey = "MOCK"
    
   private static let mainInfoDictionary: [String: Any] = {
        guard let dictionary = Bundle.main.infoDictionary else {
            fatalError("Missing Info.plist")
        }
        return dictionary
    }()
    
    static let isMockEnvironment: Bool = {
        guard let isMock = Environment.mainInfoDictionary[Environment.mockKey] as? String,
              !isMock.isEmpty else {
            return false
        }
        return true
    }()
}
