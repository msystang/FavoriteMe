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
        //TODO: Set delegate/Datasource
        return searchBar
    }()
    
    lazy var searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    //MARK: - Internal Methods
    var currentUser: AppUser!
    
    var selectedExperience: UserExperience {
        switch currentUser.selectedExperience {
        case "Ticketmaster":
            return UserExperience.ticketMaster
        case "Rijksmuseum":
            return UserExperience.rijksmuseum
        default:
            return UserExperience.ticketMaster
        }
        
    }
    
    var events = [Event]() {
        didSet {
            searchTableView.reloadData()
        }
    }
    
    var museumItems = [MuseumItem]() {
        didSet {
            searchTableView.reloadData()
        }
    }
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
        addSubviews()
        addConstraints()
        
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
                self?.loadSearchResults()
            }
        }
    }
    
    private func loadSearchResults() {
        // switch API client
        // load Data
    }
    
}

