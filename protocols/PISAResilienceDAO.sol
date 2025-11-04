// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PISAResilienceDAO {
    address public steward;

    struct ResilienceEntry {
        string region;
        string subjectDomain;
        string resilienceMechanism;
        string emotionalTag;
    }

    ResilienceEntry[] public registry;

    event PISAResilienceTagged(string region, string subjectDomain, string resilienceMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory region,
        string memory subjectDomain,
        string memory resilienceMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResilienceEntry(region, subjectDomain, resilienceMechanism, emotionalTag));
        emit PISAResilienceTagged(region, subjectDomain, resilienceMechanism, emotionalTag);
    }
}
