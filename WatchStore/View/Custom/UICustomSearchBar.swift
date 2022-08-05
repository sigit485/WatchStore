//
//  UICustomSearchBar.swift
//  WatchStore
//
//  Created by Sigit on 28/07/22.
//

import UIKit

class UICustomSearchBar: UIView {
    
    lazy var hStack: UIStackView = {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 65
        hStack.addArrangedSubview(sideMenuIcon)
        hStack.addArrangedSubview(borderView)
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
    }()
    
    lazy var searchIcon: UIImageView = {
        let searchIcon = UIImageView(image: UIImage(named: "ic_search"))
        searchIcon.contentMode = .scaleAspectFill
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        return searchIcon
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14)
        let attributes = [
            NSAttributedString.Key.foregroundColor: UIColor.lightGray,
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Search Product", attributes:attributes)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var sideMenuIcon: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "ic_menu")
        img.contentMode = .center
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.hexString(hex: "9095A6").cgColor
        view.layer.borderWidth = 1
        
        view.addSubview(searchIcon)
        view.addSubview(textField)
        
        searchIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        searchIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        searchIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        searchIcon.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        textField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 12).isActive = true
        textField.topAnchor.constraint(equalTo: searchIcon.topAnchor).isActive = true
        textField.bottomAnchor.constraint(equalTo: searchIcon.bottomAnchor).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .white
        clipsToBounds = true
        addSubview(hStack)
        
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStack.heightAnchor.constraint(equalToConstant: 40),
            
            sideMenuIcon.widthAnchor.constraint(equalToConstant: 24),
            sideMenuIcon.heightAnchor.constraint(equalToConstant: 24)
        ])
        textField.returnKeyType = .search
    }
    
    
}
