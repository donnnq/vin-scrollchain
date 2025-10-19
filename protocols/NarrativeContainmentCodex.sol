// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NarrativeContainmentCodex {
    address public admin;

    struct ContainmentEntry {
        string outletName;
        string narrativeTitle;
        string missingContext;
        string emotionalTag;
        bool summoned;
        bool contained;
        bool sealed;
    }

    ContainmentEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonContainment(string memory outletName, string memory narrativeTitle, string memory missingContext, string memory emotionalTag) external onlyAdmin {
        entries.push(ContainmentEntry(outletName, narrativeTitle, missingContext, emotionalTag, true, false, false));
    }

    function confirmContainment(uint256 index) external onlyAdmin {
        entries[index].contained = true;
    }

    function sealContainmentEntry(uint256 index) external onlyAdmin {
        require(entries[index].contained, "Must be contained first");
        entries[index].sealed = true;
    }

    function getContainmentEntry(uint256 index) external view returns (ContainmentEntry memory) {
        return entries[index];
    }
}
