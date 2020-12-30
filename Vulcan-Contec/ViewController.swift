//
//  ViewController.swift
//  Vulcan-Contec
//
//  Created by Prabu on 20/12/20.
//  Copyright © 2020 Prabu. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let newButton = UIButton()
        newButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(newButton)
        newButton.layer.cornerRadius = 12
        newButton.backgroundColor = UIColor(red: 48/255, green: 155/255, blue: 255/255, alpha: 1)
        newButton.setTitle("Login", for: .normal)
        let constra = [
        newButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -320),
        newButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        newButton.widthAnchor.constraint(equalToConstant: 200),
        newButton.heightAnchor.constraint(equalToConstant: 60)
        ]
        NSLayoutConstraint.activate(constra)
        
        newButton.addTarget(self, action: #selector(self.Login(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func username(_ sender: Any) {
    }
    
    @IBAction func password(_ sender: Any) {
    }
    @IBOutlet weak var usename: UITextField!
    
    fileprivate func animateView(_ viewToAnimate:UIView){
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: { viewToAnimate.transform =
            CGAffineTransform(scaleX: 0.92, y: 0.92)
        } ) { (_) in
            print("comp")
        }
    }
    
    @IBOutlet weak var password: UITextField!
    @IBAction func Login(_ sender: UIButton) {
        self.animateView(sender)
        guard let _username = usename.text else { return };
        guard let _password = password.text else { return };
        let modLogin = LoginModel(username: _username, password: _password)
        APIManager.shareInstance.callLoginAPI(login: modLogin) {
            (result) in
            switch result{
            case .success(let json):
                if let user = (json as AnyObject)["user"]! as? [String: AnyObject]{
                    let userName = (user as AnyObject).value(forKey: "userName") as! String
                    let jwtToken = (user as AnyObject).value(forKey: "jwtToken") as! String
                    let userModel = userDetail(userName: userName, jwtToken: jwtToken)
                    let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
                    guard let mainNavigationVC = mainStoryboard.instantiateViewController(withIdentifier: "MainnavigationController") as?
                        MainnavigationController else{
                            return
                    }
                    
                    TokenServices.tokenInstance.saveToken(token: jwtToken)
                    
                    if let mainVC = mainNavigationVC.topViewController as? HomeViewController {
                        mainVC._username = userModel.userName
                    }
                    
                    self.present(mainNavigationVC, animated: true, completion: nil)
                }
            case .failure(let err):
                print(err.localizedDescription)
                let alert = UIAlertController(title: "", message: "Invalid Password", preferredStyle: .alert)
                self.present(alert, animated: true) {
                    sleep(3)
                    alert.dismiss(animated: true) }
            }
        }
    }
}

