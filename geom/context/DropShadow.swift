import Cocoa

class DropShadow : CustomStringConvertible{
    var color:NSColor
    var offsetX:CGFloat
    var offsetY:CGFloat
    var blurRadius:CGFloat
    var inner:Bool
    init(_ color:NSColor,_ offsetX:CGFloat,_ offsetY:CGFloat,_ blurRadius:CGFloat,_ inner:Bool){
        self.color = color
        self.offsetX = offsetX
        self.offsetY = offsetY
        self.blurRadius = blurRadius
        self.inner = inner
    }
}
/*
extension DropShadow{

}
*/