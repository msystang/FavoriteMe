//
//  CreateAccountViewController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {
    //TODO: Add cancel button to pop back to LogIn VC?
    
    //MARK: - UI Objects
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
        label.textColor = .white
        label.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        label.textAlignment = .center
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email"
        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.isSecureTextEntry = true
        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create New Account", for: .normal)
        button.addTarget(self, action: #selector(trySignUp), for: .touchUpInside)
        return button
    }()
    
    //TODO: Update font to match rest of app
    lazy var experienceLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose your experience:"
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 17)
        return label
    }()
    
    lazy var experiencePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        return pickerView
    }()
    
    lazy var signUpStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    //MARK: - Internal Properties
    let userExperiences = UserExperience.allCases
    
    var selectedExperience: UserExperience = UserExperience.ticketMaster
    
    //MARK: - Lifecycle Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstraints()
        styleObjects()
    }
    
    //MARK: - Objc Functions
    @objc func validateFields() {
        guard emailTextField.hasText, passwordTextField.hasText else {
            //TODO: Change style of button when enabled/disabled
            signUpButton.isEnabled = false
            return
        }
        signUpButton.isEnabled = true
    }
    
    @objc func trySignUp() {
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            showAlert(title: "Error", message: "Please fill out all fields.")
            return
        }
        
        guard email.isValidEmail else {
            showAlert(title: "Error", message: "Please enter a valid email")
            return
        }
        
        guard password.isValidPassword else {
            showAlert(title: "Error", message: "Please enter a valid password. Passwords must have at least 8 characters.")
            return
        }
        
        FirebaseAuthService.manager.createNewUser(email: email.lowercased(), password: password) { [weak self] (result) in
            self?.handleCreateAccountResponse(with: result)
        }
    }
    
    //MARK: - Private Methods
    
    private func handleCreateAccountResponse(with result: Result<User, Error>) {
        switch result {
        case .success(let user):
            let newAppUser = AppUser(from: user, selectedExperience: selectedExperience)
            FirestoreService.manager.createUser(user: newAppUser) { [weak self] (newResult) in
                self?.handleCreatedUserInFirestore(result: newResult)
            }
        case .failure(let error):
            self.showAlert(title: "Error creating user", message: "An error occured while creating new account: \(error)")
        }
    }
    
    private func handleCreatedUserInFirestore(result: Result<(), Error>) {
        switch result {
        case .success:
            guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                let sceneDelegate = windowScene.delegate as? SceneDelegate, let window = sceneDelegate.window
                else {
                    return
            }
            
            UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromBottom, animations: {
                window.rootViewController = {
                    let searchVC = AppTabBarViewController()
                    searchVC.selectedIndex = 0
                    return searchVC
                }()
            }, completion: nil)
        case .failure(let error):
            self.showAlert(title: "Error creating user", message: "An error occured while creating new account \(error)")
        }
    }
}
