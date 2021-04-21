//
//  AppDelegate.swift
//  Github-Profile
//
//  Created by Krishantha on 05/04/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let profileViewController = ProfileViewController()
        let useCase: GithubService = Environment.isMockEnvironment ?
            MockGithubUseCase() :
            GithubUsecase()
        let presenter = ProfilePresenter(with: profileViewController, useCase: useCase)
        profileViewController.bindPresenter(to: presenter)
        window?.rootViewController = UINavigationController(rootViewController: profileViewController)
        window?.makeKeyAndVisible()
        return true
    }

}

