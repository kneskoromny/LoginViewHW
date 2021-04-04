//
//  PhotoViewController.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 03.04.2021.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    @IBOutlet weak var thirdImageView: UIImageView!
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var thirdTitleLabel: UILabel!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer()
        
        firstImageView.layer.cornerRadius = firstImageView.frame.height / 7
        secondImageView.layer.cornerRadius = secondImageView.frame.height / 7
        thirdImageView.layer.cornerRadius = thirdImageView.frame.height / 7
        
        getPhotoDescription()
        
    }
    
    private func getPhotoDescription() {
        for photo in currentUser.person.photos {
            if photo.image == "чупа" {
                firstImageView.image = UIImage(named: photo.image)
                firstTitleLabel.text = photo.description
            } else if photo.image == "лыжи" {
                secondImageView.image = UIImage(named: photo.image)
                secondTitleLabel.text = photo.description
            } else if photo.image == "эльбрус" {
                thirdImageView.image = UIImage(named: photo.image)
                thirdTitleLabel.text = photo.description
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
