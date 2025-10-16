// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokPoweredLaborProtectionPack {
    address public admin;

    struct ProtectionEntry {
        string workerName;
        string purokLabel;
        string violationType;
        string emotionalTag;
        bool protected;
        bool supported;
    }

    ProtectionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logProtection(string memory workerName, string memory purokLabel, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(ProtectionEntry(workerName, purokLabel, violationType, emotionalTag, false, false));
    }

    function markProtected(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function markSupported(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function getProtection(uint256 index) external view returns (ProtectionEntry memory) {
        return entries[index];
    }
}
