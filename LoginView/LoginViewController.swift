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
    
    private let userName = "Lex"
    private let password = "123"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userNameTF.delegate = self
        passwordTF.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController
        else { return }
        welcomeVC.userName = userNameTF.text
    }

    @IBAction func loginButtonPressed() {
        checkUser()
        performSegue(withIdentifier: "sequeToWelcome", sender: nil)
    }
    
    @IBAction func forgotNameButtonPressed() {
        alert(title: "No problem!", message: "Your username is Lex")
    }
    
    @IBAction func forgotPasswordButtonPressed() {
        alert(title: "That's it!", message: "Your password is 123")
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
        guard userNameTF.text == userName && passwordTF.text == password
        else {  let wrongUserAC = UIAlertController(
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
   
    


    


