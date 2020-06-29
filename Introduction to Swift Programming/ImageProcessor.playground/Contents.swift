//: Playground - noun: a place where people can play

import UIKit

// Process the image!
let image = UIImage(named:"sample")

var myRGBA = RGBAImage(image:image!)
var filters = Filters()

// name takes an argument from "cold", "warm","brightness","contrast","vignette"
filters.applyFilter(name:"cold",myRGBA:  &myRGBA)
myRGBA!.toUIImage()
