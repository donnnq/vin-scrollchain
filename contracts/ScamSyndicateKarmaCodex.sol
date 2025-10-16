// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ScamSyndicateKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string operationName;
        string country;
        string violationType;
        string emotionalTag;
        bool exposed;
        bool prosecuted;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logKarma(string memory operationName, string memory country, string memory violationType, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(operationName, country, violationType, emotionalTag, false, false));
    }

    function markExposed(uint256 index) external onlyAdmin {
        entries[index].exposed = true;
    }

    function markProsecuted(uint256 index) external onlyAdmin {
        entries[index].prosecuted = true;
    }

    function getKarma(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
