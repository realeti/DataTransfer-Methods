//
//  SecondPropertyController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 01.04.2023.
//

import UIKit

class SecondPropertyController: UIViewController, UpdatingDataProtocol {
    var updatingData: String = ""
    
    @IBOutlet var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scene B"
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
        let editScreen = storyboard.instantiateViewController(withIdentifier: "PropertyController") as! PropertyController

        editScreen.updatingData = dataTextField.text ?? ""
        navigationController?.pushViewController(editScreen, animated: true)
    }
}
