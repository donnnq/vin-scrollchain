// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicDisqualificationEthicsCodex {
    address public steward;

    struct DisqualificationClause {
        string targetName;
        string corridor;
        string disqualificationBasis;
        string emotionalTag;
    }

    DisqualificationClause[] public codex;

    event DisqualificationTagged(string targetName, string corridor, string disqualificationBasis, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagDisqualification(
        string memory targetName,
        string memory corridor,
        string memory disqualificationBasis,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(DisqualificationClause(targetName, corridor, disqualificationBasis, emotionalTag));
        emit DisqualificationTagged(targetName, corridor, disqualificationBasis, emotionalTag);
    }
}
