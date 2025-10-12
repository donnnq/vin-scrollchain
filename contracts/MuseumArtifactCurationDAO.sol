// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MuseumArtifactCurationDAO
 * @dev Emotionally tagged smart contract to log museum artifact entries,
 * exhibit deployments, and cultural resonance — scrollchain-sealed legacy.
 */

contract MuseumArtifactCurationDAO {
    address public steward;

    struct Artifact {
        address curator;
        string exhibitTitle;
        string originRegion;
        string emotionalTag;
        uint256 timestamp;
    }

    Artifact[] public artifacts;

    event ArtifactLogged(address indexed curator, string exhibitTitle, string originRegion, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log museum artifacts");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logArtifact(address curator, string memory exhibitTitle, string memory originRegion, string memory emotionalTag) external onlySteward {
        artifacts.push(Artifact({
            curator: curator,
            exhibitTitle: exhibitTitle,
            originRegion: originRegion,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit ArtifactLogged(curator, exhibitTitle, originRegion, emotionalTag, block.timestamp);
    }

    function getArtifactByIndex(uint256 index) external view returns (address curator, string memory exhibitTitle, string memory originRegion, string memory emotionalTag, uint256 timestamp) {
        require(index < artifacts.length, "Scrollstorm index out of bounds");
        Artifact memory a = artifacts[index];
        return (a.curator, a.exhibitTitle, a.originRegion, a.emotionalTag, a.timestamp);
    }
}
