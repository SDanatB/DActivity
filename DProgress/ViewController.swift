//
//  ViewController.swift
//  DProgress
//
//  Created by Danat Sartay on 7/19/17.
//  Copyright © 2017 Danat Sartay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    var progressIcon:UIActivityIndicatorView!
//    var viewActivitySmall : SHActivityView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let btnWidth:CGFloat = 50
        let btnHeigth:CGFloat = 50
        
        self.view.backgroundColor = UIColor.cyan
        let btn:UIButton = UIButton(frame: CGRect(x: (self.view.bounds.width - btnWidth)/2, y: (self.view.bounds.height - btnHeigth)/2, width: btnWidth, height: btnHeigth))
        btn.backgroundColor = .green
        btn.setTitle("Play", for: .normal)
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        self.view.addSubview(btn)
        
        
//        progressIcon = UIActivityIndicatorView()
//        progressIcon.translatesAutoresizingMaskIntoConstraints = false
//        progressIcon.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
//        self.view.addSubview(progressIcon)
//        
//        
//        viewActivitySmall = SHActivityView()
//        viewActivitySmall?.spinnerSize = .kSHSpinnerSizeSmall
//        viewActivitySmall?.spinnerColor = UIColor.blue
//        self.view.addSubview(viewActivitySmall!)
        
        let width: CGFloat = 160.0
        let height: CGFloat = 160.0
        
//        let demoView = DActivityIndicatorView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
//                                              y: self.view.frame.size.height/2 - height/2,
//                                              width: width,
//                                              height: height + 30))
        
//        demoView.animate()
        
//        self.view.addSubview(DActivityView.animate())
        
        DActivityView.animate(title:"wait....")
        _ = Timer.scheduledTimer(timeInterval:3, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true);
        
        
//        UIApplication.shared.keyWindow?.addSubview(DActivityView.animate())
        
//        var constraints = [NSLayoutConstraint]()
//        constraints.append(NSLayoutConstraint(
//            item: progressIcon,
//            attribute: .centerX,
//            relatedBy: .equal,
//            toItem: view,
//            attribute: .centerX,
//            multiplier: 1,
//            constant: 0)
//        )
//        constraints.append(NSLayoutConstraint(
//            item: progressIcon,
//            attribute: .centerY,
//            relatedBy: .equal,
//            toItem: view,
//            attribute: .centerY,
//            multiplier: 1,
//            constant: 0)
//        )
//        constraints.append(NSLayoutConstraint(
//            item: viewActivitySmall,
//            attribute: .centerX,
//            relatedBy: .equal,
//            toItem: view,
//            attribute: .centerX,
//            multiplier: 1,
//            constant: 0)
//        )
//        constraints.append(NSLayoutConstraint(
//            item: viewActivitySmall,
//            attribute: .centerY,
//            relatedBy: .equal,
//            toItem: view,
//            attribute: .centerY,
//            multiplier: 1,
//            constant: 0)
//        )
//        view.addConstraints(constraints)
        
        
        
        
       
//        viewActivitySmall?.center =  CGPoint(x:(self.view.frame.size.width)/2, y:(self.view.frame.size.height)/2)
        
        
    }
    func runTimedCode() {
        DActivityView.stop()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func btnAction(sender: UIButton!){
        print("Button tapped")
//        progressIcon.startAnimating()
//        viewActivitySmall?.showAndStartAnimate()

        sender.isHidden = true
        sender.backgroundColor = UIColor.green.withAlphaComponent(0.4)

        UIView.animate(withDuration: 1.0,
                       delay: 0,
                       usingSpringWithDamping: CGFloat(0.20),
                       initialSpringVelocity: CGFloat(6.0),
                       options: UIViewAnimationOptions.allowUserInteraction,
                       animations: {
                        sender.backgroundColor = UIColor.green
        },
                       completion: { Void in()  }
        )
        
//        sender.backgroundColor = UIColor.green
    }
    
}

