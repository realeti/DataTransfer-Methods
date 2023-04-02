//
//  SecondDelegateController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 02.04.2023.
//

import UIKit

class SecondDelegateController: UIViewController, UpdatingDataProtocol {
    var updatingData: String = ""
    var handleUpdatedDataDelegate: DataUpdateProtocol?
    
    @IBOutlet var dataTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scene B"
        navigationItem.prompt = "Delegate method"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    @IBAction func saveDataWithDelegate(_ sender: UIButton) {
        let updatedData = dataTextField.text ?? ""
        
        handleUpdatedDataDelegate?.onDataUpdate(data: updatedData)
        navigationController?.popViewController(animated: true)
    }
}
