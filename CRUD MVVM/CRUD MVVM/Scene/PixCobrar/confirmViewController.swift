//
//  confirmViewController.swift
//  CRUD MVVM
//
//  Created by user220270 on 5/27/22.
//

import UIKit

class confirmViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
    }
    private lazy var firstLabel: UILabel = {
        let view = UILabel()
        view.text = "Esse  é seu pix copia e cola"
        view.font = UIFont.systemFont(ofSize: 24)
        view.textColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private lazy var confirmLabel: UILabel = {
        let view = UILabel()
        view.text = "Codigo copia e cola"
        view.font = UIFont.systemFont(ofSize: 18)
        view.textColor = .black
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
        view.addSubview(firstLabel)
        view.addSubview(confirmLabel)
        view.addSubview(button)
        
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.firstLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.firstLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            self.firstLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            self.confirmLabel.topAnchor.constraint(equalTo: self.firstLabel.bottomAnchor, constant: 20),
            self.confirmLabel.leadingAnchor.constraint(equalTo: self.firstLabel.leadingAnchor),
            self.confirmLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            self.button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            self.button.leadingAnchor.constraint(equalTo: self.firstLabel.leadingAnchor),
            self.button.trailingAnchor.constraint(equalTo: self.firstLabel.trailingAnchor),
            
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func performGoToConfirm() {
        let HomePixViewController = HomePixViewController()
        self.navigationController?.pushViewController(HomePixViewController, animated: true)
    }
    
}





