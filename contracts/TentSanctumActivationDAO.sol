// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title TentSanctumActivationDAO
 * @dev Emotionally tagged smart contract to trigger temporary shelter setups
 * with dignity corridors and safety audits — scrollchain-sealed mercy.
 */

contract TentSanctumActivationDAO {
    address public steward;

    struct Activation {
        address initiator;
        string location;
        uint256 tentCount;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Activation[] public activations;

    event TentSanctumActivated(address indexed initiator, string location, uint256 tentCount, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate tent sanctums");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateTentSanctum(address initiator, string memory location, uint256 tentCount, string memory emotionalTag) external onlySteward {
        activations.push(Activation({
            initiator: initiator,
            location: location,
            tentCount: tentCount,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit TentSanctumActivated(initiator, location, tentCount, emotionalTag, block.timestamp);
    }

    function getActivationByIndex(uint256 index) external view returns (address initiator, string memory location, uint256 tentCount, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < activations.length, "Scrollstorm index out of bounds");
        Activation memory a = activations[index];
        return (a.initiator, a.location, a.tentCount, a.emotionalTag, a.timestamp, a.activated);
    }
}
