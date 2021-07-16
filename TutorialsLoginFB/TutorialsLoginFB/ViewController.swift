//
//  ViewController.swift
//  TutorialsLoginFB
//
//  Created by Nguyen Van Nguyen on 16/07/2021.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
    }


}

