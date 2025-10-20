// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiplomaticTransparencyCodex {
    address public admin;

    struct TransparencyEntry {
        string government;
        string withheldDesignation;
        string consequenceClause;
        string emotionalTag;
        bool summoned;
        bool reviewed;
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

    function summonTransparency(string memory government, string memory withheldDesignation, string memory consequenceClause, string memory emotionalTag) external onlyAdmin {
        entries.push(TransparencyEntry(government, withheldDesignation, consequenceClause, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealTransparencyEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getTransparencyEntry(uint256 index) external view returns (TransparencyEntry memory) {
        return entries[index];
    }
}
