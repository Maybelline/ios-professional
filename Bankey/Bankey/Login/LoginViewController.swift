//
//  ViewController.swift
//  Bankey
//
//  Created by Maybelline Rivas on 8/23/23.
//

import UIKit

protocol LogoutDelegate: AnyObject{
    func didLogout()
}

protocol LoginViewControllerDelegate: AnyObject{
    func didLogin()
    
}

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate? //This var is weak to avoid retain cycles. We want to hold a weak reference to things that are reaching out to us because they're going to have a strong reference to us. The AppDelegate is going to have a strong reference to our view controller.
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String?{
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    override func viewDidDisappear(_ animated: Bool){
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController{
    private func style(){
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0 //this makes a label multiline
        //errorMessageLabel.isHidden = true
    }
    private func layout(){
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1), // multiplier of 1 is equal to 8 points in iOS programming
            
            // SignInButton
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
            
            //ErrorMessageLabel
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
    }
}

// MARK: Actions
extension LoginViewController{
    @objc func signInTapped(sender: UIButton){
        errorMessageLabel.isHidden = true
        login()
    }
    private func login(){
        guard let username = username, let password = password else{
            assertionFailure("Username / password should never be nil") //This tells the developer that you have a programmer error
            return
        }
//        if username.isEmpty || password.isEmpty{
//            configureView(withMessage:"Username / password can not be blank")
//            return
//        }
        if username == "" && password == ""{
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
        }
        else{
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String){ // the word withMessage is the argument label and the word message is the named parameter
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
