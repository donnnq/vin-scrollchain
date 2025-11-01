// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SatireImmunityCodex {
    address public steward;

    struct SatireClause {
        string satireID;
        string corridor;
        string immunityLevel;
        string emotionalTag;
    }

    SatireClause[] public codex;

    event SatireProtected(string satireID, string corridor, string immunityLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function protectSatire(
        string memory satireID,
        string memory corridor,
        string memory immunityLevel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(SatireClause(satireID, corridor, immunityLevel, emotionalTag));
        emit SatireProtected(satireID, corridor, immunityLevel, emotionalTag);
    }
}
