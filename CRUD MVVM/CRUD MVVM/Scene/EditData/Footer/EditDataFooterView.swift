//
//  EditDataFooterView.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/4/22.
//

import UIKit

class EditDataFooterView: UIView {
    weak var viewModel: EditDataViewModel?
    
    static let height: CGFloat = 50
    
    // MARK: - UIElements
    private lazy var confirmEditButton: UIButton = {
       let view = UIButton()
        view.setTitle("Confirmar edição", for: .normal)
        view.backgroundColor = .systemPink
        view.tintColor = .white
        view.addTarget(self, action: #selector(performEdit), for: .touchUpInside)
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Init
    init(){
        super.init(frame: .zero)
        self.setupView()
        self.setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    func setupView(){
        self.addSubview(confirmEditButton)
    }
    
    func setupLayoutConstraints(){
        NSLayoutConstraint.activate([
            confirmEditButton.topAnchor.constraint(equalTo: self.topAnchor, constant:  5),
            confirmEditButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            confirmEditButton.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    //MARK: - Perform
    @objc func performEdit(){
        viewModel?.updateClient()
        
    }
}
