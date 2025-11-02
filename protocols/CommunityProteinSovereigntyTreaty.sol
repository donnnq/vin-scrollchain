// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityProteinSovereigntyTreaty {
    address public steward;

    struct ProteinClause {
        string barangay;
        string proteinSource;
        string sovereigntyStatus;
        string emotionalTag;
    }

    ProteinClause[] public treatyLog;

    event ProteinSovereigntyTagged(string barangay, string proteinSource, string sovereigntyStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagProteinSovereignty(
        string memory barangay,
        string memory proteinSource,
        string memory sovereigntyStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(ProteinClause(barangay, proteinSource, sovereigntyStatus, emotionalTag));
        emit ProteinSovereigntyTagged(barangay, proteinSource, sovereigntyStatus, emotionalTag);
    }
}
