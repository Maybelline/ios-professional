//
//  ViewController.swift
//  Password
//
//  Created by Maybelline Rivas on 9/25/23.
//

import UIKit

class ViewController: UIViewController{
    
    let newPasswordTextField = PasswordTextField(placeHolderText: "New password")
    let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension ViewController {
    func style(){
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout(){
        view.addSubview(stackView)
        stackView.addArrangedSubview(newPasswordTextField)
        
        NSLayoutConstraint.activate([stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
                                     view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
                                     newPasswordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        
        ]
        )
    }
}


