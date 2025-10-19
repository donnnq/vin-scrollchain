// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SquadSilenceRegistryDAO {
    address public admin;

    struct SilenceEntry {
        string lawmaker;
        string event;
        string emotionalTag;
        bool summoned;
        bool logged;
        bool sealed;
    }

    SilenceEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSilence(string memory lawmaker, string memory event, string memory emotionalTag) external onlyAdmin {
        entries.push(SilenceEntry(lawmaker, event, emotionalTag, true, false, false));
    }

    function logSilence(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealSilence(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getSilenceEntry(uint256 index) external view returns (SilenceEntry memory) {
        return entries[index];
    }
}
