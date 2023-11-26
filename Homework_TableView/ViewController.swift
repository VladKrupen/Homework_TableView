//
//  ViewController.swift
//  Homework_TableView
//
//  Created by Vlad on 25.11.23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ViewDelegate, NotesViewDelegate, ButtonViewDelegate {
    
    let tableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
        
        return tableView
    }()
    
    let customView = {
        let customView = View()
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        return customView
    }()
        
    let buttonView = {
        let buttonView = ButtonView()
//        buttonView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.frame = .init(x: 0, y: 0, width: 0, height: 70)
        
        
        return buttonView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 130))
        
//        let footer = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 50))
        
        view.addSubview(tableView)
        header.addSubview(customView)
//        footer.addSubview(buttonView)
        
        tableView.separatorColor = .green
        tableView.tableHeaderView = header
        tableView.tableFooterView = buttonView
        
        
        
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            
//            buttonView.topAnchor.constraint(equalTo: footer.topAnchor),
//            buttonView.bottomAnchor.constraint(equalTo: footer.bottomAnchor),
//            buttonView.leadingAnchor.constraint(equalTo: footer.leadingAnchor),
//            buttonView.trailingAnchor.constraint(equalTo: footer.trailingAnchor),
//            
        ])
        
        tableView.dataSource = self
        tableView.delegate = self
        customView.delegate = self
        buttonView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath) as! TableViewCell
        
        cell.notesView.delegate = self
        
//        if flag == true {
//            cell.notesView.notes.text = "Notes: "
//        }
//        
//        if cell.notesView.notes.text == "Notes: " {
//            flag == false
//        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 520
    }
    
    //MARK: ViewDelegate
    
    func displayTexts(firstText: String, secondText: String, thirdText: String) {
        print(firstText)
        print(secondText)
        print(thirdText)
    }
    
    //MARK: NotesViewDelegate
    
    func displayTextView(text: String) {
        print(text)
    }
    
    //MARK: ButtonViewDelegate
    
    var storageFirstText: String = ""
    var storageMiddleText: String = ""
    var storageLastText: String = ""
    
    func buttonSavePressed(_ sender: ButtonView) {
        storageFirstText = customView.firstText
        storageMiddleText = customView.middleText
        storageLastText = customView.lastText
        
        print(storageFirstText)
        print(storageMiddleText)
        print(storageLastText)
    }
    
    func buttonCancelPressed(_ sender: ButtonView) {
        customView.clearTextField()
        tableView.reloadData()
    }
    
    var flag: Bool = false
    
    func buttonClearPressed(_ sender: ButtonView) {
//        notesView.clearTextNotes()
        flag = true
        tableView.reloadData()
    }
    
    
}
