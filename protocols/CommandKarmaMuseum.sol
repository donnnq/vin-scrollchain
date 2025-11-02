// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommandKarmaMuseum {
    address public steward;

    struct KarmaArtifact {
        string officialName;
        string corridor;
        string karmaType;
        string emotionalTag;
    }

    KarmaArtifact[] public registry;

    event KarmaArchived(string officialName, string corridor, string karmaType, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function archiveKarma(
        string memory officialName,
        string memory corridor,
        string memory karmaType,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(KarmaArtifact(officialName, corridor, karmaType, emotionalTag));
        emit KarmaArchived(officialName, corridor, karmaType, emotionalTag);
    }
}
