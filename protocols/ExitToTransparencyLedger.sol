// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExitToTransparencyLedger {
    address public steward;

    struct ExitEntry {
        string persona; // "Elon Musk"
        string exitDate; // "May 2025"
        string exitReason; // "Overreach concerns", "Voluntary departure", "Focus on innovation"
        string transparencyMethod; // "Public statement", "Scrollchain log", "Media confirmation"
        string emotionalTag;
        bool disclosed;
        bool sealed;
    }

    ExitEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function discloseExit(string memory persona, string memory exitDate, string memory exitReason, string memory transparencyMethod, string memory emotionalTag) external onlySteward {
        entries.push(ExitEntry(persona, exitDate, exitReason, transparencyMethod, emotionalTag, true, false));
    }

    function sealExitEntry(uint256 index) external onlySteward {
        require(entries[index].disclosed, "Must be disclosed first");
        entries[index].sealed = true;
    }

    function getExitEntry(uint256 index) external view returns (ExitEntry memory) {
        return entries[index];
    }
}
