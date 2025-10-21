// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokProteinSovereigntyLedger {
    address public admin;

    struct ProteinEntry {
        string species; // "Chicken", "Cow", "Duck", "Tilapia"
        string harvestType; // "Egg", "Milk", "Meat", "Compost"
        string purokZone;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    ProteinEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProtein(string memory species, string memory harvestType, string memory purokZone, string memory emotionalTag) external onlyAdmin {
        entries.push(ProteinEntry(species, harvestType, purokZone, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealProteinEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getProteinEntry(uint256 index) external view returns (ProteinEntry memory) {
        return entries[index];
    }
}
