// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArcticFrostOversightDAO {
    address public steward;

    struct OversightEntry {
        string projectReference;
        string oversightSignal;
        string auditMechanism;
        string emotionalTag;
    }

    OversightEntry[] public registry;

    event ArcticFrostOversightTagged(string projectReference, string oversightSignal, string auditMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagOversight(
        string memory projectReference,
        string memory oversightSignal,
        string memory auditMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(OversightEntry(projectReference, oversightSignal, auditMechanism, emotionalTag));
        emit ArcticFrostOversightTagged(projectReference, oversightSignal, auditMechanism, emotionalTag);
    }
}
