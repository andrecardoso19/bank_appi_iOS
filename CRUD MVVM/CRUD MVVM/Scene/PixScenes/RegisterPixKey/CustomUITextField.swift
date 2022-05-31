//
//  CustomUITextField.swift
//  CRUD MVVM
//
//  Created by user217414 on 5/31/22.
//

import Foundation
import UIKit //Don't forget this

let registerpix = RegisterPixKeyViewController()


class CustomUITextField: UITextField {
    
    
    private var actualText: String = ""
    private var maskedText: String = ""
    
    private var masked: Bool = true {
        didSet {
            refreshTextField()
        }
    }
    
        private func maskedTogglePressed(_ sender: Any) {
        masked = !masked
    }
    
    private func refreshTextField() {
        registerpix.yourKeyTextField.text = masked ? maskedText : actualText
    }


override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
if action == #selector(UIResponderStandardEditActions.paste(_:)) {
return false
}
return super.canPerformAction(action, withSender: sender)
}
    
}
    
        

    extension CustomUITextField: UITextFieldDelegate {
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            var newString = (actualText as NSString).replacingCharacters(in: range, with: string) // Apply new text
            
            // Remove all whitespaces
            newString = newString.replacingOccurrences(of: " ", with: "")
            // Remove all that is not a number
            newString = newString.filter("0123456789".contains)
            
            // Split string into components of max 4
            var components: [String] = {
                var toDeplete = newString
                var components: [String] = []
                while !toDeplete.isEmpty {
                    let length = min(toDeplete.count, 4)
                    components.append(String(toDeplete.prefix(length)))
                    toDeplete.removeFirst(length)
                }
                return components
            }()
            // Limit to maximum of 3 components
            if components.count > 3 {
                components = Array(components[0..<3])
            }
            
            // Generate masked components, replacing all characters with X
            let maskedComponents: [String] = components.map { String($0.map { character in return "X" }) }
            
            // Add spaces
            newString = components.joined(separator: " ")
            let maskedText = maskedComponents.joined(separator: " ")
            
            // Assign new strings
            self.actualText = newString
            self.maskedText = maskedText
            
            // Refresh field
            refreshTextField()
            
            // Disallow text field to apply it's change
            return false
        }
        
    
    
    
}
