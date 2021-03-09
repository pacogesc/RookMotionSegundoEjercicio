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
    let welcomeLabel = UILabel(text: "¡Bienvenido!", font: .boldSystemFont(ofSize: 26), textColor: .black, textAlignment: .center)
    let userTextInput = TextInput(placeHolder: "Usuario", keyboardType: .emailAddress, isSecureTextEntry: false, backgroundColor: .white)
    let passwordTextInput = TextInput(placeHolder: "Contraseña", keyboardType: .emailAddress, isSecureTextEntry: true, backgroundColor: .white)
    
    lazy var loginButton = UIButton(title: "Iniciar", titleColor: .white, font: .boldSystemFont(ofSize: 16), backgroundColor: .clear, target: self, action: #selector(loginTapped))
    lazy var siginButton = UIButton(title: "Únete", titleColor: .black, font: .boldSystemFont(ofSize: 16), backgroundColor: .clear, target: self, action: #selector(siginTapped))
    
    private let loginViewModel = LoginViewModel()
    
    let hud = JGProgressHUD(style: .dark)
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewComponents()
        loginViewModel.loginViewModelDelegate = self
        let loggedIn = UserDefaults.standard.bool(forKey: Constants.DefaultsConstants.loggedIn)
        if loggedIn {
            navigationController?.pushViewController(HomeController(), animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - Helpers
    
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
        loginViewModel.checkUser(email: userTextInput.inputTextField.text, password: passwordTextInput.inputTextField.text)
    }
    
    @objc private func siginTapped() {
        navigationController?.pushViewController(RegisterController(), animated: true)
    }

}


extension LoginController: LoginViewModelDelegate, Alertable {
    func success() {
        hud.dismiss(animated: true)
        UserDefaults.standard.setValue(true, forKey: Constants.DefaultsConstants.loggedIn)
        navigationController?.pushViewController(HomeController(), animated: true)
    }
    
    func failure(_ messaege: String) {
        hud.dismiss(afterDelay: 0.2, animated: true)
        showAlert(title: "Error", message: messaege, preferredStyle: .alert)
    }
    
    func loading() {
        hud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        hud.show(in: view)
    }
    
    
}
