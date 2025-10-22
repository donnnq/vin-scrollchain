// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DigitalBroadcastKarmaIndex {
    address public admin;

    struct KarmaEntry {
        string broadcaster; // "Sangkay Janjan", "GMA News"
        string narrativeFocus; // "ICC arrest rumor", "Plunder complaint"
        string karmaSignal; // "Public reaction", "Legal escalation"
        string emotionalTag;
        bool indexed;
        bool sealed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function indexKarma(string memory broadcaster, string memory narrativeFocus, string memory karmaSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(broadcaster, narrativeFocus, karmaSignal, emotionalTag, true, false));
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].indexed, "Must be indexed first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
