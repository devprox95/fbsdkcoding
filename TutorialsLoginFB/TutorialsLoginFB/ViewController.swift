//
//  ViewController.swift
//  TutorialsLoginFB
//
//  Created by Nguyen Van Nguyen on 16/07/2021.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        loginButton.permissions = ["public_profile", "email", "pages_show_list", "ads_management", "ads_read", "pages_read_engagement", "pages_manage_ads", "pages_manage_cta", "pages_show_list", "business_management", "pages_manage_metadata"]
        
        print("graphAPIVersion: \(Settings.graphAPIVersion)")

    }
    
    @IBAction func btnDidTap(_ sender: UIButton) {
        guard let token = AccessToken.current, !token.isExpired  else {
            print("Not verify token")
            return
        }
        // do anything
        print("~~~ --: TOKEN: \(token)")
        // Test action
        let request = GraphRequest(graphPath: "/me/adaccounts", httpMethod: .get)
        request.start { graphRequestConnection, response, error in
            if let response = response {
                print("~~~ --: RESPONSE: \(response)")
            } else if let err = error {
                print("~~~ --: ERROR: \(err)")
            }
        }
        
        /// Request get campain
        var params = [String:Any]()
        params["fields"] = "id,name,objective,configured_status,effective_status,account_id,bid_amount,bid_strategy,start_time,end_time,targeting,daily_budget,campaign_id,special_ad_categories"
        params["access_token"] = "\(token)"
        
        let requestCampaign = GraphRequest(graphPath: "act_285681628233737", parameters: params, httpMethod: .get)
        requestCampaign.start { graphRequestConnection, response, error in
            if let response = response {
                print("~~~ --: RESPONSE: \(response)")
            } else if let err = error {
                print("~~~ --: ERROR: \(err)")
            }
        }
        
    }


}

