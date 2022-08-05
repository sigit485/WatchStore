//
//  DetailViewController.swift
//  WatchStore
//
//  Created by Sigit on 29/07/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true
        scrollView.addSubview(contentStack)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var contentStack: UIStackView = {
        let contentStack = UIStackView()
        contentStack.axis = .vertical
        contentStack.spacing = 24
        contentStack.distribution = .fill
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.addArrangedSubview(productImageView)
        contentStack.addArrangedSubview(roundedBackgroundView)
        
        return contentStack
    }()
    
    lazy var hContainerHeaderStack: UIStackView = {
        let headerStack = UIStackView()
        headerStack.axis = .horizontal
        headerStack.spacing = 20
        headerStack.distribution = .equalSpacing
        headerStack.isLayoutMarginsRelativeArrangement = true
        headerStack.layoutMargins = UIEdgeInsets(
            top: 20, left: 20, bottom: 0, right: 20)
        headerStack.addArrangedSubview(vHeaderStack)
        headerStack.addArrangedSubview(productPriceLabel)
        return headerStack
    }()
    
    lazy var vHeaderStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.isLayoutMarginsRelativeArrangement = true
        stack.addArrangedSubview(productTitleLabel)
        stack.addArrangedSubview(productSubTitleLabel)
        return stack
    }()
    
    lazy var vContainerColorStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stack.addArrangedSubview(productColorLabel)
        stack.addArrangedSubview(collectionView)
        return stack
    }()
    
    lazy var vContainerDescriptionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        stack.addArrangedSubview(pageTabView)
        stack.addArrangedSubview(descLabel)
        return stack
    }()
    
    lazy var productImageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "series_7")
        img.contentMode = .center
        img.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return img
    }()
    
    lazy var productTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Apple Watch Series 7"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    lazy var productSubTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "( With solo loop )"
        label.textColor = UIColor.hexString(hex: "9095A6")
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        return label
    }()
    
    lazy var productPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$799"
        label.textColor = UIColor.hexString(hex: "5B41FF")
        label.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        return label
    }()
    
    lazy var productColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Colors"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    lazy var roundedBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        let vStack = UIStackView()
        vStack.axis = .vertical
        vStack.spacing = 20
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(vStack)
        
        vStack.addArrangedSubview(hContainerHeaderStack)
        vStack.addArrangedSubview(vContainerColorStack)
        vStack.addArrangedSubview(vContainerDescriptionStack)
        
        vStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        vStack.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        vStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        vStack.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        return view
    }()
    
    lazy var btnCartContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(btnCart)
        
        btnCart.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        btnCart.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        btnCart.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        btnCart.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        
        return view
    }()
    
    lazy var btnCart: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.hexString(hex: "8743FF")
        btn.setTitle("Add to cart", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.sectionInset = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flow)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var pageTabView: UIPageTabView = {
        let view = UIPageTabView()
        view.titleLabel3.isHidden = true
        view.titleLabel4.isHidden = true
        view.titleLabel.text = "Details"
        view.titleLabel2.text = "Review"
        return view
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "The aluminium case is lightweight and made from 100 percent recycled aerospace grade alloy. The aluminium case is lightweight and made from 100 percent recycled aerospace grade alloy. The aluminium case is lightweight and made from 100 percent recycled aerospace grade alloy."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        return label
    }()
    
    private var colorProduct = [ColorProduct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(false, animated: false)
        view.backgroundColor = .white
        
        let backImage = UIImage(named: "ic_back_1")
        navigationController?.navigationBar.backIndicatorImage = backImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationController?.navigationBar.backItem?.title = ""
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "ic_love"), style: .plain, target: self, action: nil)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
        
        colorProduct = [ColorProduct(id: 0, name: "Chalk Pink", color: "F0DEC5", selected: false),
                        ColorProduct(id: 1, name: "Nectarine", color: "FFC8B7", selected: false),
                        ColorProduct(id: 2, name: "Eucalyptus", color: "5F8477", selected: false)
        ]
        
        collectionView.register(ColorsViewCell.self, forCellWithReuseIdentifier: "ColorsViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let bgImage = UIView()
        bgImage.backgroundColor = UIColor.hexString(hex: "FCFCFF")
        bgImage.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bgImage)
        view.addSubview(scrollView)
        view.addSubview(btnCartContainerView)
        
        
        scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -80).isActive = true
                
        btnCartContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        btnCartContainerView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        btnCartContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        btnCartContainerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
        collectionView.heightAnchor.constraint(equalToConstant: 42).isActive = true
        
        bgImage.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor).isActive = true
        bgImage.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor).isActive = true
        bgImage.bottomAnchor.constraint(equalTo: roundedBackgroundView.topAnchor, constant: 20).isActive = true
        bgImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        
        btnCart.layer.cornerRadius = 10
        btnCart.clipsToBounds = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        roundedBackgroundView.roundCorners(corners: [.topLeft, .topRight], radius: 14)
        collectionView(collectionView, didSelectItemAt: IndexPath(item: 0, section: 0))
    }
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorsViewCell", for: indexPath) as? ColorsViewCell {
            let item = colorProduct[indexPath.row]
            cell.configure(object: item)
            return cell
        }
        fatalError("Unable to dequeue subclassed cell")
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.collectionView.frame.width / 3) - 10, height: self.collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let index = colorProduct.firstIndex(where: {$0.selected != false}) {
            colorProduct[index].selected = false
        }
        colorProduct[indexPath.row].selected = !colorProduct[indexPath.row].selected
        collectionView.reloadData()
    }
}
