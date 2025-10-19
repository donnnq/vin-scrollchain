// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArchitectCraftRegistryCodex {
    address public admin;

    struct ArchitectEntry {
        string architectName;
        string restorationZone;
        string craftType;
        string emotionalTag;
        bool summoned;
        bool registered;
        bool sealed;
    }

    ArchitectEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCraftRegistry(string memory architectName, string memory restorationZone, string memory craftType, string memory emotionalTag) external onlyAdmin {
        entries.push(ArchitectEntry(architectName, restorationZone, craftType, emotionalTag, true, false, false));
    }

    function confirmRegistration(uint256 index) external onlyAdmin {
        entries[index].registered = true;
    }

    function sealCraftRegistry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getArchitectEntry(uint256 index) external view returns (ArchitectEntry memory) {
        return entries[index];
    }
}
