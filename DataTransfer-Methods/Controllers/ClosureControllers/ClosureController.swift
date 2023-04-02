//
//  ClosureController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 02.04.2023.
//

import UIKit

class ClosureController: UIViewController, UpdatingDataProtocol {
    var updatingData: String = ""
    
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
    
    @IBAction func pushToMainController(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func editDataWithClosure(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondClosureController") as! SecondClosureController
        
        editScreen.updatingData = dataTextField.text ?? ""
        editScreen.complationHandler = { [unowned self] updatedValue in
            updatingData = updatedValue
            updateTextFieldData(withText: updatedValue)
        }
        
        navigationController?.pushViewController(editScreen, animated: true)
    }
}
