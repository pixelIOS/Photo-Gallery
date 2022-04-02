//
//  Item_Cell.swift
//  Photo_Gallery
//
//  Created by Ahmad Mustafa on 02/04/2022.
//

import UIKit

class Item_Cell: UICollectionViewCell {
    //MARK: - Properties
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var LikeButton: UIButton!
    //MARK: - LifeCycle
    override func awakeFromNib() {
        super.awakeFromNib()
        LikeButton.setTitle("", for: .normal)
    }
    
    func configureData(img: String, titleText: String, descriptionText: String){
        titleLabel.text = titleText
        descriptionLabel.text = descriptionText
        
        guard let imgURL = URL(string: img) else {return}
        photoImageView.downloadImage(from: imgURL)
    }

}
