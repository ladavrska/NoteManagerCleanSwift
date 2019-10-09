//
//  AppDisplayable.swift
//  NoteManagerCleanSwift
//
//  Created by Lada Vrska on 08/10/2019.
//  Copyright © 2019 Lada Vrska. All rights reserved.
//

import UIKit

protocol AppDisplayable {
    var activityIndicator: UIActivityIndicatorView { get }
    func display(error: AppModels.Error)
    func displayNavigationBar(title: String)
    func showActivityIndicator()
    func hideActivityIndicator()
}

extension AppDisplayable where Self: UIViewController {
    
    func display(error: AppModels.Error) {
        let alertController = UIAlertController(
            title: error.title,
            message: error.message,
            preferredStyle: .alert
        )
        
        alertController.addAction(
            UIAlertAction(title: "OK", style: .default, handler: nil)
        )
        
        guard let rootController = UIApplication.shared.keyWindow?.rootViewController else { return }
        rootController.present(alertController, animated: true, completion: nil)
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.style = .gray
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.snp.makeConstraints { maker in
                maker.edges.equalToSuperview()
            }
            self.activityIndicator.layer.zPosition = 100
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
}

// MARK: - NavigationBar

extension AppDisplayable where Self: NotesListViewController {
    
    func displayNavigationBar(title: String) {
        guard let navController = self.navigationController else {
            return
        }
        
        let navBar = navController.navigationBar
        navBar.tintColor = .black
        navBar.barTintColor = .yellowGreenDark()
        navBar.isTranslucent = true
        
        prepareNavigationBarContent(title: title)
    }
    
    func prepareNavigationBarContent(title: String) {
        navigationItem.title = title
        navigationItem.rightBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(self.didTapCreateNote), imageName: "icon-plus")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        if let navigationBarHeight = self.navigationController?.navigationBar.frame.height {
            self.topOffset = navigationBarHeight
        }
    }
}
