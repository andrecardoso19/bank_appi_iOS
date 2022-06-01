//
//  PixCopyAndPastViewModel.swift
//  CRUD MVVM
//
//  Created by user220212 on 6/1/22.
//

import Foundation

final class PixCopyAndPastViewModel {
    
    //MARK: - verify value and cpf from copypastePix
    static var copyPasteKey = "bankapp.com//43340068833//1653653554564//9999_99"
    
    public func verifyValuesFromCopyPastePix(copyPastePix: String) {
        let copyPasteArray = copyPastePix.components(separatedBy: "//")
        
        //verify if it's in a valid format
        let isValidCopyPaste = isValidCopyPastePix(copyPasteArray: copyPasteArray)
        
        if isValidCopyPaste == true {
            valueFromCopyPasteKey = copyPasteArray[3].replacingOccurrences(of: "_", with: ",")
            cpfFromCopyPasteKey = copyPasteArray[1]
        }
        else {
            print("colocar alerta de copypaste invalido")
        }
    }
    
    //verify if the format of copypastepix is correct -> 4 elements separated by "//"
    private func isValidCopyPastePix (copyPasteArray: [String]) -> Bool{
        if copyPasteArray.count != 4 {
            return false
        }
        return true
    }
    
    public func verifyName() -> String {
        for i in 0...clients.count-1 {
            if clients[i].cpf == cpfFromCopyPasteKey {
                return clients[i].name
            }
        }
        return ""
    }
    
    public func verifyCpf() -> Bool {
        for i in 0...clients.count-1 {
            if clients[i].cpf == clients[loginIndex].cpf {
                return false
            }
        }
        return true
    }
    
    public func transferValue() {
        let verifyCpf = self.verifyCpf()
        let verifyBalvance = self.verifyBalance(value: valueFromCopyPasteKey)
        if verifyCpf == true && verifyBalvance == true {
            let valueToTransfer = Double(valueFromCopyPasteKey)
            clients[editIndex].balance = clients[editIndex].balance - (valueToTransfer ?? 0.0)
            print(clients[editIndex].balance)
            for i in 0...clients.count-1 {
                if clients[i].cpf == cpfFromCopyPasteKey {
                    clients[i].balance = clients[i].balance + (valueToTransfer ?? 0.0)
                    print(clients[i].balance)
                }
            }
            
        } else {
            print("colocar alerta")
        }
    }
    
    public func verifyBalance(value: String) -> Bool {
        let newValue = Double(value)
        guard let newValue = newValue else { return false }
        if newValue > clients[loginIndex].balance {
            return false
        }
        return true
    }
}
