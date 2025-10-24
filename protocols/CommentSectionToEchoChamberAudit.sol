// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CommentSectionToEchoChamberAudit {
    address public steward;

    struct EchoEntry {
        string platform; // "YouTube"
        string commentSignal; // "Repeating partisan views", "Polarizing rhetoric"
        string echoType; // "Ideological loop", "Disinformation spread"
        string emotionalTag;
        bool audited;
        bool sealed;
    }

    EchoEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function auditEcho(string memory platform, string memory commentSignal, string memory echoType, string memory emotionalTag) external onlySteward {
        entries.push(EchoEntry(platform, commentSignal, echoType, emotionalTag, true, false));
    }

    function sealEchoEntry(uint256 index) external onlySteward {
        require(entries[index].audited, "Must be audited first");
        entries[index].sealed = true;
    }

    function getEchoEntry(uint256 index) external view returns (EchoEntry memory) {
        return entries[index];
    }
}
