// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OfficialSecretsReformCodex {
    address public admin;

    struct ReformEntry {
        string lawName;
        string reformClause;
        string geopoliticalTrigger;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    ReformEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReform(string memory lawName, string memory reformClause, string memory geopoliticalTrigger, string memory emotionalTag) external onlyAdmin {
        entries.push(ReformEntry(lawName, reformClause, geopoliticalTrigger, emotionalTag, true, false, false));
    }

    function confirmReview(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealReformEntry(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getReformEntry(uint256 index) external view returns (ReformEntry memory) {
        return entries[index];
    }
}
