// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PCGGLegacyDAO {
    address public steward;

    struct LegacyEntry {
        string caseName;
        string officialName;
        string recoveryStatus;
        string emotionalTag;
    }

    LegacyEntry[] public registry;

    event LegacyLogged(string caseName, string officialName, string recoveryStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function logLegacy(
        string memory caseName,
        string memory officialName,
        string memory recoveryStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LegacyEntry(caseName, officialName, recoveryStatus, emotionalTag));
        emit LegacyLogged(caseName, officialName, recoveryStatus, emotionalTag);
    }
}
