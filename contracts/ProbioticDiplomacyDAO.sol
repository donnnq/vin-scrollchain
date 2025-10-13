// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ProbioticDiplomacyDAO {
    address public steward;

    struct DiplomacyEvent {
        string fermentName;
        string originCulture;
        string diplomaticUse; // "Peace Offering", "Healing Treaty", "Cultural Exchange"
        string emotionalTag;
        uint256 timestamp;
    }

    DiplomacyEvent[] public events;

    event DiplomacyLogged(
        string fermentName,
        string originCulture,
        string diplomaticUse,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log probiotic diplomacy rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logDiplomacy(
        string memory fermentName,
        string memory originCulture,
        string memory diplomaticUse,
        string memory emotionalTag
    ) external onlySteward {
        events.push(DiplomacyEvent({
            fermentName: fermentName,
            originCulture: originCulture,
            diplomaticUse: diplomaticUse,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit DiplomacyLogged(fermentName, originCulture, diplomaticUse, emotionalTag, block.timestamp);
    }

    function getDiplomacyByIndex(uint256 index) external view returns (
        string memory fermentName,
        string memory originCulture,
        string memory diplomaticUse,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        DiplomacyEvent memory d = events[index];
        return (
            d.fermentName,
            d.originCulture,
            d.diplomaticUse,
            d.emotionalTag,
            d.timestamp
        );
    }
}
