// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AsylumSovereigntyCodex {
    address public admin;

    struct AsylumEntry {
        string applicant;
        string hostCountry;
        string emotionalTag;
        bool summoned;
        bool granted;
        bool sealed;
    }

    AsylumEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonAsylum(string memory applicant, string memory hostCountry, string memory emotionalTag) external onlyAdmin {
        entries.push(AsylumEntry(applicant, hostCountry, emotionalTag, true, false, false));
    }

    function grantAsylum(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function sealAsylum(uint256 index) external onlyAdmin {
        require(entries[index].granted, "Must be granted first");
        entries[index].sealed = true;
    }

    function getAsylumEntry(uint256 index) external view returns (AsylumEntry memory) {
        return entries[index];
    }
}
