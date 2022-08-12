//
//  AddressView.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 30/7/2022.
//

import Foundation
import UIKit

class AddressView: ViewDefault {
    //MARK: - Closure
    var onSearchCEPTap:((_ cep: String) -> Void)?
    var OnNextButtonTap:(() -> Void)?
    var onSaveTap:((_ cep: String, _ street: String, _ streetNumber:String, _ district: String, _ city: String, _ state: String) -> Void)?
    
    lazy var cepLabel = LabelDefault(title: LocalizableStrings.cepLabel.localize())
    lazy var cepTextField = TextFieldDefault(placeholder: LocalizableStrings.cepTextField.localize())
    
    lazy var searchButtonCep: ButtonDefault = {
        let searchButtonCep = ButtonDefault(image: UIImage(systemName: "magnifyingglass") ?? UIImage())
        searchButtonCep.addTarget(self, action: #selector(getCepTap), for: .touchUpInside)
        return searchButtonCep
    }()
    
    
    lazy var streetLabel = LabelDefault(title: LocalizableStrings.streetLabel.localize())
    lazy var streetTextField = TextFieldDefault(placeholder: LocalizableStrings.streetTextField.localize())
    
    lazy var cityLabel = LabelDefault(title: LocalizableStrings.cityLabel.localize())
    lazy var cityTextField = TextFieldDefault(placeholder: LocalizableStrings.cityTextField.localize())
    
    lazy var numberLabel = LabelDefault(title: LocalizableStrings.numberLabel.localize())
    lazy var numberTextField = TextFieldDefault(placeholder: LocalizableStrings.numberTextField.localize())
    
    lazy var neighborhoodLabel = LabelDefault(title: LocalizableStrings.neighborhoodLabel.localize())
    lazy var neighborhoodTextField = TextFieldDefault(placeholder: LocalizableStrings.neighborhoodTextField.localize())
    
    lazy var stateLabel = LabelDefault(title: LocalizableStrings.stateLabel.localize())
    lazy var stateTextField = TextFieldDefault(placeholder: LocalizableStrings.stateTextField.localize())
    
    lazy var buttonSave: ButtonDefault = {
        let button = ButtonDefault(title: LocalizableStrings.saveButton.localize())
        return button
    }()
    
    lazy var buttonNext: ButtonDefault = {
        let button = ButtonDefault(title: LocalizableStrings.nextButton.localize())
        button.addTarget(self, action: #selector(buttonNextPressed), for: .touchUpInside)
        return button
    }()
   
    
    override func setupVisualElements() {
        super.setupVisualElements()
        setupCep()
        setupStreet()
        setupNumber()
        setupneighborhood()
        setupCity()
        setupState()
        setupButtonsElements()
    }
    
    @objc private func getCepTap() {
        if let cep = self.cepTextField.text {
        onSearchCEPTap?(cep)
        
        }
    }
    
    @objc private func buttonNextPressed() {
        OnNextButtonTap?()
    }
    
    @objc func saveButtonPressed() {
        onSaveTap?(self.cepTextField.text ?? String(),
                   self.streetTextField.text ?? String(),
                   self.numberTextField.text ?? String(),
                   self.neighborhoodTextField.text ?? String(),
                   self.cityTextField.text ?? String(),
                   self.stateTextField.text ?? String()
        )
    }
    
    func setAddressFromSearchCEP(cepViewModel: CEPViewModel) {
        // popular os campos da tela
        DispatchQueue.main.async {
            self.streetTextField.text = cepViewModel.logradouro
            self.neighborhoodTextField.text = cepViewModel.bairro
            self.cityTextField.text = cepViewModel.cidade
            self.stateTextField.text = cepViewModel.uf
        }
    }
    
    
  
   
}
