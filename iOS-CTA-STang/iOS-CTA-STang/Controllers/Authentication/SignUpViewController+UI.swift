//
//  SignUpViewController+UI.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

extension SignUpViewController {
    //MARK: - UI Design
    func styleObjects() {
        UIDesign.styleTextField(emailTextField)
        UIDesign.styleTextField(passwordTextField)
        UIDesign.styleButton(signUpButton)
    }
    
    // MARK: - Constraint Methods
    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(signUpStackView)
    }
    
    func addConstraints() {
        setTitleLabelConstraints()
        setSignUpStackViewConstraints()
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.bottomAnchor.constraint(equalTo: signUpStackView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: signUpStackView.leadingAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    private func setSignUpStackViewConstraints() {
        signUpStackView.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStackView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3),
            emailTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            passwordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            signUpButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5)
        ])
    }



}
