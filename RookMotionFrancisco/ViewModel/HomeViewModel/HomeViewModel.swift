//
//  HomeViewModel.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 09/03/21.
//

import Foundation

protocol HomeViewModelDelegate {
    func fetchingNews()
    func loadNews(hubbleNews: [HubbleNewsResponse])
    func error(_ message: String)
}

class HomeViewModel {
    
    //MARK: - Properties
    var homeViewModelDelegate: HomeViewModelDelegate?
    let netwotkManager = NetworkManager<HubbleApi>()
    
    //MARK: - Methods
    
    func fetchHubbleNews() {
        homeViewModelDelegate?.fetchingNews()
        netwotkManager.getHubbleNews() { [weak self] (res , err) in
            if let err = err {
                self?.homeViewModelDelegate?.error(err)
            }
            
            guard let res = res else {
                self?.homeViewModelDelegate?.error("Respuesta vacia")
                return }
            
            self?.homeViewModelDelegate?.loadNews(hubbleNews: res)
        }
    }
}
