//
//  ViewController.swift
//  swift-twoday-watch
//
//  Created by MacBook Pro on 2019/3/9.
//  Copyright © 2019年 MacBookPro. All rights reserved.
//

import UIKit
import SnapKit

var second = 60
var timer:Timer?

// 在global线程里创建一个时间源
//设定定时时间为10s


//设定定时时间为10s


// 设定这个时间源是每0.5秒循环一次，立即开始
//设定定时时间为10s
class ViewController: UIViewController {
   
    let oneview = UIView()
    
    let twoview = UIView()
    let threeview = UIView()
    var lizhiBtn = UIButton()
    var dingshiLabel = UILabel()
    var bianhuaLabel = UILabel()
    var zhantingBtn = UIButton()
    var restartBtn = UIButton()
    var timer:Timer!
    var lableNumber:Double = 0
    
    var result:UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //MARK:添加注释
        oneview.backgroundColor = UIColor.purple
         self.view .addSubview(oneview)
        oneview.snp.makeConstraints { (make) in
            make.top.equalTo(0)
          //  make.bottom.equalTo(0)
            //make.height.equalTo(200)
           // make.top.lessThanOrEqualToSuperview()
    make.height.equalTo(self.view.frame.size.height/2.5)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        //FIXME:要解决的bug
       twoview.backgroundColor = UIColor(red: 182.0/255, green: 172.0/255, blue: 200.0/255, alpha: 1)
        self.view.addSubview(twoview)
        twoview.snp.makeConstraints { (make) in
            make.bottom.equalTo(0)
            make.top.equalTo(oneview.snp.bottom)
            make.left.equalTo(0)
            make.width.equalTo(self.view.center.x)
        }
        //TODO:需要接着写东西
        threeview.backgroundColor = UIColor(red: 192.0/255, green: 177.0/255, blue: 245.0/255, alpha: 1)
        self.view.addSubview(threeview)
        threeview.snp.makeConstraints { (make) in
            make.left.equalTo(twoview.snp.right)
            make.top.equalTo(oneview.snp.bottom)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
        }
       
         lizhiBtn = UIButton()
         lizhiBtn.backgroundColor = UIColor.yellow
        [lizhiBtn .setTitle("Reset", for: UIControl.State.normal)];
       // lizhiBtn.setTitleColor(UIColor.yellow, for: UIControl.State.normal)
       lizhiBtn.setTitleColor(UIColor(red: 245.0/255, green: 123.0/255, blue: 11.0/255, alpha: 1), for: UIControl.State.normal)
        lizhiBtn.addTarget(self, action: #selector(start), for: .touchUpInside)
        oneview.addSubview(lizhiBtn)
        lizhiBtn.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(100)
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
         zhantingBtn = UIButton()
        zhantingBtn.backgroundColor = UIColor.blue
        zhantingBtn.setTitle("zhanting", for: UIControl.State.normal)
           zhantingBtn.addTarget(self, action: #selector(end), for: .touchUpInside)
        oneview .addSubview(zhantingBtn)
        zhantingBtn.snp.makeConstraints { (make) in
            make.top.equalTo(50)
            make.left.equalTo(100)
            make.width.equalTo(200)
            make.height.equalTo(35)
        }
        
        restartBtn = UIButton()
        restartBtn.backgroundColor = UIColor.yellow
         restartBtn.setTitle("重开", for: UIControl.State.normal)
        restartBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        restartBtn.addTarget(self, action: #selector(restart), for: .touchUpInside)
        restartBtn.setTitleColor(UIColor.black, for: UIControl.State.normal)
        oneview.addSubview(restartBtn)
        restartBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(-20)
            make.centerX.equalTo(oneview.center.x)
            make.width.height.equalTo(100)
        }
        
        
        
        dingshiLabel = UILabel()
        dingshiLabel.text = "定时器的文字"
        dingshiLabel.textColor = UIColor.black
        dingshiLabel.backgroundColor = UIColor.green
       oneview.addSubview(dingshiLabel)
        dingshiLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(oneview.center.x)
            make.centerY.equalTo(oneview.center.y)
            make.height.equalTo(40)
            make.width.equalTo(120)
        }
        bianhuaLabel = UILabel()
        bianhuaLabel.text = "21s"
        bianhuaLabel.textColor = UIColor.black
        bianhuaLabel.backgroundColor = UIColor.yellow
        oneview .addSubview(bianhuaLabel);
        bianhuaLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.left.equalTo(100)
            make.width.equalTo(120)
            make.height.equalTo(40)
        }
        
        // 启用计时器，控制每N秒执行一次getNetData方法
        
        //设定定时时间为10s
        // 在global线程里创建一个时间源
        
        

        // 在global线程里创建一个时间源
        
        
        
        }
    
    //touchupInSide
    @objc func restart(){
       
        self.lableNumber = 0
       // self.result.text = "0"
        bianhuaLabel.text = "0"
    }
    
    @objc func start(){
      print("1")
        if (self.timer != nil) {
            self.end()
        }
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { (Timer) in
            self.lableNumber = self.lableNumber + 0.1
            self.bianhuaLabel.text = String(format: "%.1f", self.lableNumber)
        }
        self.timer.fire()
        
        
//        var timerCount = 60
//
//       let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())
//
//     timer.schedule(deadline: .now(), repeating: .seconds(1))
//
//        //设定时间源的触发事件
//        timer.setEventHandler(handler: {
//            timerCount = timerCount-1
//            //时间到了取消时间源
//
//            if timerCount<=0{
//                timer.cancel()
//            }
//
//            //返回主线程处理一些事件
//            DispatchQueue.main.async {
//                print("",timerCount)
//                var a = timerCount
//                var s :String = "\(a)"
//
//                self.bianhuaLabel.text = s;
//
//
//
//            }
//
//        })
//        //启动时 间源
//        timer.resume()
        
        
       
        
        
      
        
        
    }
    //3.定时操作
    override func performSegue(withIdentifier identifier: String, sender: Any?) {

    }

    @objc func end(){
       
        
        guard let timerForDistory = self.timer
            else{return}
        timerForDistory.invalidate()
    }
    
    
    }


    

//}

