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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
        return tableView
    }()
    
    lazy var signOutButton: UIBarButtonItem = {
        let signOutImage: UIImage? = UIImage(systemName: "person.crop.circle.fill.badge.xmark")
        let barButton = UIBarButtonItem(image: signOutImage, style: .plain, target: self, action: #selector(signOutButtonPressed))
        return barButton
    }()
    
    //MARK: - Internal Properties
    var favorites = [Favorite]() {
        didSet {
            favoritesTableView.reloadData()
        }
    }
    
    //TODO: Declare these somewhere globally to use across VC's?
    let unfavoritedButtonImage: UIImage? = UIImage(systemName: "heart")
    let favoritedButtonImage: UIImage? = UIImage(systemName: "heart.fill")
    
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Favorites"
        self.navigationItem.rightBarButtonItem = signOutButton
        
        addSubviews()
        addConstraints()
        styleObjects()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadFavorites()
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
    
    private func loadFavorites() {
        FirestoreService.manager.getFavorites(forUserID: FirebaseAuthService.manager.currentUser!.uid) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let favoritesFromFB):
                self?.favorites = favoritesFromFB
            }
        }
    }

}
