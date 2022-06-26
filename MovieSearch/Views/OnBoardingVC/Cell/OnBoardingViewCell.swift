//
//  OnBoardingViewCell.swift
//  MovieSearch
//
//  Created by Ivan White on 26.06.2022.
//

import UIKit

class OnBoardingViewCell: UICollectionViewCell {
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        return image
    }()
    
    private let text: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Roboto-Medium", size: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        self.backgroundColor = .white
        self.addSubview(image)
        self.addSubview(text)
    }
    
    func cellConfigure(slide: SlideModel) {
        image.image = slide.image
        text.text = slide.text
    }
}

// MARK: - setConstrains
extension OnBoardingViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            text.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 30),
            image.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            image.heightAnchor.constraint(equalToConstant: 350),
            image.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

