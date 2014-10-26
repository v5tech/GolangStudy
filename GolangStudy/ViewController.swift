//
//  ViewController.swift
//  GolangStudy
//
//  Created by scott on 14-10-25.
//  Copyright (c) 2014年 scott. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var courseSet:[Course] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        courseSet = XmlParseUtil(name: "basic_course_list").courseSet
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: nil, action: nil)
    }
    
    @IBAction func segmentChanged(sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            courseSet = XmlParseUtil(name: "basic_course_list").courseSet
        }else if sender.selectedSegmentIndex == 1 {
            courseSet = XmlParseUtil(name: "example_course_list").courseSet
        }
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseSet.count;
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell
        var course:Course = courseSet[indexPath.row] as Course
        cell.textLabel.text = course.getName()
        cell.detailTextLabel?.text = course.getDesc()
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "show" {
            let viewController = segue.destinationViewController as DetailViewController
            var course:Course = courseSet[tableView.indexPathForSelectedRow()!.row] as Course
            viewController.pathname = course.getChapter()
            viewController.title = course.getName()
            viewController.courseSet = courseSet
            viewController.index = tableView.indexPathForSelectedRow()!.row
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

