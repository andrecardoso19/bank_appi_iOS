//
//  RegisterPickerTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/5/22.
//

import Foundation
import UIKit

final class RegisterPickerTableViewCell: UITableViewCell {
    private weak var viewModel: RegisterViewModel?
    
    private lazy var pickerOptions: [String] = ["Entre R$1000 e R$2000", "Entre de R$2000 e R$3000", "Entre R$3000 e R$5000", "Entre R$5000 e R$10000", "Acima de R$10000"]
    // MARK: - cellID
    static let reuseId: String = "RegisterPickerTableViewCell"
    
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
        view.textAlignment = .center
        view.textColor = .systemPink
        view.text = "Selecionar"
        view.backgroundColor = .systemGray5
        view.inputView = Picker
        view.inputAccessoryView = toolBar
        view.layer.cornerRadius = 5
        view.isSecureTextEntry = false
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
    
    private lazy var Picker: UIPickerView = {
        let view = UIPickerView()
        view.backgroundColor = .clear
        view.delegate = self
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
    
    //init unavailable, fatal error will not occur
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setupView(viewModel: RegisterViewModel, title: String, placeholder: String, keyboardType: UIKeyboardType) {
        self.viewModel = viewModel
        titleLabel.text = title
        registerTextField.placeholder = placeholder
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
        self.registerTextField.endEditing(true)
    }
}

//MARK: - PickerView Delegate/DataSource
extension RegisterPickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerOptions[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let chooseOption: String = pickerOptions[row]
        viewModel?.newClientMonthlyIncome = chooseOption
        registerTextField.text = chooseOption
    }
}
