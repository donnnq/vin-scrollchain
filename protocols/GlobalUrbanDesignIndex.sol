// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalUrbanDesignIndex {
    address public admin;

    struct DesignEntry {
        string city;
        string designFeature; // "Plaza", "Walkway", "Lighting", "Public Art"
        string indexScore; // "World-Class", "Regional Benchmark", "Emerging"
        string emotionalTag;
        bool summoned;
        bool scored;
        bool sealed;
    }

    DesignEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonDesignIndex(string memory city, string memory designFeature, string memory indexScore, string memory emotionalTag) external onlyAdmin {
        entries.push(DesignEntry(city, designFeature, indexScore, emotionalTag, true, false, false));
    }

    function confirmScoring(uint256 index) external onlyAdmin {
        entries[index].scored = true;
    }

    function sealDesignEntry(uint256 index) external onlyAdmin {
        require(entries[index].scored, "Must be scored first");
        entries[index].sealed = true;
    }

    function getDesignEntry(uint256 index) external view returns (DesignEntry memory) {
        return entries[index];
    }
}
