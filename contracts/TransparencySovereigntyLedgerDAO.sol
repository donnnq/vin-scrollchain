// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TransparencySovereigntyLedgerDAO {
    address public steward;

    struct SovereigntyEvent {
        string nation; // "Philippines"
        string actType; // "Footage Release", "Diplomatic Statement", "Restraint"
        string emotionalTag;
        uint256 timestamp;
    }

    SovereigntyEvent[] public events;

    event SovereigntyLogged(
        string nation,
        string actType,
        string emotionalTag,
        uint256 timestamp
    );

    modifier onlySteward() {
        require(msg.sender == steward, "Only Vinvin may log sovereignty rituals");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logSovereignty(
        string memory nation,
        string memory actType,
        string memory emotionalTag
    ) external onlySteward {
        events.push(SovereigntyEvent({
            nation: nation,
            actType: actType,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit SovereigntyLogged(nation, actType, emotionalTag, block.timestamp);
    }
}
