//
//  LoginViewController.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    let viewModel = LoginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.MyTheme.mainPinkColor
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        agencyTextField.text = ""
        accountTextField.text = ""
        passwordTextField.text = ""
    }
    
    //MARK: - UI Elements
    //Label
    private lazy var agencyLabel: UILabel = {
       let view = UILabel()
        view.textColor = .MyTheme.loginTextColor
        view.text = "Agência com dígito"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var accountLabel: UILabel = {
       let view = UILabel()
        view.textColor = .MyTheme.loginTextColor
        view.text = "Conta com dígito"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //TextField
    private lazy var agencyTextField: UITextField = {
       let view = UITextField()
        view.borderStyle = .roundedRect
        view.backgroundColor = .MyTheme.loginTextColor
        view.textColor = .MyTheme.mainPinkColor
        view.placeholder = "0000-0"
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.keyboardType = .decimalPad
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var accountTextField: UITextField = {
       let view = UITextField()
        view.borderStyle = .roundedRect
        view.backgroundColor = .MyTheme.loginTextColor
        view.textColor = .MyTheme.mainPinkColor
        view.placeholder = "00000000-0"
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.keyboardType = .decimalPad
        view.layer.cornerRadius = 5
        return view
    }()
    
    // MARK: - password label and textfield
    private lazy var passwordLabel: UILabel = {
       let view = UILabel()
        view.textColor = .MyTheme.loginTextColor
        view.text = "Senha(6 Dígitos)"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
       let view = UITextField()
        view.placeholder = "******"
        view.borderStyle = .roundedRect
        view.textColor = .MyTheme.mainPinkColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = true
        return view
    }()
    
    // MARK: -button
    private lazy var loginButton: UIButton = {
       let view = UIButton()
        view.backgroundColor = .MyTheme.backgroundColor
        view.tintColor = .MyTheme.mainPinkColor
        view.setTitleColor(.tintColor, for: .normal)
        view.setTitle("Entrar", for: .normal)
        view.titleLabel?.font = .MyTheme.defaultText
        view.layer.cornerRadius = 5
        view.addTarget(self, action: #selector(performLogin), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - logo
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = .MyTheme.loginTextColor
        view.image = UIImage(systemName: "banknote.fill")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoLabel: UILabel = {
        let view = UILabel()
        view.text = "BankApp"
        view.font = .MyTheme.boldTitleText
        view.textColor = .MyTheme.loginTextColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    //MARK: - init
    init(){
        super.init(nibName: nil, bundle: nil)
        setupView()
        setupConstraints()
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - SetupView
    private func setupView(){
        view.addSubview(agencyLabel)
        view.addSubview(accountLabel)
        view.addSubview(agencyTextField)
        view.addSubview(accountTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(logoImageView)
        view.addSubview(logoLabel)
    }
    
    //MARK: - Constraints
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            agencyLabel.topAnchor.constraint(equalTo: view.centerYAnchor),
            agencyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            accountLabel.topAnchor.constraint(equalTo: agencyLabel.topAnchor),
            accountLabel.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            
            agencyTextField.topAnchor.constraint(equalTo: agencyLabel.bottomAnchor, constant: 5),
            agencyTextField.leadingAnchor.constraint(equalTo: agencyLabel.leadingAnchor),
            agencyTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            accountTextField.topAnchor.constraint(equalTo: agencyTextField.topAnchor),
            accountTextField.leadingAnchor.constraint(equalTo: accountLabel.leadingAnchor),
            accountTextField.widthAnchor.constraint(equalTo: agencyTextField.widthAnchor),
            
            passwordLabel.topAnchor.constraint(equalTo: agencyTextField.bottomAnchor, constant: 5),
            passwordLabel.leadingAnchor.constraint(equalTo: agencyTextField.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: accountTextField.trailingAnchor),
            
            loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            
            logoImageView.bottomAnchor.constraint(equalTo: agencyLabel.topAnchor, constant: -80),
            logoImageView.centerXAnchor.constraint(equalTo: self.loginButton.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor, multiplier: 0.6),
            
            logoLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 0),
            logoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    //MARK: - button perform
    @objc func performLogin(){
        viewModel.loginPassword = passwordTextField.text ?? ""
        viewModel.loginAccount = accountTextField.text ?? ""
        viewModel.loginAgency = agencyTextField.text ?? ""
        
        viewModel.doLogin()
    }
}

//MARK: - Delegate
extension LoginViewController: LoginViewModelDelegate {
    func displayAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    func onSuccessPush() {
        let homeViewController = HomeViewController()
        self.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
