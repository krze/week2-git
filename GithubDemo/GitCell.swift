//
//  GitCell.swift
//  GithubDemo
//
//  Created by Ken Krzeminski on 9/2/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class GitCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starsImage: UIImageView!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksImage: UIImageView!
    @IBOutlet weak var forksLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
