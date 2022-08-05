//
//  WatchViewCell.swift
//  WatchStore
//
//  Created by Sigit on 29/07/22.
//

import UIKit

class WatchViewCell: UICollectionViewCell {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 14
        
        view.layer.shadowColor = UIColor.hexString(hex: "171439").cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 14
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "$700"
        label.textColor = UIColor.hexString(hex: "5B41FF")
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    lazy var vStackTitle: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descLabel)
        return stack
    }()
    
    lazy var vStackContent: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.addArrangedSubview(vStackTitle)
        stack.addArrangedSubview(priceLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    func setupViews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(vStackContent)
        
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        imageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        vStackContent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        vStackContent.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8).isActive = true
        vStackContent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8).isActive = true
        vStackContent.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
        
    }
    
    func configure<T>(object: T?) {
        if object is Watch {
            guard let _object = object as? Watch else { return }
            titleLabel.text = _object.name
            descLabel.text = _object.series
            priceLabel.text = _object.price
            imageView.image = UIImage(named: _object.image)
        }
    }
    
}
