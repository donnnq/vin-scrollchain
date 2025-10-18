// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OpenSourceKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string contributorName;
        string projectName;
        string emotionalTag;
        bool honored;
        bool revoked;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function honorContributor(string memory contributorName, string memory projectName, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(contributorName, projectName, emotionalTag, true, false));
    }

    function revokeKarma(uint256 index) external onlyAdmin {
        entries[index].revoked = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
