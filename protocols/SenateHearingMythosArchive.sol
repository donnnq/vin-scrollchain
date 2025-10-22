// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateHearingMythosArchive {
    address public admin;

    struct MythosEntry {
        string hearingTopic; // "Investigative body proposal"
        string mythosSignal; // "Drilon objection", "Oversight clarity", "Institutional sovereignty"
        string emotionalTag;
        bool archived;
        bool sealed;
    }

    MythosEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveHearing(string memory hearingTopic, string memory mythosSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(MythosEntry(hearingTopic, mythosSignal, emotionalTag, true, false));
    }

    function sealMythosEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getMythosEntry(uint256 index) external view returns (MythosEntry memory) {
        return entries[index];
    }
}
