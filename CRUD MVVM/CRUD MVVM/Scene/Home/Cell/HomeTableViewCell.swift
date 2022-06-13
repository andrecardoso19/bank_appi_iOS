//
//  HomeTableViewCell.swift
//  CRUD MVVM
//
//  Created by Ancarinha on 11/05/22.
//

import Foundation
import UIKit

final class HomeTableViewCell: UITableViewCell {
    // MARK: cellID
    static let reuseId: String = "HomeTableViewCell"
    
    
    // MARK: - UI elements
    //logo image
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor.MyTheme.mainPinkColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //option label
    private lazy var optionLabel: UILabel = {
       let view = UILabel()
        view.numberOfLines = 1
        view.font = UIFont.MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //arrow label
    private lazy var arrowLabel: UILabel = {
       let view = UILabel()
        view.textColor = UIColor.MyTheme.mainPinkColor
        view.text = ">"
        view.font = UIFont.MyTheme.defaultText
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: = Cell lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setupconstraints
        setupConstraints()
        contentView.backgroundColor = .MyTheme.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Functions
    func setupView(imageTitle: String, optionTitle: String){
        logoImageView.image = UIImage(systemName: imageTitle)
        optionLabel.text = optionTitle
    }
    
    // MARK: -Constraints and subviews
    private func setupConstraints(){
        contentView.addSubview(logoImageView)
        contentView.addSubview(optionLabel)
        contentView.addSubview(arrowLabel)
        
        NSLayoutConstraint.activate([
            logoImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            
            optionLabel.centerYAnchor.constraint(equalTo: logoImageView.centerYAnchor),
            optionLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 30),
            
            arrowLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            arrowLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
}
