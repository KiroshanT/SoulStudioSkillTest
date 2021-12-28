//
//  Book.swift
//  SoulStudioSkillTest
//
//  Created by Kiroshan Thayaparan on 12/28/21.
//

class Book {

    var id: String
    var title: String
    var description: String
    var thumbnail: String
      
    init(id: String, title: String, description: String, thumbnail: String) {

        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
    }
}
