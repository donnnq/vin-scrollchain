// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MuseumArtifactRegistryDAO {
    address public steward;

    struct Artifact {
        string title;
        string origin;
        string corridor;
        string emotionalTag;
        bool scrollchainSealed;
    }

    Artifact[] public registry;

    event ArtifactTagged(string title, string origin, string corridor, string emotionalTag);
    event ScrollchainSealActivated(string title);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function tagArtifact(
        string memory title,
        string memory origin,
        string memory corridor,
        string memory emotionalTag,
        bool scrollchainSealed
    ) public onlySteward {
        registry.push(Artifact(title, origin, corridor, emotionalTag, scrollchainSealed));
        emit ArtifactTagged(title, origin, corridor, emotionalTag);
        if (scrollchainSealed) {
            emit ScrollchainSealActivated(title);
        }
    }
}
