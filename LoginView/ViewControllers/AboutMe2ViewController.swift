//
//  AboutMe2ViewController.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 02.04.2021.
//

import UIKit

class AboutMe2ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
    var work: String!
    var city: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoLabel.text = """
            I live in \(city!) and work as \(work!).
            """

        
    }
    

}
