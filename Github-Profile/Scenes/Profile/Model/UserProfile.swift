//
//  UserProfile.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation

struct UserProfile: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: User
}

// MARK: - User
struct User: Codable {
    let email, name, login: String
    let avatarURL: String
    let followers, following: Followers
    let topRepositories, pinnedItems: PinnedItems
//    let topRepositories: TopRepositories

    enum CodingKeys: String, CodingKey {
        case email, name, login
        case avatarURL = "avatarUrl"
        case followers, following, topRepositories, pinnedItems
        //topRepositories
    }
}


// MARK: - TopRepositories
struct TopRepositories: Codable {
    let nodes: [Node]
}

struct PinnedItems: Codable {
    let nodes: [Node]
}

// MARK: - Node
struct Node: Codable {
    let name: String
    let nodeDescription: String?
    let stargazers: Followers
    let primaryLanguage: PrimaryLanguage?

        enum CodingKeys: String, CodingKey {
            case name
            case nodeDescription = "description"
            case stargazers, primaryLanguage
        }
}

// MARK: - Followers
struct Followers: Codable {
    let totalCount: Int
}

struct PrimaryLanguage: Codable {
    let name: String
}


