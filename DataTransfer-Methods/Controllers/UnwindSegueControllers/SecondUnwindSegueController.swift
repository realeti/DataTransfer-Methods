//
//  SecondUnwindSegueController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 02.04.2023.
//

import UIKit

class SecondUnwindSegueController: UIViewController, UpdatingDataProtocol {
    var updatingData: String = ""
    
    @IBOutlet var dataTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scene B"
        navigationItem.prompt = "Unwind segue method"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    private func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUnwindSegueController" {
            prepareUnwindSegueController(segue)
        }
    }
    
    private func prepareUnwindSegueController(_ segue: UIStoryboardSegue) {
        guard let destionationController = segue.destination as? UnwindSegueController else {
            return
        }
        
        destionationController.updatingData = dataTextField.text ?? ""
        
        // Use this if scene show with present
        // destionationController.updateTextFieldData(withText: dataTextField.text ?? "")
    }
}
