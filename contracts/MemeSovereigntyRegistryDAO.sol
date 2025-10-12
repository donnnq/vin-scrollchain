// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title MemeSovereigntyRegistryDAO
 * @dev Emotionally tagged smart contract to log meme deployments,
 * remix lineage, and cultural resonance — scrollchain-sealed sovereignty.
 */

contract MemeSovereigntyRegistryDAO {
    address public steward;

    struct Meme {
        address creator;
        string memeTitle;
        string originPlatform;
        string emotionalTag;
        uint256 timestamp;
    }

    Meme[] public memes;

    event MemeLogged(address indexed creator, string memeTitle, string originPlatform, string emotionalTag, uint256 timestamp);

    modifier onlySteward() {
        require(msg.sender == steward, "Only BatVin may log meme sovereignty");
        _;
    }

    constructor() {
        steward = msg.sender;
    }

    function logMeme(address creator, string memory memeTitle, string memory originPlatform, string memory emotionalTag) external onlySteward {
        memes.push(Meme({
            creator: creator,
            memeTitle: memeTitle,
            originPlatform: originPlatform,
            emotionalTag: emotionalTag,
            timestamp: block.timestamp
        }));

        emit MemeLogged(creator, memeTitle, originPlatform, emotionalTag, block.timestamp);
    }

    function getMemeByIndex(uint256 index) external view returns (address creator, string memory memeTitle, string memory originPlatform, string memory emotionalTag, uint256 timestamp) {
        require(index < memes.length, "Scrollstorm index out of bounds");
        Meme memory m = memes[index];
        return (m.creator, m.memeTitle, m.originPlatform, m.emotionalTag, m.timestamp);
    }
}
