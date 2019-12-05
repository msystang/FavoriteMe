//
//  ViewController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SearchListViewController: UIViewController {
    //MARK: - UI Objects
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.searchBarStyle = .minimal
        return searchBar
    }()
    
    lazy var searchTableView: UITableView = {
        let tableView = UITableView()
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
    var currentUser: AppUser! {
        didSet {
            assignSelectedExperience()
        }
    }
    
    var selectedExperience: UserExperience? = nil
    
    var searchString: String? = nil {
        didSet {
            determineUserExperience()
        }
    }
    
    var favoritableObjects = [Favoritable]() {
        didSet{
            searchTableView.reloadData()
        }
    }
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = signOutButton
        
        styleObjects()
        addSubviews()
        addConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUserInfo()
        searchTableView.reloadData()
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
    private func loadUserInfo() {
        let user = FirebaseAuthService.manager.currentUser!
        FirestoreService.manager.getCurrentUserInfo(user: user) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let appUser):
                self?.currentUser = appUser
                self?.loadVCTitle()
                self?.setPlaceHolderText()
            }
        }
    }
    
    private func loadVCTitle() {
        self.title = currentUser.selectedExperience
    }
    
    private func setPlaceHolderText() {
        if selectedExperience != nil {
            switch selectedExperience! {
            case UserExperience.ticketMaster:
                searchBar.placeholder = "Enter a city to search events"
            case UserExperience.rijksmuseum:
                searchBar.placeholder = "Search for art pieces"
            }
        }
    }
    
    private func assignSelectedExperience() {
        switch currentUser.selectedExperience {
        case "Ticketmaster":
            selectedExperience = UserExperience.ticketMaster
        case "Rijksmuseum":
            selectedExperience = UserExperience.rijksmuseum
        default:
            selectedExperience = UserExperience.ticketMaster
        }
    }
    
    private func determineUserExperience() {
        if selectedExperience != nil {
            switch selectedExperience! {
            case UserExperience.ticketMaster:
                loadEvents()
            case UserExperience.rijksmuseum:
                loadMuseumItems()
            }
        }
    }
    
    //TODO: Load default results before searchString is used?
    private func loadEvents() {
        let urlStr = EventAPIClient.getSearchResultsURLStr(from: searchString ?? "")
        
        EventAPIClient.manager.getEvent(urlStr: urlStr) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let eventsFromOnline):
                    self?.favoritableObjects = eventsFromOnline as [Favoritable]
                }
            }
        }
    }
    
    private func loadMuseumItems() {
        let urlStr = MuseumItemAPIClient.getSearchResultsURLStr(from: searchString ?? "")
        
        MuseumItemAPIClient.manager.getMuseumItem(urlStr: urlStr) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let museumItemsFromOnline):
                    self?.favoritableObjects = museumItemsFromOnline as [Favoritable]
                }
            }
        }
        
    }
    
    private func goToLogInVC() {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
            else { return }
        
        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromTop, animations: {
                window.rootViewController = LogInViewController()
        })
    }

}

