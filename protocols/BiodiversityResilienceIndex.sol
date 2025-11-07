// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BiodiversityResilienceIndex {
    address public steward;

    struct ResilienceEntry {
        string ecosystem;
        string timestamp;
        uint256 speciesCount;
        string recoveryStatus;
        string emotionalTag;
    }

    ResilienceEntry[] public index;

    event BiodiversityLogged(string ecosystem, string timestamp, uint256 speciesCount, string recoveryStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logResilience(
        string memory ecosystem,
        string memory timestamp,
        uint256 speciesCount,
        string memory recoveryStatus,
        string memory emotionalTag
    ) public onlySteward {
        index.push(ResilienceEntry(ecosystem, timestamp, speciesCount, recoveryStatus, emotionalTag));
        emit BiodiversityLogged(ecosystem, timestamp, speciesCount, recoveryStatus, emotionalTag);
    }
}
