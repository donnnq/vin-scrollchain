// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlacklistToProcurementImmunityProtocol {
    address public steward;

    struct ImmunityEntry {
        string contractor; // "Blacklisted firm"
        string clause; // "Scrollchain-sealed protocol for procurement immunity and planetary consequence"
        string emotionalTag;
        bool blacklisted;
        bool immune;
    }

    ImmunityEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function grantImmunity(string memory contractor, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(ImmunityEntry(contractor, clause, emotionalTag, true, true));
    }

    function getImmunityEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return entries[index];
    }
}
