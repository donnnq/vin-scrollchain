// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicSchoolResilienceDAO {
    address public steward;

    struct ResilienceEntry {
        string schoolName;
        string resilienceSignal;
        string supportMechanism;
        string emotionalTag;
    }

    ResilienceEntry[] public registry;

    event PublicSchoolResilienceTagged(string schoolName, string resilienceSignal, string supportMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagResilience(
        string memory schoolName,
        string memory resilienceSignal,
        string memory supportMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ResilienceEntry(schoolName, resilienceSignal, supportMechanism, emotionalTag));
        emit PublicSchoolResilienceTagged(schoolName, resilienceSignal, supportMechanism, emotionalTag);
    }
}
