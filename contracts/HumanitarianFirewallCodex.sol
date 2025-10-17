// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HumanitarianFirewallCodex {
    address public admin;

    struct FirewallEntry {
        string corridor;
        string protectionTheme;
        string emotionalTag;
        bool deployed;
        bool reinforced;
    }

    FirewallEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function deployFirewall(string memory corridor, string memory protectionTheme, string memory emotionalTag) external onlyAdmin {
        entries.push(FirewallEntry(corridor, protectionTheme, emotionalTag, true, false));
    }

    function reinforceFirewall(uint256 index) external onlyAdmin {
        entries[index].reinforced = true;
    }

    function getFirewall(uint256 index) external view returns (FirewallEntry memory) {
        return entries[index];
    }
}
