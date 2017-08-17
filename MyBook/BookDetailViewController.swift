//
//  BookDetailViewController.swift
//  MyBook
//
//  Created by ktds 22 on 2017. 8. 17..
//  Copyright © 2017년 OliveNetworks, Inc. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    // 사용자가 선택한 프로퍼티 값의 정보를 받기위한 변수선언
    var book:Book?
    
    @IBOutlet weak var bookCoverImageView: UIImageView!
    @IBOutlet weak var bookWriterLabel: UILabel!
    @IBOutlet weak var bookPublisherLabel: UILabel!
    @IBOutlet weak var bookPriceLabel: UILabel!
    @IBOutlet weak var bookDescriptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // newBook에 아무것도 없는 경우 return
        guard let newBook=book else{
            return
        }
        // newBook에서 사용자가 선택한 책의 detail정보를 받아온다.
        self.bookCoverImageView.image=newBook.coverImage
        self.bookWriterLabel.text=newBook.writer
        self.bookPublisherLabel.text=newBook.publisher
        self.bookPriceLabel.text=String(newBook.price)
        self.bookDescriptionTextView.text=newBook.description
        
        //Title표시
        self.navigationItem.title=newBook.title

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // url정보를 넘겨줄떄 이전화면의 정보를 주기 위함
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let webVC=segue.destination as? WebViewController{
            webVC.shopURL=self.book?.url
        }
    }

}
