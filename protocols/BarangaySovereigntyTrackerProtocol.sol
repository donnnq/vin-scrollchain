// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangaySovereigntyTrackerProtocol {
    address public admin;

    struct SovereigntyEntry {
        string projectName;
        string barangay;
        string emotionalTag;
        bool summoned;
        bool acknowledged;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSovereignty(string memory projectName, string memory barangay, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(projectName, barangay, emotionalTag, true, false, false));
    }

    function acknowledgeSovereignty(uint256 index) external onlyAdmin {
        entries[index].acknowledged = true;
    }

    function sealSovereignty(uint256 index) external onlyAdmin {
        require(entries[index].acknowledged, "Must be acknowledged first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
