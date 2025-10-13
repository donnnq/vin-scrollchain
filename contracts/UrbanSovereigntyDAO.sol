// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title UrbanSovereigntyDAO
 * @dev Emotionally tagged smart contract to log city governance rituals,
 * sovereignty assertions, and civic integrity audits — scrollchain-sealed consequence.
 */

contract UrbanSovereigntyDAO {
    address public steward;

    struct SovereigntyEvent {
        address initiator;
        string cityName;
        string governanceAction; // "Policy Declaration", "Security Protocol", "Foreign Influence Block"
        string emotionalTag;
        uint256 timestamp;
    }

    SovereigntyEvent[] public events;

    event SovereigntyLogged(address indexed initiator, string cityName, string governanceAction, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log urban sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSovereignty(address initiator, string memory cityName, string memory governanceAction, string memory emotionalTag) external onlySteward {
        events.push(SovereigntyEvent({
            initiator: initiator,
            cityName: cityName,
            governanceAction: governanceAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SovereigntyLogged(initiator, cityName, governanceAction, emotionalTag, block.timestamp);
    }

    function getSovereigntyByIndex(uint256 index) external view returns (address initiator, string memory cityName, string memory governanceAction, string memory emotionalTag, uint256 timestamp) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SovereigntyEvent memory s = events[index];
        return (s.initiator, s.cityName, s.governanceAction, s.emotionalTag, s.timestamp);
    }
}
