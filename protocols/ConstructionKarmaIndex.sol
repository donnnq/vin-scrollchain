// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ConstructionKarmaIndex {
    address public admin;

    struct KarmaEntry {
        string location;
        string disruptionType; // "Barrier", "Noise", "Delay"
        string karmaClause;
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

    function summonKarma(string memory location, string memory disruptionType, string memory karmaClause, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(location, disruptionType, karmaClause, emotionalTag, true, false, false));
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
