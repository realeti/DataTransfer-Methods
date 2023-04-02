//
//  DelegateController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 02.04.2023.
//

import UIKit

class DelegateController: UIViewController, UpdatingDataProtocol, DataUpdateProtocol {
    var updatingData: String = ""
    
    @IBOutlet var dataTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scene A"
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
    
    func onDataUpdate(data: String) {
        updatingData = data
        dataTextField.text = data
    }
    
    @IBAction func editDataWithDelegate(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondDelegateController") as! SecondDelegateController
        
        editScreen.updatingData = dataTextField.text ?? ""
        editScreen.handleUpdatedDataDelegate = self
        
        navigationController?.pushViewController(editScreen, animated: true)
    }
    
    @IBAction func pushToMainController(_sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
