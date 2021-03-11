//
//  HomeController.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 08/03/21.
//

import UIKit
import JGProgressHUD
import SDWebImage

class HomeController: UICollectionViewController {
    
    //MARK: - Properties
    
    private let cellid = "cellid"
    
    private let homeViewModel = HomeViewModel()
    private var newViewModel = [NewsViewModel]()
    private var newViewModelFilter = [NewsViewModel]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var inSearchMode: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    let hud = JGProgressHUD(style: .dark)
    
    //MARK: - Init
    
    init(collectionViewLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        homeViewModel.homeViewModelDelegate = self
        homeViewModel.fetchHubbleNews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar(title: "Noticias", largeTitle: true)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3")!, style: .plain, target: self, action: #selector(menuButtonTapped))
        navigationItem.hidesBackButton = true
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Buscar"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    //MARK: - Helpers
    
    private func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: cellid)
    }
    
    fileprivate func requiredHeight(labelText:String) -> CGFloat {
        
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 120, height: .greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .boldSystemFont(ofSize: 15)
        label.text = labelText
        label.sizeToFit()
        return label.frame.height
    }
    
    //MARK: - Selectors
    
    @objc fileprivate func menuButtonTapped() {
        let menu = MenuController(rootViewController: UIViewController())
        self.present(menu, animated: false)
    }

}

//MARK: - Extensions

extension HomeController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return !inSearchMode ? newViewModel.count : newViewModelFilter.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath) as! HomeCell
        cell.newsViewModel = !inSearchMode ? newViewModel[indexPath.item] : newViewModelFilter[indexPath.item]
        cell.imageView.sd_setImage(with: URL(string: !inSearchMode ? newViewModel[indexPath.item].url : newViewModelFilter[indexPath.item].url)) { (image, error, cacheType, url) in
            if error != nil{
                cell.imageView.image = UIImage(systemName: "xmark.bin")
                return
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(DetailWebViewController(newViewModel: !inSearchMode ? newViewModel[indexPath.item] : newViewModelFilter[indexPath.item]), animated: true)
    }
    
}

//MARK: - Extension UICollectionViewDelegateFlowLayout

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 32
        var height = (view.frame.height / 3)
        
        height = requiredHeight(labelText: !inSearchMode ? newViewModel[indexPath.item].titleDescription : newViewModelFilter[indexPath.item].titleDescription)
        
        height = height > 150 ? height : 150
        
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 16, bottom: 16, right: 16)
    }
}

extension HomeController: HomeViewModelDelegate, Alertable {
    func fetchingNews() {
        hud.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        hud.show(in: view)
    }
    
    func loadNews(hubbleNews: [HubbleNewsResponse]) {
        DispatchQueue.main.async {
            self.hud.dismiss(afterDelay: 0.2, animated: true)
            self.newViewModel = hubbleNews.map({ return NewsViewModel(new: $0)})
            self.collectionView.reloadData()
        }
    }
    
    func error(_ message: String) {
        hud.dismiss(afterDelay: 0.2, animated: true)
        showAlert(title: "Error", message: message, preferredStyle: .alert)
    }
}

extension HomeController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        newViewModelFilter = homeViewModel.filterNews(byTitle: searchText, news: newViewModel)
        collectionView.reloadData()
    }
}

