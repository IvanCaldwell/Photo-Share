//
//  DetailViewController.swift
//  Photo Share
//
//  Created by Ivan Caldwell on 12/19/18.
//  Copyright © 2018 Ivan Caldwell. All rights reserved.
//

import UIKit
import Photos
import Social

class DetailViewController: UIViewController {

    // Variables and Constants
    var passedString = "blank"
    var asset: PHAsset?
    
    // Outlets and Actions
    @IBOutlet weak var imageView: UIImageView!
    
    
    // ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detailAsset = asset {
            PHImageManager.default().requestImage(for: detailAsset, targetSize: CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.5), contentMode: .aspectFit, options: nil) { (result, info) in
                if let image = result {
                    self.imageView.image = image
                }
            }
        }
    }
    
    @IBAction func sharedButtonClicked (_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
                ShareFacebookTwiter(vc: vc);
            }
        print("facebook")
        case 1:
        print("instagram")
        case 2:
        print("pintrest")
        case 3:
        print("twitter")
        case 4:
        print("whatsapp")
        default:
        print("ahhhh")
        }
    }
    
    
    func ShareFacebookTwiter (vc: SLComposeViewController) {
        vc.setInitialText("Look at this great picture!")
        vc.add(imageView.image)
        vc.add(URL(string: "https://www.amazon.com"))
        present(vc, animated: true, completion: nil)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
