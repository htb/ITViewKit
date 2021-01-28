import UIKit


extension UIApplication
{
    public static func openApplicationSettings()
    {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }

        if self.shared.canOpenURL(settingsUrl) {
            self.shared.open(settingsUrl, completionHandler: { (success) in
            })
        }
    }
}
