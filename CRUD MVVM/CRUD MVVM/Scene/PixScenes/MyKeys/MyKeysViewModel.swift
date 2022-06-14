//
//  MyKeysViewModel.swift
//  CRUD MVVM
//
//  Created by user217586 on 5/24/22.
//

import Foundation

//MARK: - protocols
protocol MyKeysViewModelDelegate: AnyObject {
    func reloadData()
    func pushToPixDetail()
    
    func pushToRegisterPix()
}

protocol MyKeysViewModelReloadDelegate: AnyObject {
    func updateAllKeys()
}

protocol MyKeysViewModeling {
    var delegate: MyKeysViewModelDelegate? { get set }
    
    func reloadData()
    func pushToPixDetail()
    
    func pushToRegisterPix()
}

//MARK: - optionData
struct OptionKeyData {
    let imageTitle: String
    let keyTitle: String
    var keyText: String
}


    let optionSelected: String = ""

final class MyKeysViewModel {
    weak var delegate: MyKeysViewModelDelegate?
    
    var optionKeyInformation: [OptionKeyData] = [
        OptionKeyData(imageTitle: "person.crop.square.filled.and.at.rectangle", keyTitle: "CPF", keyText: "Cadastrar Nova Chave"),
        OptionKeyData(imageTitle: "person.badge.key", keyTitle: "Chave Aleatória", keyText: "Cadastrar Nova Chave"),
        OptionKeyData(imageTitle: "iphone", keyTitle: "Telefone", keyText: "Cadastrar Nova Chave"),
        OptionKeyData(imageTitle: "envelope", keyTitle: "E-mail", keyText: "Cadastrar Nova Chave")
    ]
    
    
    func verifyPixKey() -> String{
        
        
        let registerpixController = RegisterPixKeyViewController()
        let changedPicker: String
        
        if allPix[loginIndex].cpfKey == "Cadastrar Nova Chave"{
            
            
            pushToRegisterPix()
            registerpixController.selectOptionTextField.text = "CPF"
            changedPicker = registerpixController.selectOptionTextField.text!
            
            return changedPicker
            
            
        }
        
        return ""
        
    }
    
    
    //MARK: - verifyPix
    func verifyPix(){
        print(allPix)
        print(allPix[loginIndex])
        //verify each pix key
        if allPix[loginIndex].cpfKey != "" {
            optionKeyInformation[0].keyText = allPix[loginIndex].cpfKey
        }
        
        if allPix[loginIndex].randomKey != "" {
            optionKeyInformation[1].keyText = allPix[loginIndex].randomKey
        }
        
        if allPix[loginIndex].phoneKey != "" {
            optionKeyInformation[2].keyText = allPix[loginIndex].phoneKey
        }
        
        if allPix[loginIndex].emailKey != "" {
            optionKeyInformation[3].keyText = allPix[loginIndex].emailKey
        }
    }
    
    //MARK: - Navigation functions
    func goToPixDetail(){
        pushToPixDetail()
    }
    
    func goToRegisterPix(){
        pushToRegisterPix()
    }
}

//MARK: - extension protocol
extension MyKeysViewModel: MyKeysViewModeling {
    func pushToRegisterPix() {
        self.delegate?.pushToRegisterPix()
    }
    
    
    func pushToPixDetail() {
        self.delegate?.pushToPixDetail()
    }
    
    func reloadData() {
        self.delegate?.reloadData()
    }
    
}
