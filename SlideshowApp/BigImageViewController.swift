//
//  BigImageViewController.swift
//  SlideshowApp
//
//  Created by nikaidomanabu on 2017/01/16.
//  Copyright © 2017年 manabu.nikaido. All rights reserved.
//

import UIKit

class BigImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    var name:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: name!)

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
