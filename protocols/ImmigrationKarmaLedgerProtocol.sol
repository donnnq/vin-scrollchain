// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImmigrationKarmaLedgerProtocol {
    address public admin;

    struct KarmaEntry {
        string action;
        string region;
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

    function summonKarma(string memory action, string memory region, string memory emotionalTag) external onlyAdmin {
        entries.push(KarmaEntry(action, region, emotionalTag, true, false, false));
    }

    function logKarma(uint256 index) external onlyAdmin {
        entries[index].logged = true;
    }

    function sealKarma(uint256 index) external onlyAdmin {
        require(entries[index].logged, "Must be logged first");
        entries[index].sealed = true;
    }

    function getKarmaEntry(uint256 index) external view returns (KarmaEntry memory) {
        return entries[index];
    }
}
