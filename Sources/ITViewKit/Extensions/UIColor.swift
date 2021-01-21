import UIKit


public extension UIColor
{
    convenience init(rgb: Int)
    {
        self.init(rgb: rgb, alpha: 1.0)
    }

    convenience init(rgb value: Int, alpha: Double=1.0)
    {
        self.init(
            red: CGFloat((value >> 16) & 0xff) / 255,
            green: CGFloat((value >> 8) & 0xff) / 255,
            blue: CGFloat(value & 0xff) / 255,
            alpha: CGFloat(alpha))
    }

    convenience init(rgba value: UInt32)
    {
        self.init(
            red: CGFloat((value >> 24) & 0xff) / 255,
            green: CGFloat((value >> 16) & 0xff) / 255,
            blue: CGFloat((value >> 8) & 0xff) / 255,
            alpha: CGFloat(value & 0xff) / 255)
    }

    convenience init(argb value: UInt32)
    {
        self.init(
            red: CGFloat((value >> 16) & 0xff) / 255,
            green: CGFloat((value >> 8) & 0xff) / 255,
            blue: CGFloat(value & 0xff) / 255,
            alpha: CGFloat((value >> 24) & 0xff) / 255)
    }

    convenience init? (hex:String?)
    {
        guard let hex = hex else { return nil }
        var cString:String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString = (cString as NSString).substring(from: 1)
        }

        if (cString.count != 6) {
            return nil
        }

        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        self.init(rgb: Int(rgbValue))
    }

    var hex: String { return String(format: "#%08X", rgb) }

    var rgb: Int
    {
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (Int(red * 255) << 16) | (Int(green * 255) << 8) | Int(blue * 255)
    }

    var rgba: UInt32
    {
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (UInt32(red * 255) << 24) | (UInt32(green * 255) << 16) | (UInt32(blue * 255) << 8) | UInt32(alpha * 255)
    }

    var argb: UInt32
    {
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (UInt32(alpha * 255) << 24) | (UInt32(red * 255) << 16) | (UInt32(green * 255) << 8) | UInt32(blue * 255)
    }

    var alpha: Double
    {
        var red:CGFloat = 0
        var green:CGFloat = 0
        var blue:CGFloat = 0
        var alpha:CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return Double(alpha)
    }

    func isSameColor(as color:UIColor)->Bool{
        return self.rgb == color.rgb
    }
    var isWhite:Bool{
        return isSameColor(as: .white)
    }
    var isBright:Bool{
        var white:CGFloat = 0
        getWhite(&white, alpha: nil)
        return white > 0.8
    }
}


// Dark mode support

extension UIColor
{
    public static func adaptive(light: UIColor, dark: UIColor) -> UIColor
    {
        if #available(iOS 13.0, *) {
            return UIColor { (traitCollection: UITraitCollection) -> UIColor in
                return traitCollection.userInterfaceStyle == .dark ? dark : light
            }
        } else {
            return light // Dark mode only supported for iOS >= 13.0
        }
    }
}
