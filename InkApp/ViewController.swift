//
//  ViewController.swift
//  InkApp
//
//  Created by hiro on 2016/08/01.
//  Copyright © 2016年 hiro. All rights reserved.
//

import UIKit
import ACEDrawingView

class ViewController: UIViewController, ACEDrawingViewDelegate {
    
    @IBOutlet weak var drawingView: ACEDrawingView!
    @IBOutlet weak var undoButton: UIBarButtonItem!
    @IBOutlet weak var redoButton: UIBarButtonItem!
    
    @IBAction func undoButton(sender: UIBarButtonItem) {
        drawingView.undoLatestStep();
        self.updateButtonStatus()
    }
    @IBAction func redoButton(sender: UIBarButtonItem) {
        drawingView.redoLatestStep();
        self.updateButtonStatus()
    }
    
    @IBAction func clearButton(sender: UIBarButtonItem) {
        drawingView.clear()
        self.updateButtonStatus()
    }
    
    func updateButtonStatus() {
        self.undoButton.enabled = drawingView.canUndo();
        self.redoButton.enabled = drawingView.canRedo();
    }
    
    func drawingView(view: ACEDrawingView!, willBeginDrawUsingTool tool: ACEDrawingTool!) {
        print("draw start");
        self.updateButtonStatus()
    }

    func drawingView(view: ACEDrawingView!, didEndDrawUsingTool tool: ACEDrawingTool!) {
        print("draw end");
        self.updateButtonStatus()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set delegate
        drawingView.delegate = self
        
        // set pen
        drawingView.drawTool = ACEDrawingToolTypePen
        drawingView.lineWidth = 2.0
        drawingView.lineColor = UIColor.blackColor()
        
        self.updateButtonStatus()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
