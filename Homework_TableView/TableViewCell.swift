//
//  TableViewCell.swift
//  Homework_TableView
//
//  Created by Vlad on 25.11.23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let id = "TableViewCell"
    
    let notesView = {
        let notesView = NotesView()
        notesView.translatesAutoresizingMaskIntoConstraints = false
        
        return notesView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(notesView)
        
        NSLayoutConstraint.activate([
            notesView.topAnchor.constraint(equalTo: contentView.topAnchor),
            notesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            notesView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            notesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
