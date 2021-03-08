//
//  RegisterController.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 07/03/21.
//

import UIKit
import JGProgressHUD
import LBTATools

class RegisterController: UIViewController {
    
    //MARK: - Properties
    let registerLabel = UILabel(text: "Registrate", font: .boldSystemFont(ofSize: 26), textColor: .black, textAlignment: .center)
    let userTextInput = TextInput(placeHolder: "Usuario", keyboardType: .emailAddress, isSecureTextEntry: false, backgroundColor: .white)
    let passwordTextInput = TextInput(placeHolder: "Contraseña", keyboardType: .emailAddress, isSecureTextEntry: false, backgroundColor: .white)
    
    let nameTextInput = TextInput(placeHolder: "Nombre(s)", keyboardType: .default, isSecureTextEntry: false, backgroundColor: .white)
    let lastNamesTextInput = TextInput(placeHolder: "Apellidos", keyboardType: .emailAddress, isSecureTextEntry: true, backgroundColor: .white)
    
    lazy var registerButton = UIButton(title: "Registrar", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .clear, target: self, action: #selector(registerTapped))
    
    lazy var loginButton = UIButton(title: "Iniciar sesión", titleColor: .black, font: .boldSystemFont(ofSize: 16), target: self, action: #selector(loginTapped))
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - Helpers
    
    private func setupView() {
        setupGradient()
        
        userTextInput.isTrailingButtonVisible = false
        userTextInput.inputTextField.autocapitalizationType = .none
        userTextInput.inputTextField.autocorrectionType = .no
        userTextInput.leadingImageView.image = UIImage(systemName: ImageName.emailImage)
        passwordTextInput.leadingImageView.image = UIImage(systemName: ImageName.passwordImage)
        
        nameTextInput.isTrailingButtonVisible = false
        nameTextInput.inputTextField.autocapitalizationType = .none
        nameTextInput.inputTextField.autocorrectionType = .no
        
        lastNamesTextInput.isTrailingButtonVisible = false
        lastNamesTextInput.inputTextField.autocapitalizationType = .none
        lastNamesTextInput.inputTextField.autocorrectionType = .no
        
        registerButton.roundedButton(cornerRadius: 25, color: .white)
        
        view.addSubview(registerLabel)
        view.addSubview(userTextInput)
        view.addSubview(passwordTextInput)
        view.addSubview(nameTextInput)
        view.addSubview(lastNamesTextInput)
        
        view.addSubview(registerButton)
        view.addSubview(loginButton)
        
        registerLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 24, left: 0, bottom: 0, right: 0))
        registerLabel.centerXToSuperview()
        
        userTextInput.anchor(top: registerLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12))
        userTextInput.withHeight(50)
        
        passwordTextInput.anchor(top: userTextInput.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12))
        passwordTextInput.withHeight(50)
        
        nameTextInput.anchor(top: passwordTextInput.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12))
        nameTextInput.withHeight(50)
        
        lastNamesTextInput.anchor(top: nameTextInput.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 12, left: 12, bottom: 0, right: 12))
        lastNamesTextInput.withHeight(50)
        
        registerButton.anchor(top: lastNamesTextInput.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
        registerButton.centerXToSuperview()
        
        loginButton.anchor(top: registerButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        loginButton.centerXToSuperview()
        
    }
    
    //MARK: - Selectors
    
    @objc private func registerTapped() {
        
    }
    
    @objc private func loginTapped() {
        navigationController?.popToRootViewController(animated: true)
    }

}
