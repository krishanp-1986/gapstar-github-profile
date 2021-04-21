//
//  ProfilePresenterTest.swift
//  Github-ProfileTests
//
//  Created by Krishantha on 06/04/2021.
//

import XCTest
@testable import Github_Profile

class ProfilePresenterTest: XCTestCase {
    
    private var sut: ProfileViewPresenter!
    private var mockProfileView: MockProfileView!
    private var mockUseCase: GithubService!


    func test_on_view_did_load_called_on_success() {
        givenMockProfileView()
        givenMockSuccessUseCase()
        givenProfilePresenter(with: mockProfileView,
                              useCase: mockUseCase)
        whenProfilePresenterLoads()
        thenUpdateProfileHeaderCalled()
        thenPopulateTableCalled()
        thenFailedToLoadProfileNotCalled()
    }
    
    func test_on_view_did_load_called_on_faiure() {
        givenMockProfileView()
        givenMockFailureUseCase()
        givenProfilePresenter(with: mockProfileView,
                              useCase: mockUseCase)
        whenProfilePresenterLoads()
        thenUpdateProfileHeaderNotCalled()
        thenPopulateTableNotCalled()
        thenFailedToLoadProfileCalled()
    }
    
    func givenMockProfileView() {
        mockProfileView = MockProfileView()
    }
    
    func givenMockSuccessUseCase() {
        mockUseCase = MockGithubUseCase()
    }
    
    func givenMockFailureUseCase() {
        mockUseCase = MockFailureUseCase()
    }
    
    func givenProfilePresenter(with view: ProfileView, useCase: GithubService) {
        sut = ProfilePresenter(with: view,
                               useCase: useCase)
    }
    
    func whenProfilePresenterLoads() {
        sut.viewDidLoad()
    }
    
    func thenUpdateProfileHeaderCalled() {
        XCTAssertTrue(self.mockProfileView.updateProfileHeaderCalled)
    }
    
    func thenUpdateProfileHeaderNotCalled() {
        XCTAssertFalse(self.mockProfileView.updateProfileHeaderCalled)
    }
    
    func thenPopulateTableCalled() {
        XCTAssertTrue(self.mockProfileView.populateTableCalled)
    }
    
    func thenPopulateTableNotCalled() {
        XCTAssertFalse(self.mockProfileView.populateTableCalled)
    }
    
    func thenFailedToLoadProfileNotCalled() {
        XCTAssertFalse(self.mockProfileView.failedToLoadProfileCalled)
    }
    
    func thenFailedToLoadProfileCalled() {
        XCTAssertTrue(self.mockProfileView.failedToLoadProfileCalled)
    }
}


final class MockProfileView: ProfileView {
    private(set) var updateProfileHeaderCalled: Bool = false
    private(set) var populateTableCalled: Bool = false
    private(set) var failedToLoadProfileCalled: Bool = false
    
    func updateProfileHeader(with headerInfo: ProfileHeader) {
        updateProfileHeaderCalled = true
    }
    
    func populateTable(with tableSections: [TableViewSection]) {
        populateTableCalled = true
    }
    
    func failedToLoadProfile(with error: Error) {
        failedToLoadProfileCalled = true
    }
}

final class MockFailureUseCase: GithubService {
    func fetchUserInformation(for userName: String, whenDone: @escaping (Result<UserProfile, Error>) -> Void) {
        whenDone(.failure(NSError()))
    }
}
