// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateOversightBroadcastCodex {
    address public admin;

    struct BroadcastEntry {
        string hearingTopic; // "DPWH Classroom Backlog", "2026 Budget Review"
        string senatorName;
        string resonanceLayer; // "Public Reaction", "Policy Pressure", "Emotional Impact"
        string emotionalTag;
        bool summoned;
        bool aired;
        bool sealed;
    }

    BroadcastEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonBroadcast(string memory hearingTopic, string memory senatorName, string memory resonanceLayer, string memory emotionalTag) external onlyAdmin {
        entries.push(BroadcastEntry(hearingTopic, senatorName, resonanceLayer, emotionalTag, true, false, false));
    }

    function confirmAiring(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function sealBroadcastEntry(uint256 index) external onlyAdmin {
        require(entries[index].aired, "Must be aired first");
        entries[index].sealed = true;
    }

    function getBroadcastEntry(uint256 index) external view returns (BroadcastEntry memory) {
        return entries[index];
    }
}
