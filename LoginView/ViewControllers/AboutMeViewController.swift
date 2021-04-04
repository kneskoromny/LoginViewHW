//
//  AboutMeViewController.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 02.04.2021.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    
 
    @IBOutlet var avatarImage: UIImageView!
    
    var name: String!
    var surname: String!
    var age: Int!
    var city: String!
    var image: String!
    
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer()
        
        avatarImage.image = UIImage(named: "аватар")
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 10
        
        infoLabel.text = """
            Привет👋\n Меня зовут \(name!) \(surname!),
            мне \(age!) лет и я живу в городе \(city!).
            Во вкладках ты найдешь инфо о моих увлечениях и пару фото!
            Давай знакомиться😉
            """
        
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
