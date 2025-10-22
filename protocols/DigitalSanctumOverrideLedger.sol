// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalSanctumOverrideLedger {
    address public admin;

    struct OverrideEntry {
        string deviceName; // "Workstation-001", "Server-Alpha", "Cloud-Node-7"
        string overrideSignal; // "SYSTEM privilege reset", "SMB protocol lockdown", "Patch revalidation"
        string emotionalTag;
        bool overridden;
        bool sealed;
    }

    OverrideEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function overrideSanctum(string memory deviceName, string memory overrideSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(OverrideEntry(deviceName, overrideSignal, emotionalTag, true, false));
    }

    function sealOverrideEntry(uint256 index) external onlyAdmin {
        require(entries[index].overridden, "Must be overridden first");
        entries[index].sealed = true;
    }

    function getOverrideEntry(uint256 index) external view returns (OverrideEntry memory) {
        return entries[index];
    }
}
