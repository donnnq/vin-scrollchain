// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MarketExpansionPollingDAO {
    address public admin;

    struct PollEntry {
        string productName;
        string category;
        string emotionalTag;
        uint256 yesVotes;
        uint256 noVotes;
        bool summoned;
        bool closed;
        bool approvedForExpansion;
    }

    PollEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPoll(string memory productName, string memory category, string memory emotionalTag) external onlyAdmin {
        entries.push(PollEntry(productName, category, emotionalTag, 0, 0, true, false, false));
    }

    function voteYes(uint256 index) external onlyAdmin {
        entries[index].yesVotes += 1;
    }

    function voteNo(uint256 index) external onlyAdmin {
        entries[index].noVotes += 1;
    }

    function closePoll(uint256 index) external onlyAdmin {
        entries[index].closed = true;
        entries[index].approvedForExpansion = entries[index].yesVotes > entries[index].noVotes;
    }

    function getPollEntry(uint256 index) external view returns (PollEntry memory) {
        return entries[index];
    }
}
