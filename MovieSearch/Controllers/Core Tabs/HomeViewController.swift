//
//  ViewController.swift
//  MovieSearch
//
//  Created by Ivan White on 26.06.2022.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .blue
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    private func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            let vc = OnBoardingViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }


}

