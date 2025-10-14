// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalBroadcastFirewallDAO {
    address public admin;

    struct FirewallEntry {
        string platform;
        string broadcastType;
        string containmentRule;
        string emotionalTag;
        bool enforced;
    }

    FirewallEntry[] public firewalls;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitFirewall(string memory _platform, string memory _broadcastType, string memory _containmentRule, string memory _emotionalTag) external onlyAdmin {
        firewalls.push(FirewallEntry(_platform, _broadcastType, _containmentRule, _emotionalTag, false));
    }

    function enforceFirewall(uint256 index) external onlyAdmin {
        firewalls[index].enforced = true;
    }

    function getFirewall(uint256 index) external view returns (FirewallEntry memory) {
        return firewalls[index];
    }
}
