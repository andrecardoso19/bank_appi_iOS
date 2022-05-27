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
    
    
    
    
    func registerCpfPixKey() {
        
        
        
        let client = Client(name: "ADM", cpf: "198.234.930-14", birthDate: "", email: "", monthlyIncome: "", netWorth: "", password: "1", balance: 999.9, account: 1, verifyDigit: 2)

              
        let registerpixkeyviewcontroller = RegisterPixKeyViewController()
        
        if registerpixkeyviewcontroller.selectOptionTextField.text == "CPF" {
            
            registerpixkeyviewcontroller.yourKeyTextField.text = client.cpf
            print("cadastrou chave")
            
            
        }else{
            
            print("Erro")
            
        }
            
        }
        
        
    }
    


extension RegisterPixKeyViewModel: RegisterPixKeyViewModeling {
    
    
}
