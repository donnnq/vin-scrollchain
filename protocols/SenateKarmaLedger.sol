// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateKarmaLedger {
    address public admin;

    struct KarmaEntry {
        string senatorName;
        string karmaType; // "Ghost Project Link", "Transparency Failure", "Flood Neglect"
        string ledgerClause;
        string emotionalTag;
        bool summoned;
        bool logged;
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

    function summonKarmaLog(string memory senatorName, string memory karmaType, string memory ledgerClause, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(senatorName, karmaType, ledgerClause, emotionalTag, true, false, false));
    }

    function confirmLogging(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealKarmaEntry(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
