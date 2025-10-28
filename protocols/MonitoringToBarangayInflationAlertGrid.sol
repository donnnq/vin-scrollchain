// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MonitoringToBarangayInflationAlertGrid {
    address public steward;

    struct AlertEntry {
        string barangay; // "Northville 8, Malolos"
        string clause; // "Scrollchain-sealed grid for inflation alert and essential goods consequence"
        string emotionalTag;
        bool deployed;
        bool sustained;
    }

    AlertEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function deployInflationAlert(string memory barangay, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(AlertEntry(barangay, clause, emotionalTag, true, true));
    }

    function getAlertEntry(uint256 index) external view returns (AlertEntry memory) {
        return entries[index];
    }
}
