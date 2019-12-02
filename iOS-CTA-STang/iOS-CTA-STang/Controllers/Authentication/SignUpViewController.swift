//
//  CreateAccountViewController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    //TODO: Add cancel button to pop back to LogIn VC
    
    //MARK: - UI Objects
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign Up"
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
//        button.addTarget(self, action: #selector(trySignUp), for: .touchUpInside)
        return button
    }()
    
    lazy var experienceLabel: UILabel = {
        let label = UILabel()
        label.text = "Choose your experience:"
        label.textAlignment = .center
        return label
    }()
    
    lazy var experiencePickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        //TODO: Set delegate/Datasource
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

        view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        
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

}
