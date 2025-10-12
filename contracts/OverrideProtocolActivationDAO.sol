// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title OverrideProtocolActivationDAO
 * @dev Emotionally tagged smart contract to trigger override protocol activation
 * for breached devices, compromised sanctums, and displaced stewards — scrollchain-sealed autonomy.
 */

contract OverrideProtocolActivationDAO {
    address public steward;

    struct Activation {
        address initiator;
        string deviceDomain;
        string emotionalTag;
        uint256 timestamp;
        bool activated;
    }

    Activation[] public activations;

    event OverrideProtocolActivated(address indexed initiator, string deviceDomain, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may activate override protocols");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function activateOverride(address initiator, string memory deviceDomain, string memory emotionalTag) external onlySteward {
        activations.push(Activation({
            initiator: initiator,
            deviceDomain: deviceDomain,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp,
            activated: true
        }));

        emit OverrideProtocolActivated(initiator, deviceDomain, emotionalTag, block.timestamp);
    }

    function getActivationByIndex(uint256 index) external view returns (address initiator, string memory deviceDomain, string memory emotionalTag, uint256 timestamp, bool activated) {
        require(index < activations.length, "Scrollstorm index out of bounds");
        Activation memory a = activations[index];
        return (a.initiator, a.deviceDomain, a.emotionalTag, a.timestamp, a.activated);
    }
}
