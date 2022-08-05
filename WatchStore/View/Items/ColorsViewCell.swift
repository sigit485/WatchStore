//
//  ColorsViewCell.swift
//  WatchStore
//
//  Created by Sigit on 04/08/22.
//

import UIKit

class ColorsViewCell: UICollectionViewCell {
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var circularView: UIView = {
        let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 16, height: 16)))
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var colorLabel: UILabel = {
        let label = UILabel()
        label.text = "Test"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
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
        circularView.layer.cornerRadius = circularView.frame.height / 2
        circularView.layer.masksToBounds = true
    }
    
    func setupViews() {
        addSubview(containerView)
        containerView.addSubview(circularView)
        containerView.addSubview(colorLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            
            circularView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            circularView.heightAnchor.constraint(equalToConstant: 16),
            circularView.widthAnchor.constraint(equalToConstant: 16),
            circularView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            
            colorLabel.leadingAnchor.constraint(equalTo: circularView.trailingAnchor, constant: 8),
            colorLabel.bottomAnchor.constraint(equalTo: circularView.bottomAnchor),
            colorLabel.topAnchor.constraint(equalTo: circularView.topAnchor),
            colorLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8)
        ])
    }
    
    func configure<T>(object: T?) {
        if object is ColorProduct {
            guard let _object = object as? ColorProduct else { return }
            colorLabel.text = _object.name
            colorLabel.textColor = _object.selected ? .black : .lightGray
            circularView.backgroundColor = UIColor.hexString(hex: _object.color)
            containerView.layer.borderColor = _object.selected ? UIColor.lightGray.cgColor : UIColor.clear.cgColor
            containerView.layer.borderWidth = _object.selected ? 1 : 0
        }
    }
    
    
    
}
