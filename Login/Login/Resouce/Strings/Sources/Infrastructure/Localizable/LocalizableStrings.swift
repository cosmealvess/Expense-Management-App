//
//  LocalizableStrings.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 14/7/2022.
//

import Foundation
import UIKit

enum LocalizableStrings: String {
    case done
    case email
    case password
    case passwordConfirm
    case buttonOpen
    case buttonRegister
    case emailPlaceHolder
    case passwordPlaceHolder
    case passwordConfirmPlaceHolder
    case saveButton
    case nextButton
    
    case CPFPlaceHolder
    
    case empty
    case warningLabel
    case RegisterTitle
    case login
    case error
    case message
    case ok
    case personalDetails
   
    case cpf
    
    case save
    case selection
    case cancel
    
    //MARK: Profile Screen
    case profileTitle
    case ageLabel
    case agePlaceHolder
    case genderLabel
    case genderTextField
    case phoneLabel
    case phoneTextField
    
    //MARK: Address Screen
    case addressTitle
    case cepLabel
    case cepTextField
    case streetLabel
    case streetTextField
    case cityLabel
    case cityTextField
    case numberLabel
    case numberTextField
    case neighborhoodLabel
    case neighborhoodTextField
    case stateLabel
    case stateTextField

    func localize() -> String {
        rawValue.LocalizeInCurrentBundle()
    }
}

enum LocalizablloginAcessibilitylocalizable: String {
    case email
    
    
    func localize() -> String {
        rawValue.LocalizeInCurrentBundle(true)
    }
}

extension String {
    func LocalizeInCurrentBundle(_ accessibility: Bool = false) -> String {
        let path: Bundle = .current
        
        return NSLocalizedString(self, tableName: accessibility ?                                        "LocalizablloginAcessibilitylocalizable":                               "LoginLocalizable",
                                 bundle: path,
                                 value: String(),
                                 comment: String())
                                
    }
}

extension Bundle {
    static var current: Bundle {
        class DummyClass {
            init() {
                
            }
        }
        return Bundle(for: DummyClass.self)
    }
}
