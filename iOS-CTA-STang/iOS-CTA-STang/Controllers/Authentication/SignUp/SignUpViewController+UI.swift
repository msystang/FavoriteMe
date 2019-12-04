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
        UIDesign.styleLoginBackgroundColor(self.view)
        UIDesign.styleTextField(emailTextField)
        UIDesign.styleTextField(passwordTextField)
        UIDesign.styleButton(signUpButton)
    }
    
    // MARK: - Constraint Methods
    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(signUpStackView)
        view.addSubview(experienceLabel)
        view.addSubview(experiencePickerView)
        view.addSubview(signUpButton)
    }
    
    func addConstraints() {
        setTitleLabelConstraints()
        setSignUpStackViewConstraints()
        setExperienceLabelConstraints()
        setExperiencePickerViewConstraints()
        setSignUpButtonConstraints()
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
        
        
        NSLayoutConstraint.activate([
            signUpStackView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            signUpStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 100),
            emailTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            passwordTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
        ])
    }
    
    private func setExperienceLabelConstraints() {
        experienceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            experienceLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            experienceLabel.topAnchor.constraint(equalTo: signUpStackView.bottomAnchor, constant: 15),
            experienceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            experienceLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setExperiencePickerViewConstraints() {
        experiencePickerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            experiencePickerView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            experiencePickerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            experiencePickerView.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor),
            experiencePickerView.heightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func setSignUpButtonConstraints() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: experiencePickerView.bottomAnchor),
            signUpButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signUpButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.5),
            signUpButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            signUpButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }



}
