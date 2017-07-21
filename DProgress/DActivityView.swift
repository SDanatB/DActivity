//
//  DActivityView.swift
//  DProgress
//
//  Created by Danat Sartay on 7/19/17.
//  Copyright © 2017 Danat Sartay. All rights reserved.
//

import UIKit

class DActivityView: UIView {

    private static var circlePath: UIBezierPath!
    private static var circleLineWidth:CGFloat! = 2.0
    private static var radius:CGFloat! = 30.0
    private static var direction:Bool! = true
    private static var strokeColor:UIColor! = UIColor.green
    private static var activityView:UIView = UIView()
    private static var view:UIView!
    private static var textLabel:UILabel = UILabel()
    private static var subViewWidth:CGFloat = 3 * radius
    private static var subViewMargin:CGFloat = 15
    private static var vWindow:UIWindow!

    static public func animate(title:String) {
        view = setFrame()
        view.addSubview(addActivityView(title:title))
        setupConstraints()
        vWindow = UIApplication.shared.keyWindow

        vWindow.addSubview(view)
    }
    
    static public func stop() {
//        vWindow = UIApplication.shared.keyWindow
        view.removeFromSuperview()
    }
    
    private static func addActivityView(title:String)->UIView {
        activityView.backgroundColor = UIColor.black
        activityView.layer.cornerRadius = 10
        activityView.layer.addSublayer(activityShapeLayer(view: activityView, direction: true, circleLineWidth: 2.0, strokeColor: UIColor.white))
        activityView.addSubview(addString(title: title))

        return activityView
    }
    
    private static func setupConstraints() {
        
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(
            equalTo: view.centerYAnchor).isActive = true
//        activityView.widthAnchor.constraint(equalToConstant: 4 * radius).isActive = true

        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.widthAnchor.constraint(equalToConstant:subViewWidth).isActive = true
        
        textLabel.topAnchor.constraint(equalTo: activityView.layoutMarginsGuide.topAnchor, constant: 2 * radius +  2 * circleLineWidth + activityView.layoutMargins.top + subViewMargin).isActive = true
        textLabel.leftAnchor.constraint(equalTo: activityView.layoutMarginsGuide.leftAnchor).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: activityView.layoutMarginsGuide.bottomAnchor).isActive = true
        textLabel.rightAnchor.constraint(equalTo: activityView.layoutMarginsGuide.rightAnchor).isActive = true
        
    }
    
    private static func addString(title:String)->UILabel{
        
        textLabel.text = title
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        textLabel.textAlignment = NSTextAlignment.center
        textLabel.textColor = UIColor.white
        textLabel.sizeToFit()
        
        return textLabel
    }
    
    private static func setFrame() -> UIView{
        
        let view = self.init()
        view.frame = CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width , height:UIScreen.main.bounds.height)
        view.backgroundColor = UIColor.clear
        view.addBlurEffect()
        UIApplication.shared.keyWindow?.addSubview(view);
        return view
    }
    private static func activityShapeLayer(view:UIView, direction: Bool, circleLineWidth:CGFloat, strokeColor:UIColor) -> CAShapeLayer{
        
        createArcshapeCircle(view:view, direction: direction)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        //        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor.cgColor
        shapeLayer.lineWidth = circleLineWidth
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 2.0
        animation.fromValue = 0
        animation.toValue = 1.1
        animation.repeatCount = .infinity
        
        shapeLayer.add(animation, forKey: "strokeAnimation")
        return shapeLayer
    }
    
    
    
    private static func createArcshapeCircle(view:UIView, direction:Bool){
        circlePath = UIBezierPath(arcCenter: CGPoint(x: (subViewWidth + activityView.layoutMargins.left + activityView.layoutMargins.right)/2, y: radius + circleLineWidth + activityView.layoutMargins.top + subViewMargin),
                                  radius: self.radius,
                                  startAngle: CGFloat(0.0).toRadians(),
                                  endAngle: CGFloat(359.9999).toRadians(),
                                  clockwise: direction)
    }
    
}

extension UIView
{
    func addBlurEffect()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
    }
}
extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat.pi / 180.0
    }
}

