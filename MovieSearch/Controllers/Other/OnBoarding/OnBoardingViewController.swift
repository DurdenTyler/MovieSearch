//
//  OnBoardingViewController.swift
//  MovieSearch
//
//  Created by Ivan White on 26.06.2022.
//

import UIKit


class OnBoardingViewController: UIViewController {
    
    private let onBoardingIdCell = "onBoardingIdCell"
    
    private var onBoardingArray = [SlideModel]()
    
    private var collectionItem = 0
    
    let onBoarding_Collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.isScrollEnabled = false
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private lazy var button_Next: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 20)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(func_button_Next), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
        setDelegates()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(button_Next)
        view.addSubview(pageControl)
        view.addSubview(onBoarding_Collection)
        onBoarding_Collection.register(OnBoardingViewCell.self, forCellWithReuseIdentifier: onBoardingIdCell)
        
        guard let image_One = UIImage(named: "strangerthings"),
              let image_Two = UIImage(named: "bladerunner"),
              let image_Three = UIImage(named: "spiderman")
        else { return }
        
        let firstScreen = SlideModel(text: "Хочешь быть в тонусе?", image: image_One)
        let secondScreen = SlideModel(text: "Или хочешь накачать мышцы?", image: image_Two)
        let thirdScreen = SlideModel(text: "Быстро и просто", image: image_Three)
        
        onBoardingArray = [firstScreen, secondScreen, thirdScreen]
    }
    
    private func setDelegates() {
        onBoarding_Collection.dataSource = self
        onBoarding_Collection.delegate = self
    }
    
    @objc private func func_button_Next() {
        if collectionItem == 1 {
            button_Next.setTitle("Вперед", for: .normal)
            button_Next.addTarget(self, action: #selector(func_new_mean), for: .touchUpInside)
        }
        
        if collectionItem == 2 {
            saveUserDefaults()
        } else {
            collectionItem += 1
            let index: IndexPath = [0, collectionItem]
            onBoarding_Collection.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            pageControl.currentPage = collectionItem
        }
    }
    
    private func saveUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "OnBoardingWasViewed")
    }
    
    @objc private func func_new_mean() {
        //
    }
}

//MARK: - UICollectionViewDataSource
extension OnBoardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onBoardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: onBoardingIdCell, for: indexPath) as! OnBoardingViewCell
        let slide = onBoardingArray[indexPath.row]
        cell.cellConfigure(slide: slide)
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
}

extension OnBoardingViewController {
    
    private func setConstrains() {

        NSLayoutConstraint.activate([
            button_Next.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            button_Next.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button_Next.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button_Next.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: button_Next.topAnchor, constant: -20),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            onBoarding_Collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            onBoarding_Collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            onBoarding_Collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            onBoarding_Collection.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20)
        ])
    }
}
