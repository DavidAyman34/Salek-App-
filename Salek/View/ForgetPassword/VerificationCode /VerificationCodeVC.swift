//
//  VerificationCodeVC.swift
//  Salek
//
//  Created by Divo Ayman on 4/21/21.
//  Copyright © 2021 Divo Ayman. All rights reserved.
//

import UIKit

// MARK:- Protocol Methods

class VerificationCodeVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet var VerificationView: VerificationCodeView_!
    
    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        runTime()
        super.viewDidLoad()
        VerificationView.setup()
        
    }
    
    
    // MARK:- Private Methods
    private func runTime(){
        VerificationView.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.update)), userInfo: nil, repeats: true)
        VerificationView.isTimerRunning = true
    }
    
    private func stopTime(){
          VerificationView.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(self.update)), userInfo: nil, repeats: true)
          VerificationView.isTimerRunning = false
      }
      
    
    private func timeString(time:TimeInterval) -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    // MARK:- Button Methods
    @IBAction func verifytapped(_ sender: UIButton) {
        stopTime()
        let resetVC = ResetPasswordVC.create()
        resetVC.modalPresentationStyle = .fullScreen
        resetVC.modalTransitionStyle = .crossDissolve
        let navVC = UINavigationController(rootViewController:resetVC)
        navVC.modalPresentationStyle = .fullScreen
        navVC.modalTransitionStyle = .crossDissolve
        navVC.isNavigationBarHidden = true
        
        self.present(navVC, animated: true, completion:nil)
    }
    
    @objc func update(){
        if  VerificationView.min < 1 {
            VerificationView.timer.invalidate()
            VerificationView.isTimerRunning = true
            VerificationView.setupResendBtn()
            print("endtime")
        } else {
            
            VerificationView.min -= 1
            VerificationView.otpTimer.text  = timeString(time: TimeInterval(VerificationView.min))
        }
    }
    
    
    // MARK:- Public Methods
    class func create() -> VerificationCodeVC {
        let verificationCodeVC: VerificationCodeVC = UIViewController.create(storyboardName: Storyboards.forgetPassword, identifier: ViewControllers.verificationCodeVC)
        
        return verificationCodeVC
    }
    
}
// MARK: - Implement Protocols
