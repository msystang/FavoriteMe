//
//  SearchTableViewCell+UI.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/3/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

extension SearchTableViewCell {
    func addsubViews() {
        self.contentView.addSubview(cellImageView)
        self.contentView.addSubview(favoriteButton)
        self.contentView.addSubview(labelStackView)
    }
    
    func addConstraints() {
        setCellImageViewConstraints()
        setFavoriteButtonConstraints()
        setLabelStackViewConstraints()
        
    }
    
    private func setCellImageViewConstraints() {
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            cellImageView.widthAnchor.constraint(equalTo: cellImageView.heightAnchor)
        ])
    }
    
    private func setFavoriteButtonConstraints() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favoriteButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    
    private func setLabelStackViewConstraints() {
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 5),
            labelStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            labelStackView.trailingAnchor.constraint(equalTo: favoriteButton.leadingAnchor, constant: -5)
        ])
    }
    


}
