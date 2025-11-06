// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIWorkerProtectionTreaty {
    address public steward;

    struct ProtectionEntry {
        string laborSector;
        string displacementRisk;
        string protectionProtocol;
        string emotionalTag;
    }

    ProtectionEntry[] public treaty;

    event AIWorkerProtectionTagged(string laborSector, string displacementRisk, string protectionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagProtection(
        string memory laborSector,
        string memory displacementRisk,
        string memory protectionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        treaty.push(ProtectionEntry(laborSector, displacementRisk, protectionProtocol, emotionalTag));
        emit AIWorkerProtectionTagged(laborSector, displacementRisk, protectionProtocol, emotionalTag);
    }
}
