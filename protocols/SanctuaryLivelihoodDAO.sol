// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SanctuaryLivelihoodDAO {
    address public steward;

    struct LivelihoodEntry {
        string sanctuaryName;
        string livelihoodType;
        string sustainabilityProtocol;
        string emotionalTag;
    }

    LivelihoodEntry[] public registry;

    event SanctuaryLivelihoodTagged(string sanctuaryName, string livelihoodType, string sustainabilityProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLivelihood(
        string memory sanctuaryName,
        string memory livelihoodType,
        string memory sustainabilityProtocol,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LivelihoodEntry(sanctuaryName, livelihoodType, sustainabilityProtocol, emotionalTag));
        emit SanctuaryLivelihoodTagged(sanctuaryName, livelihoodType, sustainabilityProtocol, emotionalTag);
    }
}
