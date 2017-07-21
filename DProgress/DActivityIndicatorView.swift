//
//  DActivityIndicatorView.swift
//  DProgress
//
//  Created by Danat Sartay on 7/20/17.
//  Copyright © 2017 Danat Sartay. All rights reserved.
//

import UIKit

class DActivityIndicatorView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    private var circlePath: UIBezierPath!
    var circleLineWidth:CGFloat! = 2.0
    var direction:Bool! = true
    var strokeColor:UIColor! = UIColor.green
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
//    public func animate() {
//        self.backgroundColor = UIColor.gray
//        self.activityShapeLayer(direction: direction, circleLineWidth: circleLineWidth, strokeColor: strokeColor)
//        print(self.layer.frame.size)
//
//    }
    
    public func animate() {
        print(circleLineWidth)
//        activityShapeLayer(DActivityIndicatorView)
    }
    
    func addTitle(title:String) {
        let textLayer = CATextLayer()
        textLayer.string = title
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.font = UIFont(name: "Avenir", size: 15.0)
        textLayer.fontSize = 15.0
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.backgroundColor = UIColor.orange.cgColor
        textLayer.frame = CGRect(x: 0.0, y: self.frame.size.height - 20.0, width: self.frame.size.width, height: 40.0)
        textLayer.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(textLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    private func createLayers() {
        let backgroundLayer = CGRect(x: 0, y: 0, width: (window?.bounds.width)!,height: (window?.bounds.height)!)
    }
    
    private func activityShapeLayer(direction: Bool, circleLineWidth:CGFloat, strokeColor:UIColor) {
        
        
        self.createArcshapeCircle(direction: direction)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.circlePath.cgPath
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
        self.layer.addSublayer(shapeLayer)
    }
    
    
    
    private func createArcshapeCircle(direction:Bool){
        circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: (self.frame.size.height-30)/2),
                            radius: self.frame.size.width/20-circleLineWidth,
                            startAngle: CGFloat(0.0).toRadians(),
                            endAngle: CGFloat(359.9999).toRadians(),
                            clockwise: direction)
    }


}


