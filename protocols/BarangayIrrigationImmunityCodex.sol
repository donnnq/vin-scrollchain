// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayIrrigationImmunityCodex {
    address public admin;

    struct IrrigationEntry {
        string barangayName;
        string systemType;
        string emotionalTag;
        bool summoned;
        bool upgraded;
        bool sealed;
    }

    IrrigationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonIrrigationUpgrade(string memory barangayName, string memory systemType, string memory emotionalTag) external onlyAdmin {
        entries.push(IrrigationEntry(barangayName, systemType, emotionalTag, true, false, false));
    }

    function confirmUpgrade(uint256 index) external onlyAdmin {
        entries[index].upgraded = true;
    }

    function sealIrrigationUpgrade(uint256 index) external onlyAdmin {
        require(entries[index].upgraded, "Must be upgraded first");
        entries[index].sealed = true;
    }

    function getIrrigationEntry(uint256 index) external view returns (IrrigationEntry memory) {
        return entries[index];
    }
}
