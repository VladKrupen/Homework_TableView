//
//  ButtonView.swift
//  Homework_TableView
//
//  Created by Vlad on 25.11.23.
//

import UIKit

protocol ButtonViewDelegate: AnyObject {
    func buttonSavePressed(_ sender: ButtonView)
    func buttonCancelPressed(_ sender: ButtonView)
    func buttonClearPressed(_ sender: ButtonView)
}

class ButtonView: UIView {
    
    weak var delegate: ButtonViewDelegate?
    
    let buttonSave = {
        let buttonSave = UIButton()
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.setTitle("Save", for: .normal)
        buttonSave.setTitleColor(.systemBlue, for: .normal)
        
        return buttonSave
    }()
    
    let buttonCancel = {
        let buttonCancel = UIButton()
        buttonCancel.translatesAutoresizingMaskIntoConstraints = false
        buttonCancel.setTitle("Cancel", for: .normal)
        buttonCancel.setTitleColor(.systemBlue, for: .normal)
        
        return buttonCancel
    }()
    
    let buttonClear = {
        let buttonClear = UIButton()
        buttonClear.translatesAutoresizingMaskIntoConstraints = false
        buttonClear.setTitle("Clear", for: .normal)
        buttonClear.setTitleColor(.systemBlue, for: .normal)
        
        return buttonClear
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(buttonSave)
        addSubview(buttonCancel)
        addSubview(buttonClear)
        
        NSLayoutConstraint.activate([
            buttonCancel.centerXAnchor.constraint(equalTo: centerXAnchor),
            buttonCancel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            buttonSave.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonSave.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            
            buttonClear.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonClear.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50)
        ])
        
        buttonSave.addTarget(self, action: #selector(buttonSaveTapped), for: .touchUpInside)
        buttonCancel.addTarget(self, action: #selector(buttonCancelTapped), for: .touchUpInside)
        buttonClear.addTarget(self, action: #selector(buttonClearTapped), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buttonSaveTapped(_ sender: UIButton) {
        delegate?.buttonSavePressed(self)
    }
    
    @objc func buttonCancelTapped(_ sender: UIButton) {
        delegate?.buttonCancelPressed(self)
    }
    
    @objc func buttonClearTapped(_ sender: UIButton) {
        delegate?.buttonClearPressed(self)
    }
    
}

