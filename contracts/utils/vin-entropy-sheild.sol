// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVinScrollBeacon {
    function getAlert(uint256 id) external view returns (
        uint8 alertType,
        string memory message,
        address triggeredBy,
        uint256 timestamp
    );
    function totalAlerts() external view returns (uint256);
}

contract VinEntropyShield {
    enum ShieldState { Inactive, Monitoring, Locked }

    ShieldState public state;
    uint256 public lastChecked;
    uint256 public entropyThreshold;
    uint256 public alertWindow;
    address public immutable shieldMaster;
    IVinScrollBeacon public beacon;

    event EntropySurgeDetected(uint256 alertCount, uint256 timestamp);
    event ShieldActivated(uint256 timestamp);
    event ShieldDeactivated(uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == shieldMaster, "Not the shield master");
        _;
    }

    constructor(address beaconAddress, uint256 _threshold, uint256 _window) {
        shieldMaster = msg.sender;
        beacon = IVinScrollBeacon(beaconAddress);
        entropyThreshold = _threshold; // e.g. 3 alerts
        alertWindow = _window; // e.g. 10 minutes
        state = ShieldState.Monitoring;
    }

    function checkEntropy() external {
        require(state == ShieldState.Monitoring, "Shield not monitoring");

        uint256 recentAlerts = 0;
        uint256 total = beacon.totalAlerts();
        uint256 nowTime = block.timestamp;

        for (uint256 i = total; i > 0; i--) {
            (, , , uint256 ts) = beacon.getAlert(i - 1);
            if (nowTime - ts <= alertWindow) {
                recentAlerts++;
            } else {
                break;
            }
        }

        if (recentAlerts >= entropyThreshold) {
            state = ShieldState.Locked;
            emit EntropySurgeDetected(recentAlerts, nowTime);
            emit ShieldActivated(nowTime);
        }

        lastChecked = nowTime;
    }

    function deactivateShield() external onlyMaster {
        require(state == ShieldState.Locked, "Shield not active");
        state = ShieldState.Monitoring;
        emit ShieldDeactivated(block.timestamp);
    }

    function getShieldStatus() external view returns (ShieldState, uint256 lastCheck) {
        return (state, lastChecked);
    }
}
