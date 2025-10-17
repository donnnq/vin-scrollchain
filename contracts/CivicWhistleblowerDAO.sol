// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CivicWhistleblowerDAO {
    address public admin;

    struct WhistleblowerEntry {
        string name;
        string issueExposed;
        string emotionalTag;
        bool protected;
        bool validated;
    }

    WhistleblowerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectWhistleblower(string memory name, string memory issueExposed, string memory emotionalTag) external onlyAdmin {
        entries.push(WhistleblowerEntry(name, issueExposed, emotionalTag, true, false));
    }

    function validateExposure(uint256 index) external onlyAdmin {
        entries[index].validated = true;
    }

    function getWhistleblower(uint256 index) external view returns (WhistleblowerEntry memory) {
        return entries[index];
    }
}
