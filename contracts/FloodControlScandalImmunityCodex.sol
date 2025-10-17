// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FloodControlScandalImmunityCodex {
    address public admin;

    struct ImmunityEntry {
        string projectName;
        string breachSignal;
        string emotionalTag;
        bool flagged;
        bool immunized;
    }

    ImmunityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function flagProject(string memory projectName, string memory breachSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ImmunityEntry(projectName, breachSignal, emotionalTag, true, false));
    }

    function immunizeProject(uint256 index) external onlyAdmin {
        entries[index].immunized = true;
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
