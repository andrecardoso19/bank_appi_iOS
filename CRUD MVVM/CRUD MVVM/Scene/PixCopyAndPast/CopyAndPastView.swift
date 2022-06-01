//
//  CopyAndPastView.swift
//  CRUD MVVM
//
//  Created by user220212 on 5/26/22.
//

import UIKit

class CopyAndPastView: UIView {
    
    var continueAction: (() -> Void)?
    var deleteAction: (() -> Void)?
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = "Insira o Pix Copia e Cola"
        view.font = UIFont.systemFont(ofSize: 24)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "Pix Copia e Cola"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("CONTINUAR", for: .normal)
        view.backgroundColor = .systemPink
        view.setTitleColor(UIColor.white, for: .normal)
        view.layer.cornerRadius = 9
        view.addTarget(self, action: #selector(performConfirm), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var deleteTextButton: UIButton = {
        let view = UIButton(frame: .zero)
        view.tintColor = .systemPink
        view.setImage(UIImage.init(systemName: "xmark.circle.fill"), for: .normal)
        view.addTarget(self, action: #selector(performDelete), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupConstraints()
        setupAditionalConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(label)
        self.addSubview(textField)
        self.addSubview(button)
        self.addSubview(deleteTextButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            
            self.textField.topAnchor.constraint(equalTo: self.label.bottomAnchor, constant: 20),
            self.textField.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
            self.textField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50),
            
            self.button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -50),
            self.button.leadingAnchor.constraint(equalTo: self.label.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.label.trailingAnchor),
            
            self.deleteTextButton.centerYAnchor.constraint(equalTo: self.textField.centerYAnchor),
            self.deleteTextButton.leadingAnchor.constraint(equalTo: self.textField.trailingAnchor, constant: 8),
            self.deleteTextButton.widthAnchor.constraint(equalToConstant: 37),
            self.deleteTextButton.heightAnchor.constraint(equalToConstant: 37)
        ])
    }
    
    private func setupAditionalConfig() {
        self.backgroundColor = .white
    }
    
    @objc private func performConfirm() {
        self.continueAction?()
    }
    
    @objc private func performDelete() {
        self.deleteAction?()
    }

    public func configureTextField(text: String) {
        self.textField.text = text
    }
    
    public func getText() -> String {
        
        return textField.text ?? ""
    }
}
