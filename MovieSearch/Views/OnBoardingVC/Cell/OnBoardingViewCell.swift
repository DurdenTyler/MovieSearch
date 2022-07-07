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
        return image
    }()
    
    let image_small: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.layer.borderColor = UIColor.orange.cgColor
        image.layer.borderWidth = 8
        image.clipsToBounds = true
        return image
    }()
    
    private let text: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Roboto-Medium", size: 42)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
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
        self.addSubview(image_small)
    }
    
    func cellConfigure(slide: SlideModel) {
        image.image = slide.image2
        image_small.image = slide.image
        text.text = slide.text
        text.textColor = slide.colorText
    }
    
}

// MARK: - setConstrains
extension OnBoardingViewCell {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: self.topAnchor, constant: 85),
            text.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            text.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            image_small.topAnchor.constraint(equalTo: self.topAnchor, constant: 160),
            image_small.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            image_small.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            image_small.heightAnchor.constraint(equalToConstant: 450)
        ])
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            image.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}


