// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntelligenceEthicsDAO {
    address public admin;

    struct EthicsEntry {
        string agency;
        string ethicalClause;
        string geopoliticalContext;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonEthics(string memory agency, string memory ethicalClause, string memory geopoliticalContext, string memory emotionalTag) external onlyAdmin {
        entries.push(EthicsEntry(agency, ethicalClause, geopoliticalContext, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealEthicsEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
