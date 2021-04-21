//
//  GraphQLOperation.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation

struct GraphQLOperation<Input: Encodable, Output: Decodable>: Encodable {
    let input: Input
    let query: String
    
    enum CodingKeys: String, CodingKey {
        case variables
        case query
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(input, forKey: .variables)
        try container.encode(query, forKey: .query)
    }
}

extension GraphQLOperation where Input == UserNameInput, Output == UserProfile {
    static func fetchUserProfile(with userName: String) -> Self {
        GraphQLOperation(input: UserNameInput(userName: userName),
                         query: """
query UserProfile ($userName: String!) {
  user(login: $userName) {
    email,
    login,
    name,
    avatarUrl,
    followers {
      totalCount
    },
    following{
      totalCount
    },
    topRepositories(first: 10, orderBy: { field: CREATED_AT, direction: DESC} ) {
                   nodes {
         ... on Repository {
          name,
          description,
          stargazers {
            totalCount
          }
                primaryLanguage {
            name
          }
        }
      }
    },
   pinnedItems(first: 6, types: REPOSITORY) {
      nodes {
         ... on Repository {
          name,
          description,
          stargazers {
            totalCount
          }
                primaryLanguage {
            name
          }
        }
      }
    }
  }
}
""")
    }
}
