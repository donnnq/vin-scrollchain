// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GitHubRepoBreachTrackerDAO {
    address public admin;

    struct RepoEntry {
        string repoURL;
        string breachVector;
        string emotionalTag;
        bool summoned;
        bool flagged;
        bool sealed;
    }

    RepoEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRepo(string memory repoURL, string memory breachVector, string memory emotionalTag) external onlyAdmin {
        entries.push(RepoEntry(repoURL, breachVector, emotionalTag, true, false, false));
    }

    function flagRepo(uint256 index) external onlyAdmin {
        entries[index].flagged = true;
    }

    function sealRepo(uint256 index) external onlyAdmin {
        require(entries[index].flagged, "Must be flagged first");
        entries[index].sealed = true;
    }

    function getRepoEntry(uint256 index) external view returns (RepoEntry memory) {
        return entries[index];
    }
}
