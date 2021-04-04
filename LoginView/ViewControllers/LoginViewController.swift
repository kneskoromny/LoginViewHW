//
//  ViewController.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    
    private let currentUser = User.getUserdata()
//    private let userInfo = User.getPerson()
//    private let userHobbies = User.getHobbies()
//    private let userPhotos = User.getPhoto()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        
        if let viewControllers = tabBarController.viewControllers {
            
            for viewController in viewControllers {
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.currentUser = currentUser
                    
                } else if let aboutMeVC = viewController as? AboutMeViewController {
                    aboutMeVC.currentUser = currentUser
                   
                    
                } else if let aboutMyHobbiesVC = viewController as? AboutMyHobbiesViewController {
                    aboutMyHobbiesVC.currentUser = currentUser
                }
                
                else if let photoVC = viewController as? PhotoViewController {
                    photoVC.currentUser = currentUser
                }
            }
        }
        
        
    }
    
    @IBAction func loginButtonPressed() {
        checkUser()
        performSegue(withIdentifier: "sequeToWelcome", sender: nil)
    }
    
    @IBAction func forgotNameButtonPressed() {
        alert(title: "No problem!",
              message: "Your username is \(currentUser.userName)")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        alert(title: "That's it!",
              message: "Your password is \(currentUser.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue ) {
        userNameTF.text = nil
        passwordTF.text = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
        }
        return true
    }
    
    private func alert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    private func checkUser() {
        guard userNameTF.text == currentUser.userName
                && passwordTF.text == currentUser.password else {
            let wrongUserAC = UIAlertController(
                title: "Oops!",
                message: "It looks like Username or Password is wrong!",
                preferredStyle: .alert)
            let action = UIAlertAction(title: "Try again!", style: .default) {
                _ in self.passwordTF.text = nil
            }
            wrongUserAC.addAction(action)
            self.present(wrongUserAC, animated: true)
            return
        }
    }
}







