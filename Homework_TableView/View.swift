//
//  View.swift
//  Homework_TableView
//
//  Created by Vlad on 25.11.23.
//

import UIKit

protocol ViewDelegate: AnyObject {
    func displayTexts(firstText: String, secondText: String, thirdText: String)
}

class View: UIView {
    
    weak var delegate: ViewDelegate?
    
    let firstTextField = {
        let firstTextField = UITextField()
        firstTextField.placeholder = "Enter First Name"
        firstTextField.borderStyle = .roundedRect
        firstTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return firstTextField
    }()
    let middleTextField = {
        let middleTextField = UITextField()
        middleTextField.placeholder = "Enter Middle Name"
        middleTextField.borderStyle = .roundedRect
        middleTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return middleTextField
    }()
    let lastTextField = {
        let lastTextField = UITextField()
        lastTextField.placeholder = "Enter Last Name"
        lastTextField.borderStyle = .roundedRect
        lastTextField.translatesAutoresizingMaskIntoConstraints = false
        
        return lastTextField
    }()
    
    let firstLabel = {
        let firstLabel = UILabel()
        firstLabel.text = "First"
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return firstLabel
    }()
    let middleLabel = {
        let middleLabel = UILabel()
        middleLabel.text = "Middle"
        middleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return middleLabel
    }()
    let lastLabel = {
        let lastLabel = UILabel()
        lastLabel.text = "Last"
        lastLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return lastLabel
    }()
    
    let imageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    var firstText: String {
        return firstTextField.text ?? ""
    }
    
    var middleText: String {
        return middleTextField.text ?? ""
    }
    
    var lastText: String {
        return lastTextField.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(firstTextField)
        addSubview(middleTextField)
        addSubview(lastTextField)
        addSubview(firstLabel)
        addSubview(middleLabel)
        addSubview(lastLabel)
        addSubview(imageView)
        
        imageView.image = UIImage(named: "image")
        
        NSLayoutConstraint.activate([
            firstTextField.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            firstTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            firstTextField.widthAnchor.constraint(equalToConstant: 180),
            
            middleTextField.centerXAnchor.constraint(equalTo: firstTextField.centerXAnchor),
            middleTextField.topAnchor.constraint(equalTo: firstTextField.bottomAnchor, constant: 6),
            middleTextField.widthAnchor.constraint(equalToConstant: 180),
            
            lastTextField.centerXAnchor.constraint(equalTo: middleTextField.centerXAnchor),
            lastTextField.topAnchor.constraint(equalTo: middleTextField.bottomAnchor, constant: 6),
            lastTextField.widthAnchor.constraint(equalToConstant: 180),
            lastTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            firstLabel.centerYAnchor.constraint(equalTo: firstTextField.centerYAnchor),
            firstLabel.trailingAnchor.constraint(equalTo: firstTextField.leadingAnchor, constant: -16),
            firstLabel.widthAnchor.constraint(equalToConstant: 52),
            
            middleLabel.centerXAnchor.constraint(equalTo: firstLabel.centerXAnchor),
            middleLabel.centerYAnchor.constraint(equalTo: middleTextField.centerYAnchor),
            middleLabel.widthAnchor.constraint(equalToConstant: 52),
            
            lastLabel.centerXAnchor.constraint(equalTo: middleLabel.centerXAnchor),
            lastLabel.centerYAnchor.constraint(equalTo: lastTextField.centerYAnchor),
            lastLabel.widthAnchor.constraint(equalToConstant: 52),
            
            imageView.widthAnchor.constraint(equalToConstant: 100),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.trailingAnchor.constraint(equalTo: middleLabel.leadingAnchor, constant: -16),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            
        ])
        
        firstTextField.delegate = self
        middleTextField.delegate = self
        lastTextField.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension View: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.displayTexts(firstText: firstTextField.text ?? "", secondText: middleTextField.text ?? "", thirdText: lastTextField.text ?? "")
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.displayTexts(firstText: firstTextField.text ?? "", secondText: middleTextField.text ?? "", thirdText: lastTextField.text ?? "")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        delegate?.displayTexts(firstText: firstTextField.text ?? "", secondText: middleTextField.text ?? "", thirdText: lastTextField.text ?? "")
    }
    
    
    func clearTextField() {
        firstTextField.text = ""
        middleTextField.text = ""
        lastTextField.text = ""
    }
}

