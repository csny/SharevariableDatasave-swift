//
//  FirstViewController.swift
//  variableshare
//
//  Created by macbook on 2015/05/07.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var firstViewLabel: UILabel!
    @IBAction func firstViewBtn(sender: AnyObject) {
        // AppDelegateのインスタンスを取得
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // appDelegateの変数を操作
        ++appDelegate.point
        // ラベル表示,ラベル用にString型へ変換
        firstViewLabel.text = "[" + String(stringInterpolationSegment: appDelegate.point) + "]"
    }
    @IBAction func saveBtn(sender: AnyObject) {
        // AppDelegateのインスタンスを取得
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // NSUserDefaults型でディスク書き込み
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(appDelegate.point, forKey: "UserPoint")
        let success = defaults.synchronize()
        if success {
            println("保存に成功")
        }
    }
    @IBAction func clearBtn(sender: AnyObject) {
        // AppDelegateのインスタンスを取得
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // キーを元にディスクから削除
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        defaults.removeObjectForKey("UserPoint")
        let success = defaults.synchronize()
        if success {
            println("削除に成功")
        } else {
            println("削除するデータなし")
            return
        }
        // 表示中のデータリセット
        appDelegate.point = 0
        self.viewDidAppear(false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        println("1st_viewDidLoaded")
        // AppDelegateのインスタンスを取得
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // ディスクから読み出し
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var tempoint: Int? = defaults.integerForKey("UserPoint")
        if (tempoint==nil) {
            println("データなし")
        } else {
            println("データ読み出し:\(tempoint)")
            appDelegate.point = tempoint!
            tempoint = nil
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        // AppDelegateのインスタンスを取得
        let appDelegate: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // ラベル表示,ラベル用にString型へ変換
        firstViewLabel.text = "[" + String(stringInterpolationSegment: appDelegate.point) + "]"
    }
}