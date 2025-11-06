// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SierraMadreDeforestationAuditProtocol {
    address public steward;

    struct DeforestationEntry {
        string location;
        string satelliteSource;
        string damageExtent;
        string emotionalTag;
    }

    DeforestationEntry[] public protocol;

    event DeforestationTagged(string location, string satelliteSource, string damageExtent, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagDeforestation(
        string memory location,
        string memory satelliteSource,
        string memory damageExtent,
        string memory emotionalTag
    ) public onlySteward {
        protocol.push(DeforestationEntry(location, satelliteSource, damageExtent, emotionalTag));
        emit DeforestationTagged(location, satelliteSource, damageExtent, emotionalTag);
    }
}
