// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorporateLayoffKarmaTribunal {
    address public steward;

    struct TribunalEntry {
        string companyName;
        string corridor;
        uint256 layoffCount;
        string karmaVerdict;
        string emotionalTag;
    }

    TribunalEntry[] public registry;

    event LayoffJudged(string companyName, string corridor, uint256 layoffCount, string karmaVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function judgeLayoff(
        string memory companyName,
        string memory corridor,
        uint256 layoffCount,
        string memory karmaVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TribunalEntry(companyName, corridor, layoffCount, karmaVerdict, emotionalTag));
        emit LayoffJudged(companyName, corridor, layoffCount, karmaVerdict, emotionalTag);
    }
}
