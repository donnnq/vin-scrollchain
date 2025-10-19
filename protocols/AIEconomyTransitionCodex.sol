// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AIEconomyTransitionCodex {
    address public admin;

    struct TransitionEntry {
        string companyName;
        string innovationType;
        string sector;
        string emotionalTag;
        bool summoned;
        bool transitioned;
        bool sealed;
    }

    TransitionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonTransition(string memory companyName, string memory innovationType, string memory sector, string memory emotionalTag) external onlyAdmin {
        entries.push(TransitionEntry(companyName, innovationType, sector, emotionalTag, true, false, false));
    }

    function confirmTransition(uint256 index) external onlyAdmin {
        entries[index].transitioned = true;
    }

    function sealTransition(uint256 index) external onlyAdmin {
        require(entries[index].transitioned, "Must be transitioned first");
        entries[index].sealed = true;
    }

    function getTransitionEntry(uint256 index) external view returns (TransitionEntry memory) {
        return entries[index];
    }
}
