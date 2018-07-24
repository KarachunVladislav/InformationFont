//
//  fontNames.swift
//  InformationUIFonts
//
//  Created by Vladislav on 7/24/18.
//  Copyright © 2018 VladislavKarachun. All rights reserved.
//

import UIKit

class FontNames {
    lazy var fontNamesMap = mapFontNames()
    
    func mapFontNames() -> [[String]]{
        let fontNamesMap = UIFont.familyNames.sorted().map { (familyName) in
            UIFont.fontNames(forFamilyName: familyName).map({ (fontName) in
                return [familyName, fontName]
            })
        }
        let joined = Array(fontNamesMap.joined())
        return joined
    }
}
