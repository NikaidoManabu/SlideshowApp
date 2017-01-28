//
//  ViewController.swift
//  SlideshowApp
//
//  Created by nikaidomanabu on 2017/01/14.
//  Copyright © 2017年 manabu.nikaido. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var buttonPrev: UIButton!
    var id: Int=0
    var imagesName=["0.png","1.png","2.png"]
    var timer: Timer!
    var buttonStatus: String="Start"
    
    
    @IBAction func tapped(_ sender: Any) {
        timer?.invalidate()
        buttonNext.isEnabled=true
        buttonPrev.isEnabled=true
        buttonStatus="Start"
        buttonStart.setTitle(buttonStatus, for: .normal)
    }
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        id+=1
        if(id>=imagesName.count){
            id=0
        }
        imageView.image = UIImage(named: imagesName[id])
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        if(buttonStatus=="Start"){
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
            timer.fire()
            buttonNext.isEnabled=false
            buttonPrev.isEnabled=false
            buttonStatus="Stop"
            buttonStart.setTitle(buttonStatus, for: .normal)
        }else{
            timer.invalidate()
            buttonNext.isEnabled=true
            buttonPrev.isEnabled=true
            buttonStatus="Start"
            buttonStart.setTitle(buttonStatus, for: .normal)
        }
    }
    
    func update(tm: Timer) {
        id+=1
        if(id>=imagesName.count){
            id=0
        }
        imageView.image = UIImage(named: imagesName[id])
    }
    
    @IBAction func prevButtonTapped(_ sender: Any) {
        id-=1
        if(id<0){
            id=imagesName.count-1
        }
        imageView.image = UIImage(named: imagesName[id])
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let BigImageViewController:BigImageViewController = segue.destination as! BigImageViewController
        BigImageViewController.name = imagesName[id]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: imagesName[id])
        buttonStart.setTitle(buttonStatus, for: .normal)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
    }

}

