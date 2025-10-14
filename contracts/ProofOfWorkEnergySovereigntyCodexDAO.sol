// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProofOfWorkEnergySovereigntyCodexDAO {
    address public admin;

    struct SovereigntyEntry {
        string energySource;
        string miningRegion;
        string optimizationStrategy;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyEntry[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _energySource, string memory _miningRegion, string memory _optimizationStrategy, string memory _emotionalTag) external onlyAdmin {
        codex.push(SovereigntyEntry(_energySource, _miningRegion, _optimizationStrategy, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return codex[index];
    }
}
