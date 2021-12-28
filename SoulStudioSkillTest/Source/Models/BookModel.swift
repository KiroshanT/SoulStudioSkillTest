//
//  BookModel.swift
//  SoulStudioSkillTest
//
//  Created by Kiroshan Thayaparan on 12/28/21.
//

import SwiftyJSON

class BookModel {
    
    private let api = ApiClient()
    var bookList: [Book] = []
    
    func getBookData(startIndex: Int, getBookDataCallFinished: @escaping (_ status: Bool) -> Void) {
        //get data from http request
        api.sendRequest(request_url: "https://www.googleapis.com/books/v1/volumes?q=flowers&startIndex=\(startIndex)&maxResults=10", success: { (response, code) -> Void in

            if code == 200 {
                let currentData = JSON(response as Any)

                let res = currentData["items"].arrayObject

                let jsonArray = JSON(res as Any).array

                if let jsonList = jsonArray {
                    self.bookList.removeAll()
                    for jsonObject in jsonList {
                        let book = Book(id: jsonObject["id"].string ?? "",
                                        title: jsonObject["volumeInfo"]["title"].string ?? "",
                                        description: jsonObject["volumeInfo"]["description"].string ?? "",
                                        thumbnail: jsonObject["volumeInfo"]["imageLinks"]["thumbnail"].string ?? "")
                        self.bookList.append(book)
                    }
                }
                getBookDataCallFinished(true)
            } else {
                print("Api status not equal 200")
                getBookDataCallFinished(false)
            }
        }) { (error) -> Void in
            NSLog("Error (getBookDataCallFinished): \(error.localizedDescription)")
            getBookDataCallFinished(false)
        }
    }
}
