//
//  RegisterPixKeyViewModel.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/20/22.
//

import Foundation


protocol RegisterPixKeyViewModelDelegate: AnyObject {
    
    func onSuccessDismiss()
    
    func displayAlert(title: String, message: String)
    
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
    
    
    
    func verifySelection() -> String{
        
        var selectedCpf: String
        var selectedRandomKey: String
        
        
        
        if optionSelected == "CPF"{
            
            selectedCpf = clients[loginIndex].cpf
            
            
            return selectedCpf
            
           
        }else if optionSelected == "Chave Aleatória"{
            
            
            selectedRandomKey = allPix[editPixIndex].randomKey
            
            
            return selectedRandomKey
            
        }else if optionSelected == "Telefone"{
            
            
            
            return ""
            
            
        }
        
        return ""

    }
    
    
    func registerPixKey() -> Bool{
        
        let select = optionSelected
        
        if select == "CPF"{
            
            allPix[editIndex].cpfKey = clients[loginIndex].cpf
            
            reloadDelegate?.updateAllKeys()
            dismissView()
            
            return true
            
        }
        
        if select == "Chave Aleatória"{
            
            allPix[editIndex].randomKey = randomString(length: 32)
            
            reloadDelegate?.updateAllKeys()
            dismissView()
            
            return true
            
        }
        
        // if select == "Telefone"{
            
            
            
            
        //}
        
        return false
            
        
    }
    
    
    func verifyBlankTextField(text: String) -> Bool{
        
        if text == "" || text == "Chave Teste"{
            
            displayAlert(title: "Erro", message: "Por favor verifique todos os campos")
            
            return false
            
        
        }
        
        return true
        
    }
    
    
    
    
        
    func randomString(length: Int) -> String {
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890"
    return String((0..<length).map{ _ in letters.randomElement()! })
        
        
    }
    
        
    }
    


extension RegisterPixKeyViewModel: RegisterPixKeyViewModeling {
    
    func displayAlert(title: String, message: String) {
        self.delegate?.displayAlert(title: title, message: message)
    }
    
    func dismissView() {
        self.delegate?.onSuccessDismiss()
    }
    
    func reloadUpdateAllPixKeys() {
        self.reloadDelegate?.updateAllKeys()
    }
    
}
