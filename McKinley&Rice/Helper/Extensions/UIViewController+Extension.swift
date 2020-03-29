//
//  UIViewController+Extension.swift
//  McKinley&Rice
//
//  Created by Soumya Jain on 30/03/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentOkAlertWith(title: String?, message: String?) {

        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

    func register(table: UITableView, seperatorStyle: UITableViewCell.SeparatorStyle = .none) {
        table.dataSource = self as? UITableViewDataSource
        table.delegate = self as? UITableViewDelegate
        table.separatorStyle = seperatorStyle
        table.tableFooterView = UIView()
        table.alwaysBounceVertical = false
    }

    func register(_ collectionView: UICollectionView) {
        collectionView.dataSource = self as? UICollectionViewDataSource
        collectionView.delegate = self as? UICollectionViewDelegate
        collectionView.delegate = self as? UICollectionViewDelegateFlowLayout
    }

    class func initalizeMyViewController(identifier: Controller, storyboard: Storyboard) -> UIViewController {
        let storyBoard: UIStoryboard = UIStoryboard(name: storyboard.rawValue, bundle: nil)
        return storyBoard.instantiateViewController(withIdentifier: identifier.rawValue)
    }
}
