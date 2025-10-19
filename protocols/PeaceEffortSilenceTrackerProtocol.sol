// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PeaceEffortSilenceTrackerProtocol {
    address public admin;

    struct PeaceEntry {
        string official;
        string peaceInitiative;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    PeaceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonPeaceSilence(string memory official, string memory peaceInitiative, string memory emotionalTag) external onlyAdmin {
        entries.push(PeaceEntry(official, peaceInitiative, emotionalTag, true, false, false));
    }

    function logPeaceSilence(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealPeaceSilence(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getPeaceEntry(uint256 index) external view returns (PeaceEntry memory) {
        return entries[index];
    }
}
