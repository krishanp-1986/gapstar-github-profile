//
//  EndPoint.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation

/// TODO : Please add your Github personal access token here
private let bearerToken = ""
enum EndPoint {
    private static let baseUrl: URL = URL(string: "https://api.github.com/graphql")!
    case userProfile(String)
    
    
    static let httpMethod: String  = "POST"
        
    var body: Data? {
        switch self {
        case .userProfile(let userName):
            return try? JSONEncoder()
                .encode(GraphQLOperation.fetchUserProfile(with: userName))
        }
    }
    
    
    func getURLRequest() -> URLRequest {
        var request = URLRequest(url: EndPoint.baseUrl)
        request.httpMethod = "POST"
        request.setValue("application/json",
                         forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(bearerToken)",
                         forHTTPHeaderField: "Authorization")
        request.httpBody = body
        
        return request
    }
}

enum ServiceError: Error {
    case kInvalidResponse
    case kUnSuccessfulResponse(Int)
    case kInvalidData
}

extension ServiceError: LocalizedError {
    var errorDescription: String?  {
        switch self {
        case .kInvalidResponse:
            return "Invalid Response"
        case .kUnSuccessfulResponse(let errorCode):
            return "Server replied with response code \(errorCode)"
        case .kInvalidData:
            return "Server failed to return data"
        }
    }
    
}
