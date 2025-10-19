// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IndictmentResponseCodex {
    address public admin;

    struct ResponseEntry {
        string official;
        string indictment;
        string emotionalTag;
        bool summoned;
        bool reviewed;
        bool sealed;
    }

    ResponseEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonResponse(string memory official, string memory indictment, string memory emotionalTag) external onlyAdmin {
        entries.push(ResponseEntry(official, indictment, emotionalTag, true, false, false));
    }

    function reviewResponse(uint256 index) external onlyAdmin {
        entries[index].reviewed = true;
    }

    function sealResponse(uint256 index) external onlyAdmin {
        require(entries[index].reviewed, "Must be reviewed first");
        entries[index].sealed = true;
    }

    function getResponseEntry(uint256 index) external view returns (ResponseEntry memory) {
        return entries[index];
    }
}
