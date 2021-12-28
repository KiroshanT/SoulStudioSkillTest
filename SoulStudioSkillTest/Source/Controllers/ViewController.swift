//
//  ViewController.swift
//  SoulStudioSkillTest
//
//  Created by Kiroshan Thayaparan on 12/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    private var bookModel = BookModel()
    private var bookList: [Book] = []
    private var scrollStatus = false
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(BookTableViewCell.self, forCellReuseIdentifier: "BookTableViewCell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "List View"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = nil
        tableView.tableHeaderView = nil
        //tableView.allowsSelection = false
        tableView.backgroundColor = .white
        view.addSubview(tableView)
        
        getBookData(startIndex: 0)
        
        ProgressView.shared.show(view, mainText: nil, detailText: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func getBookData(startIndex: Int) {
        bookModel.getBookData(startIndex: startIndex, getBookDataCallFinished: { (status) in
            if status {
                if !self.bookModel.bookList.isEmpty {
                    self.scrollStatus = true
                }
                self.bookList.append(contentsOf: self.bookModel.bookList)
            }
            ProgressView.shared.hide()
            self.tableView.reloadData()
        })
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return Common.cellHeight(view: view, book: bookList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        cell.selectionStyle = .none
        cell.data = bookList[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == self.bookList.count-1 && scrollStatus { //you might decide to load sooner than
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                if tableView.visibleCells.contains(cell) {
                    self.scrollStatus = false
                    ProgressView.shared.show(self.view, mainText: nil, detailText: nil)
                    self.getBookData(startIndex: self.bookList.count)
                }
            }
        }
    }
}

