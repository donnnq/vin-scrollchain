// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastSovereigntyDAO {
    address public admin;

    struct CoverageEntry {
        string programName;
        string episodeTitle;
        string subjectMatter;
        string emotionalTag;
        bool summoned;
        bool protected;
        bool sealed;
    }

    CoverageEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonCoverage(string memory programName, string memory episodeTitle, string memory subjectMatter, string memory emotionalTag) external onlyAdmin {
        entries.push(CoverageEntry(programName, episodeTitle, subjectMatter, emotionalTag, true, false, false));
    }

    function confirmProtection(uint256 index) external onlyAdmin {
        entries[index].protected = true;
    }

    function sealCoverageEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getCoverageEntry(uint256 index) external view returns (CoverageEntry memory) {
        return entries[index];
    }
}
