import Foundation
/**
 * TODO: Try to get rid of the :class by making the var's mutable somehow
 */
protocol PhysicsAnimationKind:class{
    associatedtype argType
    typealias FrameTick = (argType)->Void/*generic call back signature, use Spring.FrameTick outside this class*/
    typealias InitValues = (value:argType,targetValue:argType,velocity:argType,stopVelocity:argType)
    
    var initValues:InitValues {get set}
    /**/
    var targetValue:argType {get set} /*Where value should go to*/
    var velocity:argType {get set}/*Velocity*/
    var value:argType {get set}/*The value that should be applied to the target*/
    var stopVelocity:argType {get set}
    /*Event related*/
    var callBack:(argType)->Void {get set}/*The closure method that is called on every "frame-tick" and changes the property, you can use a var closure or a regular method, probably even an inline closure*/
    /*Core Methods*/
    func updatePosition(_ val:argType)->Void
    //var assertStop:Bool {get}
    //func stop()->Void
}
/**
 * Getters and setters
 */
extension PhysicsAnimationKind{
    var targetValue:argType {get{return initValues.targetValue}set{initValues.targetValue = newValue}}
    var velocity:argType {get{return initValues.velocity}set{initValues.velocity = newValue}}
    var value:argType {get{return initValues.value}set{initValues.value = newValue}}
    var stopVelocity:argType {get{return initValues.stopVelocity}set{initValues.stopVelocity = newValue}}
}
/**
 * Core method for Springer<CGFloat>
 */
extension PhysicsAnimationKind where argType == CGFloat, Self == Springer<CGFloat>{
    func updatePosition(_ val:CGFloat) {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity = velocity + a
        velocity = velocity * config.friction
        value = value + velocity
        if assertStop {stop()}
    }
}
extension PhysicsAnimationKind where argType == CGPoint, Self == Springer<CGPoint>{
    func updatePosition(_ val:CGPoint) {
        let d = (targetValue - value)
        let a = d * config.spring
        velocity = velocity + a
        velocity = velocity * config.friction
        value = value + velocity
        if assertStop {stop()}
    }
}
/**
 * Convenient when initializing
 */
extension PhysicsAnimationKind where argType == CGFloat, Self == Springer<CGFloat>{
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    static var initConfig:(CGFloat,CGFloat) {
        return (0.02,0.90)
    }
    static var defaultInitValues:(CGFloat,CGFloat,CGFloat,CGFloat){
        return (0,0,0,0)
    }
}

/**
 * Convenient when initializing
 */
extension PhysicsAnimationKind where argType == CGPoint, Self == Springer<CGPoint> {
    var assertStop:Bool {
        return velocity.isNear(stopVelocity, 10e-5.cgFloat)
    }
    static var initPointConfig:(spring:CGPoint,friction:CGPoint) {
        return (CGPoint(0.02,0.02),CGPoint(0.90,0.90))
    }
    static var defaultInitPointValues:(value:CGPoint,targetValue:CGPoint,velocity:CGPoint,stopVelocity:CGPoint){
        return (CGPoint(0,0),CGPoint(0,0),CGPoint(0,0),CGPoint(0,0))
    }
}
