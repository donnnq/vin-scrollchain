// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WaterTankerDispatchGrid {
    address public admin;

    struct DispatchEntry {
        string barangay;
        string dispatchType; // "Emergency", "Scheduled", "Rotational"
        string gridClause;
        string emotionalTag;
        bool summoned;
        bool dispatched;
        bool sealed;
    }

    DispatchEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDispatch(string memory barangay, string memory dispatchType, string memory gridClause, string memory emotionalTag) external onlyAdmin {
        entries.push(DispatchEntry(barangay, dispatchType, gridClause, emotionalTag, true, false, false));
    }

    function confirmDispatch(uint256 index) external onlyAdmin {
        entries[index].dispatched = true;
    }

    function sealDispatchEntry(uint256 index) external onlyAdmin {
        require(entries[index].dispatched, "Must be dispatched first");
        entries[index].sealed = true;
    }

    function getDispatchEntry(uint256 index) external view returns (DispatchEntry memory) {
        return entries[index];
    }
}
