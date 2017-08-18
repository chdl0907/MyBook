//
//  Book.swift
//  MyBook
//
//  Created by ktds 22 on 2017. 8. 17..
//  Copyright © 2017년 OliveNetworks, Inc. All rights reserved.
//

import Foundation
import UIKit

class Book{
    var title:String
    var writer:String?
    var publisher:String?
    var coverImage:UIImage?
    var price:Int?
    var description:String?
    var url:String?
    
    init(title:String, writer:String?=nil,
         publisher:String?=nil,
         coverImage:UIImage?=nil,
         price:Int?,
         description:String?=nil,
         url:String?=nil){
        
        self.title=title
        self.writer=writer
        self.publisher=publisher
        self.coverImage=coverImage
        self.price=price
        self.description=description
        self.url=url
    }
    
     convenience init(title:String, writer:String){
        self.init(title: title,
                  writer: writer,
                  publisher: nil,
                  coverImage: nil,
                  price: nil,
                  description: nil,
                  url: nil)
    }
    
    convenience init(title:String, writer:String, publisher:String){
        self.init(title: title,
                  writer: writer,
                  publisher: publisher,
                  coverImage: nil,
                  price: nil,
                  description: nil,
                  url: nil)
    }
}
