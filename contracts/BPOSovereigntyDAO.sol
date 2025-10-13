// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract BPOSovereigntyDAO {
    address public steward;

    struct ExemptionEvent {
        string country;
        string diplomaticChannel; // "Ambassador", "Trade Mission", "Congress Lobby"
        string exemptionStatus; // "Requested", "Granted", "Pending"
        string emotionalTag;
        uint256 timestamp;
    }

    ExemptionEvent[] public events;

    event ExemptionLogged(
        string country,
        string diplomaticChannel,
        string exemptionStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log BPO sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logExemption(
        string memory country,
        string memory diplomaticChannel,
        string memory exemptionStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ExemptionEvent({
            country: country,
            diplomaticChannel: diplomaticChannel,
            exemptionStatus: exemptionStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ExemptionLogged(country, diplomaticChannel, exemptionStatus, emotionalTag, block.timestamp);
    }

    function getExemptionByIndex(uint256 index) external view returns (
        string memory country,
        string memory diplomaticChannel,
        string memory exemptionStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ExemptionEvent memory e = events[index];
        return (
            e.country,
            e.diplomaticChannel,
            e.exemptionStatus,
            e.emotionalTag,
            e.timestamp
        );
    }
}
