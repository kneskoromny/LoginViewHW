//
//  WelcomeViewController.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutButtonPressed() {
        
        // метод закрывающий экран
        dismiss(animated: true, completion: nil)
    }
    
}
