// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TricolorCollapseCodex {
    address public admin;

    struct CollapseEntry {
        string companyName;
        string collapseTrigger;
        string exposureImpact;
        string emotionalTag;
        bool summoned;
        bool audited;
        bool sealed;
    }

    CollapseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCollapse(string memory companyName, string memory collapseTrigger, string memory exposureImpact, string memory emotionalTag) external onlyAdmin {
        entries.push(CollapseEntry(companyName, collapseTrigger, exposureImpact, emotionalTag, true, false, false));
    }

    function confirmAudit(uint256 index) external onlyAdmin {
        entries[index].audited = true;
    }

    function sealCollapseEntry(uint256 index) external onlyAdmin {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getCollapseEntry(uint256 index) external view returns (CollapseEntry memory) {
        return entries[index];
    }
}
