//
//  ViewController.swift
//  RunningBall
//
//  Created by HoangHai on 6/18/16.
//  Copyright © 2016 Tien Son. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var radian = CGFloat()  //goc quay
    var radius = CGFloat()  //ban kinh
    var flag = true
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        let time = NSTimer.scheduledTimerWithTimeInterval(0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
    }
    
    func addBall() {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        radius = 32
        ball.center = CGPointMake(radius, mainViewSize.height * 0.5)
        self.view.addSubview(ball)
    }

    func rollBall() {
        let deltaAngle: CGFloat = 0.1
        let centerPoint = self.view.bounds.size.width - radius
        radian = radian + deltaAngle
        if flag == true {
        ball.transform = CGAffineTransformMakeRotation(radian)
        ball.center = CGPointMake(ball.center.x + deltaAngle*radius, ball.center.y)
        }
        
        if (ball.center.x >= centerPoint) {
            flag = false
        }
    
        if flag == false {
            ball.transform = CGAffineTransformMakeRotation(-radian)
            ball.center = CGPointMake(ball.center.x - deltaAngle*radius, ball.center.y)
        }

        if (ball.center.x <= 32) {
            flag = true
        }
    
    }
}