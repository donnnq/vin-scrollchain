// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AILaborDisruptionImmunityCodex {
    address public steward;

    struct ImmunityEntry {
        string jobSector;
        string disruptionType;
        string immunityMechanism;
        string emotionalTag;
    }

    ImmunityEntry[] public codex;

    event AILaborImmunityTagged(string jobSector, string disruptionType, string immunityMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagImmunity(
        string memory jobSector,
        string memory disruptionType,
        string memory immunityMechanism,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ImmunityEntry(jobSector, disruptionType, immunityMechanism, emotionalTag));
        emit AILaborImmunityTagged(jobSector, disruptionType, immunityMechanism, emotionalTag);
    }
}
