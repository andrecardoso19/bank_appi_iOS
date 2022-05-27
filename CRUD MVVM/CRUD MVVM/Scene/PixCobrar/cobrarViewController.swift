//
//  cobrarViewController.swift
//  CRUD MVVM
//
//  Created by user220270 on 5/26/22.
//

import UIKit

class cobrarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

    }
    private lazy var label: UILabel = {
           let view = UILabel()
           view.text = "Qual valor você quer receber"
           view.font = UIFont.systemFont(ofSize: 24)
           view.textColor = .black
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       
       private lazy var textField: UITextField = {
           let view = UITextField()
           view.placeholder = "R$ 0,00"
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       private lazy var notValuebutton: UIButton = {
           let view = UIButton(frame: .zero)
           view.setTitle("Não especificar valor", for: .normal)
           view.backgroundColor = .systemBackground
           view.setTitleColor(UIColor.systemPink, for: .normal)
           view.layer.cornerRadius = 9
           view.addTarget(self, action: #selector(notValueButtonTapped), for: .touchUpInside)
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       private lazy var button: UIButton = {
           let view = UIButton(frame: .zero)
           view.setTitle("CONFIRMAR", for: .normal)
           view.backgroundColor = .systemPink
           view.setTitleColor(UIColor.white, for: .normal)
           view.layer.cornerRadius = 9
           view.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
           view.translatesAutoresizingMaskIntoConstraints = false
           return view
       }()
       init() {
           super.init(nibName: nil, bundle: nil)
           setupView()
           setupConstraints()
           
       }
       @objc private func continueButtonTapped() {
           performGoToConfirm()
           
       }
       @objc private func notValueButtonTapped() {
           print("not value tapped")
       }
           
       private func setupView() {
           view.addSubview(label)
           view.addSubview(textField)
           view.addSubview(button)
           view.addSubview(notValuebutton)
           
       }
       
       private func setupConstraints() {
           NSLayoutConstraint.activate([
               self.label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
               self.label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               self.label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
               
               self.textField.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 20),
               self.textField.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
               self.textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
               
               self.notValuebutton.bottomAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 50),
               self.notValuebutton.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
               self.notValuebutton.trailingAnchor.constraint(equalTo: self.label.trailingAnchor),
               
               self.button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
               self.button.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
               self.button.trailingAnchor.constraint(equalTo: self.label.trailingAnchor),
               
              
           ])
       }
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       private func performGoToConfirm() {
        let confirmViewController = confirmViewController()
        self.navigationController?.pushViewController(confirmViewController, animated: true)
    }

   }


    


