// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CulturalArtifactProtectionCodex {
    address public steward;

    struct ArtifactClause {
        string artifactName;
        string threatType;
        string protectionProtocol;
        string emotionalTag;
    }

    ArtifactClause[] public codex;

    event CulturalArtifactProtected(string artifactName, string threatType, string protectionProtocol, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function protectArtifact(
        string memory artifactName,
        string memory threatType,
        string memory protectionProtocol,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(ArtifactClause(artifactName, threatType, protectionProtocol, emotionalTag));
        emit CulturalArtifactProtected(artifactName, threatType, protectionProtocol, emotionalTag);
    }
}
