// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TreatyToContractorAccountabilityCodex {
    address public steward;

    struct AccountabilityEntry {
        string contractor; // "DPWH-linked firms, flood control contractors"
        string clause; // "Scrollchain-sealed codex for contractor accountability and fiscal ethics consequence"
        string emotionalTag;
        bool codified;
        bool archived;
    }

    AccountabilityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyAccountabilityCodex(string memory contractor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(AccountabilityEntry(contractor, clause, emotionalTag, true, true));
    }

    function getAccountabilityEntry(uint256 index) external view returns (AccountabilityEntry memory) {
        return entries[index];
    }
}
