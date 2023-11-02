import UIKit

class AppHangDidBecomeActiveScenario: Scenario {
    
    override func startBugsnag() {
        config.appHangThresholdMillis = 2_000
        self.config.autoTrackSessions = false;
        super.startBugsnag()
    }
    
    override func run() {
        NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: nil) {
            logInfo("Received \($0.name), now sleeping for 3 seconds...")
            Thread.sleep(forTimeInterval: 3)
        }
    }
}
