// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OFWPensionCodex {
    address public admin;

    struct PensionEntry {
        string ofwName;
        string hostCountry;
        uint256 contributionAmount;
        string emotionalTag;
        bool enrolled;
        bool disbursed;
    }

    PensionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function enrollOFW(string memory ofwName, string memory hostCountry, uint256 contributionAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(PensionEntry(ofwName, hostCountry, contributionAmount, emotionalTag, true, false));
    }

    function disbursePension(uint256 index) external onlyAdmin {
        entries[index].disbursed = true;
    }

    function getPensionEntry(uint256 index) external view returns (PensionEntry memory) {
        return entries[index];
    }
}
