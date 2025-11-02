// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnionSovereigntyIndexDAO {
    address public steward;

    struct SovereigntyEntry {
        string unionName;
        string corridor;
        uint256 sovereigntyScore;
        string emotionalTag;
    }

    SovereigntyEntry[] public index;

    event SovereigntyLogged(string unionName, string corridor, uint256 sovereigntyScore, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logSovereignty(
        string memory unionName,
        string memory corridor,
        uint256 sovereigntyScore,
        string memory emotionalTag
    ) public onlySteward {
        index.push(SovereigntyEntry(unionName, corridor, sovereigntyScore, emotionalTag));
        emit SovereigntyLogged(unionName, corridor, sovereigntyScore, emotionalTag);
    }
}
