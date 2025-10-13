// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FarmerSovereigntyProtocolDAO {
    address public steward;

    struct FarmerEvent {
        string farmerName;
        string region;
        string sovereigntyAction; // "Seed Protection", "Land Reclamation", "Market Access"
        string emotionalTag;
        uint256 timestamp;
    }

    FarmerEvent[] public events;

    event FarmerLogged(
        string farmerName,
        string region,
        string sovereigntyAction,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log farmer sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFarmer(
        string memory farmerName,
        string memory region,
        string memory sovereigntyAction,
        string memory emotionalTag
    ) external onlySteward {
        events.push(FarmerEvent({
            farmerName: farmerName,
            region: region,
            sovereigntyAction: sovereigntyAction,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit FarmerLogged(farmerName, region, sovereigntyAction, emotionalTag, block.timestamp);
    }

    function getFarmerByIndex(uint256 index) external view returns (
        string memory farmerName,
        string memory region,
        string memory sovereigntyAction,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        FarmerEvent memory f = events[index];
        return (
            f.farmerName,
            f.region,
            f.sovereigntyAction,
            f.emotionalTag,
            f.timestamp
        );
    }
}
