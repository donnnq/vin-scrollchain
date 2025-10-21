// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MayorLegacyBroadcastTreaty {
    address public admin;

    struct LegacyEntry {
        string mayorName;
        string projectName;
        string broadcastChannel;
        string emotionalTag;
        bool summoned;
        bool aired;
        bool sealed;
    }

    LegacyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonLegacyBroadcast(string memory mayorName, string memory projectName, string memory broadcastChannel, string memory emotionalTag) external onlyAdmin {
        entries.push(LegacyEntry(mayorName, projectName, broadcastChannel, emotionalTag, true, false, false));
    }

    function confirmAiring(uint256 index) external onlyAdmin {
        entries[index].aired = true;
    }

    function sealLegacyEntry(uint256 index) external onlyAdmin {
        require(entries[index].aired, "Must be aired first");
        entries[index].sealed = true;
    }

    function getLegacyEntry(uint256 index) external view returns (LegacyEntry memory) {
        return entries[index];
    }
}
