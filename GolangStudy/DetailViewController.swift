//
//  DetailWebViewController.swift
//  GolangStudy
//
//  Created by scott on 14-10-26.
//  Copyright (c) 2014年 scott. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UIWebViewDelegate{

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var nextBtn: UIBarButtonItem!
    
    var courseSet:[Course] = []
    var pathname:String!
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        loadData(pathname)
    }
    
    func loadData(pathname:String){
        let path = NSBundle.mainBundle().pathForResource(pathname, ofType: "html")!
        let requestURL = NSURL(fileURLWithPath: path)!
        let request = NSURLRequest(URL: requestURL)
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    
    @IBAction func nextBtn(sender: AnyObject) {
        index = index+1
        if index < courseSet.count {
            var course = courseSet[index] as Course
            self.title = course.getName()
            pathname = course.getChapter()
            loadData(pathname)
        }else{
            nextBtn.enabled = false
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
