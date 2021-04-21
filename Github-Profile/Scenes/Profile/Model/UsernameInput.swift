//
//  UsernameInput.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation

struct UserNameInput: Encodable {
    let userName: String
}

struct QueryInput: Codable {
    let query: String
    let variables: Variables
    
    static let mockInput: QueryInput = QueryInput(query: "query UserProfile ($userName: String!) {user(login: $userName) {email}}",
                                                  variables: Variables(userName: "krishanp-1986"))
}

// MARK: - Variables
struct Variables: Codable {
    let userName: String
}
