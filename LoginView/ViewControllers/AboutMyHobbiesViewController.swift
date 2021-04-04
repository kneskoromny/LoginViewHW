//
//  AboutMe2ViewController.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 02.04.2021.
//

import UIKit

class AboutMyHobbiesViewController: UIViewController {
    
    @IBOutlet weak var TopLabelTitle: UILabel!
    @IBOutlet weak var TopLabelDescription: UILabel!
    @IBOutlet weak var MidLabelTitle: UILabel!
    @IBOutlet weak var MidLabelDescription: UILabel!
    @IBOutlet weak var BottomLabelTitle: UILabel!
    @IBOutlet weak var BottomLabelDescription: UILabel!
    
    var hobbies: [Hobby]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer()
        getHobbyDescription()
        
    }
    
    private func getHobbyDescription() {
        for hobby in hobbies {
            if hobby.title == "Бегать" {
                TopLabelTitle.text = hobby.title + " 🏃"
                TopLabelDescription.text = hobby.description
            } else if hobby.title == "Учиться" {
                MidLabelTitle.text = hobby.title + " 🤓"
                MidLabelDescription.text = hobby.description
            } else {
                BottomLabelTitle.text = hobby.title + " 🎧"
                BottomLabelDescription.text = hobby.description
            }
        }
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
