// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MergerEthicsTribunalDAO {
    address public steward;

    struct TribunalEntry {
        string mergerName;
        string corridor;
        string ethicsVerdict;
        string emotionalTag;
    }

    TribunalEntry[] public registry;

    event MergerJudged(string mergerName, string corridor, string ethicsVerdict, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function judgeMerger(
        string memory mergerName,
        string memory corridor,
        string memory ethicsVerdict,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TribunalEntry(mergerName, corridor, ethicsVerdict, emotionalTag));
        emit MergerJudged(mergerName, corridor, ethicsVerdict, emotionalTag);
    }
}
