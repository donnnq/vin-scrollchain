// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DrainageRestorationDAO {
    address public admin;

    struct RestorationEntry {
        string barangay;
        string restorationType; // "Canal Clearing", "Floodway Repair", "Green Buffer Installation"
        string clause;
        string emotionalTag;
        bool summoned;
        bool completed;
        bool sealed;
    }

    RestorationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonRestoration(string memory barangay, string memory restorationType, string memory clause, string memory emotionalTag) external onlyAdmin {
        entries.push(RestorationEntry(barangay, restorationType, clause, emotionalTag, true, false, false));
    }

    function confirmCompletion(uint256 index) external onlyAdmin {
        entries[index].completed = true;
    }

    function sealRestorationEntry(uint256 index) external onlyAdmin {
        require(entries[index].completed, "Must be completed first");
        entries[index].sealed = true;
    }

    function getRestorationEntry(uint256 index) external view returns (RestorationEntry memory) {
        return entries[index];
    }
}
