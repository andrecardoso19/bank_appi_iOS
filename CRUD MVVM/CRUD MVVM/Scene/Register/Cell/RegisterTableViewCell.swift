//
//  RegisterTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit

final class RegisterTableViewCell: UITableViewCell {
    // MARK: - cellID
    static let reuseId: String = "RegisterTableViewCell"
    
    // MARK: = UI elements
    //titlelabel
    private lazy var titleLabel: UILabel = {
       let view = UILabel()
        view.font = UIFont(name: "Nunito-Bold", size: 16)
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //textfield
    lazy var registerTextField: UITextField = {
       let view = UITextField()
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isSecureTextEntry = false
        return view
    }()
    
    // MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setupconstraints
        setupConstraints()
        
        contentView.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setupView(title: String, placeholder: String, keyboardType: UIKeyboardType, isSecure: Bool){
        titleLabel.text = title
        registerTextField.placeholder = placeholder
        registerTextField.keyboardType = keyboardType
        registerTextField.isSecureTextEntry = isSecure
    }
    
    // MARK: - Contraints and subviews
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(registerTextField)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 110),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            registerTextField.topAnchor.constraint(equalTo: self.topAnchor),
            registerTextField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            registerTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            registerTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
