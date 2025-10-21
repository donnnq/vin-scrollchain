// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GuardDeploymentCodex {
    address public admin;

    struct GuardEntry {
        string location;
        string guardType; // "Civic Steward", "Security", "Sanctum Guardian"
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    GuardEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGuard(string memory location, string memory guardType, string memory emotionalTag) external onlyAdmin {
        entries.push(GuardEntry(location, guardType, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealGuardEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getGuardEntry(uint256 index) external view returns (GuardEntry memory) {
        return entries[index];
    }
}
