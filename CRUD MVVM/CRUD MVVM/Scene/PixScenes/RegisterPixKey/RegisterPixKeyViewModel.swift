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
    
    
    var optionSelected: String = ""
    
    
    func registerCpfPixKey() {
        
        
        
        
        let client = Client(name: "ADM", cpf: "198.234.930-14", birthDate: "", email: "", monthlyIncome: "", netWorth: "", password: "1", balance: 999.9, account: 1, verifyDigit: 2)
        //let pix = Pix(account: 1, agency: "1-9", cpfKey: "S/ Cadastro", randomKey: "S/ Cadastro", phoneKey: "S/ Cadastro", copyPastePix: "")
              
        let registerpixkeyviewcontroller = RegisterPixKeyViewController()
        
        if optionSelected == "CPF"{
            
                registerpixkeyviewcontroller.yourKeyTextField.text = client.cpf
            
            if optionSelected == "Chave Aleatória"{
                
                registerpixkeyviewcontroller.yourKeyTextField.text = randomString(length: 8)
                
            }
            
            
        }else{
            
            print("Erro")
            
        }
            
        }
    
    func verifySelection() -> String{
        
        var selectedCpf: String
        var selectedRandomKey: String
        
        if optionSelected == "CPF"{
            
            selectedCpf = clients[loginIndex].cpf
            
            return selectedCpf
            
           
        }else if optionSelected == "Chave Aleatória"{
            
            allPix[editIndex].randomKey = randomString(length: 32)
            selectedRandomKey = allPix[editPixIndex].randomKey
            
            return selectedRandomKey
            
        }else if optionSelected == "Telefone"{
            
            
            return ""
            
            
        }
        
        return ""

    }
    
    
        
    func randomString(length: Int) -> String {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
    return String((0..<length).map{ _ in letters.randomElement()! })
        
        
    }
    
        
    }
    


extension RegisterPixKeyViewModel: RegisterPixKeyViewModeling {
    
    
}
