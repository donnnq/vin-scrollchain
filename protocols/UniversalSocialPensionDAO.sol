// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UniversalSocialPensionDAO {
    address public admin;

    struct PensionEntry {
        string citizenName;
        uint256 age;
        string region;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    PensionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPension(string memory citizenName, uint256 age, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(PensionEntry(citizenName, age, region, emotionalTag, true, false, false));
    }

    function confirmVerification(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealPensionEntry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getPensionEntry(uint256 index) external view returns (PensionEntry memory) {
        return entries[index];
    }
}
