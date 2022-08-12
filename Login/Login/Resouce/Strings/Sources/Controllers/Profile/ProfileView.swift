//
//  ProfileView.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 27/7/2022.
//

import Foundation
import UIKit

class ProfileView: ViewDefault {
    
    //MARK: - Closures
    var onSaveTap:(() -> Void)?
    var onNextTAP:(() -> Void)?
    
    lazy var ageLabel = LabelDefault(title: LocalizableStrings.ageLabel.localize())
    lazy var ageTextField = TextFieldDefault(placeholder: LocalizableStrings.agePlaceHolder.localize())
    
    lazy var agePickerView: ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.didTapSelect = {[weak self] in
            guard let self = self else {return}
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: true)
            self.ageTextField.text = Age.allCases[row].rawValue
            self.genderTextField.becomeFirstResponder()

        }
        
        
        picker.didTapCancel = {[weak self] in
            guard let self = self else { return }
            
            self.ageTextField.text = String()
            self.ageTextField.resignFirstResponder()
        }
        
        return picker
        
    }()
    
    lazy var genderLabel = LabelDefault(title: LocalizableStrings.genderLabel.localize())
    lazy var genderTextField = TextFieldDefault(placeholder: LocalizableStrings.genderTextField.localize())
    lazy var genderPickerView: ToolbarPickerView = {
        let picker = ToolbarPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        
        picker.didTapSelect = {[weak self] in
            guard let self = self else { return }
            
            let row = picker.selectedRow(inComponent: 0)
            picker.selectRow(row, inComponent: 0, animated: true)
            self.genderTextField.text = Gender.allCases[row].rawValue
            self.cpfTextField.becomeFirstResponder()
        }
        
        picker.didTapCancel = {[weak self] in
            guard let self = self else { return }
            
            self.genderTextField.text = String()
            self.genderTextField.resignFirstResponder()
        }
        
        return picker
    }()
    
    lazy var cpfLabel = LabelDefault(title: LocalizableStrings.cpf.localize())
    lazy var cpfTextField = TextFieldDefault(placeholder: LocalizableStrings.CPFPlaceHolder.localize())
    
    lazy var phoneLabel = LabelDefault(title: LocalizableStrings.phoneLabel.localize())
    lazy var phoneTextField = TextFieldDefault(placeholder: LocalizableStrings.phoneTextField.localize())
    
    lazy var buttonSave: ButtonDefault = {
        let button = ButtonDefault(title: LocalizableStrings.saveButton.localize())
        
        button.addTarget(self, action: #selector(buttonSaveTap), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonNext = ButtonDefault(title: LocalizableStrings.nextButton.localize())
    
    override func setupVisualElements() {
        super.setupVisualElements()
        setupAgeElements()
        setupGenderElements()
        setupCPFElements()
        setupPhoneElements()
        setupButtonsElements()
    }
    
    @objc func buttonSaveTap() {
        onSaveTap?()
    }

    @objc func buttonNextTap() {
        onNextTAP?()
    }
    
}
