// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayCollegeRegistryDAO {
    address public admin;

    struct RegistryEntry {
        string youthID;
        string barangayName;
        string purokID;
        string emotionalTag;
        bool summoned;
        bool registered;
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

    function summonRegistry(string memory youthID, string memory barangayName, string memory purokID, string memory emotionalTag) external onlyAdmin {
        entries.push(RegistryEntry(youthID, barangayName, purokID, emotionalTag, true, false, false));
    }

    function confirmRegistration(uint256 index) external onlyAdmin {
        entries[index].registered = true;
    }

    function sealRegistry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getRegistryEntry(uint256 index) external view returns (RegistryEntry memory) {
        return entries[index];
    }
}
