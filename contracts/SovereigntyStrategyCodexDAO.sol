// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SovereigntyStrategyCodexDAO {
    address public admin;

    struct Strategy {
        string corridor;
        string principle;
        string implementationPath;
        bool ratified;
    }

    Strategy[] public codex;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitStrategy(string memory _corridor, string memory _principle, string memory _implementationPath) external onlyAdmin {
        codex.push(Strategy(_corridor, _principle, _implementationPath, false));
    }

    function ratifyStrategy(uint256 index) external onlyAdmin {
        codex[index].ratified = true;
    }

    function getStrategy(uint256 index) external view returns (Strategy memory) {
        return codex[index];
    }
}
