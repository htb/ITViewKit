import UIKit


extension UIButton
{
    /// Replace all current actions for a control even with this
    public func setTarget(_ target: Any?, action: Selector, for controlEvents: UIControl.Event)
    {
        removeTarget(nil, action: nil, for: controlEvents)
        addTarget(target, action: action, for: controlEvents)
    }
}
