//
//  UIPageTabView.swift
//  WatchStore
//
//  Created by Sigit on 29/07/22.
//

import UIKit

class UIPageTabView: UIView {
    
    lazy var vStack: UIStackView = { // this container
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.alignment = .leading
        view.addArrangedSubview(hStack)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return view
    }()
    
    lazy var hStack: UIStackView = {
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.spacing = 20
        hStack.distribution = .fillProportionally
        hStack.addArrangedSubview(titleLabel)
        hStack.addArrangedSubview(titleLabel2)
        hStack.addArrangedSubview(titleLabel3)
        hStack.addArrangedSubview(titleLabel4)
        
        return hStack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Smart watch"
        label.textColor = UIColor.hexString(hex: "5B41FF")
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var titleLabel2: UILabel = {
        let label = UILabel()
        label.text = "Casio"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var titleLabel3: UILabel = {
        let label = UILabel()
        label.text = "Tissot"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var titleLabel4: UILabel = {
        let label = UILabel()
        label.text = "Seiko"
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.hexString(hex: "5B41FF")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        separatorView.layer.cornerRadius = 2
        separatorView.clipsToBounds = true
    }
    
    func setupViews() {
        addSubview(vStack)
        addSubview(separatorView)
        
        vStack.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        vStack.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        vStack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        separatorView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        separatorView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        titleLabel4.isUserInteractionEnabled = true
        titleLabel4.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
        
        titleLabel.isUserInteractionEnabled = true
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
        
        titleLabel2.isUserInteractionEnabled = true
        titleLabel2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
        
        titleLabel3.isUserInteractionEnabled = true
        titleLabel3.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapped)))
    }
    
    
    @objc func tapped(_ sender: UITapGestureRecognizer) {
        let labels = [titleLabel, titleLabel2, titleLabel3, titleLabel4]
        labels.forEach({$0.textColor = .lightGray})
        
        UIView.animate(withDuration: 0.2, delay: .zero, options: .curveEaseInOut) {
            self.separatorView.transform = CGAffineTransform(translationX: sender.view?.frame.minX ?? 0, y: .zero)
        } completion: { completed in
            let label = sender.view as? UILabel
            label?.textColor = UIColor.hexString(hex: "5B41FF")
            self.layoutIfNeeded()
        }
    }
}
