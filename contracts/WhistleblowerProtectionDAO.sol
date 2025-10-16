// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WhistleblowerProtectionDAO {
    address public admin;

    struct WhistleblowerEntry {
        string aliasLabel;
        string testimonySummary;
        string emotionalTag;
        bool verified;
        bool protected;
    }

    WhistleblowerEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitTestimony(string memory aliasLabel, string memory testimonySummary, string memory emotionalTag) external onlyAdmin {
        entries.push(WhistleblowerEntry(aliasLabel, testimonySummary, emotionalTag, false, false));
    }

    function verifyTestimony(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function grantProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function getEntry(uint256 index) external view returns (WhistleblowerEntry memory) {
        return entries[index];
    }
}
