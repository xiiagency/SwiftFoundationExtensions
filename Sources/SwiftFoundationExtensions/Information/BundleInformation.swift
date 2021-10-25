import Foundation

/**
 Full version and build number of the main bundle in the format;
   `v[MAJOR].[MINOR].[PATCH]-[BUILD]`
 
 Example:
   ```
   v1.2.3-456
   ```
 */
public let mainBundleVersion: String = {
  // Version number
  let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "?"
  
  // Build number
  let appBuild = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? "?"
  
  return "v\(appVersion)-\(appBuild)"
}()

/**
 Returns true if the main bundle was installed from the app store (not in a sandbox environment), false otherwise.
 
 NOTE: An app is considered installed from the App Store if-and-only-if:
       - the install was not in the sandbox environment
       - the app has mobile provisioning
 */
public let isInstalledFromAppstore: Bool = {
  let isSandbox =
    Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
  
  let hasMobileProvisioning =
    Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil
  
  return !isSandbox && hasMobileProvisioning
}()
