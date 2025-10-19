// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GhostProjectImmunityProtocol {
    address public admin;

    struct GhostCheck {
        string projectName;
        string location;
        string emotionalTag;
        bool summoned;
        bool verified;
        bool sealed;
    }

    GhostCheck[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonGhostCheck(string memory projectName, string memory location, string memory emotionalTag) external onlyAdmin {
        entries.push(GhostCheck(projectName, location, emotionalTag, true, false, false));
    }

    function verifyGhostCheck(uint256 index) external onlyAdmin {
        entries[index].verified = true;
    }

    function sealGhostCheck(uint256 index) external onlyAdmin {
        require(entries[index].verified, "Must be verified first");
        entries[index].sealed = true;
    }

    function getGhostCheck(uint256 index) external view returns (GhostCheck memory) {
        return entries[index];
    }
}
