//
//  CopyAndPastViewController.swift
//  CRUD MVVM
//
//  Created by user220212 on 5/26/22.
//

import UIKit

class CopyAndPastViewController: UIViewController {
    
    let copyAndPastView = CopyAndPastView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view = copyAndPastView
        copyAndPastView.continueAction = clickedContinue
        copyAndPastView.deleteAction = clickedDelete
    }
    
    private func clickedContinue() {
        print("clicou continuar")
    }
    
    private func clickedDelete() {
        copyAndPastView.configureTextField(text: "")
    }
}
