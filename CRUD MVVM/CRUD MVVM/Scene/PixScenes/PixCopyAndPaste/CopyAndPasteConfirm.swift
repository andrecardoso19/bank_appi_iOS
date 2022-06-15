//
//  CopyAndPasteConfirm.swift
//  CRUD MVVM
//
//  Created by user217584 on 27/05/22.
//

import Foundation
import UIKit

class CopyAndPasteConfirmViewController: UIViewController {
    
    let pixCopyAndPastViewModel = PixCopyAndPasteViewModel()
    
    lazy var pixKeyLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "Chave Pix"
        lb.font = .MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var keyLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "Chave Aleatória"
        lb.font = UIFont.MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .right
        return lb
    }()
    
    lazy var pixNameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "Nome"
        lb.font = UIFont.MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "João Da Silva"
        lb.font = UIFont.MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .right
        return lb
    }()
    
    lazy var pixCPFLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "CPF"
        lb.font = UIFont.MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .left
        return lb
    }()
    
    lazy var cpfLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "000.000.000-00"
        lb.font = UIFont.MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .right
        return lb
    }()
    
    lazy var valueLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 1
        lb.text = "R$ 0,00"
        lb.font = UIFont.MyTheme.boldTitleText
        lb.textColor = .MyTheme.mainPinkColor
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var confirmLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.numberOfLines = 2
        lb.text = "Confirme os dados de quem ira receber o pix:"
        lb.font = UIFont.MyTheme.defaultText
        lb.textColor = .MyTheme.defaultTextColor
        lb.textAlignment = .center
        return lb
    }()
    
    lazy var confirmButton:UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("CONFIRMAR PIX", for: .normal)
        button.titleLabel?.font = UIFont.MyTheme.defaultText
        button.setTitleColor(UIColor.MyTheme.whiteTextColor, for: .normal)
        button.backgroundColor = UIColor.MyTheme.mainPinkColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(self.confirmPix), for: .touchUpInside)
        return button
    }()
    
    @objc func confirmPix(sender:UIButton){
        let verifyTransfer = pixCopyAndPastViewModel.transferValue()
        
        if verifyTransfer == true {
            let succesViewController = TransactionSuccessViewController()
            self.navigationController?.pushViewController(succesViewController, animated: true)
        }
        else {
            //colocar tela de erro
            print("eerroo")
        }
        
//        self.navigationController?.pushViewController(HomePixViewController, animated: true)
//        print("teste")
//        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
//        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
        
    }
    
//    func teste() {
//
//        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
//        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
//    }
    
    override func loadView() {
        super.loadView()
        addSubviews()
        configConstraints()
        cpfLabel.text = cpfFromCopyPasteKey
        valueLabel.text = "R$\(String(format: "%.2f", valueFromCopyPasteKey).replacingOccurrences(of: ".", with: ","))"
        nameLabel.text = pixCopyAndPastViewModel.verifyName()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Confirmação"
//        pixCopyAndPastViewModel.delegate = self
    }
    
    private func addSubviews(){
        self.view.addSubview(pixKeyLabel)
        self.view.addSubview(keyLabel)
        self.view.addSubview(pixNameLabel)
        self.view.addSubview(nameLabel)
        self.view.addSubview(pixCPFLabel)
        self.view.addSubview(cpfLabel)
        self.view.addSubview(valueLabel)
        self.view.addSubview(confirmLabel)
        self.view.addSubview(confirmButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.confirmLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            self.confirmLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.confirmLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.valueLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.valueLabel.topAnchor.constraint(equalTo: self.confirmLabel.bottomAnchor, constant: 50),
            self.pixKeyLabel.topAnchor.constraint(equalTo: self.valueLabel.bottomAnchor, constant: 50),
            self.pixKeyLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.keyLabel.topAnchor.constraint(equalTo: self.valueLabel.bottomAnchor, constant: 50),
            self.keyLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.pixNameLabel.topAnchor.constraint(equalTo: self.pixKeyLabel.bottomAnchor, constant: 20),
            self.pixNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.nameLabel.topAnchor.constraint(equalTo: self.pixKeyLabel.bottomAnchor, constant: 20),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.pixCPFLabel.topAnchor.constraint(equalTo: self.pixNameLabel.bottomAnchor, constant: 20),
            self.pixCPFLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.cpfLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 20),
            self.cpfLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.confirmButton.topAnchor.constraint(equalTo: self.pixCPFLabel.bottomAnchor, constant: 50),
            self.confirmButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.confirmButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        ])
    }
    
}

//extension CopyAndPasteConfirmViewController: PixCopyAndPasteViewModelDelegate {
//
//
//    func displayAlert(message: String, title: String, handler: UIAlertAction?) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let actionAlert = UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction) in self.teste() })
//        alert.addAction(actionAlert)
//        self.present(alert, animated: true)
//    }
//
//
//}
