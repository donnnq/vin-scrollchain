// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiasporaNourishmentTreaty {
    address public steward;

    struct NourishmentEntry {
        string diasporaGroup;
        string corridor;
        string nourishmentType;
        string emotionalTag;
    }

    NourishmentEntry[] public treatyLog;

    event NourishmentTagged(string diasporaGroup, string corridor, string nourishmentType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagNourishment(
        string memory diasporaGroup,
        string memory corridor,
        string memory nourishmentType,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(NourishmentEntry(diasporaGroup, corridor, nourishmentType, emotionalTag));
        emit NourishmentTagged(diasporaGroup, corridor, nourishmentType, emotionalTag);
    }
}
