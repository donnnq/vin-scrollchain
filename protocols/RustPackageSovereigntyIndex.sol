// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RustPackageSovereigntyIndex {
    address public admin;

    struct PackageEntry {
        string packageName; // "async-tar", "tokio-tar"
        string threatLevel; // "High", "Moderate", "Low"
        string sovereigntyAction; // "Patch deployed", "Fork secured", "Audit complete"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    PackageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexPackage(string memory packageName, string memory threatLevel, string memory sovereigntyAction, string memory emotionalTag) external onlyAdmin {
        entries.push(PackageEntry(packageName, threatLevel, sovereigntyAction, emotionalTag, true, false));
    }

    function sealPackageEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getPackageEntry(uint256 index) external view returns (PackageEntry memory) {
        return entries[index];
    }
}
