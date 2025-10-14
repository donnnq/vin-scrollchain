// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TradeImmunityCodexDAO {
    address public admin;

    struct TradeEntry {
        string commodity;
        string partnerCountry;
        string immunityClause;
        string emotionalTag;
        bool enforced;
    }

    TradeEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _commodity, string memory _partnerCountry, string memory _immunityClause, string memory _emotionalTag) external onlyAdmin {
        codex.push(TradeEntry(_commodity, _partnerCountry, _immunityClause, _emotionalTag, false));
    }

    function enforceEntry(uint256 index) external onlyAdmin {
        codex[index].enforced = true;
    }

    function getEntry(uint256 index) external view returns (TradeEntry memory) {
        return codex[index];
    }
}
