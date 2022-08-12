//
//  AddressExtension.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 31/7/2022.
//

import Foundation
import UIKit

extension AddressView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == cepTextField {
            textField.text = String(textField.text!.prefix(9))
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cepTextField {
            if !string.isBackspace {
                if range.location == 5 {
                    textField.text = textField.text! + "-"
                }
            }
        }
        return true
    }
}
