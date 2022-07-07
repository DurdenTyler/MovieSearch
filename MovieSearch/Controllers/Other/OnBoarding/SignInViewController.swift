//
//  SignInViewController.swift
//  MovieSearch
//
//  Created by Ivan White on 26.06.2022.
//

import UIKit

class SignInViewController: UIViewController {
    
    private let view_Circle1: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let view_Circle2: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0.7852093963, blue: 0.7002510895, alpha: 1)
        return view
    }()
    
    private let view_Circle3: UIView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let text_SignIn: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Войти"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        return label
    }()
    
    private let textField_login: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Имя пользователя"
        textfield.backgroundColor = #colorLiteral(red: 0.982159555, green: 0.982159555, blue: 0.982159555, alpha: 1)
        textfield.textColor = .darkText
        textfield.layer.cornerRadius = 5
        textfield.clearButtonMode = .always
        textfield.returnKeyType = .done
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont(name: "SFProDisplay-Bold", size: 17)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.masksToBounds = true
        return textfield
    }()
    
    private let textField_password: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Пароль"
        textfield.backgroundColor = #colorLiteral(red: 0.982159555, green: 0.982159555, blue: 0.982159555, alpha: 1)
        textfield.textColor = .darkText
        textfield.layer.cornerRadius = 5
        textfield.clearButtonMode = .always
        textfield.returnKeyType = .done
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont(name: "SFProDisplay-Bold", size: 17)
        textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textfield.frame.height))
        textfield.leftViewMode = .always
        textfield.layer.masksToBounds = true
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    private let button_forgetPass: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Забыли пароль?", for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0.7852093963, blue: 0.7002510895, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        button.addTarget(self, action: #selector(func_forgetPass), for: .touchUpInside)
        return button
    }()
    
    private let button_go: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(func_go), for: .touchUpInside)
        return button
    }()
    
    private let text_NotWithUs: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ещё не с нами?"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        return label
    }()
    
    private let button_reg: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Зарегистрироваться", for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0.7852093963, blue: 0.7002510895, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        button.addTarget(self, action: #selector(func_reg), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstrains()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view_Circle1.layer.cornerRadius = view_Circle1.frame.width / 2
        view_Circle2.layer.cornerRadius = view_Circle2.frame.width / 2
        view_Circle3.layer.cornerRadius = view_Circle3.frame.width / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(view_Circle1)
        view.addSubview(view_Circle3)
        view.addSubview(view_Circle2)
        view.addSubview(text_SignIn)
        view.addSubview(textField_login)
        view.addSubview(textField_password)
        view.addSubview(button_forgetPass)
        view.addSubview(button_go)
        view.addSubview(text_NotWithUs)
        view.addSubview(button_reg)
    }
    
    @objc private func func_forgetPass() {
        ///
    }
    
    @objc private func func_go() {
        ///
    }
    
    @objc private func func_reg() {
        ///
    }


}

extension SignInViewController {
    
    private func setConstrains() {

        NSLayoutConstraint.activate([
            view_Circle1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            view_Circle1.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -25),
            view_Circle1.widthAnchor.constraint(equalToConstant: 300),
            view_Circle1.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            view_Circle2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -20),
            view_Circle2.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -90),
            view_Circle2.widthAnchor.constraint(equalToConstant: 350),
            view_Circle2.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            view_Circle3.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            view_Circle3.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -65),
            view_Circle3.widthAnchor.constraint(equalToConstant: 300),
            view_Circle3.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            text_SignIn.topAnchor.constraint(equalTo: view_Circle1.bottomAnchor, constant: 30),
            text_SignIn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            textField_login.topAnchor.constraint(equalTo: text_SignIn.bottomAnchor, constant: 20),
            textField_login.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textField_login.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textField_login.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            textField_password.topAnchor.constraint(equalTo: textField_login.bottomAnchor, constant: 15),
            textField_password.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textField_password.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textField_password.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            button_forgetPass.topAnchor.constraint(equalTo: textField_password.bottomAnchor, constant: 15),
            button_forgetPass.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15)
        ])
        
        NSLayoutConstraint.activate([
            button_go.topAnchor.constraint(equalTo: button_forgetPass.bottomAnchor, constant: 25),
            button_go.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            button_go.widthAnchor.constraint(equalToConstant: 55),
            button_go.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            text_NotWithUs.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -62),
            text_NotWithUs.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14)
        ])
        
        NSLayoutConstraint.activate([
            button_reg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 62),
            button_reg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
    }
}

