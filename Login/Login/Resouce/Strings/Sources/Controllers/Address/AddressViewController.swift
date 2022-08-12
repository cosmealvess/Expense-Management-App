//
//  AddressViewController.swift
//  Login
//
//  Created by COSME D ALVES SILVA on 30/7/2022.
//

import Foundation
import UIKit

class AddressViewController: ViewControllerDefault {
    //MARK: - Closure
    var onSearchCEPTap:((_ cep: String) -> Void)?
    var OnNextButtonTap:(() -> Void)?
    
    lazy var addressView: AddressView = {
       let addressView = AddressView()
        
        addressView.onSearchCEPTap = {[weak self ] cep in
            guard let self = self else {return}
            
            self.onSearchCEPTap?(cep)
        }
        
        addressView.OnNextButtonTap = {[weak self] in
            guard let self = self else {return}
            self.OnNextButtonTap?()
        }
        return addressView
    }()
    
    override func loadView() {
        super.loadView()
        self.view = addressView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizableStrings.addressTitle.localize()
    }
    func setAddressFromSearchCEP(cepViewModel: CEPViewModel){
        addressView.setAddressFromSearchCEP(cepViewModel: cepViewModel)
    }
    
    func showMessageCepInvalid() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Erro", message: "CEP não encontrado", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil )
        }
        
    }
}
