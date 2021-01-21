import UIKit


extension UITableView
{
    public func register<T>(_ cellType: T.Type) where T: UITableViewCell
    {
        register(cellType, forCellReuseIdentifier: String(describing: cellType))
    }

    public func dequeue<T>(_ cellType: T.Type) -> T? where T: UITableViewCell
    {
        return self.dequeueReusableCell(withIdentifier: String(describing: cellType)) as? T
    }
}
