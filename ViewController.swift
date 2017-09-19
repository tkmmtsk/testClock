//
//  ViewController.swift
//  testClock
//
//  Created by 松岡 択真 on 2017/06/13.
//  Copyright © 2017年 tkmmtsk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //日時表示ラベルの作成
    let timeLabel = UILabel()
    //点滅文字の表示ラベル作成
    let anotherLabel = UILabel()
    
    var dateFormatter : DateFormatter{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.frame = view.bounds
        timeLabel.textAlignment = .center
        timeLabel.textColor = UIColor.black
        view.addSubview(timeLabel)
        
        updateTimeLabel()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimeLabel), userInfo: nil, repeats: true)
        
        anotherLabel.frame = view.bounds
        anotherLabel.frame.origin = CGPoint(x: 0, y: 100)
        anotherLabel.text = "testClock"
        anotherLabel.textAlignment = .center
        anotherLabel.textColor = UIColor.black
        anotherLabel.font = UIFont.boldSystemFont(ofSize: UIFont.labelFontSize)
        anotherLabel.font = UIFont(name: "ArialHebew", size: UIFont.labelFontSize)
        view.addSubview(anotherLabel)
        
        let timeSwitch : UISwitch = UISwitch()
        timeSwitch.isOn = true
        timeSwitch.layer.position = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height - 150)
        timeSwitch.addTarget(self, action: #selector(ViewController.timeButtonEvent(sender:)), for: UIControlEvents.valueChanged)
        view.addSubview(timeSwitch)
        
        //BackGroundImage
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "testClock.png")?.draw(in: self.view.bounds)
        let myTestClockImage: UIImage! = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //ImageをbackgroundColor(BackgroundImage)に追加
        self.view.backgroundColor = UIColor(patternImage: myTestClockImage)
        
    }
    
    
    func updateTimeLabel(){
        let now = Date()
        timeLabel.text = dateFormatter.string(from: now as Date)
    }
    
    internal func timeButtonEvent(sender: UISwitch){
        if sender.isOn{
            anotherLabel.text = "testClock"
            anotherLabel.textColor = UIColor.black
            timeLabel.textColor = UIColor.black
        }
        else{
            anotherLabel.text = "OFF"
            anotherLabel.textColor = UIColor.red
            timeLabel.text = "OFF"
            timeLabel.textColor = UIColor.white
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

