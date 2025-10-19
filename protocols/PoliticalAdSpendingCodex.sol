// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PoliticalAdSpendingCodex {
    address public admin;

    struct AdEntry {
        string candidateName;
        string platform;
        uint256 amountSpent;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    AdEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAdSpending(string memory candidateName, string memory platform, uint256 amountSpent, string memory emotionalTag) external onlyAdmin {
        entries.push(AdEntry(candidateName, platform, amountSpent, emotionalTag, true, false, false));
    }

    function verifyAdSpending(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealAdSpending(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getAdEntry(uint256 index) external view returns (AdEntry memory) {
        return entries[index];
    }
}
