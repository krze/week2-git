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
    
    
    var githubRepo: GithubRepo! {
        didSet {
            nameLabel.text = githubRepo.name
            ownerLabel.text = githubRepo.ownerHandle
            avatarImage.setImageWithURL(githubRepo.ownerAvatarURL!)
            descriptionLabel.text = githubRepo.description
            starsImage.image = UIImage(named: "star")
            starsLabel.text = "\(githubRepo.stars)"
            forksImage.image = UIImage(named: "fork")
            forksLabel.text = "\(githubRepo.forks)"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Rounding the corners of the restaurant photo thumbnail imageView
        avatarImage.layer.cornerRadius = 3
        avatarImage.clipsToBounds = true
        
        // Setting the preferred max width of the restaurant name's label
        
        nameLabel.preferredMaxLayoutWidth = nameLabel.frame.size.width
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
