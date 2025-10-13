// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ClimateAlignedFarmingDAO {
    address public steward;

    struct FarmingEvent {
        string farmName;
        string region;
        string alignmentType; // "Regenerative", "Organic", "Agroecological"
        string climateBenefit; // "Carbon Sequestration", "Water Conservation", "Biodiversity"
        string emotionalTag;
        uint256 timestamp;
    }

    FarmingEvent[] public events;

    event FarmingLogged(
        string farmName,
        string region,
        string alignmentType,
        string climateBenefit,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log climate farming rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logFarming(
        string memory farmName,
        string memory region,
        string memory alignmentType,
        string memory climateBenefit,
        string memory emotionalTag
    ) external onlySteward {
        events.push(FarmingEvent({
            farmName: farmName,
            region: region,
            alignmentType: alignmentType,
            climateBenefit: climateBenefit,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit FarmingLogged(farmName, region, alignmentType, climateBenefit, emotionalTag, block.timestamp);
    }

    function getFarmingByIndex(uint256 index) external view returns (
        string memory farmName,
        string memory region,
        string memory alignmentType,
        string memory climateBenefit,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        FarmingEvent memory f = events[index];
        return (
            f.farmName,
            f.region,
            f.alignmentType,
            f.climateBenefit,
            f.emotionalTag,
            f.timestamp
        );
    }
}
