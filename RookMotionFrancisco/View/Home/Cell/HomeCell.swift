//
//  HomeCell.swift
//  RookMotionFrancisco
//
//  Created by Francisco Guerrero Escamilla on 08/03/21.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let imageView = UIImageView(image: nil, contentMode: .scaleAspectFit)
    let titleLabel = UILabel(font: .boldSystemFont(ofSize: 14), textColor: .black, numberOfLines: -1)
    let descriptionLabel = UILabel(font: .boldSystemFont(ofSize: 12), textColor: .gray, textAlignment: .justified , numberOfLines: -1)
    
    var newsViewModel: NewsViewModel! {
        didSet {
            titleLabel.text = newsViewModel.name
            descriptionLabel.text = newsViewModel.description
        }
    }
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    private func setupViewComponents() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 6, left: 12, bottom: 0, right: 0))
        imageView.withSize(.init(width: 120, height: 120))
        
        titleLabel.anchor(top: topAnchor, leading: imageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 6, left: 6, bottom: 0, right: 6))
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, leading: imageView.trailingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 6, bottom: 0, right: 6))
    }
    
    //MARK: - Selectors
    
}