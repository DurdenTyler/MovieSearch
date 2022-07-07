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
        pageControl.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.2392156863, green: 0.05882352941, blue: 0.01960784314, alpha: 1)
        return pageControl
    }()
    
    private lazy var button_Next: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9098039216, green: 0.5254901961, blue: 0, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Далее", for: .normal)
        button.titleLabel?.font = UIFont(name: "Roboto-Medium", size: 20)
        button.tintColor = #colorLiteral(red: 0.2392156863, green: 0.05882352941, blue: 0.01960784314, alpha: 1)
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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        changeColorButton()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(onBoarding_Collection)
        onBoarding_Collection.register(OnBoardingViewCell.self, forCellWithReuseIdentifier: onBoardingIdCell)
        view.addSubview(button_Next)
        view.addSubview(pageControl)
        
        guard let image_One = UIImage(named: "bladerunner"),
              let image_Two = UIImage(named: "strangerthings"),
              let image_Three = UIImage(named: "spiderman"),
              let image2_One = UIImage(named: "bladerunner2"),
              let image2_Two = UIImage(named: "strangerthings2"),
              let image2_Three = UIImage(named: "spiderman2")
        else { return }
        
        let firstScreen = SlideModel(text: "Не знаешь что посмотреть?", image: image_One, image2: image2_One, colorText: #colorLiteral(red: 0.2392156863, green: 0.05882352941, blue: 0.01960784314, alpha: 1))
        let secondScreen = SlideModel(text: "Задай нужные настройки для поиска фильма", image: image_Two, image2: image2_Two, colorText: #colorLiteral(red: 0.9764705882, green: 0.8509803922, blue: 0.5490196078, alpha: 1))
        let thirdScreen = SlideModel(text: "Или полистай тематические подборки", image: image_Three, image2: image2_Three, colorText: .white)
        
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
    
    private func changeColorButton() {
        if collectionItem == 1 {
            button_Next.backgroundColor = .specialYellow
            button_Next.tintColor = #colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 1)
            pageControl.pageIndicatorTintColor = #colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 1)
        } else if collectionItem == 2 {
            button_Next.backgroundColor = .specialBlue
            button_Next.tintColor = .white
            pageControl.pageIndicatorTintColor = .specialBlue
        }
    }
    
    private func saveUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "OnBoardingWasViewed")
    }
    
    @objc private func func_new_mean() {
        let signInVC = SignInViewController()
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true)
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
        
        if collectionItem == 1 {
            cell.image_small.layer.borderColor = UIColor.specialGray.cgColor
        } else if collectionItem == 2 {
            cell.image_small.layer.borderColor = UIColor.specialBlue.cgColor
        } else if collectionItem == 3 {
            cell.image_small.layer.borderColor = UIColor.black.cgColor
        }
        
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
            onBoarding_Collection.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            onBoarding_Collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            onBoarding_Collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            onBoarding_Collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            button_Next.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -37),
            button_Next.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button_Next.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button_Next.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            pageControl.bottomAnchor.constraint(equalTo: button_Next.topAnchor, constant: -34),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pageControl.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}



extension UIColor {
    static let specialYellow = #colorLiteral(red: 0.9764705882, green: 0.8509803922, blue: 0.5490196078, alpha: 1)
    static let specialGray = #colorLiteral(red: 0.2549019608, green: 0.2745098039, blue: 0.3019607843, alpha: 1)
    static let specialBlue = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
}
