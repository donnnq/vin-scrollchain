// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OrbitalRefugeCodex {
    address public steward;

    struct RefugeEntry {
        string refugeType;
        string threatScenario;
        string sanctuaryProtocol;
        string emotionalTag;
    }

    RefugeEntry[] public codex;

    event OrbitalRefugeLogged(string refugeType, string threatScenario, string sanctuaryProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logRefuge(
        string memory refugeType,
        string memory threatScenario,
        string memory sanctuaryProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(RefugeEntry(refugeType, threatScenario, sanctuaryProtocol, emotionalTag));
        emit OrbitalRefugeLogged(refugeType, threatScenario, sanctuaryProtocol, emotionalTag);
    }
}
