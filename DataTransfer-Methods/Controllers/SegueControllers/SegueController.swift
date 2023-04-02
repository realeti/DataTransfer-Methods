//
//  SegueController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 01.04.2023.
//

import UIKit

class SegueController: UIViewController, UpdatingDataProtocol {
    var updatingData: String = ""
    
    @IBOutlet var dataTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scene A"
        navigationItem.prompt = "Segue method"
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
        if segue.identifier == "toSecondSegueController" {
            prepareEditScreen(segue)
        }
    }
    
    private func prepareEditScreen(_ segue: UIStoryboardSegue) {
        guard let destinationController = segue.destination as? SecondSegueController else {
            return
        }
        
        destinationController.updatingData = dataTextField.text ?? ""
    }
    
    @IBAction private func pushToMainController(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
