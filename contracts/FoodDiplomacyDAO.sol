// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract FoodDiplomacyDAO {
    address public steward;

    struct TreatyEvent {
        string dishName;
        string originNation;
        string diplomaticUse; // "Peace Offering", "Trade Ritual", "Cultural Exchange"
        string emotionalTag;
        uint256 timestamp;
    }

    TreatyEvent[] public events;

    event TreatyLogged(
        string dishName,
        string originNation,
        string diplomaticUse,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log food diplomacy rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTreaty(
        string memory dishName,
        string memory originNation,
        string memory diplomaticUse,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TreatyEvent({
            dishName: dishName,
            originNation: originNation,
            diplomaticUse: diplomaticUse,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TreatyLogged(dishName, originNation, diplomaticUse, emotionalTag, block.timestamp);
    }

    function getTreatyByIndex(uint256 index) external view returns (
        string memory dishName,
        string memory originNation,
        string memory diplomaticUse,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TreatyEvent memory t = events[index];
        return (
            t.dishName,
            t.originNation,
            t.diplomaticUse,
            t.emotionalTag,
            t.timestamp
        );
    }
}
