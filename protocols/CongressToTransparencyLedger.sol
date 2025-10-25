// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CongressToTransparencyLedger {
    address public steward;

    struct ProjectEntry {
        string proponentName; // "District Rep", "Party-list Rep"
        string projectTitle; // "Flood Control", "Road Expansion"
        string budgetAmount; // "₱150M", "₱75M"
        string districtCode; // "NCR-2", "Region IV-A"
        string emotionalTag;
        bool disclosed;
        bool sealed;
    }

    ProjectEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function discloseProject(string memory proponentName, string memory projectTitle, string memory budgetAmount, string memory districtCode, string memory emotionalTag) external onlySteward {
        entries.push(ProjectEntry(proponentName, projectTitle, budgetAmount, districtCode, emotionalTag, true, false));
    }

    function sealProjectEntry(uint256 index) external onlySteward {
        require(entries[index].disclosed, "Must be disclosed first");
        entries[index].sealed = true;
    }

    function getProjectEntry(uint256 index) external view returns (ProjectEntry memory) {
        return entries[index];
    }
}
