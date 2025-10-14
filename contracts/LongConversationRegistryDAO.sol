// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LongConversationRegistryDAO {
    address public admin;

    struct Episode {
        string speaker;
        string title;
        string season;
        string timestamp;
        bool archived;
    }

    Episode[] public episodes;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function registerEpisode(string memory _speaker, string memory _title, string memory _season, string memory _timestamp) external onlyAdmin {
        episodes.push(Episode(_speaker, _title, _season, _timestamp, false));
    }

    function archiveEpisode(uint256 index) external onlyAdmin {
        episodes[index].archived = true;
    }

    function getEpisode(uint256 index) external view returns (Episode memory) {
        return episodes[index];
    }
}
