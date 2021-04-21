//
//  MockGitHubService.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import Foundation

struct MockGithubUseCase: GithubService {
    
    func fetchUserInformation(for userName: String, whenDone: @escaping (Result<UserProfile, Error>) -> Void) {
        let profile = JsonUtils.convertJsonIntoDecodable(UserProfile.self,
                                                         fileName: "Profile",
                                                         inDirectory: "MockResponses")
        /// Since its mock , safe to force unwrap
            whenDone(.success(profile!))
    }
}
