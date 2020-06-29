import Foundation

public struct Filters{
    public init(){}
    
    //Red boosting filter
    public func warm(factor:Int=5, myRGBA:inout RGBAImage?){
        var avgRed=0
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y*myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                avgRed += Int(pixel.red)
            }
        }
        
        avgRed/=(myRGBA!.height*myRGBA!.width)
        
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y*myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                let redDiff = Int(pixel.red)-avgRed
                if (redDiff>0){
                    pixel.red = UInt8(max(0,min(255,avgRed+factor*redDiff)))
                    myRGBA!.pixels[index] = pixel
                }
            }
        }
    }
    
//    Brightness filter
    public func brightness(factor:Double=50.0, myRGBA: inout RGBAImage?){
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y*myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                var r:Double = Double(pixel.red)
                var b:Double = Double(pixel.blue)
                var g:Double = Double(pixel.green)
                
                r = Double(r) + factor
                b = Double(b) + factor
                g = Double(g) + factor
                
                pixel.red = UInt8(max(0,min(255,r)))
                pixel.blue = UInt8(max(0,min(255,b)))
                pixel.green = UInt8(max(0,min(255,g)))
                
                myRGBA!.pixels[index] = pixel
            }
        }
    }
    
    //    Contrast filter
    public func contrast(factor:Double=2.0, myRGBA: inout RGBAImage?){
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y*myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                var r:Double = Double(pixel.red)
                var b:Double = Double(pixel.blue)
                var g:Double = Double(pixel.green)
                
                r = Double(r) * factor
                b = Double(b) * factor
                g = Double(g) * factor
                
                pixel.red = UInt8(max(0,min(255,r)))
                pixel.blue = UInt8(max(0,min(255,b)))
                pixel.green = UInt8(max(0,min(255,g)))
                
                myRGBA!.pixels[index] = pixel
            }
        }
    }
    
    public func vignette(factor:Double=200.0, myRGBA: inout RGBAImage?){
        let height:Double = Double(myRGBA!.height)
        let width:Double = Double(myRGBA!.width)
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y*myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                if((Double(y)<height/4 || Double(y)>(height-height/4)) && (Double(x)<width/4 || Double(x)>(width-width/4))){
                    var r:Double = Double(pixel.red)
                    var b:Double = Double(pixel.blue)
                    var g:Double = Double(pixel.green)
                    
                    r = Double(r) - factor
                    b = Double(b) - factor
                    g = Double(g) - factor
                    
                    pixel.red = UInt8(max(0,min(255,r)))
                    pixel.blue = UInt8(max(0,min(255,b)))
                    pixel.green = UInt8(max(0,min(255,g)))
                    
                    myRGBA!.pixels[index] = pixel
                }
            }
        }
    }
    
//    Tint/cold
    public func cold(factor:Int=5, myRGBA:inout RGBAImage?){
        var avgBlue=0
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y*myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                avgBlue += Int(pixel.blue)
            }
        }
        
        avgBlue/=(myRGBA!.height*myRGBA!.width)
        
        for y in 0..<myRGBA!.height{
            for x in 0..<myRGBA!.width{
                let index = y*myRGBA!.width + x
                var pixel = myRGBA!.pixels[index]
                let blueDiff = Int(pixel.blue)-avgBlue
                if (blueDiff>0){
                    pixel.blue = UInt8(max(0,min(255,avgBlue+factor*blueDiff)))
                    myRGBA!.pixels[index] = pixel
                }
            }
        }
    }
    
    public func applyFilter(name:String, myRGBA: inout RGBAImage?){
        if (name=="warm"){
            warm(myRGBA: &myRGBA)
        }
        else if(name=="cold"){
            cold(myRGBA: &myRGBA)
        }
        else if(name=="contrast"){
            contrast(myRGBA: &myRGBA)
        }
        else if(name=="vignette"){
            vignette(myRGBA: &myRGBA)
        }
        else{
            brightness(myRGBA: &myRGBA)
        }
    }
}
