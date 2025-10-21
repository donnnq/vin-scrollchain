// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LinuxGuardianDAO {
    address public admin;

    struct GuardianEntry {
        string distroName;
        string guardianClause;
        string emotionalTag;
        bool summoned;
        bool deployed;
        bool sealed;
    }

    GuardianEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGuardian(string memory distroName, string memory guardianClause, string memory emotionalTag) external onlyAdmin {
        entries.push(GuardianEntry(distroName, guardianClause, emotionalTag, true, false, false));
    }

    function confirmDeployment(uint256 index) external onlyAdmin {
        entries[index].deployed = true;
    }

    function sealGuardianEntry(uint256 index) external onlyAdmin {
        require(entries[index].deployed, "Must be deployed first");
        entries[index].sealed = true;
    }

    function getGuardianEntry(uint256 index) external view returns (GuardianEntry memory) {
        return entries[index];
    }
}
