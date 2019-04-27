//
//  StyleOneViewController.swift
//  Demo
//
//  Created by Rudi Luis on 13/04/2019.
//  Copyright © 2019 Telo Technology Limited. All rights reserved.
//

import UIKit
import RoundSelection

class StyleOneViewController: UIViewController {
    
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
        //CustomView 1
        customView1.data = RoundSelectionView.Data(icon: UIImage(named: "CreditCard"), title: "Credit Card")
        customView1.colorBackgroundOnSelected = .black
        customView1.colorTitleOnSelected = .white
        customView1.didSelected = { [weak self] isSelected in
            if let title = self?.customView1.titleData {
                print("Selected: \(isSelected) ", title)
            }
        }
        
        //CustomView 2
        customView2.data = RoundSelectionView.Data(icon: UIImage(named: "CashMoney"), title: "Cash Money")
        customView2.colorBackgroundOnSelected = .black
        customView2.colorTitleOnSelected = .white
        customView2.didSelected = { [weak self] isSelected in
            if let title = self?.customView2.titleData {
                print("Selected: \(isSelected) ", title)
            }
        }
        
        //CustomView 3
        customView3.data = RoundSelectionView.Data(icon: UIImage(named: "Wallet"), title: "Wallet")
        customView3.colorBackgroundOnSelected = .black
        customView3.colorTitleOnSelected = .white
        customView3.didSelected = { [weak self] isSelected in
            if let title = self?.customView3.titleData {
                print("Selected: \(isSelected) ", title)
            }
        }
    }
}
