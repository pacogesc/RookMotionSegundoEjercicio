//
//  MenuController.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 08/03/21.
//

import UIKit

class MenuController: UINavigationController {
    
    //MARK: - Properties
    
    private let viewController: UIViewController
    var menuWidth: CGFloat = UIScreen.main.bounds.width * 0.33
    lazy var dismissButton = UIButton(title: "", titleColor: .clear, font: .systemFont(ofSize: 1), backgroundColor: .clear, target: self, action: #selector(dismissTapped))
    var isMenuPresented: Bool = false
    
    let imageView = UIImageView(image: UIImage(systemName: "person.crop.rectangle.fill"), contentMode: .scaleAspectFill)
    let wellcomeLabel = UILabel(text: "Hola", font: .systemFont(ofSize: 24), textColor: .black, textAlignment: .center, numberOfLines: 1)
    let nameLabel = UILabel(font: .boldSystemFont(ofSize: 18), textColor: .black, textAlignment: .center, numberOfLines: 1)
    let emailLabel = UILabel(font: .systemFont(ofSize: 16), textColor: .black, textAlignment: .center, numberOfLines: 1)
    
    lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var closeSessionButton = UIButton(title: "Cerra sesión", titleColor: .black, font: .boldSystemFont(ofSize: 16), backgroundColor: .clear, target: self, action: #selector(closeTapped))
    
    let menuViewModel = MenuViewModel()
    
    //MARK: - Init
    
    override init(rootViewController: UIViewController) {
        self.viewController = rootViewController
        super.init(rootViewController: rootViewController)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0, options: .curveEaseOut, animations:({ [unowned self] in
            self.containerView.frame.origin.x =  self.view.frame.size.width + self.menuWidth
        }), completion: nil)
        menuViewModel.menuDelegate = self
        menuViewModel.getUserData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - Helpers
    private func setupView() {
        menuView.addSubview(viewController.view)
        
        menuView.addSubview(closeSessionButton)
        
        menuView.addSubview(imageView)
        menuView.addSubview(wellcomeLabel)
        menuView.addSubview(nameLabel)
        menuView.addSubview(emailLabel)
        
        imageView.tintColor = #colorLiteral(red: 0.2548260987, green: 0.2807472646, blue: 0.7541999221, alpha: 1)
        imageView.anchor(top: menuView.topAnchor, leading: menuView.leadingAnchor, bottom: nil, trailing: menuView.trailingAnchor, padding: .init(top: view.frame.height / 5, left: 6, bottom: 0, right: 6))
        imageView.withHeight(menuWidth)
        
        wellcomeLabel.anchor(top: imageView.bottomAnchor, leading: imageView.leadingAnchor, bottom: nil, trailing: imageView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        nameLabel.anchor(top: wellcomeLabel.bottomAnchor, leading: imageView.leadingAnchor, bottom: nil, trailing: imageView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        emailLabel.anchor(top: nameLabel.bottomAnchor, leading: imageView.leadingAnchor, bottom: nil, trailing: imageView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        
        
        closeSessionButton.anchor(top: nil, leading: menuView.leadingAnchor, bottom: menuView.bottomAnchor, trailing: menuView.trailingAnchor, padding: .init(top: 0, left: 12, bottom: 24, right: 12))
        closeSessionButton.withHeight(40)
        
        viewController.view.fillSuperview()
        containerView.edgeTo(view)
        
        menuView.pinMenuTo(view, with: menuWidth)
        
        containerView.addSubview(dismissButton)
        dismissButton.fillSuperview()
    }
    
    //MARK: - Selectors
    
    @objc private func dismissTapped() {
        self.dismiss(animated: false, completion: nil)
    }
    
    @objc private func closeTapped() {
        menuViewModel.deleteData()
    }

}

extension MenuController: MenuViewModelDelegate {
    func dataUser(_ user: UserStore) {
        nameLabel.text = "\(user.name) \(user.lastName)"
        emailLabel.text = user.email
        
    }
    
    func sessionClosed() {
        let loginController = LoginController()
        let navController = UINavigationController(rootViewController: loginController)
        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first!
        window.rootViewController = navController
    }
}
