//
//  SignUpViewController.swift
//  MovieSearch
//
//  Created by Ivan White on 26.06.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    
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
    
    private let view_Circle4: UIView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        return view
    }()
    
    private let view_Circle5: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0, green: 0.7852093963, blue: 0.7002510895, alpha: 1)
        return view
    }()
    
    private let text_SignUp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Регистрация"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Bold", size: 28)
        return label
    }()
    
    private let textField_login: UITextField = {
        let textfield = UITextField()
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.placeholder = "Ваш email"
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
    
    private let textField_password2: UITextField = {
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
    
    private let button_go: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(func_go), for: .touchUpInside)
        return button
    }()
    
    private let text_AlreadyReg: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Уже зарегистрированы?"
        label.textColor = .black
        label.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        return label
    }()
    
    private let button_SignIn: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Войти", for: .normal)
        button.tintColor = #colorLiteral(red: 0, green: 0.7852093963, blue: 0.7002510895, alpha: 1)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        button.addTarget(self, action: #selector(func_backToSignIn), for: .touchUpInside)
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
        view_Circle4.layer.cornerRadius = view_Circle4.frame.width / 2
        view_Circle5.layer.cornerRadius = view_Circle5.frame.width / 2
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(view_Circle1)
        view.addSubview(view_Circle3)
        view.addSubview(view_Circle2)
        view.addSubview(view_Circle4)
        view.addSubview(view_Circle5)
        view.addSubview(text_SignUp)
        view.addSubview(textField_login)
        view.addSubview(textField_password)
        view.addSubview(textField_password2)
        view.addSubview(button_go)
        view.addSubview(text_AlreadyReg)
        view.addSubview(button_SignIn)
    }
    
    @objc private func func_forgetPass() {
        ///
    }
    
    @objc private func func_go() {
        
        guard let textEmail = textField_login.text else { return }
        let emailCount = textEmail.filter {$0.isNumber || $0.isLetter}.count
        if textEmail.contains("@") && textEmail.contains(".") && emailCount > 3 {
            textField_login.backgroundColor = #colorLiteral(red: 0.982159555, green: 0.982159555, blue: 0.982159555, alpha: 1)
        } else {
            textField_login.backgroundColor = #colorLiteral(red: 1, green: 0.3519983888, blue: 0.2944571674, alpha: 1)
            simpleAlertOK(title: "Ошибка", message: "Введите правильный email")
        }
        
        guard let textPass1 = textField_password.text else { return }
        let textPass1Count = textPass1.filter {$0.isNumber || $0.isLetter}.count
        if textPass1Count <= 5 {
            textField_password.backgroundColor = #colorLiteral(red: 1, green: 0.3519983888, blue: 0.2944571674, alpha: 1)
            simpleAlertOK(title: "Ошибка", message: "Пароль должен быть длиннее")
        } else {
            textField_password.backgroundColor = #colorLiteral(red: 0.982159555, green: 0.982159555, blue: 0.982159555, alpha: 1)
        }
        
        guard let textPass2 = textField_password2.text else { return }
        if textPass1 != textPass2 {
            textField_password2.backgroundColor = #colorLiteral(red: 1, green: 0.3519983888, blue: 0.2944571674, alpha: 1)
            simpleAlertOK(title: "Ошибка", message: "Проверочный пароль не совпадает")
        } else {
            textField_password2.backgroundColor = #colorLiteral(red: 0.982159555, green: 0.982159555, blue: 0.982159555, alpha: 1)
        }
        
        AuthService.shared.signUp(email: textEmail, password: textPass1) { result in
            switch result {
            case .success(let user):
                self.simpleAlertOK(title: "Успешно", message: "Вы успешно зарегистрированы как \(user.email!)")
                /// тут автоматически проходит регистрация и перенаправление на глав экран
                
            case .failure(let error):
                self.simpleAlertOK(title: "Ошибка", message: "Ошибка регистрации \(error.localizedDescription)")
            }
        }
    }
    
    @objc private func func_backToSignIn() {
        dismiss(animated: false)
    }
}

extension SignUpViewController {
    
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
            text_SignUp.topAnchor.constraint(equalTo: view_Circle1.bottomAnchor, constant: 30),
            text_SignUp.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15)
        ])
        
        NSLayoutConstraint.activate([
            textField_login.topAnchor.constraint(equalTo: text_SignUp.bottomAnchor, constant: 20),
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
            textField_password2.topAnchor.constraint(equalTo: textField_password.bottomAnchor, constant: 15),
            textField_password2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            textField_password2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            textField_password2.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            button_go.topAnchor.constraint(equalTo: textField_password2.bottomAnchor, constant: 25),
            button_go.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            button_go.widthAnchor.constraint(equalToConstant: 55),
            button_go.heightAnchor.constraint(equalToConstant: 55)
        ])
        
        NSLayoutConstraint.activate([
            text_AlreadyReg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -25),
            text_AlreadyReg.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14)
        ])
        
        NSLayoutConstraint.activate([
            button_SignIn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 85),
            button_SignIn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            view_Circle4.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            view_Circle4.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            view_Circle4.widthAnchor.constraint(equalToConstant: 80),
            view_Circle4.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            view_Circle5.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            view_Circle5.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            view_Circle5.widthAnchor.constraint(equalToConstant: 60),
            view_Circle5.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}


