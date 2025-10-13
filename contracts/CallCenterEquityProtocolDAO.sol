// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CallCenterEquityProtocolDAO {
    address public steward;

    struct EquityEvent {
        string companyName;
        string hostCountry;
        string laborCorridor; // "Voice", "Tech Support", "Back Office"
        string equityStatus; // "Protected", "Threatened", "Exempted"
        string emotionalTag;
        uint256 timestamp;
    }

    EquityEvent[] public events;

    event EquityLogged(
        string companyName,
        string hostCountry,
        string laborCorridor,
        string equityStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log call center equity rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logEquity(
        string memory companyName,
        string memory hostCountry,
        string memory laborCorridor,
        string memory equityStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(EquityEvent({
            companyName: companyName,
            hostCountry: hostCountry,
            laborCorridor: laborCorridor,
            equityStatus: equityStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit EquityLogged(companyName, hostCountry, laborCorridor, equityStatus, emotionalTag, block.timestamp);
    }

    function getEquityByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory hostCountry,
        string memory laborCorridor,
        string memory equityStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        EquityEvent memory e = events[index];
        return (
            e.companyName,
            e.hostCountry,
            e.laborCorridor,
            e.equityStatus,
            e.emotionalTag,
            e.timestamp
        );
    }
}
