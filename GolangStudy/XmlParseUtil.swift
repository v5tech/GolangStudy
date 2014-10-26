//
//  XmlParseUtil.swift
//  GolangStudy
//
//  Created by scott on 14-10-26.
//  Copyright (c) 2014年 scott. All rights reserved.
//

import Foundation

class XmlParseUtil:NSObject,NSXMLParserDelegate {
    
    var course:Course?
    
    var courseSet:[Course] = []
    
    var elementname:String = String()
    var name:String = String()
    var desc:String = String()
    var chapter:String = String()
    
    init(name:String){
        super.init()
        let path = NSBundle.mainBundle().pathForResource(name, ofType: "xml")!
        let xmlparser:NSXMLParser = NSXMLParser(contentsOfURL: NSURL(fileURLWithPath: path)!)!
        xmlparser.delegate = self
        xmlparser.parse()
    }
        
    func parser(parser: NSXMLParser!, didStartElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!, attributes attributeDict: [NSObject : AnyObject]!) {
        elementname = elementName
        if elementName == "Content"{
            name = String()
            desc = String()
            chapter = String()
        }
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!) {
        let data = string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if elementname == "Name"{
            name += data
        } else if elementname == "Abstract" {
            desc += data
        } else if elementname == "Chapter" {
            chapter += data
        }
    }
    
    func parser(parser: NSXMLParser!, didEndElement elementName: String!, namespaceURI: String!, qualifiedName qName: String!) {
        if elementName == "Content"{
            course = Course(name: name, desc: desc, chapter: chapter)
            courseSet.append(course!)
        }
    }
    
}
