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
        searchBar.searchBarStyle = .minimal
        searchBar.delegate = self
        return searchBar
    }()
    
    lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "searchCell")
        return tableView
    }()
    
    lazy var signOutButton: UIBarButtonItem = {
        let barButton = UIBarButtonItem()
        barButton.image = UIImage(systemName: "person.crop.circle.fill.badge.xmark")
        //TODO: Add target action
        return barButton
    }()
    
    //MARK: - Internal Methods
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
        
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        navigationItem.rightBarButtonItem = signOutButton
        
        addSubviews()
        addConstraints()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadUserInfo()
    }
    
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
}

