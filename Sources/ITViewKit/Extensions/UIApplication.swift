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

    public static func openURL(_ urlString: String)
    {
        guard let url = URL(string: urlString) else { return }

        if self.shared.canOpenURL(url) {
            self.shared.open(url, completionHandler: { (success) in
            })
        }
    }
}
