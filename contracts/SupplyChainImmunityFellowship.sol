// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChainImmunityFellowship {
    address public admin;

    struct ImmunityEntry {
        string packageName;
        string registry;
        string breachVector;
        string emotionalTag;
        bool immunized;
        bool audited;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function immunizePackage(string memory packageName, string memory registry, string memory breachVector, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(packageName, registry, breachVector, emotionalTag, true, false));
    }

    function auditImmunity(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
