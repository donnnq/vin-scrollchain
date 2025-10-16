// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LegislativePermitPressureDAO {
    address public admin;

    struct PressureEntry {
        string legislatorLabel;
        string permitType;
        string targetAgency;
        string emotionalTag;
        bool confirmed;
        bool escalated;
    }

    PressureEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitPressure(string memory legislatorLabel, string memory permitType, string memory targetAgency, string memory emotionalTag) external onlyAdmin {
        entries.push(PressureEntry(legislatorLabel, permitType, targetAgency, emotionalTag, false, false));
    }

    function confirmPressure(uint256 index) external onlyAdmin {
        entries[index].confirmed = true;
    }

    function escalatePressure(uint256 index) external onlyAdmin {
        entries[index].escalated = true;
    }

    function getEntry(uint256 index) external view returns (PressureEntry memory) {
        return entries[index];
    }
}
