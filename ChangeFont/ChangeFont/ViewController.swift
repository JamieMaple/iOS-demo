//
//  ViewController.swift
//  ChangeFont
//
//  Created by Jamie on 2018/6/11.
//  Copyright © 2018 Jamie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textArea.font = UIFont(name: fontNames[0], size: fontSize)
        changeButton.layer.cornerRadius = CGFloat(50)
    }
    
    let fontNames = [
        "Gaspar_Regular",
        "MFTongXin_Noncommercial-Regular",
        "MFZhiHei_Noncommercial-Regular",
        "MFJinHei_Noncommercial-Regular",
    ]
    
    let fontSize = CGFloat(14)

    @IBOutlet weak var textArea: UITextView!
    @IBOutlet weak var changeButton: UIButton!
    
    @IBAction func changeFont(_ sender: UIButton) {
        textArea.font = getFont()
    }
    
    func getFont() -> UIFont? {
        var fontName = ""
        repeat {
            let randomFontIndex = Int(arc4random_uniform(UInt32(fontNames.count)))
            fontName = fontNames[randomFontIndex]
        } while fontName == textArea.font?.fontName
        

        
        return UIFont(name: fontName, size: fontSize)
    }
    
}

