//
//  PropertyController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 01.04.2023.
//

import UIKit

class PropertyController: UIViewController, UpdatingDataProtocol {
    var updatingData: String = ""

    @IBOutlet var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scene A"
        navigationItem.prompt = "Property method"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    @IBAction func saveDataWithProperty(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondPropertyController") as! SecondPropertyController
        
        editScreen.updatingData = dataTextField.text ?? ""
        navigationController?.pushViewController(editScreen, animated: true)
    }
    
    @IBAction private func pushToMainController(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
