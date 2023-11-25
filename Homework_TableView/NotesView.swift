//
//  NotesView.swift
//  Homework_TableView
//
//  Created by Vlad on 25.11.23.
//

import UIKit

protocol NotesViewDelegate: AnyObject {
    func displayTextView(text: String)
}

class NotesView: UIView {
    
    weak var delegate: NotesViewDelegate?
    
    var notes = {
        let notes = UITextView()
        notes.translatesAutoresizingMaskIntoConstraints = false
        notes.backgroundColor = .gray
        notes.text = "Notes: "
        notes.font = UIFont.systemFont(ofSize: 20)
        
        return notes
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(notes)
        notes.delegate = self
        
        NSLayoutConstraint.activate([
            notes.topAnchor.constraint(equalTo: topAnchor),
            notes.bottomAnchor.constraint(equalTo: bottomAnchor),
            notes.trailingAnchor.constraint(equalTo: trailingAnchor),
            notes.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension NotesView: UITextViewDelegate {
//    func textViewDidBeginEditing(_ textView: UITextView) {
//        delegate?.displayTextView(text: notes.text)
//    }
//
//    func textViewDidEndEditing(_ textView: UITextView) {
//        delegate?.displayTextView(text: notes.text)
//    }
        
    func textViewDidChangeSelection(_ textView: UITextView) {
        delegate?.displayTextView(text: notes.text)
    }
}

