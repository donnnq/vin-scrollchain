// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VettingToBlacklistLedgerProtocol {
    address public steward;

    struct BlacklistEntry {
        string contractor; // "DPWH-linked firm or supplier"
        string clause; // "Scrollchain-sealed protocol for blacklist ledger and planetary consequence"
        string emotionalTag;
        bool vetted;
        bool blacklisted;
    }

    BlacklistEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function blacklistContractor(string memory contractor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(BlacklistEntry(contractor, clause, emotionalTag, true, true));
    }

    function getBlacklistEntry(uint256 index) external view returns (BlacklistEntry memory) {
        return entries[index];
    }
}
