//
//  Common.swift
//  SoulStudioSkillTest
//
//  Created by Kiroshan Thayaparan on 12/29/21.
//

import UIKit

class Common: NSObject {
    
    class func cellHeight(view: UIView, book: Book) -> CGFloat {
        
        let textView = UITextView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 10))
        textView.isScrollEnabled = true
        textView.text = book.description
        
        if textView.contentSize.height+50 < 80 {
            return 80
        }
        return textView.contentSize.height+50
    }
}
