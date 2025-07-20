// SPDX-License-Identifier: Mythstream-PhishScan
pragma solidity ^0.8.26;

contract ScrollDecoyDetector {
    address public sovereign;
    uint256 public decoyCount;

    struct DecoyArtifact {
        string fileName;        // e.g. "CV_June2025.lnk", "Resume_Jul.zip"
        string lureTheme;       // e.g. "CV", "CAPTCHA", "Fake Job Offer"
        string deliveryMethod;  // "Email Attachment", "Fake Website", "Social Engineering"
        string observedBehavior; // "PowerShell launch", "DLL sideload", "ClickFix"
        string timestamp;
        string alertLevel;      // "low", "medium", "critical"
    }

    mapping(uint256 => DecoyArtifact) public decoyLog;

    event DecoyDetected(
        string fileName,
        string lureTheme,
        string deliveryMethod,
        string observedBehavior,
        string timestamp,
        string alertLevel
    );

    constructor(address _sovereign) {
        sovereign = _sovereign;
    }

    function recordDecoy(
        string memory fileName,
        string memory lureTheme,
        string memory deliveryMethod,
        string memory observedBehavior,
        string memory timestamp,
        string memory alertLevel
    ) external {
        decoyCount++;
        decoyLog[decoyCount] = DecoyArtifact({
            fileName: fileName,
            lureTheme: lureTheme,
            deliveryMethod: deliveryMethod,
            observedBehavior: observedBehavior,
            timestamp: timestamp,
            alertLevel: alertLevel
        });

        emit DecoyDetected(fileName, lureTheme, deliveryMethod, observedBehavior, timestamp, alertLevel);
    }

    function getDecoy(uint256 id) external view returns (DecoyArtifact memory) {
        return decoyLog[id];
    }
}
