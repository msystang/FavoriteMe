//
//  DetailViewController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    //TODO: Only allow profile view?
    
    //MARK: - UI Objects
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var otherInfoTextView: UITextView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    //MARK: - Internal Properties
    var selectedExperience: UserExperience!
    
    var favoritableObject: Favoritable!
    var detailImage: UIImage!
    
    var museumItemplaqueDescription: String? = nil {
        didSet {
            otherInfoTextView.text = "Plaque Description: \(museumItemplaqueDescription ?? "No Plaque Description")"
        }
    }
    
    var delegate: FavoriteButtonDelegate?
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        self.delegate = self
        
        super.viewDidLoad()
        if selectedExperience == UserExperience.rijksmuseum {
            loadMuseumItemDetails()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadDataIntoObjects()
        loadButtonImage()
    }
    
    //MARK: - IBAction Methods
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        //TODO: Disable button until completion
        favoriteButton.isEnabled = false
        delegate?.checkExistsInFavorites(tag: nil, completion: {
            self.favoriteButton.isEnabled = true
        })
    }
    
    //MARK: - Private Methods
    private func loadMuseumItemDetails() {
        let urlStr = MuseumItemDetailAPIClient.getSearchResultsURLStr(from: favoritableObject.id)
        
        MuseumItemDetailAPIClient.manager.getMuseumItemDetail(urlStr: urlStr) { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let museumItemDetails):
                    self?.museumItemplaqueDescription = museumItemDetails.plaqueDescriptionEnglish
                }
            }
        }
    }
    
    private func loadDataIntoObjects() {
        detailImageView.image = detailImage
        nameLabel.text = favoritableObject.name
        detailLabel.text = favoritableObject.details
        
        
        switch selectedExperience! {
        case UserExperience.ticketMaster:
            otherInfoTextView.textAlignment = .left
            
            //TODO: Add link to ticketmaster
            otherInfoTextView.text = """
            Price range: \(favoritableObject.eventPrice ?? "No Price Posted")
            See in Ticketmaster: \(favoritableObject.eventLink ?? "No Link")
            """
        case UserExperience.rijksmuseum:
            otherInfoTextView.textAlignment = .justified
        }
        
    }
    
    private func loadButtonImage() {
        favoritableObject.existsInFavorites(userID: FirebaseAuthService.manager.currentUser!.uid) { [weak self] (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let isFavoritedInFB):
                switch isFavoritedInFB {
                case true:
                    self?.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                case false:
                    self?.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                }
            }
        }
    }
}
