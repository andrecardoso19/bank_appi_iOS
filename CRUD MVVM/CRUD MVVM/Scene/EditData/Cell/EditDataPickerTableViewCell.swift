//
//  EditDataTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/3/22.
//

import Foundation
import UIKit

final class EditDataPickerTableViewCell: UITableViewCell {
    private weak var viewModel: EditDataViewModel?
    
    private lazy var pickerOptions: [String] = ["Entre R$1000 e R$2000", "Entre de R$2000 e R$3000", "Entre R$3000 e R$5000", "Entre R$5000 e R$10000", "Acima de R$10000"]
    
    //MARK: - cellId
    static let reuseId: String = "EditDataPickerTableViewCell"
    
    //MARK: - UIElements
    private lazy var titleLable: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var editTextField: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.textAlignment = .center
        view.textColor = .systemPink
        view.text = "Selecionar"
        view.backgroundColor = .systemGray5
        view.inputView = Picker
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
    
    private lazy var Picker: UIPickerView = {
        let view = UIPickerView()
        view.backgroundColor = .clear
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //constraints
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(viewModel: EditDataViewModel, titleLableText: String, editTextFieldText: String){
        self.viewModel = viewModel
        titleLable.text = titleLableText
        editTextField.text = editTextFieldText
    }
    
    func setupConstraints(){
        contentView.addSubview(titleLable)
        contentView.addSubview(editTextField)
        
        NSLayoutConstraint.activate([
            titleLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            editTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            editTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            editTextField.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            editTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4),
            editTextField.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5)
        ])
    }
    
    //MARK: - Perform
    @objc private func performDone() {
        self.editTextField.endEditing(true)
    }
}

extension EditDataPickerTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        viewModel?.editClientMonthlyIncome = chooseOption
        editTextField.text = chooseOption
    }
}
