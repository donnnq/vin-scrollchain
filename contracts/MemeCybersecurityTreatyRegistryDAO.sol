// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MemeCybersecurityTreatyRegistryDAO {
    address public steward;

    struct TreatyEvent {
        string treatyName;
        string memeClause; // "Satire Immunity", "Parody Amplification", "Reaction Thread Protection"
        string signatoryNation;
        string enforcementStatus; // "Ratified", "Pending", "Violated"
        string emotionalTag;
        uint256 timestamp;
    }

    TreatyEvent[] public events;

    event TreatyLogged(
        string treatyName,
        string memeClause,
        string signatoryNation,
        string enforcementStatus,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log meme treaty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logTreaty(
        string memory treatyName,
        string memory memeClause,
        string memory signatoryNation,
        string memory enforcementStatus,
        string memory emotionalTag
    ) external onlySteward {
        events.push(TreatyEvent({
            treatyName: treatyName,
            memeClause: memeClause,
            signatoryNation: signatoryNation,
            enforcementStatus: enforcementStatus,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit TreatyLogged(treatyName, memeClause, signatoryNation, enforcementStatus, emotionalTag, block.timestamp);
    }

    function getTreatyByIndex(uint256 index) external view returns (
        string memory treatyName,
        string memory memeClause,
        string memory signatoryNation,
        string memory enforcementStatus,
        string memory emotionalTag,
        uint256 timestamp
    ) {
        require(index < events.length, "Scrollstorm index out of bounds");
        TreatyEvent memory t = events[index];
        return (
            t.treatyName,
            t.memeClause,
            t.signatoryNation,
            t.enforcementStatus,
            t.emotionalTag,
            t.timestamp
        );
    }
}
