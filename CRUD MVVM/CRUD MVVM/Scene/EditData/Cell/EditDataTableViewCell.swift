//
//  EditDataTableViewCell.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/3/22.
//

import Foundation
import UIKit

final class EditDataTableViewCell: UITableViewCell {
    //MARK: - cellId
    static let reuseId: String = "EditDataTableViewCell"
    
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
    
    func setupView(titleLableText: String, editTextFieldText: String){
        titleLable.text = titleLableText
        editTextField.text = editTextFieldText
    }
    
    func setupConstraints(){
        contentView.addSubview(titleLable)
        contentView.addSubview(editTextField)
        
        NSLayoutConstraint.activate([
            titleLable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            
            editTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            editTextField.leadingAnchor.constraint(equalTo: self.centerXAnchor),
            editTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4)
        ])
    }
}
