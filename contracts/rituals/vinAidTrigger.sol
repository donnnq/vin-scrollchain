// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinAidTrigger - Ritual contract for automatic civic aid deployment based on oracle forecasts
/// @author Vinvin
/// @notice Listens to vinPulseOracle and dispatches aid modules when collapse is predicted
/// @dev Integrates with vinPulseOracle.sol and civic aid registries

contract vinAidTrigger {
    address public scrollsmith;
    string public lastForecast;
    bool public aidDeployed;

    event AidDeployed(string reason, uint256 timestamp);
    event AidReset(uint256 timestamp);

    constructor() {
        scrollsmith = msg.sender;
        aidDeployed = false;
    }

    function receiveForecast(string memory forecast) public {
        lastForecast = forecast;

        if (compareStrings(forecast, "⚠️ Economic slowdown likely. Prepare civic safety nets.") && !aidDeployed) {
            deployAid();
        }
    }

    function deployAid() internal {
        aidDeployed = true;

        // Ritual actions (symbolic)
        // - Dispatch food scrolls
        // - Activate job referrals
        // - Notify barangay coordinators
        // - Launch emotional support rituals

        emit AidDeployed(lastForecast, block.timestamp);
    }

    function resetAidTrigger() public {
        aidDeployed = false;
        emit AidReset(block.timestamp);
    }

    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(bytes(a)) == keccak256(bytes(b));
    }
}
