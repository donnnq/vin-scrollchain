// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CorporateKarmaCodex {
    address public admin;

    struct KarmaEntry {
        string corporationName;
        string karmaClause;
        string violationType;
        string emotionalTag;
        bool summoned;
        bool judged;
        bool sealed;
    }

    KarmaEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonKarma(string memory corporationName, string memory violationType, string memory karmaClause, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(corporationName, karmaClause, violationType, emotionalTag, true, false, false));
    }

    function confirmJudgment(uint256 index) external onlyAdmin {
        entries[index].judged = true;
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].judged, "Must be judged first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
