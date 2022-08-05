//
//  ViewController.swift
//  WatchStore
//
//  Created by Sigit on 28/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var headerStack: UIStackView = {
        let headerStack = UIStackView()
        headerStack.axis = .vertical
        headerStack.spacing = 24
        headerStack.distribution = .equalSpacing
        headerStack.addArrangedSubview(searchBar)
        headerStack.addArrangedSubview(headLabel)
        headerStack.isLayoutMarginsRelativeArrangement = true
        headerStack.layoutMargins = UIEdgeInsets(
            top: 0, left: 20, bottom: 0, right: 20)
        return headerStack
    }()
    
    lazy var searchBar: UICustomSearchBar = {
        let searchBar = UICustomSearchBar()
        searchBar.textField.isEnabled = false
        return searchBar
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = false
        scrollView.addSubview(shadowView)
        scrollView.addSubview(contentStack)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var shadowView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentStack: UIStackView = {
        let contentStack = UIStackView()
        contentStack.axis = .vertical
        contentStack.spacing = 24
        contentStack.distribution = .fill
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        contentStack.addArrangedSubview(headerStack)
        contentStack.addArrangedSubview(pageTabView)
        contentStack.addArrangedSubview(collectionView)
        
        return contentStack
    }()
    
    lazy var headLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        view.text = "Find your suitable watch now."
        view.numberOfLines = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var pageTabView: UIPageTabView = {
        let view = UIPageTabView()
        view.vStack.layoutMargins = UIEdgeInsets(top: .zero, left: 20, bottom: .zero, right: 20)
        return view
    }()
    
    let collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .vertical
        flow.minimumLineSpacing = 20
        flow.minimumInteritemSpacing = 20
        flow.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 32, height: 220)
        flow.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: flow)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var watchModel: [Watch]!
    var previousOffset: CGPoint?
    var viewHeight: CGFloat = 0
    let scrollTopEdgeInsets:CGFloat = 10//scrollView Top insets size

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexString(hex: "FCFCFF")
        view.addSubview(scrollView)
        
        watchModel = [
            Watch(name: "Apple Watch", series: "Series 7", price: "$799", image: "apple_watch"),
            Watch(name: "Galaxy Watch", series: "Series 4", price: "$599", image: "galaxy_watch"),
            Watch(name: "Mi Watch", series: "All Series", price: "$299", image: "mi_watch"),
            Watch(name: "Amazfit Bip U", series: "Pro Series", price: "$199", image: "amazfit_watch"),
            Watch(name: "Apple Watch", series: "Series 7", price: "$799", image: "apple_watch"),
            Watch(name: "Galaxy Watch", series: "Series 4", price: "$599", image: "galaxy_watch"),
            Watch(name: "Mi Watch", series: "All Series", price: "$299", image: "mi_watch"),
            Watch(name: "Amazfit Bip U", series: "Pro Series", price: "$199", image: "amazfit_watch")

        ]
        
        collectionView.register(WatchViewCell.self, forCellWithReuseIdentifier: "WatchViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        
        scrollView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        contentStack.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        contentStack.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentStack.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentStack.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: pageTabView.bottomAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        previousOffset = scrollView.contentOffset
        viewHeight = headerStack.frame.height
    }


}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return watchModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WatchViewCell", for: indexPath) as? WatchViewCell {
            let item = watchModel[indexPath.row]
            cell.configure(object: item)
            return cell
        }
        fatalError("Unable to dequeue subclassed cell")
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
