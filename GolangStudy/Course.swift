//
//  Course.swift
//  GolangStudy
//
//  Created by scott on 14-10-26.
//  Copyright (c) 2014年 scott. All rights reserved.
//

import Foundation

class Course {
    
    private var name:String?
    private var desc:String?
    private var chapter:String?
    
    func getName()->String{
        return self.name!
    }
    
    func getDesc()->String{
        return self.desc!
    }
    
    func getChapter()->String{
        return self.chapter!
    }
    
    init(name:String,desc:String,chapter:String){
        self.name = name
        self.desc = desc
        self.chapter = chapter
    }
    
}