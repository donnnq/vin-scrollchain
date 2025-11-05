// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VeteranLivelihoodSovereigntyDAO {
    address public steward;

    struct LivelihoodEntry {
        string veteranName;
        string livelihoodType;
        string sustainabilityProtocol;
        string emotionalTag;
    }

    LivelihoodEntry[] public registry;

    event VeteranLivelihoodTagged(string veteranName, string livelihoodType, string sustainabilityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLivelihood(
        string memory veteranName,
        string memory livelihoodType,
        string memory sustainabilityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LivelihoodEntry(veteranName, livelihoodType, sustainabilityProtocol, emotionalTag));
        emit VeteranLivelihoodTagged(veteranName, livelihoodType, sustainabilityProtocol, emotionalTag);
    }
}
