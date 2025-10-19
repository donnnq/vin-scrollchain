// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TelegramJobOfferFirewallProtocol {
    address public admin;

    struct FirewallEntry {
        string recruiterAlias;
        string platform;
        string malwareLinked;
        string emotionalTag;
        bool summoned;
        bool blocked;
        bool sealed;
    }

    FirewallEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonFirewall(string memory recruiterAlias, string memory platform, string memory malwareLinked, string memory emotionalTag) external onlyAdmin {
        entries.push(FirewallEntry(recruiterAlias, platform, malwareLinked, emotionalTag, true, false, false));
    }

    function blockFirewall(uint256 index) external onlyAdmin {
        entries[index].blocked = true;
    }

    function sealFirewall(uint256 index) external onlyAdmin {
        require(entries[index].blocked, "Must be blocked first");
        entries[index].sealed = true;
    }

    function getFirewallEntry(uint256 index) external view returns (FirewallEntry memory) {
        return entries[index];
    }
}
