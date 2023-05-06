//
//  ChooseAccountView.swift
//  Salek
//
//  Created by Divo Ayman on 4/13/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit

class ChooseAccountView: UIView {
    
    //MARK:- outlets
    @IBOutlet weak var titileLabel: UILabel!
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var chooseLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var personalLabel: UILabel!
    @IBOutlet weak var storeImg: UIImageView!
    @IBOutlet weak var sotreCheckBtn: UIButton!
    @IBOutlet weak var personalImg: UIImageView!
    @IBOutlet weak var pesonalCheckBtn: UIButton!
    @IBOutlet weak var workLabel: UILabel!
    @IBOutlet weak var workImg: UIImageView!
    @IBOutlet weak var workCheckBtn: UIButton!
    
    //MARK:- outlets Views
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var secoundView: UIView!
    @IBOutlet weak var sotreView: UIView!
    @IBOutlet weak var personalView: UIView!
    @IBOutlet weak var storeImgView: UIView!
    @IBOutlet weak var personalImgView: UIView!
    @IBOutlet weak var workView: UIView!
    @IBOutlet weak var workImgView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var topColorView: UIView!
    
    
    // MARK:- Public Methods
    func setup(){
        setupTitleLabel()
        updateUI()
        setupLabel(label: storeLabel, text: L10n.storeLabel)
        setupLabel(label: personalLabel, text: L10n.personalLabel)
        setupLabel(label: workLabel, text: L10n.workLabel)
        setupImg(imgView: storeImg, img: Asset.component151.image)
        setupImg(imgView: personalImg, img: Asset.component161.image)
        setupImg(imgView: workImg, img: Asset.component171.image)
        setupNextBtn()
        setupChooseLabel()
        
    }
    
    // MARK:- Private Methods
    private func setupTitleLabel(){
        titileLabel.font = FontFamily.Library3Am.regular.font(size: 53)
        titileLabel.textColor = .white
        titileLabel.textAlignment = .center
    }
    
    
    private func setupLabel(label: UILabel,text: String){
        label.text = text
        label.textColor = UIColor(named: ColorName.blue)
        label.font = FontFamily.Nunito.semiBold.font(size: 16)
        label.textAlignment = .center
        
    }
    
    private func setupImg(imgView: UIImageView, img: UIImage){
        imgView.image = img
        
    }
    
    private func setupNextBtn(){
        nextBtn.setTitle(L10n.nextBtn, for: .normal)
        nextBtn.backgroundColor = UIColor(named: ColorName.green)
        nextBtn.titleLabel?.font = FontFamily.Nunito.bold.font(size: 20)
        nextBtn.layer.cornerRadius = 20
    }
    private func setupChooseLabel(){
        chooseLabel.text = L10n.chooseLabel
        chooseLabel.font = FontFamily.Nunito.semiBold.font(size: 18)
        chooseLabel.textColor =  UIColor(named: ColorName.blue)
    }
    
    private func updateUI(){
        scrollView.backgroundColor = .clear
        subView.backgroundColor = UIColor(named: ColorName.bluepurp)
        topColorView.backgroundColor = UIColor(named: ColorName.bluepurp)
        secoundView.backgroundColor = .white
        secoundView.layer.cornerRadius = 50
        secoundView.layer.masksToBounds = true
        secoundView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        secoundView.layer.masksToBounds = true
        sotreView.layer.cornerRadius = 10
        sotreView.layer.borderWidth = 0.2
        sotreView.backgroundColor = .white
        sotreView.layer.borderColor =  UIColor(named: ColorName.lightnavy).cgColor
        personalView.layer.cornerRadius = 10
        personalView.layer.borderWidth = 0.2
        personalView.backgroundColor = .white
        personalView.layer.borderColor =  UIColor(named: ColorName.lightnavy).cgColor
        workView.layer.cornerRadius = 10
        workView.layer.borderWidth = 0.2
        workView.backgroundColor = .white
        workView.layer.borderColor =  UIColor(named: ColorName.lightnavy).cgColor
        storeImgView.layer.cornerRadius = 10
        storeImgView.layer.borderWidth = 2
        storeImgView.backgroundColor = .white
        storeImgView.layer.borderColor =  UIColor(named: ColorName.lightBlue).cgColor
        personalImgView.layer.cornerRadius = 10
        personalImgView.layer.borderWidth = 2
        personalImgView.backgroundColor = .white
        personalImgView.layer.borderColor =  UIColor(named: ColorName.lightBlue).cgColor
        workImgView.layer.cornerRadius = 10
        workImgView.layer.borderWidth = 2
        workImgView.backgroundColor = .white
        workImgView.layer.borderColor =  UIColor(named: ColorName.lightBlue).cgColor
        
    }
 
    
}
