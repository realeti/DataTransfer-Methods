//
//  ViewController.swift
//  DataTransfer_On_Navigation_Controllers
//
//  Created by Apple M1 on 01.04.2023.
//

import UIKit

protocol UpdatingDataProtocol: AnyObject {
    var updatingData: String { get set }
}

class MainController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

