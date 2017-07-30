import Foundation

struct RoundedRect{
    var rect:CGRect
    var fillet:Fillet
    init(_ rect:CGRect = CGRect(),_ fillet:Fillet = Fillet()) {
        self.rect = rect
        self.fillet = fillet
    }
}
extension RoundedRect{
    var origin: CGPoint {get{return rect.origin} set{rect.origin = newValue}}
    var size: CGSize {get{return rect.size} set{rect.size = newValue}}
    var x: CGFloat {get{return rect.x} set{rect.x = newValue}}
    var y: CGFloat {get{return rect.y} set{rect.y = newValue}}
    var w: CGFloat {get{return rect.w} set{rect.w = newValue}}
    var h: CGFloat {get{return rect.h} set{rect.h = newValue}}
    init(_ origin:CGPoint = CGPoint(),_ size:CGSize = CGSize(),_ fillet:Fillet = Fillet()){
        self.init(CGRect(origin,size), fillet)
    }
    init(_ x:CGFloat = 0,_ y:CGFloat = 0,_ w:CGFloat = 0,_ h:CGFloat = 0,_ fillet:Fillet = Fillet()){
        self.init(CGRect(CGPoint(x,y),CGSize()), fillet)
    }
    enum DefaultEasing{
        static var easing:RoundedRect { return RoundedRect(0.2,0.2,0.2,0.2,Fillet(0.2)) }
    }
}
extension RoundedRect:Advancable5 {
    static var defaults:AnimState5<RoundedRect>  =  AnimState5<RoundedRect>(RoundedRect(), RoundedRect(), RoundedRect(), RoundedRect(), RoundedRect(10e-5,10e-5,10e-5,10e-5,Fillet(10e-5)))
    func isNear( value:  RoundedRect,  epsilon: RoundedRect) -> Bool {
        let isSizeNear = self.size.isNear(value.size,epsilon.size.w)
        let isOriginNear = self.origin.isNear(value.origin,epsilon.origin.x)
        let isFilletNear = self.fillet
        return isSizeNear && isOriginNear && isFilletNear
    }
}
func +(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin + b.origin,a.size + b.size,a.fillet+b.fillet)}
func -(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin - b.origin,a.size - b.size,a.fillet-b.fillet)}
func *(a: RoundedRect, b: RoundedRect) -> RoundedRect { return RoundedRect(a.origin * b.origin,a.size * b.size,a.fillet*b.fillet)}