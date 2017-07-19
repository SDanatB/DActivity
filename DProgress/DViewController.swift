//
//  DViewController.swift
//  DProgress
//
//  Created by Danat Sartay on 7/19/17.
//  Copyright © 2017 Danat Sartay. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        indicator.frame = CGRect(x:0.0,y:0.0, width:40.0,height: 40.0);
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubview(toFront: view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = true

        indicator.startAnimating()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
