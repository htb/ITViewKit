import UIKit


extension UIStackView
{
    @discardableResult
    public func add(_ views: [UIView]) -> Self
    {
        for view in views { self.addArrangedSubview(view) }
        return self
    }

    @discardableResult
    public func remove(_ views: [UIView]? = nil) -> Self
    {
        if let views = views {
            for v in views { v.removeFromSuperview() }
        } else {
            while let v = self.arrangedSubviews.first { v.removeFromSuperview() }
        }
        return self
    }

    @discardableResult
    public func alignment(_ alignment: Alignment) -> Self
    {
        self.alignment = alignment
        return self
    }

    @discardableResult
    public func padding(_ insets: UIEdgeInsets) -> Self
    {
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: insets.top, leading: insets.left, bottom: insets.bottom, trailing: insets.right)
        return self
    }

    @discardableResult
    public func padding(_ axis: NSLayoutConstraint.Axis, _ inset: CGFloat) -> Self
    {
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = (axis == .vertical)
            ? NSDirectionalEdgeInsets(top: inset, leading: directionalLayoutMargins.leading, bottom: inset, trailing: directionalLayoutMargins.trailing)
            : NSDirectionalEdgeInsets(top: directionalLayoutMargins.top, leading: inset, bottom: directionalLayoutMargins.bottom, trailing: inset)
        return self
    }
}
