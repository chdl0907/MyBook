//
//  WebViewController.swift
//  MyBook
//
//  Created by ktds 22 on 2017. 8. 17..
//  Copyright © 2017년 OliveNetworks, Inc. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    @IBOutlet weak var shopWebView: UIWebView!
    // 받아올 url정보를 담을 변수선언
    var shopURL:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let bookURL=shopURL else{
            return
        }
        
        if let urlIns=URL(string: bookURL){
            let urlRequest=URLRequest(url: urlIns)
            self.shopWebView.loadRequest(urlRequest)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
