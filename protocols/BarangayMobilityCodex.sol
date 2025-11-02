// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayMobilityCodex {
    address public steward;

    struct MobilityClause {
        string barangay;
        string corridorType;
        string congestionLevel;
        string emotionalTag;
    }

    MobilityClause[] public codex;

    event MobilityLogged(string barangay, string corridorType, string congestionLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logMobility(
        string memory barangay,
        string memory corridorType,
        string memory congestionLevel,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(MobilityClause(barangay, corridorType, congestionLevel, emotionalTag));
        emit MobilityLogged(barangay, corridorType, congestionLevel, emotionalTag);
    }
}
