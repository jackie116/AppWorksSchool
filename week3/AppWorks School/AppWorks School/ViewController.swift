//
//  ViewController.swift
//  AppWorks School
//
//  Created by 黃昱崴 on 2022/4/10.
//

import UIKit

class ViewController: UIViewController {
    let acceptableAccount = "appworks_school@gmail.com"
    let acceptablePassword = "1234"
    
    @IBOutlet weak var accountTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkTextField: UITextField!
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var logInSignUpSegmentedControl: UISegmentedControl!
    
    func changeSelectedSegment() {
        clearTextField()
        logInSignUpSegmentedControl.layer.borderWidth = 1
        logInSignUpSegmentedControl.backgroundColor = .white
        logInSignUpSegmentedControl.selectedSegmentTintColor = .black
        logInSignUpSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        logInSignUpSegmentedControl.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
    }
    
    func changeToLogInSegment() {
        changeSelectedSegment()
        checkTextField.isUserInteractionEnabled = false
        checkLabel.textColor = .gray
        checkTextField.backgroundColor = .gray
    }
    
    func changeToSignUpSegment() {
        changeSelectedSegment()
        checkTextField.isUserInteractionEnabled = true
        checkLabel.textColor = .black
        checkTextField.backgroundColor = .white
    }
    
    func checkLogIn() {
        let account = accountTextField.text!
        let password = passwordTextField.text!
        
        if account.isEmpty {
            showAlert(message: "Account should not be empty.")
        } else if password.isEmpty {
            showAlert(message: "Password should not be empty.")
        } else if account == acceptableAccount && password == acceptablePassword {
            showAlert(title: "Success", message: "Login successed.")
        } else {
            showAlert(message: "Login fail")
        }
    }
    
    func checkSignUp() {
        let account = accountTextField.text!
        let password = passwordTextField.text!
        let passwordCheck = checkTextField.text!
        
        if account.isEmpty {
            showAlert(message: "Account should not be empty.")
        } else if password.isEmpty {
            showAlert(message: "Password should not be empty.")
        } else if passwordCheck.isEmpty {
            showAlert(message: "Check password should not be empty.")
        } else if password == passwordCheck {
            showAlert(title: "Success", message: "Signup successed")
        } else {
            showAlert(message: "Signup fail")
        }
    }
    
    func showAlert(title: String = "Error", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in

        })
        alert.addAction(action)
        present(alert, animated:  true)
    }
    
    func clearTextField() {
        accountTextField.text = ""
        passwordTextField.text = ""
        checkTextField.text = ""
    }
    
    @IBAction func changeSegmentedControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            changeToLogInSegment()
        } else if sender.selectedSegmentIndex == 1 {
            changeToSignUpSegment()
        }
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        if logInSignUpSegmentedControl.selectedSegmentIndex == 0 {
            checkLogIn()
        } else if logInSignUpSegmentedControl.selectedSegmentIndex == 1 {
            checkSignUp()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        changeToLogInSegment()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

