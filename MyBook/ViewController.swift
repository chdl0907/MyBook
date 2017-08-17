//
//  ViewController.swift
//  MyBook
//
//  Created by ktds 22 on 2017. 8. 17..
//  Copyright © 2017년 OliveNetworks, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewControllerProtocol {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var pwLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let idStr=UserDefaults.standard.object(forKey: "userId") as? String
        let pwStr=UserDefaults.standard.object(forKey: "userPassword") as? String
        
        if let id=idStr, let pw=pwStr{
            let welcomeAlert=UIAlertController(title: "My Book", message: "\(id)님 환영합니다.", preferredStyle: .alert)
            
            let closeAction=UIAlertAction(title: "닫기", style: .cancel, handler: nil)
            
            welcomeAlert.addAction(closeAction)
            self.present(welcomeAlert,animated: true, completion: nil)
        } else { // id/pw가 없는경우
            self.performSegue(withIdentifier: "loginvc", sender: self)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // LoginViewContoller에 있는 id/pw정보를 받아옴
        if let vc=segue.destination as? LoginViewController{
            vc.delegate=self
        }
    }
    
    // delegate만 할당하지말고 값을 받아오는 함수도 같이 구현해줘야한다.
    func send(withId: String, password: String) {
        self.idLabel.text=withId
        self.pwLabel.text=password

        // UserDefaults에 저장(UserDefaults : 앱에서 값을 계속 가지고 있어야할 때 사용)
        UserDefaults.standard.set(withId, forKey: "userId")
        UserDefaults.standard.set(password, forKey: "userPassword")
    
    }

}

