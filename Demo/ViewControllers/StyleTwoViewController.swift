//
//  StyleTwoViewController.swift
//  Demo
//
//  Created by Rudi Luis on 13/04/2019.
//  Copyright © 2019 Telo Technology Limited. All rights reserved.
//

import UIKit
import RoundSelection

class StyleTwoViewController: UIViewController {
    
    // MARK: - Property
    
    @IBOutlet
    private weak var customView1: RoundSelectionView!
    
    @IBOutlet
    private weak var customView2: RoundSelectionView!
    
    @IBOutlet
    private weak var customView3: RoundSelectionView!
    
    // MARK: - Lifecyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        customView1.data = RoundSelectionView.Data(icon: UIImage(named: "CreditCard"), title: "Credit Card")
        customView1.checkMarkImage = UIImage(named: "GreenCheckMark")
        
        customView2.data = RoundSelectionView.Data(icon: UIImage(named: "CashMoney"), title: "Cash Money")
        customView2.checkMarkImage = UIImage(named: "GreenCheckMark")
        
        customView3.data = RoundSelectionView.Data(icon: UIImage(named: "Wallet"), title: "Wallet")
        customView3.checkMarkImage = UIImage(named: "GreenCheckMark")
    }
}
