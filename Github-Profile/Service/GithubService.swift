//
//  GithubService.swift
//  Github-Profile
//
//  Created by Krishantha on 06/04/2021.
//

import Foundation

struct Agent {
    func execute<T: Decodable>(_ request: URLRequest, whenDone: @escaping (Result<T, Error>) -> Void) {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                if let responseError = error {
                    return whenDone(.failure(responseError))
                }
                
                guard response != nil else {
                    whenDone(.failure(ServiceError.kInvalidResponse))
                    return
                }
                
                let httpUrlResponseCode = (response as? HTTPURLResponse)?.statusCode ?? 200
                guard 200 ..< 300 ~= httpUrlResponseCode else {
                    whenDone(.failure(ServiceError.kUnSuccessfulResponse(httpUrlResponseCode)))
                    return
                }
                
                guard let responseData = data else {
                    whenDone(.failure(ServiceError.kInvalidData))
                    return
                }
                
                do {
                    let value = try JSONDecoder().decode(T.self, from: responseData)
                    whenDone(.success(value))
                } catch let error  {
                    whenDone(.failure(error))
                    return
                }
            }
        }
        task.resume()
    }
}

protocol GithubService {
    func fetchUserInformation(for userName: String, whenDone: @escaping (Result<UserProfile, Error>) -> Void)
}

struct GithubUsecase: GithubService {
    
    private let agent = Agent()
    func fetchUserInformation(for userName: String, whenDone: @escaping (Result<UserProfile, Error>) -> Void) {
        agent.execute(EndPoint.userProfile(userName).getURLRequest(), whenDone: whenDone)
    }
}
