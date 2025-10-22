// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AppealsCourtRulingMythosArchive {
    address public admin;

    struct RulingEntry {
        string caseName; // "Oregon v. ICE"
        string mythosSignal; // "Sanctuary policy upheld", "Federal cooperation limited", "Local autonomy reinforced"
        string emotionalTag;
        bool archived;
        bool sealed;
    }

    RulingEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function archiveRuling(string memory caseName, string memory mythosSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(RulingEntry(caseName, mythosSignal, emotionalTag, true, false));
    }

    function sealRulingEntry(uint256 index) external onlyAdmin {
        require(entries[index].archived, "Must be archived first");
        entries[index].sealed = true;
    }

    function getRulingEntry(uint256 index) external view returns (RulingEntry memory) {
        return entries[index];
    }
}
