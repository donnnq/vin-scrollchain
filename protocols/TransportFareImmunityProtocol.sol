// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransportFareImmunityProtocol {
    address public admin;

    struct FareEntry {
        string region;
        string transportType;
        string immunityType;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    FareEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFare(string memory region, string memory transportType, string memory immunityType, string memory emotionalTag) external onlyAdmin {
        entries.push(FareEntry(region, transportType, immunityType, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealFare(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getFareEntry(uint256 index) external view returns (FareEntry memory) {
        return entries[index];
    }
}
