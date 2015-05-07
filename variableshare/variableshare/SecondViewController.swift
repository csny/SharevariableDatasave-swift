//
//  SecondViewController.swift
//  variableshare
//
//  Created by macbook on 2015/05/07.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBAction func secondViewBtn(sender: AnyObject) {
        // AppDelegateのインスタンスを取得
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // appDelegateの変数を操作
        ++appDelegate.point
        // ラベル表示,ラベル用にString型へ変換
        secondViewLabel.text = "[" + String(stringInterpolationSegment: appDelegate.point) + "]"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        println("2nd_viewDidLoaded")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // AppDelegateのインスタンスを取得
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // ラベル表示,ラベル用にString型へ変換
        secondViewLabel.text = "[" + String(stringInterpolationSegment: appDelegate.point) + "]"
    }
}