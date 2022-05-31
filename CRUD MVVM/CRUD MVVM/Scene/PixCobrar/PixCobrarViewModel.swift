//
//  cobrarViewModel.swift
//  CRUD MVVM
//
//  Created by user220270 on 5/27/22.
//

import Foundation

class PixCobrarViewModel {
  
    public func generateCopyPaste(value: String, clientCPF: String) -> String{
        let valueChanged = value.replacingOccurrences(of: ",", with: "_")
        
        var timeStampText: String {
            return "\(NSDate().timeIntervalSince1970 * 1000)"
        }
        
        let copyPasteKey = "bankapp.com//\(clientCPF)//\(timeStampText)//\(valueChanged)"
        
        self.valueFromCopyPasteKey = value
        self.cpfFromCopyPasteKey = clientCPF
        
        return copyPasteKey
    }
    
    //MARK: - verify value and cpf from copypastePix
    var valueFromCopyPasteKey = ""
    var cpfFromCopyPasteKey = ""
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
    
}
