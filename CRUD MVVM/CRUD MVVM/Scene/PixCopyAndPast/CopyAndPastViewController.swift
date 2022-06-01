//
//  CopyAndPastViewController.swift
//  CRUD MVVM
//
//  Created by user220212 on 5/26/22.
//

import UIKit

class CopyAndPastViewController: UIViewController {
    
    let copyAndPastView = CopyAndPastView()
    let pixCopyAndPastViewModel = PixCopyAndPastViewModel()
    
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
        let CopyAndPastConfirm = CopyAndPastConfirm()
        pixCopyAndPastViewModel.verifyValuesFromCopyPastePix(copyPastePix: copyAndPastView.getText())

        self.navigationController?.pushViewController(CopyAndPastConfirm, animated: true)
    }
    
    private func clickedDelete() {
        copyAndPastView.configureTextField(text: "")
    }
}
