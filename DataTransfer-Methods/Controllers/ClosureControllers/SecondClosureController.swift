//
//  SecondClosureController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 02.04.2023.
//

import UIKit

class SecondClosureController: UIViewController, UpdatingDataProtocol {
    var updatingData: String = ""
    var complationHandler: ((String) -> Void)?
    
    @IBOutlet var dataTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scene A"
        navigationItem.prompt = "Closure method"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    @IBAction func saveDataWithClosure(_ sender: UIButton) {
        let updatedValue = dataTextField.text ?? ""
        
        complationHandler?(updatedValue)
        navigationController?.popViewController(animated: true)
    }
}
