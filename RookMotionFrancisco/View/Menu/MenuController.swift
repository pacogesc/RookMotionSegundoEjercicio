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
    
    let closeSessionButton = UIButton(title: "Cerra sesión", titleColor: .black, font: .systemFont(ofSize: 14), backgroundColor: .clear, target: self, action: #selector(closeTapped))
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: - Helpers
    private func setupView() {
        viewController.view.backgroundColor = .red
        menuView.addSubview(viewController.view)
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
        
    }

}
