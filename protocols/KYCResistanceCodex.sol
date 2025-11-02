// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KYCResistanceCodex {
    address public steward;

    struct ResistanceEntry {
        string coinName;
        string corridor;
        string resistanceType;
        string emotionalTag;
    }

    ResistanceEntry[] public codex;

    event ResistanceTagged(string coinName, string corridor, string resistanceType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagResistance(
        string memory coinName,
        string memory corridor,
        string memory resistanceType,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ResistanceEntry(coinName, corridor, resistanceType, emotionalTag));
        emit ResistanceTagged(coinName, corridor, resistanceType, emotionalTag);
    }
}
