//
//  RegisterViewTextFieldDelegateExtension.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 22/7/2022.
//

import Foundation
import UIKit

extension RegisterView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailField.textField {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        } else if textField == passwordField.textField {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        } else if textField == passwordConfirmField.textField {
            self.scrollView.setContentOffset(CGPoint(x: 0, y: 70), animated: true)
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            self.scrollView.setContentOffset(self.scrollPositionDefault ?? CGPoint(x: 0, y: 0), animated: true)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField.textField {
            self.passwordField.textField.becomeFirstResponder()
        } else if textField == passwordField.textField {
            self.passwordConfirmField.textField.becomeFirstResponder()
        } else if textField == passwordConfirmField.textField {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == passwordField.textField
        || textField == passwordConfirmField.textField {
            if !RegExp.checkPasswordComplexity(password: textField.text!,
                                               length: 6,
                                               patternsToEscape:[],
                                               caseSensitivty: true,
                                               numericDigits: true,
                                               specialCharacter: true) {
                textField.layer.borderColor = UIColor.red.cgColor
            } else {
                textField.layer.borderColor = UIColor.black.cgColor
            }
        }
    }

}
