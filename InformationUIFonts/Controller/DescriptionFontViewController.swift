//
//  DescriptionFontViewController.swift
//  InformationUIFonts
//
//  Created by Vladislav on 7/24/18.
//  Copyright © 2018 VladislavKarachun. All rights reserved.
//

import UIKit
import ChameleonFramework
class DescriptionFontViewController: UIViewController {
    
    @IBOutlet weak var fontTitleTextLabel: UILabel!
    @IBOutlet weak var fontDescriptionTextLabel: UILabel!
    @IBOutlet weak var fontExampleTextLabel: UILabel!
    
    var index = 0
    let fontNames = FontNames()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let fontFullName = fontNames.fontNamesMap[index][FontKeysDictionary.fontFullName] else { return }
        fontTitleTextLabel.text = fontNames.fontNamesMap[index][FontKeysDictionary.fontFamilyName]
        fontDescriptionTextLabel.text = fontFullName
        fontExampleTextLabel.font = UIFont(name: fontFullName, size: 15)
        fontExampleTextLabel.textColor = FlatGreen()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
