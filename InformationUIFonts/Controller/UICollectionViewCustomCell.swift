//
//  UICollectionViewCustomCell.swift
//  InformationUIFonts
//
//  Created by Vladislav on 7/23/18.
//  Copyright © 2018 VladislavKarachun. All rights reserved.
//

import UIKit

class UICollectionViewCustomCell: UICollectionViewCell {

    @IBOutlet weak var fontTitleLabel: UILabel!
    @IBOutlet weak var fontDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       // self.addGradientBackground(firstColor: .green, secondColor: .blue)
    }

}
extension UIView {
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        print(gradientLayer.frame)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
