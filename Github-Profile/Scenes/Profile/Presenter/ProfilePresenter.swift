//
//  ProfilePresenter.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import Foundation

protocol ProfileViewPresenter: AnyObject {
    var profileView: ProfileView? { get set  }
    init(with view: ProfileView, useCase: GithubService)
    func viewDidLoad()
}

final class ProfilePresenter: ProfileViewPresenter {
    weak var profileView: ProfileView?
    let useCase: GithubService?
    
    init(with view: ProfileView, useCase: GithubService) {
        self.profileView = view
        self.useCase = useCase
    }

    func viewDidLoad() {
        useCase?.fetchUserInformation(for: "fabpot") { result in
            switch result {
            case .success(let userProfile):
                self.populateUserInfor(with: userProfile)
            case .failure(let error):
                self.profileView?.failedToLoadProfile(with: error)
            }
        }
    }
    
    private func populateUserInfor(with userProfile: UserProfile) {
        let avatarUrl = userProfile.data.user.avatarURL
        let userName = userProfile.data.user.login
        let profileHeader = ProfileHeader(avatarUrl: avatarUrl,
                                          name: userProfile.data.user.name,
                                          username: userName,
                                          email: userProfile.data.user.email,
                                          noOfFollers: userProfile.data.user.followers.totalCount,
                                          noOfFollowing: userProfile.data.user.following.totalCount)
        
        let profileHeaderRow = TableCellHeaderConfigurator<ProfileTableViewHeader, ProfileHeader>(with: profileHeader)
        
        // First 3 Pinned Repositories
        let pinnedRepositories = userProfile.data.user.pinnedItems.nodes.map { node in
            getPinnedRepositoryCellConfigurtor(for: node,
                                               avatarUrl: avatarUrl,
                                               userName: userName)
        }
        
        let top10Repo =
            getTopTenRepositories(for: userProfile.data.user.topRepositories.nodes,
                                  avatarUrl: avatarUrl,
                                  userName: userName)
        
        let pinnedSectionConfiguration = TableCellHeaderConfigurator<SectionHeaderView, SectionHeaderInfo>(with: SectionHeaderInfo(title: "Pinned", onClickListener: nil))
        let pinnedSection = BaseTableViewSection(with: pinnedSectionConfiguration,
                             rows: pinnedRepositories, footer: nil)
        
        let sectionConfiguration = TableCellHeaderConfigurator<SectionHeaderView, SectionHeaderInfo>(with: SectionHeaderInfo(title: "Top 10", onClickListener: nil))
        let top10RepoSection = BaseTableViewSection(with: sectionConfiguration,
                             rows: [top10Repo], footer: nil)
        
        let profileHeaderSection = BaseTableViewSection(rows: [profileHeaderRow])
        
        self.profileView?.populateTable(with: [profileHeaderSection,pinnedSection, top10RepoSection])
    }
    
    private func getPinnedRepositoryCellConfigurtor(for node: Node,
                                                    avatarUrl: String,
                                                    userName: String) -> CellConfigurator {
       let repoInfo =  RepositoryInfo(avatarUrl: avatarUrl,
                                      userName: userName,
                                      repoName: node.name,
                                      repoDescription: node.nodeDescription ?? "",
                                      starCount: node.stargazers.totalCount,
                                      primaryLangugage: node.primaryLanguage?.name ?? "")
        return TableCellHeaderConfigurator<RepositoryTableViewCell, RepositoryInfo>(with: repoInfo)
    }
    
    
    private func getTopTenRepositories(for nodes: [Node],
                                                    avatarUrl: String,
                                                    userName: String) -> CellConfigurator {
        
        let repos = nodes.map { node in
            RepositoryInfo(avatarUrl: avatarUrl,
                                           userName: userName,
                                           repoName: node.name,
                                           repoDescription: node.nodeDescription ?? "",
                                           starCount: node.stargazers.totalCount,
                                           primaryLangugage: node.primaryLanguage?.name ?? "")
        }
        return TableCellHeaderConfigurator<HorizontalScrollingTableViewCell, [RepositoryInfo]>(with: repos)
    }
}
