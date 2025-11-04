// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlIntegrityDAO {
    address public steward;

    struct IntegrityEntry {
        string projectName;
        string location;
        string integritySignal;
        string emotionalTag;
    }

    IntegrityEntry[] public registry;

    event FloodControlIntegrityTagged(string projectName, string location, string integritySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagIntegrity(
        string memory projectName,
        string memory location,
        string memory integritySignal,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(IntegrityEntry(projectName, location, integritySignal, emotionalTag));
        emit FloodControlIntegrityTagged(projectName, location, integritySignal, emotionalTag);
    }
}
