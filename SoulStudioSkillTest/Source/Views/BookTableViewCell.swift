//
//  BookTableViewCell.swift
//  SoulStudioSkillTest
//
//  Created by Kiroshan Thayaparan on 12/28/21.
//

import UIKit
import Kingfisher

class BookTableViewCell: UITableViewCell {
    
    var data: Book! = nil {
        didSet {
            print(data.thumbnail)
            thumbnail.kf.setImage(with: URL(string: data.thumbnail))
            labelTitle.text = data.title
            textViewDescription.text = data.description
        }
    }
    
    private var thumbnail: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.backgroundColor = .gray
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.gray.cgColor
        return imageView
    }()
    
    private var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Title"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private var textViewDescription: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.textColor = .darkGray
        textView.text = "Address"
        textView.font = UIFont.systemFont(ofSize: 10)
        return textView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        commonInit(view: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(view: UIView) {
        view.addSubview(thumbnail)
        view.addSubview(labelTitle)
        view.addSubview(textViewDescription)
        
        thumbnail.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        thumbnail.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        thumbnail.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thumbnail.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        labelTitle.leftAnchor.constraint(equalTo: thumbnail.rightAnchor, constant: 10).isActive = true
        labelTitle.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        labelTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: textViewDescription.topAnchor).isActive = true
        labelTitle.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        textViewDescription.leftAnchor.constraint(equalTo: thumbnail.rightAnchor, constant: 5).isActive = true
        textViewDescription.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        textViewDescription.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 10).isActive = true
        textViewDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
    }
}
