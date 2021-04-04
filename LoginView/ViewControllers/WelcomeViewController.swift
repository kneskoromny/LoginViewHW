//
//  WelcomeViewController.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 30.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer()
        welcomeLabel.text = "Добро пожаловать, \(currentUser.person.name) \(currentUser.person.surname)!"
    }
    
    private func gradientLayer() {
        
        let color1 = UIColor(
            red: 202/255,
            green: 223/255,
            blue: 241/255,
            alpha: 1).cgColor
        let color2 = UIColor.white.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        
        gradientLayer.colors = [color1, color2]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
}
