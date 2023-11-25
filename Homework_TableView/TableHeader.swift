//
//  TableHeader.swift
//  Homework_TableView
//
//  Created by Vlad on 25.11.23.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {
    
    static let id = "TableHeader"
    
    let customView = {
        let customView = View()
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        return customView
    }()
    

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(customView)
        
        NSLayoutConstraint.activate([
            customView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
