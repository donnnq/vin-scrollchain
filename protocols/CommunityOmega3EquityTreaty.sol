// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityOmega3EquityTreaty {
    address public steward;

    struct OmegaClause {
        string barangay;
        string fishType;
        string equityStatus;
        string emotionalTag;
    }

    OmegaClause[] public treatyLog;

    event Omega3EquityTagged(string barangay, string fishType, string equityStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOmega3Equity(
        string memory barangay,
        string memory fishType,
        string memory equityStatus,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(OmegaClause(barangay, fishType, equityStatus, emotionalTag));
        emit Omega3EquityTagged(barangay, fishType, equityStatus, emotionalTag);
    }
}
