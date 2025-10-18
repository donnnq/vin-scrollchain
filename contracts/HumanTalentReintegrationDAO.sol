// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanTalentReintegrationDAO {
    address public admin;

    struct ReintegrationEntry {
        string companyName;
        string roleRestored;
        string emotionalTag;
        bool summoned;
        bool completed;
    }

    ReintegrationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReintegration(string memory companyName, string memory roleRestored, string memory emotionalTag) external onlyAdmin {
        entries.push(ReintegrationEntry(companyName, roleRestored, emotionalTag, true, false));
    }

    function completeReintegration(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function getReintegrationEntry(uint256 index) external view returns (ReintegrationEntry memory) {
        return entries[index];
    }
}
