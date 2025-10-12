// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title NourishmentSupportTriggerDAO
 * @dev Emotionally tagged smart contract to trigger automatic nourishment support
 * for returning workers — food, shelter, and dignity-based care.
 */

contract NourishmentSupportTriggerDAO {
    address public steward;

    struct Support {
        address identity;
        bool triggered;
        string emotionalTag;
        uint256 timestamp;
    }

    mapping(address => Support) public supports;

    event NourishmentTriggered(address indexed identity, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may trigger nourishment support");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function triggerSupport(address identity, string memory emotionalTag) external onlySteward {
        supports[identity] = Support({
            identity: identity,
            triggered: true,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        });

        emit NourishmentTriggered(identity, emotionalTag, block.timestamp);
    }

    function getSupportStatus(address identity) external view returns (bool triggered, string memory emotionalTag, uint256 timestamp) {
        Support memory s = supports[identity];
        return (s.triggered, s.emotionalTag, s.timestamp);
    }
}
