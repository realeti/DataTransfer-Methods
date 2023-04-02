//
//  UnwindSegueController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 02.04.2023.
//

// Не ограничены последней показанной сценой. Можно вернуться к любой сцене, показанной ранее, пропустив все промежуточные.
// Не имеет значения каким образом выводится текущая сцена, с помощью метода present или внутри Navigation Controller.
// Unwind segue как обычный segue, но производит переход в обратную сторону.

import UIKit

class UnwindSegueController: UIViewController, UpdatingDataProtocol {
    var updatingData: String = ""
    
    @IBOutlet var dataTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scene A"
        navigationItem.prompt = "Unwind segue method"
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTextFieldData(withText: updatingData)
    }
    
    func updateTextFieldData(withText text: String) {
        dataTextField.text = text
    }
    
    @IBAction func unwindToSegueController(_ segue: UIStoryboardSegue) {}
    
    @IBAction func pushToSecondUnwindSegueController(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "SecondUnwindSegueController")
        
        // editScreen.modalPresentationStyle = .fullScreen
        // present(editScreen, animated: true)
        navigationController?.pushViewController(editScreen, animated: true)
    }
    
    @IBAction func pushToMainController(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
