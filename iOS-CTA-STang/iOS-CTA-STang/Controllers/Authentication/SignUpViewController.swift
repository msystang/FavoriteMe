//
//  CreateAccountViewController.swift
//  iOS-CTA-STang
//
//  Created by Sunni Tang on 12/2/19.
//  Copyright © 2019 Sunni Tang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
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
//        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.isSecureTextEntry = true
//        textField.addTarget(self, action: #selector(validateFields), for: .editingChanged)
        return textField
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Create New Account", for: .normal)
//        button.addTarget(self, action: #selector(trySignUp), for: .touchUpInside)
        return button
    }()
    
    lazy var signUpStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, signUpButton])
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}