//
//  ScrollView+upToEmptyViewController.swift
//  Salek
//
//  Created by Divo Ayman on 4/27/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit

extension UIScrollView{
    func upToEmpty(textField: UITextField){
        self.setContentOffset(CGPoint(x:0, y: textField.frame.origin.y.binade ), animated: true)
    }
}
