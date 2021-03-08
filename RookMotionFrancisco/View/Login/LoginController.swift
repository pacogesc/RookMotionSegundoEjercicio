//
//  LoginController.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 06/03/21.
//

import UIKit
import LBTATools
import JGProgressHUD

class LoginController: UIViewController {
    
    //MARK: - Properties
    
    let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle"), contentMode: .scaleAspectFill)
    let welcomeLabel = UILabel(text: "¡Bienvenido!", font: .boldSystemFont(ofSize: 26), textColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), textAlignment: .center)
    let userTextInput = TextInput(placeHolder: "Usuario", keyboardType: .emailAddress, isSecureTextEntry: false, backgroundColor: .white)
    let passwordTextInput = TextInput(placeHolder: "Contraseña", keyboardType: .emailAddress, isSecureTextEntry: true, backgroundColor: .white)
    
    lazy var loginButton = UIButton(title: "Iniciar", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .clear, target: self, action: #selector(loginTapped))
    lazy var siginButton = UIButton(title: "Únete", titleColor: .black, font: .boldSystemFont(ofSize: 16), backgroundColor: .clear, target: self, action: #selector(siginTapped))
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewComponents()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - Helpers
    
    private func setupGradient() {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.locations = [0.0, 1.0]
        gradient.colors = [#colorLiteral(red: 0.2690247297, green: 0.4241275191, blue: 1, alpha: 1).cgColor, #colorLiteral(red: 0.1681487262, green: 0.2643073797, blue: 0.6318634748, alpha: 1).cgColor]
        view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func setupViewComponents() {
        setupGradient()
        
        userTextInput.isTrailingButtonVisible = false
        userTextInput.inputTextField.autocapitalizationType = .none
        userTextInput.inputTextField.autocorrectionType = .no
        userTextInput.leadingImageView.image = UIImage(systemName: ImageName.emailImage)
        passwordTextInput.leadingImageView.image = UIImage(systemName: ImageName.passwordImage)
        
        imageView.tintColor = .white
        
        loginButton.roundedButton(cornerRadius: 25, color: .white)
        siginButton.roundedButton(cornerRadius: 25, color: .black)
        
        view.addSubview(imageView)
        imageView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: view.frame.height * 0.1, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.height * 0.2, height: view.frame.height * 0.2))
        imageView.centerXToSuperview()
        
        view.addSubview(welcomeLabel)
        view.addSubview(userTextInput)
        view.addSubview(passwordTextInput)
        
        welcomeLabel.anchor(top: imageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 24, left: 12, bottom: 0, right: 12))
        
        userTextInput.anchor(top: welcomeLabel.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 28, left: 16, bottom: 0, right: 16))
        userTextInput.withHeight(50)
        
        passwordTextInput.anchor(top: userTextInput.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 16, left: 16, bottom: 0, right: 16))
        passwordTextInput.withHeight(50)
        
        view.addSubview(loginButton)
        view.addSubview(siginButton)
        
        loginButton.anchor(top: passwordTextInput.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
        loginButton.centerXToSuperview()
        
        siginButton.anchor(top: loginButton.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 18, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 50))
        siginButton.centerXToSuperview()
    }
    
    //MARK: - Selectors
    
    @objc private func loginTapped() {
        
    }
    
    @objc private func siginTapped() {
        
    }

}
