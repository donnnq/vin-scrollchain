// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicWorksTransparencyDAO {
    address public steward;

    struct TransparencyEntry {
        string projectReference;
        string transparencySignal;
        string auditMechanism;
        string emotionalTag;
    }

    TransparencyEntry[] public registry;

    event PublicWorksTransparencyTagged(string projectReference, string transparencySignal, string auditMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTransparency(
        string memory projectReference,
        string memory transparencySignal,
        string memory auditMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TransparencyEntry(projectReference, transparencySignal, auditMechanism, emotionalTag));
        emit PublicWorksTransparencyTagged(projectReference, transparencySignal, auditMechanism, emotionalTag);
    }
}
