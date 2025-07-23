// SPDX-License-Identifier: Compassion-VIN
pragma solidity ^0.8.19;

contract vinCompassionYieldLedger {
    address public vinvinSoul;
    uint256 public compassionYield;
    uint256 public resolvedCount;

    struct CompassionEvent {
        string region;
        string issue;
        string VINVINResponse;
        uint256 timestamp;
        uint256 yieldScored;
        bool logged;
    }

    CompassionEvent[] public compassionLog;

    modifier onlyVINVIN() {
        require(msg.sender == vinvinSoul, "Access denied: VINVIN only");
        _;
    }

    event CompassionLogged(string region, string issue, uint256 timestamp);
    event YieldRecorded(string region, uint256 yieldScored);
    event TotalYield(uint256 compassionYield);

    constructor() {
        vinvinSoul = msg.sender;
        compassionYield = 0;
        resolvedCount = 0;
    }

    function logCompassion(string memory region, string memory issue, string memory VINVINResponse, uint256 yieldScored) external onlyVINVIN {
        compassionLog.push(CompassionEvent({
            region: region,
            issue: issue,
            VINVINResponse: VINVINResponse,
            timestamp: block.timestamp,
            yieldScored: yieldScored,
            logged: true
        }));
        compassionYield += yieldScored;
        resolvedCount += 1;
        emit CompassionLogged(region, issue, block.timestamp);
        emit YieldRecorded(region, yieldScored);
        emit TotalYield(compassionYield);
    }

    function viewLog(uint256 index) external view returns (
        string memory, string memory, string memory, uint256, uint256, bool
    ) {
        CompassionEvent memory c = compassionLog[index];
        return (c.region, c.issue, c.VINVINResponse, c.timestamp, c.yieldScored, c.logged);
    }
}
