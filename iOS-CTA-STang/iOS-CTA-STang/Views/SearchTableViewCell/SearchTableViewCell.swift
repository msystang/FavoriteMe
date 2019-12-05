//
//  ObjectTableViewCell.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    //MARK: - UI Objects
    lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var imageActivityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        return activityIndicator
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, detailLabel])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    lazy var favoriteButton: UIButton = {
        let button = UIButton()
        //TODO: Determine when to change this image
        button.setImage(UIImage(systemName: "heart"), for: .normal)
//        button.setImage(currentButtonImage, for: .normal)
//        button.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Internal Properties
//    var isFavorited: Bool = false
//
//    var currentButtonImage: UIImage {
//        switch isFavorited {
//        case false:
//            return UIImage(systemName: "heart")!
//        case true:
//            return UIImage(systemName: "heart.fill")!
//        }
//    }
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        styleObjects()
        addsubViews()
        addConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //MARK: - Objc Functions
//    @objc func favoriteButtonPressed() {
//        //Check if already in favorites
//        
//        switch isFavorited {
//        case false:
//            //If not saved, create new favorite, save in Firestore
//            saveFavoritableToFirestore()
//        case true:
//            //If saved (based on id), delete from Firestore
//            deleteFavoritableFromFirestore()
//        }
//        
//        //Change button appearance based on isFavorited property
//        changeFavoriteButtonAppearance()
//    }
//    
//    //MARK: - Public Methods
//    public func saveFavoritableToFirestore() {
//        FirestoreService.manager.storeFavorite(favorite: <#T##Favorite#>, completion: <#T##(Result<(), Error>) -> ()#>)
//    }
//    
//    
//    public func deleteFavoritableFromFirestore() {
//        
//    }
//    
//    
//    
//    public func changeFavoriteButtonAppearance() {
//        switch isFavorited {
//        case true:
//            //Change img
//            isFavorited = false
//        case false:
//            //Change img
//            isFavorited = true
//        }
//    }
//    
//    private func createNewFavorite(by currentUserId: String, from favoritableObject: Favoritable) -> Favorite {
//        let newFavorite = Favorite(creatorID: currentUserId, favoritableObject: favoritableObject)
//        return newFavorite
//    }
}
