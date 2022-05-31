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
    var randomStringKey: String = ""
    var cellPhonePixKey: String = ""
    
    func verifySelection() -> String{
        
        var selectedCpf: String
        var selectedRandomKey: String
        var selectedPhoneKey: String
        
        if optionSelected == "CPF"{
            
            selectedCpf = clients[loginIndex].cpf
            
            
            return selectedCpf
            
           
        }else if optionSelected == "Chave Aleatória"{
            
            randomStringKey = randomString(length: 32)
            
            selectedRandomKey = randomStringKey
            
            
            return selectedRandomKey
            
            
        }else if optionSelected == "Telefone"{
        
            selectedPhoneKey = cellPhonePixKey
            
                
            return selectedPhoneKey
                
            }
            
            return ""

        
    }
    
    func phoneOptionSelected() -> String{
        
        let registerpixcontroller = RegisterPixKeyViewController()
        var changedLabel: String
        
        let select = optionSelected
        
        if select == "Telefone"{
            
            registerpixcontroller.yourKeyDescriptionLabel.text = "Insira seu celular:"
            changedLabel = registerpixcontroller.yourKeyDescriptionLabel.text!
            
            return changedLabel
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
            
            allPix[editIndex].randomKey = randomStringKey
            
            
            reloadDelegate?.updateAllKeys()
            dismissView()
            
            return true
            
        }
        
         if select == "Telefone"{
             
             allPix[editIndex].phoneKey = cellPhonePixKey
             
             print(cellPhonePixKey)
             
             reloadDelegate?.updateAllKeys()
             dismissView()
             
             return true
            
        }
        
        return false
        
        }
    
    func verifyCellPhone(text: String) -> Bool{
        
        let select = optionSelected
        
        if select == "Telefone"{
            
            if text.count != 11{
            
                displayAlert(title: "Erro", message: "Número de telefone inválido")
                return false
                
            }
        }
        
        return true
       
        
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
