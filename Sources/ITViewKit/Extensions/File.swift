import UIKit


extension UIViewController
{
    public func add(_ child: UIViewController)
    {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    public func remove()
    {
        if parent == nil { return }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
