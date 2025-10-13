// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SupplyChainChokeholdProtocolDAO {
    address public steward;

    struct ChokeholdEvent {
        string companyName;
        string controlType;
        string affectedSector;
        string emotionalTag;
        uint256 timestamp;
    }

    ChokeholdEvent[] public events;

    event ChokeholdLogged(
        string companyName,
        string controlType,
        string affectedSector,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log supply chain chokehold rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logChokehold(
        string memory companyName,
        string memory controlType,
        string memory affectedSector,
        string memory emotionalTag
    ) external onlySteward {
        events.push(ChokeholdEvent({
            companyName: companyName,
            controlType: controlType,
            affectedSector: affectedSector,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ChokeholdLogged(companyName, controlType, affectedSector, emotionalTag, block.timestamp);
    }

    function getChokeholdByIndex(uint256 index) external view returns (
        string memory companyName,
        string memory controlType,
        string memory affectedSector,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        ChokeholdEvent memory c = events[index];
        return (
            c.companyName,
            c.controlType,
            c.affectedSector,
            c.emotionalTag,
            c.timestamp
        );
    }
}
