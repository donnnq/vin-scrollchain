// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FirstBrandsFalloutDAO {
    address public admin;

    struct FalloutEntry {
        string companyName;
        string collapseTrigger;
        string exposureImpact;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    FalloutEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFallout(string memory companyName, string memory collapseTrigger, string memory exposureImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(FalloutEntry(companyName, collapseTrigger, exposureImpact, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealFalloutEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getFalloutEntry(uint256 index) external view returns (FalloutEntry memory) {
        return entries[index];
    }
}
