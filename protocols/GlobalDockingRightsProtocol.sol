// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalDockingRightsProtocol {
    address public admin;

    struct DockingEntry {
        string dockName;
        string jurisdiction;
        string dockingClause;
        string emotionalTag;
        bool summoned;
        bool granted;
        bool sealed;
    }

    DockingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDocking(string memory dockName, string memory jurisdiction, string memory dockingClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DockingEntry(dockName, jurisdiction, dockingClause, emotionalTag, true, false, false));
    }

    function confirmGrant(uint256 index) external onlyAdmin {
        entries[index].granted = true;
    }

    function sealDockingEntry(uint256 index) external onlyAdmin {
        require(entries[index].granted, "Must be granted first");
        entries[index].sealed = true;
    }

    function getDockingEntry(uint256 index) external view returns (DockingEntry memory) {
        return entries[index];
    }
}
