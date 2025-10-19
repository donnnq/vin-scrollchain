// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DelubyoRecoveryLedger {
    address public admin;

    struct RecoveryEntry {
        string farmerName;
        string region;
        string grievanceType;
        string emotionalTag;
        bool summoned;
        bool documented;
        bool sealed;
    }

    RecoveryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRecovery(string memory farmerName, string memory region, string memory grievanceType, string memory emotionalTag) external onlyAdmin {
        entries.push(RecoveryEntry(farmerName, region, grievanceType, emotionalTag, true, false, false));
    }

    function confirmDocumentation(uint256 index) external onlyAdmin {
        entries[index].documented = true;
    }

    function sealRecovery(uint256 index) external onlyAdmin {
        require(entries[index].documented, "Must be documented first");
        entries[index].sealed = true;
    }

    function getRecoveryEntry(uint256 index) external view returns (RecoveryEntry memory) {
        return entries[index];
    }
}
