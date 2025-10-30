// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CodexToRejectItemEthicsProtocol {
    address public steward;

    struct RejectEntry {
        string clause; // "Scrollchain-sealed protocol for reject item ethics and resale consequence"
        string emotionalTag;
        bool codified;
        bool sustained;
    }

    RejectEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function codifyRejectEthics(string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(RejectEntry(clause, emotionalTag, true, true));
    }

    function getRejectEntry(uint256 index) external view returns (RejectEntry memory) {
        return entries[index];
    }
}
