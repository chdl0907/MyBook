//
//  BookListTableViewController.swift
//  MyBook
//
//  Created by ktds 22 on 2017. 8. 17..
//  Copyright © 2017년 OliveNetworks, Inc. All rights reserved.
//

import UIKit
import Foundation

class BookListTableViewController: UITableViewController, AddBookDelegate {
    
    // cell에 출력할 array를 선언한다.
    var books:[Book]=Array()
    
    // 외부,내부이름을 다르게 선언(외부:withFileName/내부:fileName)
    func getFilePath(withFileName fileName:String)->String{
        let dirPath=NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docDir=dirPath[0] as NSString
        print(docDir)
     
        // 데이터를 저장할 디렉토리 생성
        let filePath=docDir.appendingPathComponent(fileName)
        return filePath

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 저장되있는 파일을 불러오는 코드
        let filePath=self.getFilePath(withFileName: "books")
        let fileManager=FileManager.default
        if fileManager.fileExists(atPath: filePath){
            if let books=NSKeyedUnarchiver.unarchiveObject(withFile: filePath) as? [Book]{
                self.books.append(contentsOf: books)
            }
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        /*
        let book1=Book(title: "그림으로 배우는 C++ Programming Basic 쉽고 재미있게 배우는 C++ 언어 기초의 모든 것",
                       writer: "Mana Takahashi",
                       publisher: "영진닷컴",
                       coverImage: UIImage(named:"b1")!,
                       price: 16200,
                       desc: "그림으로 배우는 C++ Programming은 프로그래밍에 익숙하지 않은 초보자들도 쉽고 재미있게 배울 수 있는 C++ 입문서다. 풍부한 일러스트를 통해 어려운 프로그래밍 개념도 그림을 통해 쉽게 이해할 수 있으며, 기초부터 고급 개념까지 마치 책상에 마주 앉아 설명하듯이 구성되어 있기 때문에 초보자들에게도 적합하다. 변수, 연산자, 함수 등 C++ 프로그래밍의 기초 개념부터 포인터, 제네릭 프로그래밍과 STL 등 고급 기능까지 매우 상세하면서 쉽게 설명하고 있다.",
                       url:"http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788931448931&orderClick=LEA&Kc=")
        
        let book2=Book(title: "살인자의 기억법",
                       writer: "김영하",
                       publisher: "문학동네",
                       coverImage: UIImage(named:"b2")!,
                       price: 7000,
                       desc: "30년 동안 꾸준히 살인을 해오다 25년 전에 은퇴한 연쇄살인범 김병수. 알츠하이머에 걸린 70세의 그가 벌이는 고독한 싸움을 통해 세계가 무너져 내리는 공포 체험에 대한 기록과 함께 인생이 던진 농담에 맞서는 모습을 담아냈다. 잔잔한 일상에 파격과 도발을 불어넣어 딸을 구하기 위한 마지막 살인을 계획하는 그의 이야기를 그려내며 삶과 죽음, 시간과 악에 대한 깊은 통찰을 풀어놓는다.",
                       url:"http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?barcode=4808954622035&orderClick=1cb#abstractDiv")
        
        let book3=Book(title: "오직 두 사람",
                       writer: "김영하",
                       publisher: "문학동네",
                       coverImage: UIImage(named:"b3")!,
                       price: 9100,
                       desc: "무언가를 상실한 사람들, 그리고 상실 이후의 삶을 살아가는 이들의 이야기를 담은 일곱 편의 작품이 담겨 있다. 한 인간 내면의 복합적인 감정부터 다종다양한 관계의 모순, 더 나아가 소위 신의 뜻이라 비유되는 알 수 없는 상황에 처한 인간의 고뇌까지 담아낸 이야기를 만나볼 수 있다.",
                       url:"http://digital.kyobobook.co.kr/digital/ebook/ebookDetail.ink?barcode=4808954645614")
        

        self.books.append(book1)
        self.books.append(book2)
        self.books.append(book3)
 */
        
        // 위에 있는 각 프로퍼티를 파일로 만들어라
        //let filePath=self.getFilePath(withFileName: "books")
        NSKeyedArchiver.archiveRootObject(self.books, toFile: filePath)
        print(filePath)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    // 몇 개의 cell을 보여줄것인가
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    // 반환받은 cell을 뿌려줌
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        

        // bookTableViewCell에 할당
        if let bookCell=cell as? BookTableViewCell{
            let book=self.books[indexPath.row]
        

        
        // Configure the cell...
        //let book=self.books[indexPath.row]
        
            // 가격에 천원단위 표기하는 방법
            let numFormatter: NumberFormatter=NumberFormatter()
            numFormatter.numberStyle=NumberFormatter.Style.decimal
        
            if let price = book.price{
                let priceStr = numFormatter.string(from: NSNumber(integerLiteral: price))
                bookCell.priceCellLabel.text=priceStr
            }else{
                // title에 빈 문자열이 할당된경우에 화면에 나타나지 않도록 처리
                bookCell.priceCellLabel.text=""
            }
        
            bookCell.titleCellLabel.text=book.title
            bookCell.writerCellLabel.text=book.writer
            bookCell.imageCellView.image=book.coverImage
            
            return bookCell
        }
        

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // segue : 전달하고자 하는 정보
    // sender : 전환되는 주체
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 다음 화면이 2개이상인경우 segue종류에 따라 다음화면을 예상할수 있음(detail화면 vs add화면)
        if segue.identifier=="addvc"{
            
            // 프로토콜과 어떤규약이 있는지 알아야함
            if let addVC=segue.destination as? AddBookViewController{
                addVC.delegate=self
            }
            
        }else if segue.identifier=="datailvc"{
            // detail화면
            let cell=sender as? UITableViewCell
            let vc=segue.destination as? BookDetailViewController
            

            guard let selectedCell=cell, let detailVC=vc else{
                return
            }
            
            if let idx=self.tableView.indexPath(for: selectedCell){
                detailVC.book=self.books[idx.row]
            }
            /*
             // sender의 return type이 any이므로 UITableViewCell형으로 형변환을 해줘야함
             let cell=sender as? UITableViewCell
             if let selCell=cell{
             let cellIdx=self.tableView.indexPath(for: selCell)
             print(cellIdx?.row)
             }*/
        }
    }

    // delegate시 참조할 함수(addbook)
    func sendNewBook(book: Book) {
        self.books.append(book)
        // 화면전환 후 다시 돌아왔을때 데이터 다시 리로드 해서 데이터 출력되도록 구현
        self.tableView.reloadData()
    }

}



class BookTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleCellLabel: UILabel!
    @IBOutlet weak var writerCellLabel: UILabel!
    @IBOutlet weak var publisherCellLabel: UILabel!
    @IBOutlet weak var priceCellLabel: UILabel!
    @IBOutlet weak var imageCellView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
