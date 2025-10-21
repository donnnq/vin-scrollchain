// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JudicialTransparencyProtocol {
    address public admin;

    struct TransparencyEntry {
        string courtName;
        string caseTheme;
        string transparencyClause;
        string emotionalTag;
        bool summoned;
        bool broadcasted;
        bool sealed;
    }

    TransparencyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransparency(string memory courtName, string memory caseTheme, string memory transparencyClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(courtName, caseTheme, transparencyClause, emotionalTag, true, false, false));
    }

    function confirmBroadcast(uint256 index) external onlyAdmin {
        entries[index].broadcasted = true;
    }

    function sealTransparencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].broadcasted, "Must be broadcasted first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
