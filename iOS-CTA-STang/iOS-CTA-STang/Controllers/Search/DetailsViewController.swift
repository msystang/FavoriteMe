//
//  DetailViewController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    //MARK: - UI Objects
    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var favoriteButton: UIButton!
    
    //MARK: - Internal Properties
    var selectedExperience: UserExperience!

    //TODO: Refactor to pass over one Favoritable protocol property 
    var event: Event?
    var museumItem: MuseumItem?
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    //MARK: - IBAction Methods
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        
    }
    
    
}
