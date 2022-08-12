//
//  ProfileExtensions.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 27/7/2022.
//

import Foundation
import UIKit

extension ProfileView:UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == agePickerView {
            return Age.asArray.count
        } else if pickerView == genderPickerView {
            return Gender.asArray.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == agePickerView {
            return Age.allCases[row].rawValue
        } else if pickerView == genderPickerView {
            return Gender.allCases[row].rawValue
        }
        
        return String()

    }
    
}

extension ProfileView: UITextFieldDelegate {
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == ageTextField {
//            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//        } else if textField == genderTextField {
//            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//        } else if textField == cpfTextField {
//            self.scrollView.setContentOffset(CGPoint(x: 0, y: 1), animated: true)
//        } else if textField == phoneTextField {
//            self.scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
//        }
//    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField == cpfTextField {
            if textField.text?.count ?? 0 < 14 {
                textField.layer.borderColor = UIColor.borderColorRed.cgColor
            } else if textField.text?.isValidCPF ?? false {
                textField.layer.borderColor = UIColor.borderColorBlack.cgColor
                phoneTextField.becomeFirstResponder()
            }
            
            textField.text = String(textField.text!.prefix(14))
        } else if textField == phoneTextField {
            textField.text = String(textField.text!.prefix(15))
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == cpfTextField {
            if !string.isBackspace {
                if range.location == 3 || range.location == 7 {
                    textField.text = textField.text! + "."
                } else if range.location == 11 {
                    textField.text = textField.text! + "-"
                }
            }
        } else if textField == phoneTextField {
            if !string.isBackspace {
                if range.location == 0 {
                    textField.text = textField.text! + "("
                } else if range.location == 3 {
                    textField.text = textField.text! + ") "
                } else if range.location == 10 {
                    textField.text = textField.text! + "-"
                }
            }
        }
        
        return true
    }
}
