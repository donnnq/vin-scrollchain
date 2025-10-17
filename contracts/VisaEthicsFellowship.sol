// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VisaEthicsFellowship {
    address public admin;

    struct FellowshipEntry {
        string companyName;
        string visaPolicy;
        string emotionalTag;
        bool summoned;
        bool reviewed;
    }

    FellowshipEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFellowship(string memory companyName, string memory visaPolicy, string memory emotionalTag) external onlyAdmin {
        entries.push(FellowshipEntry(companyName, visaPolicy, emotionalTag, true, false));
    }

    function reviewPolicy(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function getFellowship(uint256 index) external view returns (FellowshipEntry memory) {
        return entries[index];
    }
}
