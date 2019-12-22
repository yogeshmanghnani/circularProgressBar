//
//  ViewController.swift
//  circularProgressBar
//
//  Created by Yogesh Manghnani on 12/06/18.
//  Copyright © 2018 Yogesh Manghnani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var progressBar: CircularProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        progressBar.safePercent = 100
        progressBar.lineColor = .blue
        progressBar.lineFinishColor = .red
        progressBar.lineBackgroundColor = .gray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func handleTap() {
        progressBar.setProgress(to: 1, withAnimation: true)
    }


}

