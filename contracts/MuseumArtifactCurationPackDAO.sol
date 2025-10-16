// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MuseumArtifactCurationPackDAO {
    address public admin;

    struct ArtifactEntry {
        string artifactLabel;
        string curationClause;
        string emotionalTag;
        bool archived;
    }

    ArtifactEntry[] public artifacts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _artifactLabel, string memory _curationClause, string memory _emotionalTag) external onlyAdmin {
        artifacts.push(ArtifactEntry(_artifactLabel, _curationClause, _emotionalTag, false));
    }

    function archiveEntry(uint256 index) external onlyAdmin {
        artifacts[index].archived = true;
    }

    function getEntry(uint256 index) external view returns (ArtifactEntry memory) {
        return artifacts[index];
    }
}
