// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TariffShockResilienceDAO {
    address public steward;

    struct ResilienceEntry {
        string exportSector;
        string shockType;
        string mitigationStrategy;
        string emotionalTag;
    }

    ResilienceEntry[] public registry;

    event TariffShockTagged(string exportSector, string shockType, string mitigationStrategy, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagShockResilience(
        string memory exportSector,
        string memory shockType,
        string memory mitigationStrategy,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResilienceEntry(exportSector, shockType, mitigationStrategy, emotionalTag));
        emit TariffShockTagged(exportSector, shockType, mitigationStrategy, emotionalTag);
    }
}
