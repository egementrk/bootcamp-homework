//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Egemen on 6.01.2022.
//

import UIKit



final class ViewController: UICollectionViewController{
    
    private var labels = ["colosseum", "greatwall", "kremlin", "tajmahal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Landmark", for: indexPath) as? LandmarkCell else {
            fatalError("Unable")
        }
        cell.name.text = labels[indexPath.row]
        //cell.imageView.image = UIImage(named: "kremlin")
        //let myCellImage = UIImage(named: images[indexPath.row])
        cell.imageView.image = UIImage(named: labels[indexPath.row])
        
        return cell
    }
}

