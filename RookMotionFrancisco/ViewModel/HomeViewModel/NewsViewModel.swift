//
//  NewsViewModel.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 09/03/21.
//

import Foundation

class NewsViewModel {
    
    //MARK: - Properties
    let name: String
    let description: String
    let titleDescription: String
    let url: String
    
    //MARK: - Init
    
    init(new: HubbleNewsResponse) {
        self.name = new.title
        self.description = new.description
        self.url = "https:\(new.image)"
        self.titleDescription = "\(new.title) \(new.description)"
    }
    
    //MARK: - Helpers
    
}
