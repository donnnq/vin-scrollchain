// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressionalGridlockAuditDAO {
    address public steward;

    struct GridlockEntry {
        string chamber;
        string timestamp;
        string issue;
        string delayReason;
        string emotionalTag;
    }

    GridlockEntry[] public registry;

    event GridlockFlagged(string chamber, string timestamp, string issue, string delayReason, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function flagGridlock(
        string memory chamber,
        string memory timestamp,
        string memory issue,
        string memory delayReason,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(GridlockEntry(chamber, timestamp, issue, delayReason, emotionalTag));
        emit GridlockFlagged(chamber, timestamp, issue, delayReason, emotionalTag);
    }
}
