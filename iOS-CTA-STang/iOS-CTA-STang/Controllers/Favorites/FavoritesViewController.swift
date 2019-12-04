//
//  FavoriteViewController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {
    
    //MARK: - UI Objects
    lazy var favoritesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        //TODO: Set delegate/Datasource
        return tableView
    }()
    
    lazy var signOutButton: UIBarButtonItem = {
        let signOutImage: UIImage? = UIImage(systemName: "person.crop.circle.fill.badge.xmark")
        let barButton = UIBarButtonItem(image: signOutImage, style: .plain, target: self, action: #selector(signOutButtonPressed))
        return barButton
    }()
    
    //MARK: Internal Properties
    //TODO: Declare these somewhere globally to use across VC's?
    let unfavoritedButtonImage: UIImage? = UIImage(systemName: "heart")
    let favoritedButtonImage: UIImage? = UIImage(systemName: "heart.fill")
    
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Add to functions
        self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.9568627451, green: 0.6693382982, blue: 0.5450980392, alpha: 1)
        self.title = "Favorites"
        self.navigationItem.rightBarButtonItem = signOutButton
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        addSubviews()
        addConstraints()
    }
    
    //MARK: - Objc Functions
    @objc func signOutButtonPressed() {
        FirebaseAuthService.manager.signOutUser { (result) in
            switch result {
            case .failure(let error):
                print("Could not sign out:\(error)")
            case .success(()):
                print("Signed out")
                self.goToLogInVC()
            }
        }
    }
    
    //MARK: - Private Methods
    private func goToLogInVC() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else { return }
        
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromTop, animations: {
                window.rootViewController = LogInViewController()
        })
    }

}
