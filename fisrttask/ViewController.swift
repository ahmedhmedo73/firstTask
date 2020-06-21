//
//  ViewController.swift
//  fisrttask
//
//  Created by ahmed kamel on 10/27/1441 AH.
//  Copyright © 1441 AH ahmed kamel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var backGround: UIView!
    @IBOutlet weak var clickMeButton: UIButton!
    @IBOutlet weak var selected: UILabel!
    @IBOutlet var mainView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clickMeButton.layer.cornerRadius = 15
        
        clickMeButton.layer.shadowColor = UIColor.lightGray.cgColor
        clickMeButton.layer.shadowOffset = .init(width:0, height:0)
        clickMeButton.layer.shadowRadius = 10
        clickMeButton.layer.shadowOpacity = 1
        
        clickMeButton.layer.borderColor  = UIColor.black.cgColor
        clickMeButton.layer.borderWidth = 1
        
        
    }
    enum selection {
        case selected
        case notSelected
        mutating func toggle() {
            switch self {
                case .selected:
                    self = .notSelected
                case .notSelected:
                    self = .selected
            }
        }
    }
    var select: selection = selection.notSelected{
        didSet{
            figureButtonUi()
        }
    }
    @IBAction func clickMeButtonDidClick(_ sender: UIButton) {
    
        select.toggle()
        
    }
    func figureButtonUi (){
        switch select {
        case .selected:
         setSelectedUiButton()
        case .notSelected:
         setNotSelectedUiButton()
        }
    }
    func setSelectedUiButton (){
        clickMeButton.layer.backgroundColor = UIColor.orange.cgColor
        clickMeButton.setTitleColor(UIColor.white, for: .normal)
        clickMeButton.setImage(UIImage(named: "baseline_lock_open_black_36pt") , for: .normal)
        selected.text = "Selected"
    }
    func setNotSelectedUiButton(){
        clickMeButton.layer.backgroundColor = UIColor.white.cgColor
        clickMeButton.setTitleColor(UIColor.lightGray, for: .normal)
        clickMeButton.setImage(UIImage(named: "baseline_lock_black_36pt") , for: .normal)
        selected.text = "Not Selected"
    }
    
}
