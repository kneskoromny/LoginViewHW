//
//  AboutMeViewController.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 02.04.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    var name: String!
    var surname: String!
    var age: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = """
            Hi! My name is \(name!) and surname is \(surname!),
            I'm \(age!) years old
            """
        

        
    }
    

   

}
