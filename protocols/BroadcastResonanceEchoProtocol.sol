// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BroadcastResonanceEchoProtocol {
    address public admin;

    struct EchoEntry {
        string platform; // "YouTube", "GMA News"
        string narrativeFocus; // "ICC arrest rumor", "Plunder complaint"
        string resonanceLevel; // "High", "Viral", "Institutional"
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

    function logEcho(string memory platform, string memory narrativeFocus, string memory resonanceLevel, string memory emotionalTag) external onlyAdmin {
        entries.push(EchoEntry(platform, narrativeFocus, resonanceLevel, emotionalTag, true, false));
    }

    function sealEchoEntry(uint256 index) external onlyAdmin {
        require(entries[index].echoed, "Must be echoed first");
        entries[index].sealed = true;
    }

    function getEchoEntry(uint256 index) external view returns (EchoEntry memory) {
        return entries[index];
    }
}
