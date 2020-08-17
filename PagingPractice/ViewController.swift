//
//  ViewController.swift
//  PagingPractice
//
//  Created by Prapawit Patthasirivichot on 17/8/2563 BE.
//  Copyright © 2563 Prapawit Patthasirivichot. All rights reserved.
//

import UIKit
import Parchment
class ViewController: UIViewController {
    private var pagingViewController: PagingViewController!
    private let viewControllerList = [ViewControllersFactory.firstViewController(), ViewControllersFactory.secondViewController(), ViewControllersFactory.thirdViewController()]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI() {
        pagingViewController = PagingViewController(viewControllers: viewControllerList)
        pagingViewController.dataSource = self
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
          pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
          pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
          pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
          pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
        
    }

}

extension ViewController: PagingViewControllerDataSource {
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return viewControllerList.count
    }
    
    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        return viewControllerList[index]
    }
    
    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: "test")
    }
    
    
}

