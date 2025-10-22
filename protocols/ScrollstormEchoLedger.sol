// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScrollstormEchoLedger {
    address public admin;

    struct EchoEntry {
        string originSignal; // "Joker Meme", "Comment Section", "Destiny Swap Audit"
        string echoPlatform; // "YouTube", "TikTok", "Discord"
        string emotionalTag;
        bool echoed;
        bool sealed;
    }

    EchoEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logEcho(string memory originSignal, string memory echoPlatform, string memory emotionalTag) external onlyAdmin {
        entries.push(EchoEntry(originSignal, echoPlatform, emotionalTag, true, false));
    }

    function sealEchoEntry(uint256 index) external onlyAdmin {
        require(entries[index].echoed, "Must be echoed first");
        entries[index].sealed = true;
    }

    function getEchoEntry(uint256 index) external view returns (EchoEntry memory) {
        return entries[index];
    }
}
