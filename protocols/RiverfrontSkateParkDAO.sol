// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverfrontSkateParkDAO {
    address public admin;

    struct SkateParkEntry {
        string parkName;
        string location;
        string terrainType;
        string emotionalTag;
        bool summoned;
        bool built;
        bool sealed;
    }

    SkateParkEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSkatePark(string memory parkName, string memory location, string memory terrainType, string memory emotionalTag) external onlyAdmin {
        entries.push(SkateParkEntry(parkName, location, terrainType, emotionalTag, true, false, false));
    }

    function confirmBuild(uint256 index) external onlyAdmin {
        entries[index].built = true;
    }

    function sealSkateParkEntry(uint256 index) external onlyAdmin {
        require(entries[index].built, "Must be built first");
        entries[index].sealed = true;
    }

    function getSkateParkEntry(uint256 index) external view returns (SkateParkEntry memory) {
        return entries[index];
    }
}
