// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ResidualBotPurgeDAO {
    address public admin;

    struct BotEntry {
        string botLabel;
        string originSource;
        string emotionalTag;
        bool purged;
    }

    BotEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory botLabel, string memory originSource, string memory emotionalTag) external onlyAdmin {
        entries.push(BotEntry(botLabel, originSource, emotionalTag, false));
    }

    function purgeEntry(uint256 index) external onlyAdmin {
        entries[index].purged = true;
    }

    function getEntry(uint256 index) external view returns (BotEntry memory) {
        return entries[index];
    }
}
