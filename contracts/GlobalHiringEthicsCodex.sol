// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalHiringEthicsCodex {
    address public admin;

    struct EthicsEntry {
        string companyName;
        string hiringPractice;
        string emotionalTag;
        bool summoned;
        bool reviewed;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthicsReview(string memory companyName, string memory hiringPractice, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(companyName, hiringPractice, emotionalTag, true, false));
    }

    function reviewEthics(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
