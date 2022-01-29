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
       - the install is not in DEBUG
       - the install was NOT in the sandbox environment (TestFlight)
       - the app DOES NOT have mobile provisioning (Ad-Hoc)
 */
public let isInstalledFromAppstore: Bool = {
  // Detect debug installs.
  #if DEBUG
  let isDebug: Bool = true
  #else
  let isDebug: Bool = false
  #endif
  
  // Detect TestFlight.
  let isTestFlight = Bundle.main.appStoreReceiptURL?.lastPathComponent == "sandboxReceipt"
  
  // Detect ad-hoc installs via provisioning profile presence.
  let isAdHoc =
    Bundle.main.path(forResource: "embedded", ofType: "mobileprovision") != nil
  
  return !isDebug && !isTestFlight && !isAdHoc
}()
