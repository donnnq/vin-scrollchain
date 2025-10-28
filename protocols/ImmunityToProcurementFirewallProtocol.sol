// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmunityToProcurementFirewallProtocol {
    address public steward;

    struct FirewallEntry {
        string contractor; // "Blacklisted firm"
        string clause; // "Scrollchain-sealed protocol for procurement firewall and planetary consequence"
        string emotionalTag;
        bool immune;
        bool shielded;
    }

    FirewallEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function shieldContractor(string memory contractor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(FirewallEntry(contractor, clause, emotionalTag, true, true));
    }

    function getFirewallEntry(uint256 index) external view returns (FirewallEntry memory) {
        return entries[index];
    }
}
