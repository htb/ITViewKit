import UIKit


public extension UIView
{
     func addSubviews(_ views: [UIView])
     {
         for view in views { self.addSubview(view) }
     }

    func addSafeSnappingSubview(_ subview: UIView, insets: UIEdgeInsets = .zero)
    {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        let topC = subview.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: insets.top)
        let bottomC = subview.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom)
        let leftC = subview.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: insets.left)
        let rightC = subview.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -insets.right)
        bottomC.priority = UILayoutPriority(rawValue: 999)
        rightC.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([topC, bottomC, leftC, rightC])
    }

    func addSnappingSubview(_ subview: UIView, insets: UIEdgeInsets = .zero, safeTop: Bool = false, safeBottom: Bool = false)
    {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        let topC = subview.topAnchor.constraint(equalTo: safeTop ? self.safeAreaLayoutGuide.topAnchor : self.topAnchor, constant: insets.top)
        let bottomC = subview.bottomAnchor.constraint(equalTo: safeBottom ? self.safeAreaLayoutGuide.bottomAnchor : self.bottomAnchor, constant: -insets.bottom)
        let leftC = subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets.left)
        let rightC = subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -insets.right)
        bottomC.priority = UILayoutPriority(rawValue: 999)
        rightC.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([topC, bottomC, leftC, rightC])
    }

    func addSnappingSubviewToMargins(_ subview: UIView)
    {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        let topC = subview.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor)
        let bottomC = subview.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        let leftC = subview.leftAnchor.constraint(equalTo: self.layoutMarginsGuide.leftAnchor)
        let rightC = subview.rightAnchor.constraint(equalTo: self.layoutMarginsGuide.rightAnchor)
        bottomC.priority = UILayoutPriority(rawValue: 999)
        rightC.priority = UILayoutPriority(rawValue: 999)
        NSLayoutConstraint.activate([topC, bottomC, leftC, rightC])
    }

    func addSnappingSubviewsVertical(_ subviews: [UIView], spacing: CGFloat = 0, insets: UIEdgeInsets = .zero)
    {
        var previous: UIView? = nil
        for subview in subviews {
            self.addSubview(subview)
            var topC: NSLayoutConstraint!
            var bottomC: NSLayoutConstraint!
            subview.translatesAutoresizingMaskIntoConstraints = false
            if let prev = previous {
                topC = subview.topAnchor.constraint(equalTo: prev.bottomAnchor, constant: spacing)
            } else {
                topC = subview.topAnchor.constraint(equalTo: self.topAnchor, constant: insets.top)
            }
            if subview == subviews.last {
                bottomC = subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -insets.bottom)
                bottomC.priority = UILayoutPriority(rawValue: 999)
                bottomC.isActive = true
            }
            let leftC = subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: insets.left)
            let rightC = subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -insets.right)
            rightC.priority = UILayoutPriority(rawValue: 999)
            NSLayoutConstraint.activate([topC, leftC, rightC])
            previous = subview
        }
    }

    func addCenteredSubview(_ subview: UIView, widthMultiplier: CGFloat? = nil, heightMultiplier: CGFloat? = nil)
    {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        if let wm = widthMultiplier {
            subview.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: wm).isActive = true
        }
        if let hm = heightMultiplier {
            subview.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: hm).isActive = true
        }
    }
}


extension UIView
{
    open func setContentCompressionResistancePriority(_ priority: Float, for axis: NSLayoutConstraint.Axis)
    {
        setContentCompressionResistancePriority(UILayoutPriority(rawValue: priority), for: axis)
    }

    open func setContentHuggingPriority(_ priority: Float, for axis: NSLayoutConstraint.Axis)
    {
        setContentHuggingPriority(UILayoutPriority(rawValue: priority), for: axis)
    }
}
