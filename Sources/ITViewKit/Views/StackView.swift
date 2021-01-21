import UIKit


public class StackView: UIStackView
{
    public init(axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 0, _ views: [UIView]? = nil)
    {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = axis
        self.spacing = spacing
        if let views = views { add(views) }
    }
    required init(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
