//
//  ViewController.swift
//  Photo Share
//
//  Created by Ivan Caldwell on 12/17/18.
//  Copyright © 2018 Ivan Caldwell. All rights reserved.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // Variables and Constants
    let reuseIdentifier = "photoCell"
    var dummyObjects = ["Hi", "There", "I'm", "Awesome!"]
    var assetCollection: PHAssetCollection?
    var photos: PHFetchResult<PHAsset>?
    
    
    // Outlets and Actions
    @IBOutlet weak var tableView: UITableView!
    
    // ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        let collection = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        if (collection.firstObject != nil) {
            self.assetCollection = collection.firstObject! as PHAssetCollection
            let options = PHFetchOptions()
            options.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
            options.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
            self.photos = PHAsset.fetchAssets(in: assetCollection!, options: options)
        } else {
            print("No photos were found.")
        }
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyObjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoTableViewCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PhotoTableViewCell
        if let asset = self.photos?[indexPath.row] {
            PHImageManager.default().requestImage(for: asset, targetSize: CGSize(width: 320, height: 240), contentMode: .aspectFill, options: nil) { (result, info) in
                if let image = result {
                    cell.photoImageView.image = image
                }
            }
        } else {
            cell.photoImageView.image = UIImage(named: "camera")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let id = segue.identifier {
            if (id == "detailSegue") {
                let newVC = segue.destination as! DetailViewController
                var indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
                if let asset = self.photos?[(indexPath!.row)] {
                    newVC.asset = asset
                }
            }
        }
    }
}

