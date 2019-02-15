//
//  OnboardingCollectionViewCell.swift
//  ProjectFinal
//
//  Created by aluno on 05/02/19.
//  Copyright © 2019 Anderson Carlos Nunes Sales. All rights reserved.
//

import UIKit

struct OnboardingCollectionViewCellModel {
   
    var description: String?
    var imageName: String?
    
    init(description: String, imageName: String) {
        self.description = description
        self.imageName = imageName
    }
}

class OnboardingCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
  
    var model: OnboardingCollectionViewCellModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populate(model: OnboardingCollectionViewCellModel) {
        self.model = model
       
        descriptionLabel.text = model.description
        
        if let imageName = model.imageName {
            backgroundImageView.image = UIImage(named: imageName)
        }
    }

}
