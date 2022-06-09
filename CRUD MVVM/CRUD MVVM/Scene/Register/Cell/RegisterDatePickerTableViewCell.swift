//
//  RegisterDatePickerTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/5/22.
//

import Foundation
import UIKit

final class RegisterDatePickerTableViewCell: UITableViewCell {
    private weak var viewModel: RegisterViewModel?
    // MARK: - cellID
    static let reuseId: String = "RegisterDatePickerTableViewCell"
    
    // MARK: = UI elements
    //titlelabel
    private lazy var titleLabel: UILabel = {
       let view = UILabel()
        view.font = UIFont.MyTheme.defaultText
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    //textfield
    lazy var registerTextField: UITextField = {
       let view = UITextField()
        view.textAlignment = .center
        view.textColor = UIColor.MyTheme.mainPinkColor
        view.text = "Selecionar"
        view.font = UIFont.MyTheme.defaultText
        view.backgroundColor = UIColor.MyTheme.mainGrayButtonColor
        view.inputView = datePicker
        view.inputAccessoryView = toolBar
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var toolBar: UIToolbar = {
        let view = UIToolbar()
        view.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(performDone))
        view.setItems([doneButton], animated: true)
        return view
    }()
    
    private lazy var datePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.backgroundColor = .clear
        view.datePickerMode = .date
        view.tintColor = UIColor.MyTheme.mainPinkColor
        view.preferredDatePickerStyle = .wheels
        view.translatesAutoresizingMaskIntoConstraints = false
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
    func setupView(viewModel: RegisterViewModel, title: String, placeholder: String, keyboardType: UIKeyboardType){
        self.viewModel = viewModel
        titleLabel.text = title
        registerTextField.placeholder = placeholder
        registerTextField.keyboardType = keyboardType
    }
    
    // MARK: - Contraints and subviews
    private func setupConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(registerTextField)
        inputView?.addSubview(toolBar)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 110),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            registerTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            registerTextField.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            registerTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            registerTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    //MARK: - Perform
    @objc private func performDone() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: datePicker.date)
        
        
        viewModel?.newClientBirthDate = dateString
        self.registerTextField.text = dateString
        viewModel?.verifyDate(date: datePicker.date)
        self.registerTextField.endEditing(true)
    }
}
