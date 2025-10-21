// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TourismEquityDAO {
    address public admin;

    struct EquityEntry {
        string city;
        string tourismType; // "Local Festival", "Heritage Walk", "Plaza Showcase"
        string equityClause;
        string emotionalTag;
        bool summoned;
        bool supported;
        bool sealed;
    }

    EquityEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEquity(string memory city, string memory tourismType, string memory equityClause, string memory emotionalTag) external onlyAdmin {
        entries.push(EquityEntry(city, tourismType, equityClause, emotionalTag, true, false, false));
    }

    function confirmSupport(uint256 index) external onlyAdmin {
        entries[index].supported = true;
    }

    function sealEquityEntry(uint256 index) external onlyAdmin {
        require(entries[index].supported, "Must be supported first");
        entries[index].sealed = true;
    }

    function getEquityEntry(uint256 index) external view returns (EquityEntry memory) {
        return entries[index];
    }
}
