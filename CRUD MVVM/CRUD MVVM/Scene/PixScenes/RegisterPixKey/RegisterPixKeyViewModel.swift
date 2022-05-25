//
//  RegisterPixKeyViewModel.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/20/22.
//

import Foundation

protocol RegisterPixKeyViewModelDelegate: AnyObject {
}

protocol RegisterPixKeyViewModeling {
    var delegate: RegisterPixKeyViewModelDelegate? { get set }
    var reloadDelegate: MyKeysViewModelReloadDelegate? { get }
}

final class RegisterPixKeyViewModel {
    weak var delegate: RegisterPixKeyViewModelDelegate?
    weak var reloadDelegate: MyKeysViewModelReloadDelegate?
    
    init(reloadDelegate: MyKeysViewModelReloadDelegate? = nil){
        self.reloadDelegate = reloadDelegate
    }
    
    var selectedOption: String = "Selecionar"
    
    
}

extension RegisterPixKeyViewModel: RegisterPixKeyViewModeling {
    
    
}
