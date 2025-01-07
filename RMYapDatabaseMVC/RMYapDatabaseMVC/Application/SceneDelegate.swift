//
//  SceneDelegate.swift
//  RMYapDatabaseMVC
//
//  Created by Ибрагим Габибли on 29.12.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window  = UIWindow(windowScene: windowScene)

        let viewController = CharacterViewController()
        let navigationControllet = UINavigationController(rootViewController: viewController)

        window.rootViewController = navigationControllet
        self.window = window
        window.makeKeyAndVisible()
    }
}
