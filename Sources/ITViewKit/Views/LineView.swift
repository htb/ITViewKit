import UIKit


public class LineView: UIView
{
    private var _axis: NSLayoutConstraint.Axis = .horizontal

    public var dashLength: CGFloat = 0 { didSet { setNeedsDisplay() } }

    public init(_ axis: NSLayoutConstraint.Axis = .horizontal, thickness: CGFloat = 1, dashLength: CGFloat? = nil)
    {
        self._axis = axis
        super.init(frame: .zero)
        if let d = dashLength { self.dashLength = d }
        self.translatesAutoresizingMaskIntoConstraints = false
        let dim: NSLayoutDimension = (axis == .horizontal ? self.heightAnchor : self.widthAnchor)
        dim.constraint(equalToConstant: thickness).isActive = true
        self.backgroundColor = UIColor.clear
        self.translatesAutoresizingMaskIntoConstraints = false
    }

    required init?(coder: NSCoder) { super.init(coder: coder) }

    override public func draw(_ rect: CGRect)
    {
        let path = UIBezierPath()
        var p0: CGPoint!
        var p1: CGPoint!
        if _axis == .horizontal {
            p0 = CGPoint(x: self.bounds.minX, y: self.bounds.midY)
            p1 = CGPoint(x: self.bounds.maxX, y: self.bounds.midY)
        } else {
            p0 = CGPoint(x: self.bounds.midX, y: self.bounds.minY)
            p1 = CGPoint(x: self.bounds.midX, y: self.bounds.maxY)
        }
        path.move(to: p0)
        path.addLine(to: p1)
        if dashLength > 0 {
            let dashes: [CGFloat] = [dashLength, dashLength]
            path.setLineDash(dashes, count: dashes.count, phase: 0.0)
        }
        path.lineWidth = self.bounds.height
        path.lineCapStyle = .butt
        self.tintColor.setStroke()
        path.stroke()
    }
}
