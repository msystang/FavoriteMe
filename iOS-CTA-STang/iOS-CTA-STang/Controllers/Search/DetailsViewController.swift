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
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    //MARK: - Internal Properties
    var selectedExperience: UserExperience!

    var favoritableObject: Favoritable!
    var detailImage: UIImage!
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataIntoObjects()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    //MARK: - IBAction Methods
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        
    }
    
    //MARK: - Private Methods
    private func loadDataIntoObjects() {
        detailImageView.image = detailImage
        detailTitleLabel.text = favoritableObject.name
        
        
        switch selectedExperience! {
        case UserExperience.ticketMaster:
            detailTextView.textAlignment = .left
            
            //TODO: Add link to ticketmaster
            detailTextView.text = """
            Date & Time: \(favoritableObject.details)
            Price range: \(favoritableObject.eventPrice ?? "No Price Posted")
            See in Ticketmaster: \(favoritableObject.eventLink ?? "No Link")
            """
        case UserExperience.rijksmuseum:
            //TODO: Add more museum details from MuseumItemDetails
            detailTextView.textAlignment = .justified
            detailTextView.text = """
            Place of production: \(favoritableObject.details)
            """
        }
        
        
    }
}
