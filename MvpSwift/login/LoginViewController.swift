//
//  LoginViewController.swift
//  MvpSwift
//
//  Created by Nabin Khatiwada on 12/4/18.
//  Copyright © 2018 EvolveAsia. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginView {
    var presenter: LoginPresenter?
    @IBOutlet weak var tbUsername: UITextField!
    @IBOutlet weak var tbPassword: UITextField!
    private var progress: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LoginPagePresenter(view:self)
    }
    
    @IBAction func onLoginButtonClicked(_ sender: Any) {
        let username = tbUsername.text
        let password = tbPassword.text
        
        if username == ""{
            showAlertDialog(title: "Error",  message: "Username can't be empty.")
        }else if password == ""{
            showAlertDialog(title: "Error",  message: "Password can't be empty.")
        }else{
            let loginModel = LoginModel(username: username!, password: password!)
            self.presenter?.doLogin(loginModel: loginModel)
        }
    }
    
    func showNetworkError(message: String) {
        self.showAlertDialog(title: "Network Error", message: message)
    }
    
    func showLoading(message: String) {
        progress =  showDialog()
        progress?.startAnimating()
    }
    
    func showLoginSuccess(message: String) {
        progress?.stopAnimating()
        self.showAlertDialog(title: "Login Success", message: message)
    }
    
    func showError(message: String) {
        progress?.stopAnimating()
        self.showAlertDialog(title: "Login Error", message: message)
    }
    
   private func showDialog()-> UIActivityIndicatorView{
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        return indicator
    }
    
    
    private func showAlertDialog(title:String?, message:String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    

}