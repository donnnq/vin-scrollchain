// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PurokHealthWorkerDispatchGrid {
    address public admin;

    struct DispatchEntry {
        string healthWorkerName;
        string purokZone;
        string dispatchLayer; // "Fever Monitoring", "Larvicide Oversight", "Community Education"
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

    function summonDispatch(string memory healthWorkerName, string memory purokZone, string memory dispatchLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(DispatchEntry(healthWorkerName, purokZone, dispatchLayer, emotionalTag, true, false, false));
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
