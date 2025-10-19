// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InformalSettlerRegistryCodex {
    address public admin;

    struct RegistryEntry {
        string familyID;
        string livingCondition;
        string purokID;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    RegistryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRegistry(string memory familyID, string memory livingCondition, string memory purokID, string memory emotionalTag) external onlyAdmin {
        entries.push(RegistryEntry(familyID, livingCondition, purokID, emotionalTag, true, false, false));
    }

    function verifyRegistry(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealRegistry(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getRegistryEntry(uint256 index) external view returns (RegistryEntry memory) {
        return entries[index];
    }
}
