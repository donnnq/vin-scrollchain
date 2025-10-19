// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokModRegistryDAO {
    address public admin;

    struct ModEntry {
        string modName;
        string creatorName;
        string consoleType;
        string emotionalTag;
        bool summoned;
        bool registered;
        bool sealed;
    }

    ModEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonMod(string memory modName, string memory creatorName, string memory consoleType, string memory emotionalTag) external onlyAdmin {
        entries.push(ModEntry(modName, creatorName, consoleType, emotionalTag, true, false, false));
    }

    function confirmRegistration(uint256 index) external onlyAdmin {
        entries[index].registered = true;
    }

    function sealModEntry(uint256 index) external onlyAdmin {
        require(entries[index].registered, "Must be registered first");
        entries[index].sealed = true;
    }

    function getModEntry(uint256 index) external view returns (ModEntry memory) {
        return entries[index];
    }
}
