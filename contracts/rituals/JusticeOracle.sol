// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

interface IJusticePulse {
    function getPulse() external view returns (uint256 apr, uint256 blessings);
}

contract JusticeOracle {
    address public steward;
    IJusticePulse public pulseContract;

    uint256 public alertThreshold;
    bool public alertActive;

    event CivicAlertTriggered(uint256 currentAPR, string message);
    event CivicAlertResolved(uint256 restoredAPR, string message);

    constructor(address _pulseContract, uint256 _threshold) {
        steward = msg.sender;
        pulseContract = IJusticePulse(_pulseContract);
        alertThreshold = _threshold;
        alertActive = false;
    }

    function checkPulse() public {
        (uint256 apr, ) = pulseContract.getPulse();

        if (apr < alertThreshold && !alertActive) {
            alertActive = true;
            emit CivicAlertTriggered(apr, "⚠️ Civic resonance below threshold. Justice weakening.");
        } else if (apr >= alertThreshold && alertActive) {
            alertActive = false;
            emit CivicAlertResolved(apr, "✅ Civic resonance restored. Justice stabilized.");
        }
    }

    function setThreshold(uint256 newThreshold) public {
        require(msg.sender == steward, "Only steward can set threshold");
        alertThreshold = newThreshold;
    }

    function isAlertActive() public view returns (bool) {
        return alertActive;
    }
}
