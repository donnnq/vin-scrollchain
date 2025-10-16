// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommunityBoostRegistry {
    address public admin;

    struct BoostEntry {
        string gameTitle;
        string contributorName;
        uint256 amount;
        string emotionalTag;
        bool received;
    }

    BoostEntry[] public boosts;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitBoost(string memory gameTitle, string memory contributorName, uint256 amount, string memory emotionalTag) external onlyAdmin {
        boosts.push(BoostEntry(gameTitle, contributorName, amount, emotionalTag, false));
    }

    function markReceived(uint256 index) external onlyAdmin {
        boosts[index].received = true;
    }

    function getBoost(uint256 index) external view returns (BoostEntry memory) {
        return boosts[index];
    }
}
