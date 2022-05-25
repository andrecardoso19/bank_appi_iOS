//
//  EditDataTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/3/22.
//

import Foundation
import UIKit

final class EditDataDatePickerTableViewCell: UITableViewCell {
    private weak var viewModel: EditDataViewModel?
    //MARK: - cellId
    static let reuseId: String = "EditDataDatePickerTableViewCell"
    
    //MARK: - UIElements
    private lazy var titleLable: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var editTextField: UITextField = {
        let view = UITextField()
        view.textAlignment = .left
        view.borderStyle = .roundedRect
        view.textColor = .systemPink
        view.text = "Selecionar"
        view.backgroundColor = .systemGray5
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
        view.tintColor = .systemPink
        view.preferredDatePickerStyle = .wheels
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
        inputView?.addSubview(toolBar)
        
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
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        let dateString = formatter.string(from: datePicker.date)
        
        
        viewModel?.editClientBirthDate = dateString
        self.editTextField.text = dateString
        viewModel?.verifyDate(date: datePicker.date)
        self.editTextField.endEditing(true)
    }
}
