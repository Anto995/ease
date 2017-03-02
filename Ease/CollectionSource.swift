//
//  CollectionSource.swift
//  Ease
//
//  Created by Antonio Scialdone on 01/03/2017.
//  Copyright © 2017 Antonio Scialdone. All rights reserved.
//

import Foundation

import UIKit

class CollectionSource: NSObject, UICollectionViewDataSource {
    
    var rooms: [Room] = PersistenceManager.fetchData()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "reuse"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! RoomCollectionViewCell
        let roomIm = rooms[indexPath.row].image as! Data
        let image: UIImage = UIImage(data: roomIm)!
        cell.imageView.image = image
        
        return cell
    }
    
}
