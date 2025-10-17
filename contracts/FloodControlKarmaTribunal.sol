// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlKarmaTribunal {
    address public admin;

    struct TribunalEntry {
        string projectName;
        string region;
        string emotionalTag;
        bool summoned;
        bool judged;
    }

    TribunalEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTribunal(string memory projectName, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(TribunalEntry(projectName, region, emotionalTag, true, false));
    }

    function judgeProject(uint256 index) external onlyAdmin {
        entries[index].judged = true;
    }

    function getTribunal(uint256 index) external view returns (TribunalEntry memory) {
        return entries[index];
    }
}
