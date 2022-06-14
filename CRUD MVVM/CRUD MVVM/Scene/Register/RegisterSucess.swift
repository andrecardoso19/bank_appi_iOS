//
//  CadastroConcluido.swift
//  CRUD MVVM
//
//  Created by user217685 on 6/14/22.
//

import UIKit
import Foundation

class RegisterSucess: UIViewController {
    //MARK: - Labels Texts
    private lazy var sucessLabel:UILabel = {
        let view = UILabel()
        view.text = "Seja bem-vindo ao OinkBank, cadastro realizado com sucesso!"
        view.numberOfLines = 3
        view.font = UIFont.MyTheme.defaultText.withSize(24)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    private lazy var infoLabel:UILabel = {
        let view = UILabel()
        view.text = "Seus dados de acesso:"
        view.font = UIFont.MyTheme.defaultText.withSize(17)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        }()
    //MARK: - Images Views
    private lazy var infosAccount: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.text = "•Conta: 1-2 \n•Agência: 1-9"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var pigImageRegisterSucess: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "FredSucesso")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //MARK: - Botão
    private lazy var sucessButton: UIButton = {
        let view = UIButton()
        view.setTitle("Entrar", for: .normal)
        view.addTarget(self, action: #selector(sucessEnterButton), for: .touchUpInside)
        view.backgroundColor = UIColor.MyTheme.mainGrayButtonColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    //MARK: - Button Actions
    @objc func sucessEnterButton() {
        navigationController?.popToRootViewController(animated: true)

    }
   
    
    //MARK: - viewdidload
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let presentationController = presentationController as? UISheetPresentationController {
                presentationController.detents = [
                    .large()
                ]
            setupView()
            setupConstraints()
            view.backgroundColor = .white
    }
    }
    //MARK: - SetupView
        func setupView(){
        view.addSubview(sucessLabel)
        view.addSubview(infoLabel)
        view.addSubview(infosAccount)
        view.addSubview(pigImageRegisterSucess)
        view.addSubview(sucessButton)
        
        
    }
    //MARK: - Constraints
        func setupConstraints(){
        NSLayoutConstraint.activate([
            sucessLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            sucessLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            sucessLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
            infoLabel.topAnchor.constraint(equalTo: sucessLabel.bottomAnchor,constant: 20),
            infoLabel.leadingAnchor.constraint(equalTo: sucessLabel.leadingAnchor),
            infoLabel.trailingAnchor.constraint(equalTo: sucessLabel.trailingAnchor),
            infosAccount.topAnchor.constraint(equalTo: infoLabel.bottomAnchor,constant: 10),
            infosAccount.leadingAnchor.constraint(equalTo: infoLabel.leadingAnchor),
            infosAccount.trailingAnchor.constraint(equalTo: infoLabel.trailingAnchor),
            sucessButton.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -40),
            sucessButton.trailingAnchor.constraint(equalTo: sucessLabel.trailingAnchor),
            sucessButton.leadingAnchor.constraint(equalTo: sucessLabel.leadingAnchor),
            pigImageRegisterSucess.bottomAnchor.constraint(equalTo: sucessButton.topAnchor,constant: -40),
            pigImageRegisterSucess.leadingAnchor.constraint(equalTo: sucessLabel.leadingAnchor),
            pigImageRegisterSucess.trailingAnchor.constraint(equalTo: sucessLabel.trailingAnchor)
            
        ])
    }
   
}

