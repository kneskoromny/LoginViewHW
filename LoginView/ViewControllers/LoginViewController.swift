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
    
//    private let userName = "Lex"
//    private let password = "123"
    
    private let userKirill = User(person: Person(
                                    name: "Kirill",
                                    surname: "Neskoromny",
                                    age: 35,
                                    work: "Navigator",
                                    city: "Murmansk"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let welcomeVC = segue.destination as? WelcomeViewController
//        else { return }
//        welcomeVC.userName = userKirill.person.name
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        if let viewControllers = tabBarController.viewControllers {
            
            for viewController in viewControllers {
                if let welcomeVC = viewController as? WelcomeViewController {
                    welcomeVC.name = userKirill.person.name
                    
                } else if let aboutMeVC = viewController as? AboutMeViewController {
                    aboutMeVC.name = userKirill.person.name
                    aboutMeVC.surname = userKirill.person.surname
                    aboutMeVC.age = userKirill.person.age
                    
                } else if let aboutMe2VC = viewController as? AboutMe2ViewController {
                    aboutMe2VC.city = userKirill.person.city
                    aboutMe2VC.work = userKirill.person.work
                }
            }
        }
       
        
    }

    @IBAction func loginButtonPressed() {
        checkUser()
        performSegue(withIdentifier: "sequeToWelcome", sender: nil)
    }
    
    @IBAction func forgotNameButtonPressed() {
        alert(title: "No problem!", message: "Your username is \(userKirill.userName)")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        alert(title: "That's it!", message: "Your password is \(userKirill.password)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue ) {
        guard segue.source is WelcomeViewController else { return }
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
        guard userNameTF.text == userKirill.userName
                && passwordTF.text == userKirill.password else {
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
   
    


    


