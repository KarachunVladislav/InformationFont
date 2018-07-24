//
//  ViewController.swift
//  InformationUIFonts
//
//  Created by Vladislav on 7/23/18.
//  Copyright © 2018 VladislavKarachun. All rights reserved.
//

import UIKit
import ChameleonFramework

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    fileprivate let itemsPerRow: CGFloat = 2
    fileprivate let itemsPerLine: CGFloat = 4
    fileprivate let sectionInsets = UIEdgeInsets(top: 15.0, left: 20.0, bottom: 20.0, right: 15.0)
    let fontNames = FontNames()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fontNames.fontNamesMap.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! UICollectionViewCustomCell
        if indexPath.row % 6 == 0 || indexPath.row % 6 == 1 {
            if let color = FlatSkyBlue().darken(byPercentage: CGFloat(indexPath.row/6)/CGFloat(fontNames.fontNamesMap.count)){
                cell.backgroundColor = color
                cell.fontTitleLabel.textColor = ContrastColorOf(color, returnFlat: true)
                cell.fontDescriptionLabel.textColor = ContrastColorOf(color, returnFlat: true)
            }
        } else if indexPath.row % 6 == 2 || indexPath.row % 6 == 3 {
            if let color = FlatPurple().darken(byPercentage: CGFloat(indexPath.row/6)/CGFloat(fontNames.fontNamesMap.count)){
                cell.backgroundColor = color
                cell.fontTitleLabel.textColor = ContrastColorOf(color, returnFlat: true)
                cell.fontDescriptionLabel.textColor = ContrastColorOf(color, returnFlat: true)
            }
        } else {
            if let color = FlatPlum().darken(byPercentage: CGFloat(indexPath.row/6)/CGFloat(fontNames.fontNamesMap.count)){
                cell.backgroundColor = color
                cell.fontTitleLabel.textColor = ContrastColorOf(color, returnFlat: true)
                cell.fontDescriptionLabel.textColor = ContrastColorOf(color, returnFlat: true)
            }
        }
        
        cell.fontTitleLabel.font = UIFont(name: fontNames.fontNamesMap[indexPath.row][1], size: 20)
        cell.fontDescriptionLabel.font = UIFont(name: fontNames.fontNamesMap[indexPath.row][1], size: 15)
        
        cell.fontTitleLabel.text = fontNames.fontNamesMap[indexPath.row][0]
        cell.fontDescriptionLabel.text = fontNames.fontNamesMap[indexPath.row][1]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let destination = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DescriptionFontVC") as! DescriptionFontViewController
        self.navigationController?.pushViewController(destination, animated: true)
        //collectionView.deselectItem(at: indexPath, animated: true)
        destination.index = indexPath.row
        
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpaceLine = sectionInsets.left * (itemsPerRow + 1)
        let paddingSpaceRow = sectionInsets.bottom * (itemsPerLine + 1)
        let availableWidth = view.frame.width - paddingSpaceLine
        let availableHidth = view.frame.height - paddingSpaceRow
        let hightPerItem = availableHidth / itemsPerLine
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: hightPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}
