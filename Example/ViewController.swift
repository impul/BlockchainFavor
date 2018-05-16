//
//  ViewController.swift
//  Example
//
//  Created by Pavlo Boiko on 14.05.18.
//  Copyright © 2018 Pavlo Boiko. All rights reserved.
//

import UIKit

fileprivate struct Constants {
    static let imageUrl = URL(string: "http://loremflickr.com/\(Int(UIScreen.main.bounds.width))/\(Int(UIScreen.main.bounds.width))")!
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var urls:[URL?] = Array(repeating: nil, count: Int(Int16.max))

    //MARK: - IBOutlet
    
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: - Action
    
    @IBAction func changeCalculatingStatus(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let blockchainFavlor = (UIApplication.shared.delegate as? AppDelegate)?.blockchainFavor
        if sender.isSelected {
            try? blockchainFavlor?.start()
        } else {
            blockchainFavlor?.stop()
        }
    }
    
    //MARK: - UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageCell.self), for: indexPath) as! ImageCell
        calculateUrl(forIndexPath: indexPath) { (image) in
            OperationQueue.main.addOperation {
                cell.imageView.image = image
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height:  view.frame.height)
    }
    
    func calculateUrl(forIndexPath:IndexPath, complition:@escaping (UIImage)->()) {
        guard let url = urls[forIndexPath.item] else {
            let task = URLSession.shared.dataTask(with: Constants.imageUrl) {(data, response, error) in
                guard let data = data,
                    let image = UIImage(data: data),
                    let fileUrl = response?.url else { return }
                complition(image)
                self.urls[forIndexPath.item] = fileUrl
            }
            task.resume()
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data,
                let image = UIImage(data: data) else { return }
            complition(image)
        }
        task.resume()
        return
    }
}

