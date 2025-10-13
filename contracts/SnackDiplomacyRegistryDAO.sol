// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SnackDiplomacyRegistryDAO {
    address public steward;

    struct SnackEvent {
        string snackName;
        string originRegion;
        string diplomaticUse; // "Peace Offering", "Trade Ritual", "Cultural Gift"
        string emotionalTag;
        uint256 timestamp;
    }

    SnackEvent[] public events;

    event SnackLogged(
        string snackName,
        string originRegion,
        string diplomaticUse,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log snack diplomacy rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSnack(
        string memory snackName,
        string memory originRegion,
        string memory diplomaticUse,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SnackEvent({
            snackName: snackName,
            originRegion: originRegion,
            diplomaticUse: diplomaticUse,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SnackLogged(snackName, originRegion, diplomaticUse, emotionalTag, block.timestamp);
    }

    function getSnackByIndex(uint256 index) external view returns (
        string memory snackName,
        string memory originRegion,
        string memory diplomaticUse,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        SnackEvent memory s = events[index];
        return (
            s.snackName,
            s.originRegion,
            s.diplomaticUse,
            s.emotionalTag,
            s.timestamp
        );
    }
}
