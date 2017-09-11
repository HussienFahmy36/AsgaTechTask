//
//  ViewController.swift
//  AuthenticationTask
//
//  Created by mac on 9/11/17.
//  Copyright © 2017 AsgaTech. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var Username_TxTField: UITextField!
    @IBOutlet weak var Password_TxTField: UITextField!
    @IBOutlet weak var ConfirmPassword_TxTField: UITextField!
    @IBOutlet weak var Email_TxTField: UITextField!
    var userObject: User!
    
    //MARK: - viewcontroller LifeCycle methds
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    //MARK: textfield delegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Username_TxTField.resignFirstResponder()
        Password_TxTField.resignFirstResponder()
        Email_TxTField.resignFirstResponder()
    }
    //MARK: form validation
    func validInputs () -> Bool {
        if (Username_TxTField.text?.characters.count)! > 0 &&
            (Password_TxTField.text?.characters.count)! > 0 &&
            (ConfirmPassword_TxTField.text?.characters.count)! > 0 &&
            (Email_TxTField.text?.characters.count)! > 0{
            
            if Password_TxTField.text! != ConfirmPassword_TxTField.text! {
                return false
            }
            else{
                return true
            }
            
        }
        return false
    }
    //MARK: - functions
    func pushToWelcomeScreen(){
        
        let welcomeScreen = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        self.navigationController?.pushViewController(welcomeScreen, animated: true)
    }
    func showErrorAlert(){
        let alertControl = UIAlertController.init(title: "Error", message: "Error happened", preferredStyle: .alert)
        let okButton = UIAlertAction.init(title: "Ok", style: .cancel, handler: nil)
        alertControl.addAction(okButton)
        self.present(alertControl, animated: true, completion: nil)
        
    }
    //MARK: - Button actions
    @IBAction func signupClicked(_ sender: Any) {
        if validInputs()
        {
            userObject = User(usernameParam: Username_TxTField.text!, passwordParam: Password_TxTField.text!, emailParam: Email_TxTField.text!)
            
            AuthenticationManager.AuthenticateWithUserData(user: userObject, completionHandler: { (response, error) in
                if response.isSuccess! {
                    OperationQueue.main.addOperation({ 
                        self.pushToWelcomeScreen()
                    })
                }
                else{
                    self.showErrorAlert()
                }
            })
        }
    }
    

}

