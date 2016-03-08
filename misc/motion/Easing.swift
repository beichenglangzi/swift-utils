import Cocoa
/**
 * t: time (current frame) this can also be actual time
 * b: begin (the value it is at the begining)
 * c: change (end value - begining value) sort of the amount to change, this can also be described as the difference between two values
 * d: duration (total frames in anim) this can also be actual time
 * TODO://Elastic, Circular, Back, bounce, Quibic +++
 */
class Easing{
    //No easing, linear animation
    class func easeLinear (t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{//Think line in graph: y = x
        return c*t/d + b
    }
    //Sine SINUSOIDAL EASING: sin(t)
    class func easeInSine (t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c * cos(t/d * π2) + c + b
    }
    class func easeOutSine (t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return c * sin(t/d * π2) + b
    }
    class func easeInOutSine (t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        return -c/2 * (cos(π*t/d) - 1) + b
    }
    //Quintic - QUINTIC EASING: t^5
    class func easeInQuint (var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        t = t/d
        return c*t*t*t*t*t + b
    }
	class func easeOutQuint (var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
		t = t/d-1
		return c*(t*t*t*t*t + 1) + b
	}
	class func easeInOutQuint(var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat {
        t = t/(d/2)//<--the brackets are important
		if (t < 1) {return c/2*t*t*t*t*t + b}
        t = t-2
		return c/2*(t*t*t*t*t + 2) + b
	}
    //Quartic
    class func easeInQuart(var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
        t = t/d
        return c*t*t*t*t + b
    }
    class func easeOutQuart(var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)->CGFloat{
		t = (t/d)-1//<--the brackets are important
		return -c * (t*t*t*t - 1) + b
	}
    class func easeInOutQuart(var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat) -> CGFloat{
		t = t/(d/2)//<--the brackets are important
		if (t < 1) {return c/2*t*t*t*t + b}
		t = t-2
		return -c/2 * (t*t*t*t - 2) + b;
	}
	//Quadratic
	class func easeInQuad (var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
		t = t/d
		return c*t*t + b;
	}
	class func easeOutQuad (var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
		t = t/d
		return -c*t*(t-2) + b;
	}
	class func easeInOutQuad (var t:CGFloat, _ b:CGFloat, _ c:CGFloat, _ d:CGFloat)-> CGFloat{
		t = t/(d/2)//<--the brackets are important
		if (t < 1) {return c/2*t*t + b}
		return -c/2 * ((--t)*(t-2) - 1) + b;
	}
    //Circular
    //,,
    private class func easeInCircular(){
        //return -c * (Math.sqrt(1 - (t/=d)*t) - 1) + b;
    }
    private class func easeOutCircular(){
        //return c * Math.sqrt(1 - (t=t/d-1)*t) + b;
    }
    private class func easeInOutCircular(){
        /*
        if ((t/=d/2) < 1) return -c/2 * (Math.sqrt(1 - t*t) - 1) + b;
        return c/2 * (Math.sqrt(1 - (t-=2)*t) + 1) + b;
        */
    }
}

/*
/**
* NOTE: If you decrease the decimal variable you increase the friction effect
*/
class func easeOut(value : CGFloat, _ from:CGFloat, _ to:CGFloat) -> CGFloat {
let distToGoal:CGFloat = NumberParser.relativeDifference(value, to)
let val:CGFloat = 0.2 * distToGoal
return val
}

*/