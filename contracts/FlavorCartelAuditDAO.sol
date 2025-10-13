// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FlavorCartelAuditDAO {
    address public steward;

    struct CartelEvent {
        string spiceName;
        string controllingEntity;
        string cartelType; // "Price Fixing", "Supply Hoarding", "Brand Monopoly"
        string emotionalTag;
        uint256 timestamp;
    }

    CartelEvent[] public events;

    event CartelLogged(
        string spiceName,
        string controllingEntity,
        string cartelType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log flavor cartel rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logCartel(
        string memory spiceName,
        string memory controllingEntity,
        string memory cartelType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(CartelEvent({
            spiceName: spiceName,
            controllingEntity: controllingEntity,
            cartelType: cartelType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit CartelLogged(spiceName, controllingEntity, cartelType, emotionalTag, block.timestamp);
    }

    function getCartelByIndex(uint256 index) external view returns (
        string memory spiceName,
        string memory controllingEntity,
        string memory cartelType,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        CartelEvent memory c = events[index];
        return (
            c.spiceName,
            c.controllingEntity,
            c.cartelType,
            c.emotionalTag,
            c.timestamp
        );
    }
}
