//
//  PhotoTableViewCell.swift
//  Photo Share
//
//  Created by Ivan Caldwell on 12/19/18.
//  Copyright © 2018 Ivan Caldwell. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    // Variables and Constants
    
    // Outlets and Actions
    @IBOutlet weak var photoImageView: UIImageView!
    
    // View Controller Function
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
