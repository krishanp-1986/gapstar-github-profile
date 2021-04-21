//
//  ProfileViewControllerTests.swift
//  Github-ProfileTests
//
//  Created by Krishantha on 06/04/2021.
//

import XCTest
@testable import Github_Profile

class ProfileViewControllerTests: XCTestCase {
    private var sut: ProfileViewController!
    private var mockPresenter: MockPresenter!
    
    func givenMockPresneterBind() {
        mockPresenter = MockPresenter(with: sut, useCase: MockGithubUseCase())
        sut.bindPresenter(to: mockPresenter)
    }
    
    func givenProfileViewController()  {
        sut = ProfileViewController()
    }
    
    func whenViewDidLoadCalled() {
        sut.loadViewIfNeeded()
        sut.viewDidLoad()
    }
    
    func thenPresenterViewDidLoadCalled() {
        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
    }
    
    func test_viewdidload_calls_presenter() {
        givenProfileViewController()
        givenMockPresneterBind()
        whenViewDidLoadCalled()
        thenPresenterViewDidLoadCalled()
    }
    
    
    func whenPrenseterCallsUpdateProfileHeader() {
        let profileHeader = ProfileHeader(avatarUrl: "TestUrl",
                                          name: "Krishan",
                                          username: "Krishan",
                                          email: "krishan1623@gmail.com",
                                          noOfFollers: 100,
                                          noOfFollowing: 100)
        mockPresenter.profileView?.updateProfileHeader(with: profileHeader)
    }
    
    func thenTupdateProfileHeaderCalled() {
        XCTAssertEqual(sut.navigationItem.title, "Profile")
        XCTAssertNotNil(sut.tableView)
        XCTAssertNotNil(sut.tableView.tableHeaderView)
    }
    
    func test_update_profile_header() {
        givenProfileViewController()
        givenMockPresneterBind()
        whenViewDidLoadCalled()
        whenPrenseterCallsUpdateProfileHeader()
        thenTupdateProfileHeaderCalled()
    }
    
}

class MockPresenter: ProfileViewPresenter {
    var profileView: ProfileView?
    private(set) var viewDidLoadCalled: Bool = false
    
    required init(with view: ProfileView, useCase: GithubService) {
        self.profileView = view
    }
    
    func viewDidLoad() {
        viewDidLoadCalled = true
    }
}
