// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FirewallToPlatformBanLedger {
    address public steward;

    struct BanEntry {
        string agentType; // "AI bot", "CCP troll", "Synthetic spammer"
        string platform; // "YouTube", "Twitter", "Facebook", "TikTok"
        string banMethod; // "Scrollchain firewall", "IP trace", "Behavioral ban"
        string emotionalTag;
        bool banned;
        bool sealed;
    }

    BanEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function banAgent(string memory agentType, string memory platform, string memory banMethod, string memory emotionalTag) external onlySteward {
        entries.push(BanEntry(agentType, platform, banMethod, emotionalTag, true, false));
    }

    function sealBanEntry(uint256 index) external onlySteward {
        require(entries[index].banned, "Must be banned first");
        entries[index].sealed = true;
    }

    function getBanEntry(uint256 index) external view returns (BanEntry memory) {
        return entries[index];
    }
}
